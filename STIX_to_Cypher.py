import json
import yaml

def main():
    input = "STIX\\file.json"
    output = "Cypher\\file.cypher"
    content = query_generator(read_json(input)["objects"])
    query_cypher = "\n".join(content)
    with open(output, "w", encoding="utf-8") as f:
        f.write(query_cypher)

def sanitize_data(data):
    if isinstance(data, dict):
        return {k: sanitize_data(v) for k, v in data.items()}
    elif isinstance(data, list):
        return [sanitize_data(item) for item in data]
    elif isinstance(data, str):
        return data.replace("\\", "\\\\").replace('"', '\\"')
    else:
        return data
    
def read_json(path):
    try:
        with open (path, 'r', encoding="utf-8") as file:
            content = json.load(file)
            return sanitize_data(content)
    except:
        print("File non trovato")
    
SDO = (
    "attack-pattern", "campaign", "course-of-action", "grouping",
    "identity", "incident", "indicator", "infrastructure",
    "intrusion-set", "location", "malware", "malware-analysis",
    "note", "observed-data", "opinion", "report", "threat-actor",
    "tool", "vulnerability"
)
SCO = (
    "artifact", "autonomous-system", "directory", "domain-name",
    "email-addr", "email-message", "file", "ipv4-addr",
    "ipv6-addr", "mac-addr", "mutex", "network-traffic",
    "process", "software", "url", "user-account",
    "windows-registry-key", "x509-certificate"
)

prop_count = 0
ext_count = 0
other_rel = 0

def query_generator(objects):
    global prop_count
    standard = ("spec_version", "id", "created", "modified")
    return_list = []
    query = []
    id_var = {}
    # 1° ciclo sugli oggetti
    for num, obj in enumerate(objects):
        str_conv= f"{obj["type"].replace("-", " ").title().replace(" ", "")}"
        try:
            #salvo tutti gli id
            id_var[obj['id']] = f"el{num}"
            if obj["type"] in SDO or obj["type"] in SCO:
                #set delle proprietà standard
                if obj["type"] == "identity" and obj["identity_class"] == "class":
                    for el in obj["sectors"]:
                        prop_count += 1
                        query.append(
                            f'MERGE (st{prop_count}:Sector {{type:"{el}"}})'
                        )
                else:
                    query.append(
                        f'MERGE (el{num}:{str_conv} {{id:"{obj['id']}"}})'
                    )
                    if obj["type"] in SDO:
                        query.append(set_standard_prop(num, obj))
                        if obj["type"] == "indicator" and obj["pattern_type"] == "sigma":
                            sigma = set_sigma_rule(query, return_list, num, obj)
                    elif obj["type"] in SCO:
                        query.append(
                            f'ON CREATE SET el{num}.spec_version = "2.1"'
                        )                    
                    if f"el{num}" not in return_list:
                        return_list.append(f"el{num}")
                    for prop, val in obj.items():
                        if prop in standard or prop.endswith("_ref") or prop.endswith("_refs") or "extensions" in prop:
                            continue
                        else:
                            #set delle proprietà
                            if isinstance(val, dict):
                                hand_dict=handling_dict(query, return_list, num, prop, val)
                            elif isinstance(val, list):
                                hand_list=handling_list(query, return_list, num, prop, val, obj)
                            elif isinstance(val, str):
                                if obj["type"] == "indicator" and obj["pattern_type"] == "sigma" and prop == "pattern":
                                    pattern = val.replace("\n", " ")
                                    query.append(
                                        f'SET el{num}.{prop} = "{pattern}"'
                                    )                                    
                                else: 
                                    query.append(
                                        f'SET el{num}.{prop} = "{val}"'
                                    )
                            else:
                                # gestisce i casi in cui sia un booleano, un float, un intero
                                query.append(
                                    f'SET el{num}.{prop} = {val}'
                                )
            else:
                continue
        except Exception as e:
            print(f"[Errore] all'oggetto {num}: {e}") 
            #pass
    # 2° ciclo, set delle proprietà con riferimenti interni
    for num, obj in enumerate(objects):
        str_conv= f"{obj["type"].replace("-", " ").title().replace(" ", "")}"
        try:
            if not (obj["type"] in SDO or obj["type"] in SCO):
                continue
            else:
                for prop, val in obj.items():
                    #creo la relazione tra l'oggetto e i suoi riferimenti   
                    if prop.endswith("_ref") or prop.endswith("_refs"):
                        refs_execution = set_int_ref(query, num, obj, prop, id_var, return_list, name_el= None)
                    # creo un nodo Extension
                    if obj["type"] in SCO:
                        if "extensions" in prop:
                            ext_execution = set_extension(query, return_list, num, val, id_var)
        except Exception as e:
            print(f"[Errore] all'oggetto {num}: {e}") 
            #pass
    # 3° ciclo, creazione delle relazioni
    for num, obj in enumerate(objects):
        try:           
            if obj["type"] == "relationship":
                query.append(set_rel(num, obj, return_list, id_var)) #OK
        except Exception as e:
            print(f"Errore all'oggetto {num}: {e}") 
            #pass
    query.append(f"RETURN {", ".join(return_list)}")
    return query

