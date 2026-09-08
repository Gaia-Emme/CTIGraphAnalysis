import stix2
import json
from collections import defaultdict

def main():
    input = "Graphs\\file_query_table_data.json"
    output = "STIX\\file_fromQuery.json"
    content = stix_generator(object_parser(read_json(input)))
    bundle = stix2.Bundle(objects=content, allow_custom=True)
    bundle_dict = json.loads(bundle.serialize())
    with open(output, "w", encoding="utf-8") as file:
        json.dump(bundle_dict, file, indent=2, ensure_ascii=False)
    
def read_json(path):
    try:
        with open (path, 'r', encoding="utf-8") as file:
            content = json.load(file)
            return content[0]
    except:
        print("File non trovato")

TYPE_MAP = {
    "attack-pattern": stix2.AttackPattern,
    "campaign": stix2.Campaign,
    "course-of-action": stix2.CourseOfAction,
    "grouping": stix2.Grouping,
    "identity": stix2.Identity,
    "incident": stix2.Incident,
    "indicator": stix2.Indicator,
    "infrastructure": stix2.Infrastructure,
    "intrusion-set": stix2.IntrusionSet,
    "location": stix2.Location,
    "malware": stix2.Malware,
    "malware-analysis": stix2.MalwareAnalysis,
    "note": stix2.Note,
    "observed-data": stix2.ObservedData,
    "opinion": stix2.Opinion,
    "report": stix2.Report,
    "threat-actor": stix2.ThreatActor,
    "tool": stix2.Tool,
    "vulnerability": stix2.Vulnerability,
    "artifact": stix2.Artifact,
    "autonomous-system": stix2.AutonomousSystem,
    "directory": stix2.Directory,
    "domain-name": stix2.DomainName,
    "email-addr": stix2.EmailAddress,
    "email-message": stix2.EmailMessage,
    "file": stix2.File,
    "ipv4-addr": stix2.IPv4Address,
    "ipv6-addr": stix2.IPv6Address,
    "mac-addr": stix2.MACAddress,
    "mutex": stix2.Mutex,
    "network-traffic": stix2.NetworkTraffic,
    "process": stix2.Process,
    "software": stix2.Software,
    "url": stix2.URL,
    "user-account": stix2.UserAccount,
    "windows-registry-key": stix2.WindowsRegistryKey,
    "x509-certificate": stix2.X509Certificate,
    "relationship": stix2.Relationship,
    "sighting": stix2.Sighting,
    "extension-definition": stix2.ExtensionDefinition
}

# Ogni voce descrive: (nome proprietà STIX finale, modalità di fusione)
# Le modalità sono gestite tutte dentro resolve_properties, in modo generico
# e ricorsivo — indipendentemente dal fatto che il nodo sorgente sia un
# oggetto principale o un nodo ausiliario intermedio (es. Extension, ADS, Section).
MERGE_RULES = {
    "HAS_PARENT_DIRECTORY":     ("parent_directory_ref", "stringId_ref"),
    "HAS_IMAGE_REF":            ("image_ref", "stringId_ref"),
    "CREATED_BY":               ("created_by_ref", "stringId_ref"),     
    "IN_PHASE":                 ("kill_chain_phases", "list_append"),
    "HAS_EXTERNAL_REFERENCE":   ("external_references", "list_append"),
    "HAS_ADS":                  ("alternate_data_streams", "list_append"),
    "HAS_SECTION":              ("sections", "list_append"),      
    "REFERS_TO":                ("object_refs", "list_id_append"),
    "HAS_SAMPLE":               ("sample_refs", "list_id_append"),
    "CONTAINS":                 ("contains_refs", "list_id_append"), 
    "IN_SECTOR":                ("sectors", "list_scalar_append"),         
    "HAS_HASH":                 ("hashes", "dict_merge"),
    "HAS_EXTENSION":            ("extensions", "dict_keyed"), 
    #esistono sicuramente altri casi, ma al momento non so
}

ID_ONLY_MODES = {"stringId_ref", "list_id_append"}


def object_parser(objects):
    nodes = {} # ci salvo tutti i nodi
    cypher_edge = [] # ci salvo tutte le relazioni con distinzione is_main False/True
    relationship_list = []  # solo SRO -> is_main True
    edges_by_source = defaultdict(list)
    
    for obj, val in objects.items():
        for key, value in val.items():
            #raccolgo in nodes i nodi (SDO/SCO principali + nodi ausiliari)
            if key == "properties" and "end" not in val:
                if val["elementId"] not in nodes:
                    is_main = "id" in value
                    nodes[val["elementId"]] = {"properties": val["properties"], "is_main": is_main}    

            #raccolgo in cypher_edge tutte le relazioni, distinguendo tra SRO e ausiliarie con l'indicazione is_main
            elif key == "properties" and "type" in val and "start" in val and "end" in val:
                if "id" in value:
                    convert = val["type"].replace("_", "-").lower()
                    cypher_edge.append({
                        "type": "relationship",
                        "relationship_type": convert,
                        "source": val["startNodeElementId"],
                        "dest": val["endNodeElementId"],
                        "properties": val["properties"],
                        "is_main": True
                    })
                else:
                    cypher_edge.append({   
                        "relationship_type": val["type"],
                        "source": val["startNodeElementId"],
                        "dest": val["endNodeElementId"],
                        "properties": val["properties"],
                        "is_main": False
                    })

    # copie mutabili delle proprietà grezze di OGNI nodo (non solo i principali):
    # servono come punto di partenza per la risoluzione ricorsiva, e per poter
    # iniettare src_ref/dst_ref (TRAFFIC_TO) prima che la ricorsione parta.
    base_properties = {eid: dict(n["properties"]) for eid, n in nodes.items()}
    for el in cypher_edge:
        if el["is_main"]:
            relationship_list.append(el)
            continue

        rel_type = el["properties"]["relationship_type"]  # "property" o "reference"

        if el["relationship_type"] == "TRAFFIC_TO":
            handling_TrafficTo(el, nodes, base_properties)
        elif rel_type in ("property", "reference"):
            edges_by_source[el["source"]].append(el)
        else:
            print(f"[AVVISO] relationship_type non riconosciuto: {rel_type}")

    cache = {}
    raw_objects = [
        resolve_properties(eid, nodes, base_properties, edges_by_source, cache)
        for eid, n in nodes.items() if n["is_main"]
    ]
    for el in relationship_list:
        raw_objects.append(handling_SRO(el, nodes))

    return raw_objects

