import stix2
import json
import yaml

def main():
    input = "YAML\\file.yaml"
    output = "STIX\\file.json"
    stix_objects = create_objects(parse_yaml(input))
    bundle = stix2.Bundle(objects=stix_objects, allow_custom=True)
    bundle_dict = json.loads(bundle.serialize())
    #print(bundle)
    with open(output, "w", encoding="utf-8") as file:
        json.dump(bundle_dict, file, indent=2, ensure_ascii=False)

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

def parse_yaml(input):
    with open(input, "r", encoding="utf-8") as file:
        data = yaml.safe_load(file)
        if isinstance(data, dict) and data.get("type") == "bundle":
            objects = data.get("objects", []) 
        else:
            objects = data
        raw_objects = []
        if isinstance(objects, list):
            raw_objects = objects
        elif isinstance(objects, dict):
            for stix_type, items in objects.items():
                for item in items:
                    item = dict(item)
                    item["type"] = stix_type
                    raw_objects.append(item)
        return raw_objects

def resolve_refs(value, id_map):
    if isinstance(value, str):
        return id_map.get(value, value)
    if isinstance(value, list):
        return [resolve_refs(v, id_map) for v in value]
    if isinstance(value, dict):
        return {k: resolve_refs(v, id_map) for k, v in value.items()}
    return value

def all_ref_ids(raw_objects):
    return {o["ref_id"] for o in raw_objects if o.get("ref_id")}

def find_unresolved(value, known_ref_ids, found):
    if isinstance(value, str):
        if value in known_ref_ids:
            found.add(value)
    elif isinstance(value, list):
        for v in value:
            find_unresolved(v, known_ref_ids, found)
    elif isinstance(value, dict):
        for v in value.values():
            find_unresolved(v, known_ref_ids, found)

def create_objects(raw_objects):
    known_ref_ids = all_ref_ids(raw_objects)
    id_map = {}
    stix_objects = []
    for obj in raw_objects:
        obj = dict(obj)
        ref_id = obj.pop("ref_id", None)
        stix_type = obj.pop("type")

        obj = resolve_refs(obj, id_map)

        still_unresolved = set()
        find_unresolved(obj, known_ref_ids, still_unresolved)
        if still_unresolved:
            print(f"[AVVISO] '{ref_id or stix_type}' cita {still_unresolved} "
                  f"che non risulta ancora creato: mettilo PRIMA nello YAML.")

        constructor = TYPE_MAP.get(stix_type)
        if constructor is None:
            print(f"[AVVISO] tipo sconosciuto '{stix_type}', oggetto saltato")
            continue

        try:
            stix_obj = constructor(allow_custom=True, **obj)
            stix_objects.append(stix_obj)
            if ref_id:
                id_map[ref_id] = stix_obj["id"]
        except Exception as e:
            print(f"[ERRORE] oggetto '{ref_id or '(senza ref_id)'}' "
                  f"di tipo '{stix_type}': {e}")

    return stix_objects

if __name__ == "__main__":
    main()