def set_standard_prop(num, obj):
    return f'ON CREATE SET el{num}.spec_version = "2.1", el{num}.created = "{obj['created']}"\
        \nSET el{num}.modified = "{obj['modified']}"'

def set_ext_ref(query, return_list, num, obj):
    global prop_count, other_rel
    for el in obj["external_references"]:
        prop_count += 1
        other_rel +=1
        query.append(
            f'MERGE (er{prop_count}:ExternalReference {{url:"{el['url']}"}})'
        )
        for el_key, el_value in el.items():
            if el_key != 'url':
                query.append(
                    f'ON CREATE SET er{prop_count}.{el_key} = "{el_value}"'
                )
        if f"er{prop_count}" not in return_list:
            return_list.append(f"er{prop_count}")
        query.append(
            f'MERGE (el{num})-[rel{other_rel}:HAS_EXTERNAL_REFERENCE {{relationship_type: "property"}}]->(er{prop_count})'
        )
        if f"rel{other_rel}" not in return_list:
            return_list.append(f"rel{other_rel}")

def set_kcp(query, return_list, num, obj):
    global prop_count, other_rel
    for el in obj["kill_chain_phases"]:
        other_rel += 1
        prop_count += 1
        query.append(
            f'MERGE (kcp{prop_count}:KillChainPhase {{phase_name:"{el['phase_name']}"}})'
        )
        for el_key, el_value in el.items():
            if el_key != 'phase_name':
                query.append(
                    f'ON CREATE SET kcp{prop_count}.{el_key} = "{el_value}"'
                )
        if f"kcp{prop_count}" not in return_list:
            return_list.append(f"kcp{prop_count}")
        query.append(
            f'MERGE (el{num})-[rel{other_rel}:IN_PHASE {{relationship_type: "property"}}]->(kcp{prop_count})'
        )
        if f"rel{other_rel}" not in return_list:
            return_list.append(f"rel{other_rel}")

def set_values(query, return_list, num, obj):
    global prop_count, other_rel
    for el in obj["values"]:
        other_rel += 1
        prop_count += 1
        query.append(
            f'MERGE (val{prop_count}:Value {{name:"{el['name']}"}})'
        )
        for el_key, el_value in el.items():
            if el_key != 'name':
                query.append(
                    f'ON CREATE SET val{prop_count}.{el_key} = "{el_value}"'
                )
        if f"val{prop_count}" not in return_list:
            return_list.append(f"val{prop_count}")
        query.append(
            f'MERGE (el{num})-[rel{other_rel}:HAS_VALUE {{relationship_type: "property"}}]->(val{prop_count})'
        )
        if f"rel{other_rel}" not in return_list:
            return_list.append(f"rel{other_rel}")

def set_hash(query, return_list, val, num, name_el = None):
    global prop_count, other_rel
    if name_el is None:
        name_el = f"el{num}"
    
    for hash_algo, hash_val in val.items():
        prop_count += 1
        other_rel += 1
        if "-" in hash_algo:
            algo_clean = hash_algo.replace('-', '_').lower()
        else:
            algo_clean = hash_algo.lower()
        query.append(
                f'MERGE (hs{prop_count}:Hash {{{algo_clean}: "{hash_val}"}})'
            )
        if f"hs{prop_count}" not in return_list:
            return_list.append(f"hs{prop_count}")
        query.append(
            f'MERGE ({name_el})-[rel{other_rel}:HAS_HASH {{relationship_type: "property"}}]->(hs{prop_count})'
        )
        if f"rel{other_rel}" not in return_list:
            return_list.append(f"rel{other_rel}")
    return f"hs{prop_count}"