def handling_TrafficTo(el, nodes, base_properties):
    # TRAFFIC_TO ha direzione ambigua (src_ref vs dst_ref): viene risolto
    # PRIMA della ricorsione generica, iniettando la proprietà direttamente
    # nelle proprietà grezze del nodo network-traffic.
    if nodes[el["dest"]]["properties"].get("type") == "network-traffic":
        # ip -> traffic : è src_ref
        base_properties[el["dest"]]["src_ref"] = nodes[el["source"]]["properties"]["id"]
    else:
        # traffic -> ip : è dst_ref
        base_properties[el["source"]]["dst_ref"] = nodes[el["dest"]]["properties"]["id"]

def resolve_properties(element_id, nodes, base_properties, edges_by_source, cache, visiting=None):
    # Risolve ricorsivamente un nodo (principale o ausiliario), fondendo
    # tutti i suoi figli PRIMA di restituirsi. Funziona a qualunque profondità
    # di annidamento (Extension -> Section -> Hash, ecc.) grazie alla ricorsione,
    # e salva il risultato per evitare ricalcoli su nodi condivisi."""
    if element_id in cache:
        return cache[element_id]
    if visiting is None:
        visiting = set()

    if element_id in visiting:
        # CICLO TROVATO: stampiamo info utile per rintracciarlo nei dati originali
        props = nodes[element_id]["properties"]
        print(f"[CICLO RILEVATO] elementId={element_id} | tipo={props.get('type') or props.get('extension_type') or nodes[element_id].get('labels')} | id={props.get('id')}")
        return dict(base_properties[element_id])  # tronca la ricorsione, restituendo il nodo "così com'è" senza fondere oltre

    visiting.add(element_id)    
    props = dict(base_properties[element_id])

    for edge in edges_by_source.get(element_id, []):
        cypher_type = edge["relationship_type"]
        if cypher_type not in MERGE_RULES:
            print(f"[AVVISO] relationship di supporto non gestita: {cypher_type}")
            continue
        prop_name, mode = MERGE_RULES[cypher_type]

        if mode in ID_ONLY_MODES:
            # NESSUNA RICORSIONE: basta l'id, letto direttamente, senza fondere il figlio
            child_id = nodes[edge["dest"]]["properties"]["id"]        
        
            if mode == "stringId_ref":
                props[prop_name] = child_id
            elif mode == "list_id_append":
                props.setdefault(prop_name, [])
                props[prop_name].append(child_id)  
            continue

        # Da qui in poi SERVE il contenuto pieno del figlio (nodo ausiliario)
        if edge["dest"] in visiting:
            print(f"[CICLO RILEVATO, tronco] {edge['dest']}")
            continue
        child_props = resolve_properties(edge["dest"], nodes, base_properties, edges_by_source, cache, visiting)
        if mode == "list_append":
            props.setdefault(prop_name, [])
            props[prop_name].append(child_props)

        elif mode == "list_scalar_append":
            props.setdefault(prop_name, [])
            props[prop_name].append(child_props.get("type"))       

        elif mode == "dict_merge":
            props.setdefault(prop_name, {})
            for algo_raw, hash_val in child_props.items():
                algo = algo_raw.replace("_", "-").upper()
                props[prop_name][algo] = hash_val

        elif mode == "dict_keyed":
            props.setdefault("extensions", {})
            ext_type = child_props.get("extension_type")
            ext_content = {k: v for k, v in child_props.items() if k != "extension_type"}
            props["extensions"].setdefault(ext_type, {})
            props["extensions"][ext_type].update(ext_content)

    visiting.discard(element_id)
    cache[element_id] = props
    return props

def handling_SRO(el, nodes):
    obj = {}
    for key, value in nodes.items():
        if el["source"] == key:
            obj["source_ref"] = value["properties"]["id"]
        if el["dest"] == key:
            obj["target_ref"] = value["properties"]["id"]
        if "source_ref" in obj and "target_ref" in obj:
            break
    obj["type"] = el["type"]
    obj["relationship_type"] = el["relationship_type"]
    for key, value in el["properties"].items():
        obj[key] = value
    return obj

def stix_generator(raw_objects):
    stix_objects = []
    for obj in raw_objects:
        obj = dict(obj)
        ref_id = obj.pop("id", None)
        stix_type = obj.pop("type")
        constructor = TYPE_MAP.get(stix_type)
        if constructor is None:
            print(f"[AVVISO] tipo sconosciuto '{stix_type}', oggetto saltato")
            continue

        try:
            stix_obj = constructor(id=ref_id, allow_custom=True, **obj)
            stix_objects.append(stix_obj)
        except Exception as e:
            print(f"[ERRORE] oggetto '{ref_id or '(senza id)'}' "
                  f"di tipo '{stix_type}': {e}") 
    return stix_objects     
        
if __name__ == '__main__':
    main()