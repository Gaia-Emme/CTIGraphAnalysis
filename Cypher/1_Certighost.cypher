MERGE (el0:Identity {id:"identity--d2a9ef61-c9d3-4a30-8f3d-b95e1d625d5e"})
ON CREATE SET el0.spec_version = "2.1", el0.created = "2026-08-01T16:49:23.513412Z"        
SET el0.modified = "2026-08-01T16:49:23.513412Z"
SET el0.type = "identity"
SET el0.name = "Microsoft Corporation"
SET el0.roles = ['vendor', 'cloud-provider', 'cyber-security-research']
SET el0.identity_class = "organization"
MERGE (st1:Sector {type:"technology"})
MERGE (el0)-[rel1:IN_SECTOR {relationship_type: "property"}]->(st1)
MERGE (st2:Sector {type:"commercial"})
MERGE (el0)-[rel2:IN_SECTOR {relationship_type: "property"}]->(st2)
SET el0.contact_information = "https://microsoft.com"
MERGE (el1:Identity {id:"identity--24673cb3-c9fb-45cf-95f8-6f7419f1812b"})
ON CREATE SET el1.spec_version = "2.1", el1.created = "2026-08-02T09:23:00.174927Z"        
SET el1.modified = "2026-08-02T09:23:00.174927Z"
SET el1.type = "identity"
SET el1.name = "Cyber Security News"
SET el1.roles = ['news-media', 'threat-intel-aggregator']
SET el1.identity_class = "organization"
MERGE (st3:Sector {type:"communications"})
MERGE (el1)-[rel3:IN_SECTOR {relationship_type: "property"}]->(st3)
MERGE (st4:Sector {type:"technology"})
MERGE (el1)-[rel4:IN_SECTOR {relationship_type: "property"}]->(st4)
SET el1.contact_information = "https://cybersecuritynews.com"
MERGE (el2:Vulnerability {id:"vulnerability--fc1a7df2-c797-452f-91b2-68c6fad386d5"})
ON CREATE SET el2.spec_version = "2.1", el2.created = "2026-07-28T16:43:46.892Z"        
SET el2.modified = "2026-08-26T16:49:23.51403Z"
SET el2.type = "vulnerability"
SET el2.name = "Certighost"
SET el2.description = "Active Directory Certificate Services Elevation of Privilege Vulnerability"
MERGE (er5:ExternalReference {url:"https://www.cve.org/CVERecord?id=CVE-2026-54121"})
ON CREATE SET er5.source_name = "cve"
ON CREATE SET er5.external_id = "CVE-2026-54121"
MERGE (el2)-[rel5:HAS_EXTERNAL_REFERENCE {relationship_type: "property"}]->(er5)
MERGE (er6:ExternalReference {url:"https://nvd.nist.gov/vuln/detail/CVE-2026-54121"})
ON CREATE SET er6.source_name = "cvss"
ON CREATE SET er6.description = "CVSS:3.1/AV:N/AC:L/PR:L/UI:N/S:U/C:H/I:H/A:H/E:U/RL:O/RC:C"
ON CREATE SET er6.external_id = "8.8"
MERGE (el2)-[rel6:HAS_EXTERNAL_REFERENCE {relationship_type: "property"}]->(er6)
MERGE (er7:ExternalReference {url:"https://cwe.mitre.org/data/definitions/285.html"})
ON CREATE SET er7.source_name = "cwe"
ON CREATE SET er7.description = "Improper Authorization"
ON CREATE SET er7.external_id = "CWE-285"
MERGE (el2)-[rel7:HAS_EXTERNAL_REFERENCE {relationship_type: "property"}]->(er7)
MERGE (el3:CourseOfAction {id:"course-of-action--d1155531-371d-4d90-8d20-2f5a487c6374"})
ON CREATE SET el3.spec_version = "2.1", el3.created = "2026-07-28T16:54:01.437Z"        
SET el3.modified = "2026-08-01T16:49:23.514395Z"
SET el3.type = "course-of-action"
SET el3.name = "July 2026 Microsoft Updates"
SET el3.description = "Official patch provided by Microsoft introducing the new DC validation feature."
MERGE (el4:CourseOfAction {id:"course-of-action--ce610eda-c6bd-4f4a-8785-2441fcd68fb4"})
ON CREATE SET el4.spec_version = "2.1", el4.created = "2026-07-28T16:54:01.437Z"        
SET el4.modified = "2026-08-01T16:49:23.514508Z"
SET el4.type = "course-of-action"
SET el4.name = "Disabling EDITF_ENABLECHASECLIENTDC"
SET el4.description = "Temporary Mitigation: Disable vulnerable chase fallback if the July 2026 patch cannot be applied immediately"
MERGE (el5:Software {id:"software--22a96754-1c46-5c9c-bda0-77b77902d598"})
ON CREATE SET el5.spec_version = "2.1"
SET el5.type = "software"
SET el5.name = "Active Directory Certificate Services"
SET el5.vendor = "identity--d2a9ef61-c9d3-4a30-8f3d-b95e1d625d5e"
MERGE (el6:AttackPattern {id:"attack-pattern--f6d4b301-7ac5-469c-b8a2-ae2b5749eee5"})
ON CREATE SET el6.spec_version = "2.1", el6.created = "2026-07-28T16:43:46.892Z"        
SET el6.modified = "2026-08-25T16:49:23.51477Z"
SET el6.type = "attack-pattern"
SET el6.name = "DCSync"
SET el6.description = "Allows krbtgt hash extraction. In combination with the ms-DS-MachineAccountQuota setting, it would allow you to take full control of the domain."
MERGE (kcp8:KillChainPhase {phase_name:"credential-access"})
ON CREATE SET kcp8.kill_chain_name = "mitre-att&ck"
MERGE (el6)-[rel8:IN_PHASE {relationship_type: "property"}]->(kcp8)
MERGE (er9:ExternalReference {url:"https://attack.mitre.org/techniques/T1003/006/"})
ON CREATE SET er9.source_name = "mitre-att&ck"
ON CREATE SET er9.description = "OS Credential Dumping: DCSync"
ON CREATE SET er9.external_id = "T1003.006"
MERGE (el6)-[rel9:HAS_EXTERNAL_REFERENCE {relationship_type: "property"}]->(er9)
MERGE (el7:Report {id:"report--8c894e49-6cf5-4f28-b713-d7b9e0ffd7b4"})
ON CREATE SET el7.spec_version = "2.1", el7.created = "2026-08-25T08:53:51.509Z"        
SET el7.modified = "2026-08-25T08:53:51.509Z"
SET el7.type = "report"
SET el7.name = "Certighost Active Directory CS Exploit Allows Low-Privileged Users to Compromise Domain"
SET el7.report_types = ['attack-pattern', 'course-of-action', 'vulnerability']
SET el7.published = "2026-07-24T09:07:01.424Z"
MERGE (er10:ExternalReference {url:"https://cybersecuritynews.com/certighost-active-directory-cs-flaw/"})
ON CREATE SET er10.source_name = "cyber-security-news"
MERGE (el7)-[rel10:HAS_EXTERNAL_REFERENCE {relationship_type: "property"}]->(er10)
MERGE (el5)-[rel11:PRODUCED_BY {relationship_type: "reference"}]->(el0)
MERGE (el7)-[rel12:CREATED_BY {relationship_type: "reference"}]->(el1)
MERGE (el7)-[rel13:REFERS_TO {relationship_type: "reference"}]->(el2)
MERGE (el7)-[rel14:REFERS_TO {relationship_type: "reference"}]->(el6)
MERGE (el7)-[rel15:REFERS_TO {relationship_type: "reference"}]->(el5)
MERGE (el7)-[rel16:REFERS_TO {relationship_type: "reference"}]->(el3)
MERGE (el7)-[rel17:REFERS_TO {relationship_type: "reference"}]->(el4)
MERGE (el5)-[r8:HAS {id:"relationship--5a87922a-b98d-4d61-bd5b-43f8db0c2867"}]->(el2)    
ON CREATE SET r8.spec_version = "2.1", r8.created = "2026-08-01T16:49:23.515168Z", r8.modified = "2026-08-01T16:49:23.515168Z"
MERGE (el4)-[r9:MITIGATES {id:"relationship--0c881d35-d6a2-4228-b597-4811c466de36"}]->(el2)    
ON CREATE SET r9.spec_version = "2.1", r9.created = "2026-08-01T16:49:23.515275Z", r9.modified = "2026-08-01T16:49:23.515275Z"
MERGE (el3)-[r10:REMEDIATES {id:"relationship--e82117f5-9ecf-40c3-b836-433e55437fea"}]->(el2)    
ON CREATE SET r10.spec_version = "2.1", r10.created = "2026-08-01T16:49:23.515376Z", r10.modified = "2026-08-01T16:49:23.515376Z"
MERGE (el6)-[r11:TARGETS {id:"relationship--2c66b88d-ebcb-4be8-9bc5-8537eb00c026"}]->(el2)    
ON CREATE SET r11.spec_version = "2.1", r11.created = "2026-08-01T16:49:23.515483Z", r11.modified = "2026-08-01T16:49:23.515483Z"
RETURN el0, st1, rel1, st2, rel2, el1, st3, rel3, st4, rel4, el2, er5, rel5, er6, rel6, er7, rel7, el3, el4, el5, el6, kcp8, rel8, er9, rel9, el7, er10, rel10, rel11, rel12, rel13, rel14, rel15, rel16, rel17, r8, r9, r10, r11