def set_int_ref(query, num, obj, prop, id_var, return_list, name_el= None):
    global other_rel
    if name_el == None:
        name_el = f"el{num}"
    target_id = obj[prop]
    if "src_ref" in prop:
        new_rel = "TRAFFIC_TO"
        other_rel += 1
        target = id_var.get(target_id)
        query.append(
            f'MERGE ({target})-[rel{other_rel}:{new_rel} {{relationship_type: "reference"}}]->({name_el})'
        )
    elif "dst_ref" in prop:
        new_rel = "TRAFFIC_TO"
    elif prop.endswith("_ref"):
        if prop == "parent_directory_ref":
            new_rel = "HAS_" + prop[:-4].upper()
        elif "image_ref" in prop:
            new_rel = "HAS_" + prop.upper()
        else:
            new_rel = prop[:-4].upper()
    elif prop.endswith("_refs"):
        if prop == "object_refs":
            new_rel = "REFERS_TO"
        elif prop == "sample_refs":
            new_rel = "HAS_" + prop[:-5].upper()
        else:
            new_rel = prop[:-5].upper()

    if isinstance(target_id, list): 
        for el in target_id:
            other_rel += 1
            target = id_var.get(el)   
            query.append(
                f'MERGE ({name_el})-[rel{other_rel}:{new_rel} {{relationship_type: "reference"}}]->({target})'
            )
            if f"rel{other_rel}" not in return_list:
                return_list.append(f"rel{other_rel}")
    elif "src_ref" in prop:
        pass
    else:
        other_rel += 1
        target = id_var.get(target_id)
        query.append(
            f'MERGE ({name_el})-[rel{other_rel}:{new_rel} {{relationship_type: "reference"}}]->({target})'
        )
        if f"rel{other_rel}" not in return_list:
            return_list.append(f"rel{other_rel}")

def set_extension(query, return_list, num, val, id_var):
    global ext_count, other_rel, prop_count
    for x_key, x_value in val.items():
        ext_count +=1  
        query.append(
            f'CREATE (ext{ext_count}:Extension {{extension_type:"{x_key}"}})'
        )
        for y_key, y_value in x_value.items():
            if isinstance(y_value, dict):        
                if "pdf-ext" in x_key:
                    if "document_info_dict" in y_key:
                        for obj_key, obj_value in y_value.items():
                            name_el = f"ext{ext_count}"
                            prefix = "docInfo_"
                            elaborate_cases = set_actions(num, obj_key, obj_value, query, name_el = name_el, prefix = prefix)  
                    else:
                        print(f"[Avviso] Casistica di dizionario non gestita all'oggetto {num}") 
                elif "raster-image-ext" in x_key:
                    if "exif_tags" in y_key:
                        for obj_key, obj_value in y_value.items():                    
                            name_el = f"ext{ext_count}"
                            prefix = "exifTags_"
                            elaborate_cases = set_actions(num, obj_key, obj_value, query, name_el = name_el, prefix = prefix)
                elif "windows-pebinary-ext" in x_key:
                    if "file_header_hashes" in y_key:
                        name_el = f"ext{ext_count}"
                        hash_execution = set_hash(query, return_list, y_value, num, name_el = name_el)                        
                    elif "optional_header" in y_key:
                        for obj_key, obj_value in y_value.items():
                            name_el = f"ext{ext_count}"
                            prefix = "header_"                            
                            if "hashes" in obj_key:
                                hash_execution = set_hash(query, return_list, obj_value, num, name_el = name_el)  
                            else:
                                elaborate_cases = set_actions(num, obj_key, obj_value, query, name_el = name_el, prefix = prefix)            
                    else:
                        print(f"[Avviso] Casistica di dizionario non gestita all'oggetto {num}") 
                elif "http-request-ext" in x_key:
                    for obj_key, obj_value in y_value.items():
                        obj_key = obj_key.replace("-", "")
                        name_el = f"ext{ext_count}"
                        prefix = "reqHeader_"
                        elaborate_cases = set_actions(num, obj_key, obj_value, query, name_el = name_el, prefix = prefix)                  
                else: 
                    print(f"[Avviso] Casistica di dizionario non gestita all'oggetto {num}")
            elif isinstance(y_value, list):
                if y_key.endswith("_refs"):
                    name_el = f"ext{ext_count}"
                    refs_execution = set_int_ref(query, num, x_value, y_key, id_var, return_list, name_el= name_el)
                elif "alternate_data_streams" in y_key:
                    for data in y_value:
                        other_rel +=1
                        prop_count += 1
                        name_el = f"ads{prop_count}"
                        prefix = "" 
                        query.append(
                            f'CREATE (ads{prop_count}:AlternateDataStream)'
                        )
                        if f"ads{prop_count}" not in return_list:
                            return_list.append(f"ads{prop_count}")
                        query.append(
                            f'MERGE (ext{ext_count})-[rel{other_rel}:HAS_ADS {{relationship_type: "property"}}]->(ads{prop_count})'
                        )
                        if f"rel{other_rel}" not in return_list:
                            return_list.append(f"rel{other_rel}")
                        for obj_key, obj_value in data.items():
                            if "hashes" in obj_key:
                                hash_execution = set_hash(query, return_list, obj_value, num, name_el = name_el) 
                            else:                                                                
                                elaborate_cases = set_actions(num, obj_key, obj_value, query, name_el = name_el, prefix = prefix) 
                elif "sections" in y_key:
                    for data in y_value:
                        other_rel +=1
                        prop_count += 1
                        name_el = f"sec{prop_count}"
                        prefix = ""
                        query.append(
                            f'CREATE (sec{prop_count}:Section)'
                        )
                        if f"sec{prop_count}" not in return_list:
                            return_list.append(f"sec{prop_count}")
                        query.append(
                            f'MERGE (ext{ext_count})-[rel{other_rel}:HAS_SECTION {{relationship_type: "property"}}]->(sec{prop_count})'
                        )
                        if f"rel{other_rel}" not in return_list:
                            return_list.append(f"rel{other_rel}")                         
                        for obj_key, obj_value in data.items():
                            if "hashes" in obj_key:
                                hash_execution = set_hash(query, return_list, obj_value, num, name_el = name_el) 
                            else:                                                              
                                elaborate_cases = set_actions(num, obj_key, obj_value, query, name_el = name_el, prefix = prefix)

                else:
                    name_el = f"ext{ext_count}"
                    elaborate_cases = set_actions(num, y_key, y_value, query, name_el = name_el, prefix = "")
            elif isinstance(y_value, str):
                query.append(
                    f'SET ext{ext_count}.{y_key} = "{y_value}"'
                )
            else:
                query.append(
                    f'SET ext{ext_count}.{y_key} = {y_value}'
                )
        if f"ext{ext_count}" not in return_list:
            return_list.append(f"ext{ext_count}")
        other_rel +=1
        query.append(
            f'MERGE (el{num})-[rel{other_rel}:HAS_EXTENSION {{relationship_type: "property"}}]->(ext{ext_count})'
        )
        if f"rel{other_rel}" not in return_list:
            return_list.append(f"rel{other_rel}")
    
