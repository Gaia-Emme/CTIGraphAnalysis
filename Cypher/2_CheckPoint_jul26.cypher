MERGE (el0:Identity {id:"identity--09eb2fbe-8823-48f3-a278-ce7e197aaf10"})
ON CREATE SET el0.spec_version = "2.1", el0.created = "2026-08-01T07:31:57.723Z"        
SET el0.modified = "2026-08-01T07:31:57.723Z"
SET el0.type = "identity"
SET el0.name = "Cybersecurity and Infrastructure Security Agency (CISA)"
SET el0.roles = ['csirt', 'government-agency']
SET el0.identity_class = "organization"
MERGE (st1:Sector {type:"government-national"})
MERGE (el0)-[rel1:IN_SECTOR {relationship_type: "property"}]->(st1)
MERGE (st2:Sector {type:"defence"})
MERGE (el0)-[rel2:IN_SECTOR {relationship_type: "property"}]->(st2)
MERGE (st3:Sector {type:"communications"})
MERGE (el0)-[rel3:IN_SECTOR {relationship_type: "property"}]->(st3)
SET el0.contact_information = "['Contact@cisa.dhs.gov', 'central@cisa.dhs.gov']"
MERGE (el1:Identity {id:"identity--24673cb3-c9fb-45cf-95f8-6f7419f1812b"})
ON CREATE SET el1.spec_version = "2.1", el1.created = "2026-08-02T09:23:00.174927Z"        
SET el1.modified = "2026-08-02T09:23:00.174927Z"
SET el1.type = "identity"
SET el1.name = "Cyber Security News"
SET el1.roles = ['news-media', 'threat-intel-aggregator']
SET el1.identity_class = "organization"
MERGE (st4:Sector {type:"communications"})
MERGE (el1)-[rel4:IN_SECTOR {relationship_type: "property"}]->(st4)
MERGE (st5:Sector {type:"technology"})
MERGE (el1)-[rel5:IN_SECTOR {relationship_type: "property"}]->(st5)
SET el1.contact_information = "https://cybersecuritynews.com"
MERGE (el2:Identity {id:"identity--46ffc491-23fe-457f-9b0b-9823b035471a"})
ON CREATE SET el2.spec_version = "2.1", el2.created = "2026-08-01T08:48:46.235Z"        
SET el2.modified = "2026-08-01T08:48:46.235Z"
SET el2.type = "identity"
SET el2.name = "Check Point Software Technologies Ltd."
SET el2.roles = ['vendor', 'cyber-security-research']
SET el2.identity_class = "organization"
MERGE (st6:Sector {type:"technology"})
MERGE (el2)-[rel6:IN_SECTOR {relationship_type: "property"}]->(st6)
MERGE (st7:Sector {type:"commercial"})
MERGE (el2)-[rel7:IN_SECTOR {relationship_type: "property"}]->(st7)
SET el2.contact_information = "https://checkpoint.com"
MERGE (el3:Vulnerability {id:"vulnerability--ad9b541e-54a6-42d7-bc1f-3346fc54cf22"})
ON CREATE SET el3.spec_version = "2.1", el3.created = "2026-08-01T08:03:48.265Z"        
SET el3.modified = "2026-08-25T08:03:48.265Z"
SET el3.type = "vulnerability"
SET el3.name = "CheckPoint vulnerability - CVE-2026-16232"
SET el3.description = "Authentication Bypass in the SmartConsole Login Process Using an Application Token"
MERGE (er8:ExternalReference {url:"https://www.cve.org/CVERecord?id=CVE-2026-16232"})
ON CREATE SET er8.source_name = "cve"
ON CREATE SET er8.external_id = "CVE-2026-16232"
MERGE (el3)-[rel8:HAS_EXTERNAL_REFERENCE {relationship_type: "property"}]->(er8)
MERGE (er9:ExternalReference {url:"https://nvd.nist.gov/vuln/detail/CVE-2026-16232"})
ON CREATE SET er9.source_name = "cvss"
ON CREATE SET er9.description = "CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:H/I:H/A:N"
ON CREATE SET er9.external_id = "9.1"
MERGE (el3)-[rel9:HAS_EXTERNAL_REFERENCE {relationship_type: "property"}]->(er9)
MERGE (er10:ExternalReference {url:"https://cwe.mitre.org/data/definitions/287.html"})
ON CREATE SET er10.source_name = "cwe"
ON CREATE SET er10.description = "Improper Authentication"
ON CREATE SET er10.external_id = "CWE-287"
MERGE (el3)-[rel10:HAS_EXTERNAL_REFERENCE {relationship_type: "property"}]->(er10)
MERGE (el4:Vulnerability {id:"vulnerability--1baf856d-bb0a-4d07-866a-a60b0d63c468"})
ON CREATE SET el4.spec_version = "2.1", el4.created = "2026-08-01T08:59:10.280Z"        
SET el4.modified = "2026-08-25T08:59:10.280Z"
SET el4.type = "vulnerability"
SET el4.name = "CheckPoint vulnerability - CVE-2026-62144"
SET el4.description = "Management Authentication Bypass and Privilege Escalation"
MERGE (er11:ExternalReference {url:"https://www.cve.org/CVERecord?id=CVE-2026-62144"})
ON CREATE SET er11.source_name = "cve"
ON CREATE SET er11.external_id = "CVE-2026-62144"
MERGE (el4)-[rel11:HAS_EXTERNAL_REFERENCE {relationship_type: "property"}]->(er11)
MERGE (er12:ExternalReference {url:"https://nvd.nist.gov/vuln/detail/CVE-2026-62144"})
ON CREATE SET er12.source_name = "cvss"
ON CREATE SET er12.description = "CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:H/I:H/A:N"
ON CREATE SET er12.external_id = "9.1"
MERGE (el4)-[rel12:HAS_EXTERNAL_REFERENCE {relationship_type: "property"}]->(er12)
MERGE (er13:ExternalReference {url:"https://cwe.mitre.org/data/definitions/287.html"})
ON CREATE SET er13.source_name = "cwe"
ON CREATE SET er13.description = "Improper Authentication"
ON CREATE SET er13.external_id = "CWE-287"
MERGE (el4)-[rel13:HAS_EXTERNAL_REFERENCE {relationship_type: "property"}]->(er13)
MERGE (el5:Vulnerability {id:"vulnerability--aad384bf-c899-43a4-bd77-b39122bdfa78"})
ON CREATE SET el5.spec_version = "2.1", el5.created = "2026-08-01T08:59:40.432Z"        
SET el5.modified = "2026-08-25T08:59:40.432Z"
SET el5.type = "vulnerability"
SET el5.name = "CheckPoint vulnerability - CVE-2026-62145"
SET el5.description = "Local Privilege Escalation in Gaia Portal"
MERGE (er14:ExternalReference {url:"https://www.cve.org/CVERecord?id=CVE-2026-62145"})
ON CREATE SET er14.source_name = "cve"
ON CREATE SET er14.external_id = "CVE-2026-62145"
MERGE (el5)-[rel14:HAS_EXTERNAL_REFERENCE {relationship_type: "property"}]->(er14)
MERGE (er15:ExternalReference {url:"https://nvd.nist.gov/vuln/detail/CVE-2026-62145"})
ON CREATE SET er15.source_name = "cvss"
ON CREATE SET er15.description = "CVSS:3.1/AV:N/AC:H/PR:L/UI:N/S:U/C:H/I:H/A:H"
ON CREATE SET er15.external_id = "7.5"
MERGE (el5)-[rel15:HAS_EXTERNAL_REFERENCE {relationship_type: "property"}]->(er15)
MERGE (er16:ExternalReference {url:"https://cwe.mitre.org/data/definitions/269.html"})
ON CREATE SET er16.source_name = "cwe"
ON CREATE SET er16.description = "Improper Privilege Management"
ON CREATE SET er16.external_id = "CWE-269"
MERGE (el5)-[rel16:HAS_EXTERNAL_REFERENCE {relationship_type: "property"}]->(er16)
MERGE (el6:CourseOfAction {id:"course-of-action--5dcc0eeb-4424-49e8-ba2a-9d997d9598a0"})
ON CREATE SET el6.spec_version = "2.1", el6.created = "2026-08-01T09:16:16.407Z"        
SET el6.modified = "2026-08-01T09:16:16.407Z"
SET el6.type = "course-of-action"
SET el6.name = "Protect, restrict access and verify"
SET el6.description = "Protect Management access with Firewall, restrict access to trusted IP addresses, and verify that implied rules for control connections are enabled"
MERGE (el7:CourseOfAction {id:"course-of-action--81e2d93a-12d3-451b-9863-f6b4b470cc17"})
ON CREATE SET el7.spec_version = "2.1", el7.created = "2026-08-01T09:15:18.722Z"        
SET el7.modified = "2026-08-01T09:15:18.722Z"
SET el7.type = "course-of-action"
SET el7.name = "Limit Trusted Clients"
SET el7.description = "Limit Trusted Clients (GUI clients) to trusted IP addresses/subnets"
MERGE (el8:CourseOfAction {id:"course-of-action--6bd45bfd-7e87-426c-974c-405e0eebc8eb"})
ON CREATE SET el8.spec_version = "2.1", el8.created = "2026-08-01T09:09:49.386Z"        
SET el8.modified = "2026-08-01T09:09:49.386Z"
SET el8.type = "course-of-action"
SET el8.name = "Jumbo hotfix"
SET el8.description = "July 2026 Official CheckPoint Update"
MERGE (el9:Software {id:"software--e985ea47-d1c0-4754-a948-560852e4b9a8"})
ON CREATE SET el9.spec_version = "2.1"
SET el9.type = "software"
SET el9.name = "Check Point Multi-Domain Security Management"
SET el9.vendor = "identity--46ffc491-23fe-457f-9b0b-9823b035471a"
MERGE (el10:Software {id:"software--b61a7bf8-7cbe-40a3-9b25-75908f6daf96"})
ON CREATE SET el10.spec_version = "2.1"
SET el10.type = "software"
SET el10.name = "GaiaOS WebUI"
SET el10.vendor = "identity--46ffc491-23fe-457f-9b0b-9823b035471a"
MERGE (el11:AttackPattern {id:"attack-pattern--fd1d0bb5-456e-44eb-9aeb-91370b34274a"})
ON CREATE SET el11.spec_version = "2.1", el11.created = "2026-08-01T09:53:37.960Z"        
SET el11.modified = "2026-08-01T09:53:37.960Z"
SET el11.type = "attack-pattern"
SET el11.name = "Access to SmartConsole"
MERGE (kcp17:KillChainPhase {phase_name:"Initial Access"})
ON CREATE SET kcp17.kill_chain_name = "mitre-att&ck"
MERGE (el11)-[rel17:IN_PHASE {relationship_type: "property"}]->(kcp17)
MERGE (er18:ExternalReference {url:"https://attack.mitre.org/techniques/T1190/"})
ON CREATE SET er18.source_name = "mitre-att&ck"
ON CREATE SET er18.description = "Initial Access/Exploit Public-Facing Application"
ON CREATE SET er18.external_id = "T1190"
MERGE (el11)-[rel18:HAS_EXTERNAL_REFERENCE {relationship_type: "property"}]->(er18)
MERGE (el12:Ipv4Addr {id:"ipv4-addr--d2211eb1-94fc-4988-81ef-99d9ac0d7606"})
ON CREATE SET el12.spec_version = "2.1"
SET el12.type = "ipv4-addr"
SET el12.value = "151.241.99[.]207"
SET el12.defanged = True
MERGE (el13:Ipv4Addr {id:"ipv4-addr--8741232b-b230-42fd-9675-b65d9adb2a8c"})
ON CREATE SET el13.spec_version = "2.1"
SET el13.type = "ipv4-addr"
SET el13.value = "151.241.99[.]233"
SET el13.defanged = True
MERGE (el14:Ipv4Addr {id:"ipv4-addr--58887340-60fd-4bea-a97c-282e5394576c"})
ON CREATE SET el14.spec_version = "2.1"
SET el14.type = "ipv4-addr"
SET el14.value = "158.62.198[.]182"
SET el14.defanged = True
MERGE (el15:Ipv4Addr {id:"ipv4-addr--35add4df-2be3-4e08-8441-5bb435f24abd"})
ON CREATE SET el15.spec_version = "2.1"
SET el15.type = "ipv4-addr"
SET el15.value = "192.142.10[.]99"
SET el15.defanged = True
MERGE (el16:Ipv4Addr {id:"ipv4-addr--cf14f1e0-cbf8-4fac-b616-1cfdbe8332f3"})
ON CREATE SET el16.spec_version = "2.1"
SET el16.type = "ipv4-addr"
SET el16.value = "139.28.37[.]250"
SET el16.defanged = True
MERGE (el17:Ipv4Addr {id:"ipv4-addr--49d81eea-96b1-4b12-adca-0bc8f64dcd88"})
ON CREATE SET el17.spec_version = "2.1"
SET el17.type = "ipv4-addr"
SET el17.value = "194.213.18[.]137"
SET el17.defanged = True
MERGE (el18:Indicator {id:"indicator--d43bdfdb-dfdc-44bd-9f6d-ff063a861c75"})
ON CREATE SET el18.spec_version = "2.1", el18.created = "2026-08-01T10:38:49.292Z"        
SET el18.modified = "2026-08-25T10:38:49.292Z"
SET el18.type = "indicator"
SET el18.pattern = "[ipv4-addr:value = '139.28.37.250']"
SET el18.pattern_type = "stix"
SET el18.pattern_version = "2.1"
SET el18.valid_from = "2026-07-01T10:35:59.298Z"
MERGE (el19:Indicator {id:"indicator--fed1cee8-ab48-4a5d-aacf-68092b72d250"})
ON CREATE SET el19.spec_version = "2.1", el19.created = "2026-08-01T10:39:15.003Z"        
SET el19.modified = "2026-08-25T10:39:15.003Z"
SET el19.type = "indicator"
SET el19.pattern = "[ipv4-addr:value = '194.213.18.137']"
SET el19.pattern_type = "stix"
SET el19.pattern_version = "2.1"
SET el19.valid_from = "2026-07-01T10:35:59.298Z"
MERGE (el20:Indicator {id:"indicator--e0f5f84f-bccd-4e2e-8628-bfc632d4a09c"})
ON CREATE SET el20.spec_version = "2.1", el20.created = "2026-08-01T10:37:51.733Z"        
SET el20.modified = "2026-08-01T10:37:51.733Z"
SET el20.type = "indicator"
SET el20.pattern = "[ipv4-addr:value = '192.142.10.99']"
SET el20.pattern_type = "stix"
SET el20.pattern_version = "2.1"
SET el20.valid_from = "2026-07-01T10:35:59.298Z"
MERGE (el21:Indicator {id:"indicator--87810bfd-57ad-4c9e-b27b-ecd2f24ea93d"})
ON CREATE SET el21.spec_version = "2.1", el21.created = "2026-08-01T10:35:59.298Z"        
SET el21.modified = "2026-08-01T10:35:59.298Z"
SET el21.type = "indicator"
SET el21.pattern = "[ipv4-addr:value = '158.62.198.182']"
SET el21.pattern_type = "stix"
SET el21.pattern_version = "2.1"
SET el21.valid_from = "2026-07-01T10:35:59.298Z"
MERGE (el22:Indicator {id:"indicator--a67f0abf-8885-4acf-96d4-2c2d25bc93db"})
ON CREATE SET el22.spec_version = "2.1", el22.created = "2026-08-01T10:35:59.298Z"        
SET el22.modified = "2026-08-25T10:35:59.298Z"
SET el22.type = "indicator"
SET el22.pattern = "[ipv4-addr:value = '151.241.99.233']"
SET el22.pattern_type = "stix"
SET el22.pattern_version = "2.1"
SET el22.valid_from = "2026-07-01T10:35:59.298Z"
MERGE (el23:Indicator {id:"indicator--96a1b6ff-f276-4d3d-a30b-edf9d522819a"})
ON CREATE SET el23.spec_version = "2.1", el23.created = "2026-08-01T10:31:01.033Z"        
SET el23.modified = "2026-08-25T10:31:01.033Z"
SET el23.type = "indicator"
SET el23.pattern = "[ipv4-addr:value = '151.241.99.207']"
SET el23.pattern_type = "stix"
SET el23.pattern_version = "2.1"
SET el23.valid_from = "2026-07-01T10:35:59.298Z"
MERGE (el24:Report {id:"report--5c001c8b-3be2-4004-820c-4cda84ce6d22"})
ON CREATE SET el24.spec_version = "2.1", el24.created = "2026-08-25T09:00:56.904Z"        
SET el24.modified = "2026-08-25T09:00:56.904Z"
SET el24.type = "report"
SET el24.name = "CISA Warns of Check Point Authentication Vulnerability Actively Exploited in the Wild"
SET el24.published = "2026-07-23T09:00:56.904Z"
MERGE (er19:ExternalReference {url:"https://cybersecuritynews.com/check-point-vulnerability-exploited/"})
ON CREATE SET er19.source_name = "cyber-security-news"
MERGE (el24)-[rel19:HAS_EXTERNAL_REFERENCE {relationship_type: "property"}]->(er19)
MERGE (el9)-[rel20:PRODUCED_BY {relationship_type: "reference"}]->(el2)
MERGE (el10)-[rel21:PRODUCED_BY {relationship_type: "reference"}]->(el2)
MERGE (el20)-[rel22:CREATED_BY {relationship_type: "reference"}]->(el2)
MERGE (el21)-[rel23:CREATED_BY {relationship_type: "reference"}]->(el2)
MERGE (el22)-[rel24:CREATED_BY {relationship_type: "reference"}]->(el2)
MERGE (el23)-[rel25:CREATED_BY {relationship_type: "reference"}]->(el2)
MERGE (el24)-[rel26:CREATED_BY {relationship_type: "reference"}]->(el1)
MERGE (el24)-[rel27:REFERS_TO {relationship_type: "reference"}]->(el3)
MERGE (el24)-[rel28:REFERS_TO {relationship_type: "reference"}]->(el4)
MERGE (el24)-[rel29:REFERS_TO {relationship_type: "reference"}]->(el5)
MERGE (el24)-[rel30:REFERS_TO {relationship_type: "reference"}]->(el18)
MERGE (el24)-[rel31:REFERS_TO {relationship_type: "reference"}]->(el19)
MERGE (el24)-[rel32:REFERS_TO {relationship_type: "reference"}]->(el20)
MERGE (el24)-[rel33:REFERS_TO {relationship_type: "reference"}]->(el21)
MERGE (el24)-[rel34:REFERS_TO {relationship_type: "reference"}]->(el22)
MERGE (el24)-[rel35:REFERS_TO {relationship_type: "reference"}]->(el23)
MERGE (el24)-[rel36:REFERS_TO {relationship_type: "reference"}]->(el12)
MERGE (el24)-[rel37:REFERS_TO {relationship_type: "reference"}]->(el13)
MERGE (el24)-[rel38:REFERS_TO {relationship_type: "reference"}]->(el14)
MERGE (el24)-[rel39:REFERS_TO {relationship_type: "reference"}]->(el15)
MERGE (el24)-[rel40:REFERS_TO {relationship_type: "reference"}]->(el16)
MERGE (el24)-[rel41:REFERS_TO {relationship_type: "reference"}]->(el17)
MERGE (el24)-[rel42:REFERS_TO {relationship_type: "reference"}]->(el11)
MERGE (el24)-[rel43:REFERS_TO {relationship_type: "reference"}]->(el9)
MERGE (el24)-[rel44:REFERS_TO {relationship_type: "reference"}]->(el10)
MERGE (el24)-[rel45:REFERS_TO {relationship_type: "reference"}]->(el6)
MERGE (el24)-[rel46:REFERS_TO {relationship_type: "reference"}]->(el7)
MERGE (el24)-[rel47:REFERS_TO {relationship_type: "reference"}]->(el8)
MERGE (el8)-[r25:REMEDIATES {id:"relationship--c62d0b4a-f3b7-45b3-9edc-7c8047515a48"}]->(el3)    
ON CREATE SET r25.spec_version = "2.1", r25.created = "2026-08-01T11:08:47.761737Z", r25.modified = "2026-08-01T11:08:47.761737Z"
MERGE (el18)-[r26:BASED_ON {id:"relationship--f1dadb04-92bb-40cd-a547-1228d02b976e"}]->(el16)    
ON CREATE SET r26.spec_version = "2.1", r26.created = "2026-08-01T11:08:47.762842Z", r26.modified = "2026-08-25T11:08:47.762842Z"
MERGE (el19)-[r27:BASED_ON {id:"relationship--a333f498-80d0-4280-a191-6d768ad0c52b"}]->(el17)    
ON CREATE SET r27.spec_version = "2.1", r27.created = "2026-08-01T11:08:47.762913Z", r27.modified = "2026-08-25T11:08:47.762913Z"
MERGE (el20)-[r28:BASED_ON {id:"relationship--bcc6d18c-1825-4c64-a356-f1ea1c342615"}]->(el15)    
ON CREATE SET r28.spec_version = "2.1", r28.created = "2026-08-01T11:08:47.762981Z", r28.modified = "2026-08-25T11:08:47.762981Z"
MERGE (el21)-[r29:BASED_ON {id:"relationship--55f410e7-76b0-4696-b481-3c1af9fb8bba"}]->(el14)    
ON CREATE SET r29.spec_version = "2.1", r29.created = "2026-08-01T11:08:47.763046Z", r29.modified = "2026-08-25T11:08:47.763046Z"
MERGE (el22)-[r30:BASED_ON {id:"relationship--e6cf6a05-4d2e-431e-977a-46ba67a23f24"}]->(el13)    
ON CREATE SET r30.spec_version = "2.1", r30.created = "2026-08-01T11:08:47.763115Z", r30.modified = "2026-08-01T11:08:47.763115Z"
MERGE (el23)-[r31:BASED_ON {id:"relationship--61cc7e62-96b7-4cf4-81bb-af41af2d0a52"}]->(el12)    
ON CREATE SET r31.spec_version = "2.1", r31.created = "2026-08-01T11:08:47.763182Z", r31.modified = "2026-08-25T11:08:47.763182Z"
MERGE (el19)-[r32:INDICATES {id:"relationship--91660bf7-4d47-4290-ae5c-a54717b3e09b"}]->(el11)    
ON CREATE SET r32.spec_version = "2.1", r32.created = "2026-08-01T11:08:47.762775Z", r32.modified = "2026-08-01T11:08:47.762775Z"
MERGE (el18)-[r33:INDICATES {id:"relationship--8b887f97-d0be-44c7-8aff-1e52066dc398"}]->(el11)    
ON CREATE SET r33.spec_version = "2.1", r33.created = "2026-08-01T11:08:47.762709Z", r33.modified = "2026-08-01T11:08:47.762709Z"
MERGE (el20)-[r34:INDICATES {id:"relationship--ee7dc08c-9fd9-4bef-a2f2-3bcea47b2e51"}]->(el11)    
ON CREATE SET r34.spec_version = "2.1", r34.created = "2026-08-01T11:08:47.762643Z", r34.modified = "2026-08-01T11:08:47.762643Z"
MERGE (el21)-[r35:INDICATES {id:"relationship--d1c1eec5-1a5b-4201-9a5b-60b26c10aaa1"}]->(el11)    
ON CREATE SET r35.spec_version = "2.1", r35.created = "2026-08-01T11:08:47.762579Z", r35.modified = "2026-08-01T11:08:47.762579Z"
MERGE (el23)-[r36:INDICATES {id:"relationship--29a34cad-28f9-4c8c-a560-eead780a4608"}]->(el11)    
ON CREATE SET r36.spec_version = "2.1", r36.created = "2026-08-01T11:08:47.762443Z", r36.modified = "2026-08-01T11:08:47.762443Z"
MERGE (el22)-[r37:INDICATES {id:"relationship--9c6f890e-0955-4d13-8ef1-450b4535597b"}]->(el11)    
ON CREATE SET r37.spec_version = "2.1", r37.created = "2026-08-01T11:08:47.762512Z", r37.modified = "2026-08-01T11:08:47.762512Z"
MERGE (el11)-[r38:TARGETS {id:"relationship--f5494477-3cfb-490b-b4df-10e3b9c7fc23"}]->(el3)    
ON CREATE SET r38.spec_version = "2.1", r38.created = "2026-08-01T11:08:47.762373Z", r38.modified = "2026-08-01T11:08:47.762373Z"
MERGE (el9)-[r39:HAS {id:"relationship--96791df5-efb8-484f-97b2-d0ed12657b40"}]->(el5)    
ON CREATE SET r39.spec_version = "2.1", r39.created = "2026-08-01T11:08:47.762167Z", r39.modified = "2026-08-01T11:08:47.762167Z"
MERGE (el9)-[r40:HAS {id:"relationship--03b9255d-f4aa-4c67-8908-99fa102aadd7"}]->(el4)    
ON CREATE SET r40.spec_version = "2.1", r40.created = "2026-08-01T11:08:47.762237Z", r40.modified = "2026-08-01T11:08:47.762237Z"
MERGE (el9)-[r41:HAS {id:"relationship--fc6049c5-28c6-489d-bc5d-d6604de7e1bc"}]->(el3)    
ON CREATE SET r41.spec_version = "2.1", r41.created = "2026-08-01T11:08:47.762304Z", r41.modified = "2026-08-01T11:08:47.762304Z"
MERGE (el6)-[r42:MITIGATES {id:"relationship--7f2fa41c-fba1-474b-ad7f-5d5b595762e7"}]->(el3)    
ON CREATE SET r42.spec_version = "2.1", r42.created = "2026-08-01T11:08:47.761884Z", r42.modified = "2026-08-01T11:08:47.761884Z"
MERGE (el8)-[r43:REMEDIATES {id:"relationship--a319bdfd-cd0b-4f2e-90be-543eb9ed0cab"}]->(el4)    
ON CREATE SET r43.spec_version = "2.1", r43.created = "2026-08-01T11:08:47.761952Z", r43.modified = "2026-08-01T11:08:47.761952Z"
MERGE (el8)-[r44:REMEDIATES {id:"relationship--e0b0a7eb-ea11-4865-a1cb-668f90993915"}]->(el5)    
ON CREATE SET r44.spec_version = "2.1", r44.created = "2026-08-01T11:08:47.762026Z", r44.modified = "2026-08-01T11:08:47.762026Z"
MERGE (el10)-[r45:HAS {id:"relationship--c10ca714-a261-4cd7-a0a9-db6367aa1cbf"}]->(el5)    
ON CREATE SET r45.spec_version = "2.1", r45.created = "2026-08-01T11:08:47.762094Z", r45.modified = "2026-08-01T11:08:47.762094Z"
MERGE (el7)-[r46:MITIGATES {id:"relationship--4ddfc56f-22f4-4db4-933b-c93e233d5a9c"}]->(el3)    
ON CREATE SET r46.spec_version = "2.1", r46.created = "2026-08-01T11:08:47.761814Z", r46.modified = "2026-08-01T11:08:47.761814Z"
RETURN el0, st1, rel1, st2, rel2, st3, rel3, el1, st4, rel4, st5, rel5, el2, st6, rel6, st7, rel7, el3, er8, rel8, er9, rel9, er10, rel10, el4, er11, rel11, er12, rel12, er13, rel13, el5, er14, rel14, er15, rel15, er16, rel16, el6, el7, el8, el9, el10, el11, kcp17, rel17, er18, rel18, el12, el13, el14, el15, el16, el17, el18, el19, el20, el21, el22, el23, el24, er19, rel19, rel20, rel21, rel22, rel23, rel24, rel25, rel26, rel27, rel28, rel29, rel30, rel31, rel32, rel33, rel34, rel35, rel36, rel37, rel38, rel39, rel40, rel41, rel42, rel43, rel44, rel45, rel46, rel47, r25, r26, r27, r28, r29, r30, r31, r32, r33, r34, r35, r36, r37, r38, r39, r40, r41, r42, r43, r44, r45, r46