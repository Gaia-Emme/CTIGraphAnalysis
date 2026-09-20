MERGE (el0:AttackPattern {id:"attack-pattern--02be0d0a-023f-4379-9cdd-793c6bfc80a0"})
ON CREATE SET el0.spec_version = "2.1", el0.created = "2026-08-06T10:02:04.338539Z"        
SET el0.modified = "2026-08-06T10:02:04.338539Z"
SET el0.type = "attack-pattern"
SET el0.name = "Trusted Relationship"
MERGE (kcp1:KillChainPhase {phase_name:"initial-access"})
ON CREATE SET kcp1.kill_chain_name = "mitre-att&ck"
MERGE (el0)-[rel1:IN_PHASE {relationship_type: "property"}]->(kcp1)
MERGE (er2:ExternalReference {url:"https://attack.mitre.org/techniques/T1199/"})
ON CREATE SET er2.source_name = "mitre-att&ck"
ON CREATE SET er2.description = "Trusted Relationship"
ON CREATE SET er2.external_id = "T1199"
MERGE (el0)-[rel2:HAS_EXTERNAL_REFERENCE {relationship_type: "property"}]->(er2)
MERGE (el1:Incident {id:"incident--a7ae5c63-d07a-4ae9-a1eb-b086748eee61"})
ON CREATE SET el1.spec_version = "2.1", el1.created = "2026-08-06T10:02:04.339539Z"        
SET el1.modified = "2026-08-27T10:02:04.339539Z"
SET el1.type = "incident"
SET el1.name = "breach 2026"
SET el1.description = "Occurred between 2026-03-28 and 2026-04-12, and detected on 2026-04-23"
SET el1.x_detected = "2026-04-23"
SET el1.x_first_evidence = "2026-03-28"
SET el1.x_last_evidence = "2026-04-12"
MERGE (el2:Incident {id:"incident--088767a5-b231-4fc3-9ecf-713bdfa69b26"})
ON CREATE SET el2.spec_version = "2.1", el2.created = "2026-08-06T10:02:04.339539Z"        
SET el2.modified = "2026-08-27T10:02:04.339539Z"
SET el2.type = "incident"
SET el2.name = "Azure Exposure 2025"
SET el2.description = "Detected on 2025-10"
SET el2.x_detected = "2025-10"
MERGE (el3:Incident {id:"incident--60058bdd-6bd6-4260-86cd-4cc96a490c07"})
ON CREATE SET el3.spec_version = "2.1", el3.created = "2026-08-06T10:02:04.340539Z"        
SET el3.modified = "2026-08-27T10:02:04.340539Z"
SET el3.type = "incident"
SET el3.name = "MOVEit 2023"
SET el3.description = "Occurred between 2023-05-30 and 2023-05-31"
SET el3.x_first_evidence = "2023-05-30"
SET el3.x_last_evidence = "2023-05-31"
MERGE (el4:Identity {id:"identity--56031c2c-df26-4e81-b93a-af77c5c5854c"})
ON CREATE SET el4.spec_version = "2.1", el4.created = "2026-08-06T10:02:04.340539Z"        
SET el4.modified = "2026-08-06T10:02:04.340539Z"
SET el4.type = "identity"
SET el4.name = "Ernst & Young LLP"
SET el4.identity_class = "organization"
MERGE (st3:Sector {type:"financial-services"})
MERGE (el4)-[rel3:IN_SECTOR {relationship_type: "property"}]->(st3)
MERGE (st4:Sector {type:"commercial"})
MERGE (el4)-[rel4:IN_SECTOR {relationship_type: "property"}]->(st4)
SET el4.contact_information = "https://www.ey.com/en_us"
MERGE (el5:Identity {id:"identity--24673cb3-c9fb-45cf-95f8-6f7419f1812b"})
ON CREATE SET el5.spec_version = "2.1", el5.created = "2026-08-02T09:23:00.174927Z"        
SET el5.modified = "2026-08-02T09:23:00.174927Z"
SET el5.type = "identity"
SET el5.name = "Cyber Security News"
SET el5.roles = ['news-media', 'threat-intel-aggregator']
SET el5.identity_class = "organization"
MERGE (st5:Sector {type:"communications"})
MERGE (el5)-[rel5:IN_SECTOR {relationship_type: "property"}]->(st5)
MERGE (st6:Sector {type:"technology"})
MERGE (el5)-[rel6:IN_SECTOR {relationship_type: "property"}]->(st6)
SET el5.contact_information = "https://cybersecuritynews.com"
MERGE (el6:Report {id:"report--629ee48c-9fff-408a-963f-df9809ffe41e"})
ON CREATE SET el6.spec_version = "2.1", el6.created = "2026-08-26T09:00:56.904Z"        
SET el6.modified = "2026-08-26T09:00:56.904Z"
SET el6.type = "report"
SET el6.name = "EY Data Breach – Hackers Gain Access to IT Support System and Download Documents"
SET el6.published = "2026-07-17T09:00:56.904Z"
MERGE (er7:ExternalReference {url:"https://cybersecuritynews.com/ey-data-breach/"})
ON CREATE SET er7.source_name = "cyber-security-news"
MERGE (el6)-[rel7:HAS_EXTERNAL_REFERENCE {relationship_type: "property"}]->(er7)
MERGE (el6)-[rel8:CREATED_BY {relationship_type: "reference"}]->(el5)
MERGE (el6)-[rel9:REFERS_TO {relationship_type: "reference"}]->(el4)
MERGE (el6)-[rel10:REFERS_TO {relationship_type: "reference"}]->(el1)
MERGE (el6)-[rel11:REFERS_TO {relationship_type: "reference"}]->(el2)
MERGE (el6)-[rel12:REFERS_TO {relationship_type: "reference"}]->(el3)
MERGE (el6)-[rel13:REFERS_TO {relationship_type: "reference"}]->(el0)
MERGE (el1)-[r7:USES {id:"relationship--493dca59-d6a0-46ad-accc-d28c057eb74d"}]->(el0)    
ON CREATE SET r7.spec_version = "2.1", r7.created = "2026-08-06T10:02:04.341038Z", r7.modified = "2026-08-06T10:02:04.341038Z"
MERGE (el4)-[r8:SUFFERED {id:"relationship--d2778cc6-3493-43ec-b87c-f51d30c61c9d"}]->(el1)    
ON CREATE SET r8.spec_version = "2.1", r8.created = "2026-08-06T10:02:04.341038Z", r8.modified = "2026-08-06T10:02:04.341038Z"
MERGE (el4)-[r9:SUFFERED {id:"relationship--4d5023d1-73f7-4e36-b1f6-9fa0a7258271"}]->(el2)    
ON CREATE SET r9.spec_version = "2.1", r9.created = "2026-08-06T10:02:04.341038Z", r9.modified = "2026-08-06T10:02:04.341038Z"
MERGE (el4)-[r10:SUFFERED {id:"relationship--7a4bfe0e-266b-4ed2-8674-960c01663ab7"}]->(el3)    
ON CREATE SET r10.spec_version = "2.1", r10.created = "2026-08-06T10:02:04.341038Z", r10.modified = "2026-08-06T10:02:04.341038Z"
RETURN el0, kcp1, rel1, er2, rel2, el1, el2, el3, el4, st3, rel3, st4, rel4, el5, st5, rel5, st6, rel6, el6, er7, rel7, rel8, rel9, rel10, rel11, rel12, rel13, r7, r8, r9, r10