def create_sector(query, return_list, num, obj):
    global prop_count, other_rel
    for el in obj["sectors"]:
        prop_count += 1
        other_rel +=1
        query.append(
            f'MERGE (st{prop_count}:Sector {{type:"{el}"}})'
        )
        if f"st{prop_count}" not in return_list:
            return_list.append(f"st{prop_count}")
        query.append(
            f'MERGE (el{num})-[rel{other_rel}:IN_SECTOR {{relationship_type: "property"}}]->(st{prop_count})'
        )
        if f"rel{other_rel}" not in return_list:
            return_list.append(f"rel{other_rel}")

def set_actions(num, obj_key, obj_value, query, name_el = None, prefix = ""):
    if name_el is None:
        name_el = f"el{num}"
    if isinstance(obj_value, dict) and obj_key != "hashes":
        print(f"[Avviso] Casistica di dizionario non gestita all'oggetto {num}") 
    elif isinstance(obj_value, str):
        query.append(
            f'SET {name_el}.{prefix}{obj_key} = "{obj_value}"'
        )
    else:
        query.append(
            f'SET {name_el}.{prefix}{obj_key} = {obj_value}'
        )

def handling_dict(query, return_list, num, prop, val):
    if "hashes" in prop:
        hash_execution = set_hash(query, return_list, val, num, name_el = None) 
    else:
        print(f"[Avviso] Casistica di dizionario non gestita all'oggetto {num}")
    for obj_key, obj_value in val.items():
        if "additional_header_fields" in prop:
            prefix = "addHeadFields_"
            elaborate_cases = set_actions(num, obj_key, obj_value, query, name_el = None, prefix = "addHeadFields_")
        elif "ipfix" in prop:
            prefix = "ipfix_"
            elaborate_cases = set_actions(num, obj_key, obj_value, query, name_el = None, prefix = "ipfix_")
        elif "environment_variables" in prop:
            prefix = "envar_"
            elaborate_cases = set_actions(num, obj_key, obj_value, query, name_el = None, prefix = "envar_")
        elif "x509_v3_extensions" in prop:
            prefix = "certExt_"
            elaborate_cases = set_actions(num, obj_key, obj_value, query, name_el = None, prefix = "certExt_" ) 
      
        elif isinstance(obj_value, dict):
            print(f"[Avviso] Casistica di dizionario non gestita all'oggetto {num}")                                 

def handling_list(query, return_list, num, prop, val, obj):
    global prop_count, other_rel
    has_dicts = any(isinstance(item, dict) for item in val)
    if has_dicts:          
        if "body_multipart" in prop:
            for data in val:  
                prop_count += 1
                other_rel += 1                
                name_el = f"mp{prop_count}"
                query.append(
                    f'CREATE (mp{prop_count}:BodyMultipart)'
                )
                for obj_key, obj_value in data.items():
                    elaborate_cases = set_actions(num, obj_key, obj_value, query, name_el = name_el, prefix = "" )
                if f"mp{prop_count}" not in return_list:
                    return_list.append(f"mp{prop_count}")
                query.append(
                    f'MERGE (el{num})-[rel{other_rel}:HAS_MULTIPART {{relationship_type: "property"}}]->(mp{prop_count})'
                )
                if f"rel{other_rel}" not in return_list:
                    return_list.append(f"rel{other_rel}")
        if "external_references" in prop:
            ext_execution = set_ext_ref(query, return_list, num, obj)
        elif "kill_chain_phases" in prop:
            kcp_execution = set_kcp(query, return_list, num, obj)
        elif prop == "values":
            values_execution = set_values(query, return_list, num, obj)
        else:
            print(f"[Avviso] Casistica di dizionario non gestita all'oggetto {num}")
    else:
        if prop == "sectors":
            create = create_sector(query, return_list, num, obj)
        else:
            query.append(
                f'SET el{num}.{prop} = {val}'
            )

def set_sigma_rule(query, return_list, num, obj):
    global other_rel, prop_count
    prop_count += 1
    node_name = f"sig{prop_count}"

    try:
        raw_pattern = obj["pattern"].replace('\\"', '"').replace('\\\\', '\\')
        parsed = yaml.safe_load(raw_pattern)
    except yaml.YAMLError as e:
        print(f"[AVVISO] pattern sigma non parsabile per {obj.get('id')}: {e}")
        return  

    # campi di primo livello, piatti sul nodo
    flat_fields = ["title", "id", "status", "author", "date", "level", "condition"]
    query.append(f'MERGE ({node_name}:SigmaRule {{sigma_id: "{parsed.get("id", "")}"}})')
    for field in flat_fields:
        if field in parsed:
            val = str(parsed[field]).replace('"', '\\"')
            query.append(f'SET {node_name}.{field} = "{val}"')

    # logsource: appiattito con prefisso, per restare comunque su un solo nodo
    logsource = parsed.get("logsource", {})
    for k, v in logsource.items():
        query.append(f'SET {node_name}.logsource_{k} = "{v}"')

    # detection: serializzato come stringa unica (struttura troppo variabile per scomporla)
    detection_str = json.dumps(parsed.get("detection", {}), ensure_ascii=False)
    detection_str_escaped = detection_str.replace('\\', '\\\\').replace('"', '\\"')
    query.append(f'SET {node_name}.detection_json = "{detection_str_escaped}"')

    if node_name not in return_list:
        return_list.append(node_name)

    other_rel += 1
    query.append(
        f'MERGE (el{num})-[rel{other_rel}:HAS_SIGMA_RULE {{relationship_type: "property"}}]->({node_name})'
    )
    if f"rel{other_rel}" not in return_list:
        return_list.append(f"rel{other_rel}")

def set_rel(num, obj, return_list, id_var):
    source_id = obj["source_ref"]
    target_id = obj.get("target_ref")
    source = id_var.get(source_id)
    target = id_var.get(target_id)
    convert= obj["relationship_type"].replace("-", "_").upper()

    if f"r{num}" not in return_list:
        return_list.append(f"r{num}")

    return f'MERGE ({source})-[r{num}:{convert} {{id:"{obj['id']}"}}]->({target})\
    \nON CREATE SET r{num}.spec_version = "2.1", r{num}.created = "{obj["created"]}", r{num}.modified = "{obj["modified"]}"'

if __name__ == "__main__":
    main()