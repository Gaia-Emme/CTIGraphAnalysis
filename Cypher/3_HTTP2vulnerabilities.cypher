MERGE (el0:Identity {id:"identity--b97bba6b-08f1-48ff-8232-2e8327ae5cd9"})
ON CREATE SET el0.spec_version = "2.1", el0.created = "2026-08-01T09:23:00.171615Z"        
SET el0.modified = "2026-08-02T09:23:00.171615Z"
SET el0.type = "identity"
SET el0.name = "Meta Platforms, Inc."
SET el0.roles = ['vendor', 'social-media-provider', 'cyber-security-research']
SET el0.identity_class = "organization"
MERGE (st1:Sector {type:"communications"})
MERGE (el0)-[rel1:IN_SECTOR {relationship_type: "property"}]->(st1)
MERGE (st2:Sector {type:"entertainment-media"})
MERGE (el0)-[rel2:IN_SECTOR {relationship_type: "property"}]->(st2)
MERGE (st3:Sector {type:"technology"})
MERGE (el0)-[rel3:IN_SECTOR {relationship_type: "property"}]->(st3)
SET el0.contact_information = "https://meta.com"
MERGE (el1:Identity {id:"identity--fc28739e-dfb4-44e4-b0ee-0412fba71132"})
ON CREATE SET el1.spec_version = "2.1", el1.created = "2026-08-01T09:23:00.173652Z"        
SET el1.modified = "2026-08-01T09:23:00.173652Z"
SET el1.type = "identity"
SET el1.name = "Apache Software Foundation"
SET el1.roles = ['open-source-developer', 'software-foundation']
SET el1.identity_class = "organization"
MERGE (st4:Sector {type:"technology"})
MERGE (el1)-[rel4:IN_SECTOR {relationship_type: "property"}]->(st4)
SET el1.contact_information = "https://apache.org"
MERGE (el2:Identity {id:"identity--3e7872dd-9764-4385-920e-bc901cde582c"})
ON CREATE SET el2.spec_version = "2.1", el2.created = "2026-08-01T09:23:00.174184Z"        
SET el2.modified = "2026-08-01T09:23:00.174184Z"
SET el2.type = "identity"
SET el2.name = "F5 Networks"
SET el2.roles = ['vendor', 'network-hardware-provider', 'cyber-security-research']
SET el2.identity_class = "organization"
MERGE (st5:Sector {type:"technology"})
MERGE (el2)-[rel5:IN_SECTOR {relationship_type: "property"}]->(st5)
MERGE (st6:Sector {type:"commercial"})
MERGE (el2)-[rel6:IN_SECTOR {relationship_type: "property"}]->(st6)
SET el2.contact_information = "https://f5.com"
MERGE (el3:Identity {id:"identity--fa34f35d-ffd7-4f74-9eae-48261c439289"})
ON CREATE SET el3.spec_version = "2.1", el3.created = "2026-08-01T09:23:00.174291Z"        
SET el3.modified = "2026-08-01T09:23:00.174291Z"
SET el3.type = "identity"
SET el3.name = "Okta Red Team"
SET el3.roles = ['red-team', 'adversary-simulation', 'internal-security-testing']
SET el3.identity_class = "organization"
MERGE (st7:Sector {type:"technology"})
MERGE (el3)-[rel7:IN_SECTOR {relationship_type: "property"}]->(st7)
MERGE (st8:Sector {type:"commercial"})
MERGE (el3)-[rel8:IN_SECTOR {relationship_type: "property"}]->(st8)
SET el3.contact_information = "https://sec.okta.com"
MERGE (el4:Identity {id:"identity--5b965ca5-c116-43c3-8d0e-d2530f2e0631"})
ON CREATE SET el4.spec_version = "2.1", el4.created = "2026-08-02T09:23:00.174832Z"        
SET el4.modified = "2026-08-02T09:23:00.174832Z"
SET el4.type = "identity"
SET el4.name = "CERT Coordination Center"
SET el4.roles = ['csirt', 'coordination-center', 'vulnerability-coordinator']
SET el4.identity_class = "organization"
MERGE (st9:Sector {type:"education"})
MERGE (el4)-[rel9:IN_SECTOR {relationship_type: "property"}]->(st9)
MERGE (st10:Sector {type:"communications"})
MERGE (el4)-[rel10:IN_SECTOR {relationship_type: "property"}]->(st10)
MERGE (st11:Sector {type:"technology"})
MERGE (el4)-[rel11:IN_SECTOR {relationship_type: "property"}]->(st11)
SET el4.contact_information = "https://cert.org"
MERGE (el5:Identity {id:"identity--24673cb3-c9fb-45cf-95f8-6f7419f1812b"})
ON CREATE SET el5.spec_version = "2.1", el5.created = "2026-08-02T09:23:00.174927Z"        
SET el5.modified = "2026-08-02T09:23:00.174927Z"
SET el5.type = "identity"
SET el5.name = "Cyber Security News"
SET el5.roles = ['news-media', 'threat-intel-aggregator']
SET el5.identity_class = "organization"
MERGE (st12:Sector {type:"communications"})
MERGE (el5)-[rel12:IN_SECTOR {relationship_type: "property"}]->(st12)
MERGE (st13:Sector {type:"technology"})
MERGE (el5)-[rel13:IN_SECTOR {relationship_type: "property"}]->(st13)
SET el5.contact_information = "https://cybersecuritynews.com"
MERGE (el6:Vulnerability {id:"vulnerability--0f785f67-87fd-4501-94ab-3cea0956709f"})
ON CREATE SET el6.spec_version = "2.1", el6.created = "2026-08-01T09:23:00.172418Z"        
SET el6.modified = "2026-08-02T09:23:00.172418Z"
SET el6.type = "vulnerability"
SET el6.name = "HTTP/2 flow-control causing OOM"
SET el6.description = "A remote, unauthenticated attacker could exploit HTTP/2 flow-control by setting SETTINGS_INITIAL_WINDOW_SIZE to 0 or withholding WINDOW_UPDATE frames, causing the server to buffer complete response bodies in memory indefinitely for stalled streams."
MERGE (er14:ExternalReference {url:"https://www.cve.org/CVERecord?id=CVE-2026-44909"})
ON CREATE SET er14.source_name = "cve"
ON CREATE SET er14.external_id = "CVE-2026-44909"
MERGE (el6)-[rel14:HAS_EXTERNAL_REFERENCE {relationship_type: "property"}]->(er14)
MERGE (er15:ExternalReference {url:"https://nvd.nist.gov/vuln/detail/CVE-2026-44909"})
ON CREATE SET er15.source_name = "cvss"
ON CREATE SET er15.description = "CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H"
ON CREATE SET er15.external_id = "7.5"
MERGE (el6)-[rel15:HAS_EXTERNAL_REFERENCE {relationship_type: "property"}]->(er15)
MERGE (er16:ExternalReference {url:"https://cwe.mitre.org/data/definitions/770.html"})
ON CREATE SET er16.source_name = "cwe"
ON CREATE SET er16.description = "Allocation of Resources Without Limits or Throttling"
ON CREATE SET er16.external_id = "CWE-770"
MERGE (el6)-[rel16:HAS_EXTERNAL_REFERENCE {relationship_type: "property"}]->(er16)
MERGE (el7:Vulnerability {id:"vulnerability--f51a14cc-8218-4f91-8d82-b13f7204f5e3"})
ON CREATE SET el7.spec_version = "2.1", el7.created = "2026-08-01T09:23:00.173937Z"        
SET el7.modified = "2026-08-02T09:23:00.173937Z"
SET el7.type = "vulnerability"
SET el7.name = "Uncontrolled Resource Consumption vulnerability"
SET el7.description = "Apache Traffic Server: DoS vulnerability in HTTP/2 via stalled flow-control conditions"
MERGE (er17:ExternalReference {url:"https://www.cve.org/CVERecord?id=CVE-2026-59173"})
ON CREATE SET er17.source_name = "cve"
ON CREATE SET er17.external_id = "CVE-2026-59173"
MERGE (el7)-[rel17:HAS_EXTERNAL_REFERENCE {relationship_type: "property"}]->(er17)
MERGE (er18:ExternalReference {url:"https://nvd.nist.gov/vuln/detail/CVE-2026-59173"})
ON CREATE SET er18.source_name = "cvss"
ON CREATE SET er18.description = "CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H"
ON CREATE SET er18.external_id = "7.5"
MERGE (el7)-[rel18:HAS_EXTERNAL_REFERENCE {relationship_type: "property"}]->(er18)
MERGE (er19:ExternalReference {url:"https://cwe.mitre.org/data/definitions/400.html"})
ON CREATE SET er19.source_name = "cwe"
ON CREATE SET er19.description = "Uncontrolled Resource Consumption"
ON CREATE SET er19.external_id = "CWE-400"
MERGE (el7)-[rel19:HAS_EXTERNAL_REFERENCE {relationship_type: "property"}]->(er19)
MERGE (el8:Vulnerability {id:"vulnerability--f82a4ba1-fd84-4241-bd0f-98d6c65edeec"})
ON CREATE SET el8.spec_version = "2.1", el8.created = "2026-08-01T09:23:00.174462Z"        
SET el8.modified = "2026-08-02T09:23:00.174462Z"
SET el8.type = "vulnerability"
SET el8.name = "BIG-IP HTTP/2 vulnerability"
SET el8.description = "This vulnerability allows a remote, unauthenticated attacker to cause a degradation of service that can lead to a denial-of-service (DoS) on the BIG-IP system."
MERGE (er20:ExternalReference {url:"https://www.cve.org/CVERecord?id=CVE-2026-59762"})
ON CREATE SET er20.source_name = "cve"
ON CREATE SET er20.external_id = "CVE-2026-59762"
MERGE (el8)-[rel20:HAS_EXTERNAL_REFERENCE {relationship_type: "property"}]->(er20)
MERGE (er21:ExternalReference {url:"https://nvd.nist.gov/vuln/detail/CVE-2026-59762"})
ON CREATE SET er21.source_name = "cvss"
ON CREATE SET er21.description = "CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H"
ON CREATE SET er21.external_id = "7.5"
MERGE (el8)-[rel21:HAS_EXTERNAL_REFERENCE {relationship_type: "property"}]->(er21)
MERGE (er22:ExternalReference {url:"https://cwe.mitre.org/data/definitions/770.html"})
ON CREATE SET er22.source_name = "cwe"
ON CREATE SET er22.description = "Allocation of Resources Without Limits or Throttling"
ON CREATE SET er22.external_id = "CWE-770"
MERGE (el8)-[rel22:HAS_EXTERNAL_REFERENCE {relationship_type: "property"}]->(er22)
MERGE (el9:Software {id:"software--1ecaa59f-0d36-5fa1-8181-34722e8c712f"})
ON CREATE SET el9.spec_version = "2.1"
SET el9.type = "software"
SET el9.name = "Proxygen"
SET el9.vendor = "identity--b97bba6b-08f1-48ff-8232-2e8327ae5cd9"
SET el9.version = "from v2017.01.16.00before v2026.07.20.00"
MERGE (el10:Software {id:"software--c0adaa18-852c-50ff-a9da-0a9938ca7fa2"})
ON CREATE SET el10.spec_version = "2.1"
SET el10.type = "software"
SET el10.name = "Apache Traffic Server"
SET el10.vendor = "identity--fc28739e-dfb4-44e4-b0ee-0412fba71132"
SET el10.version = "from 9.0.0through 9.2.13/from 10.0.0through 10.1.2"
MERGE (el11:Software {id:"software--edac26e0-9dc1-5aae-9823-02b2f067626b"})
ON CREATE SET el11.spec_version = "2.1"
SET el11.type = "software"
SET el11.name = "BIG-IP"
SET el11.vendor = "identity--3e7872dd-9764-4385-920e-bc901cde582c"
SET el11.version = "['from 21.1.0 before 21.1.0.1', 'from 21.0.0 before 21.0.0.3', 'from 17.5.0 before 17.5.1.8', 'from 17.1.0before 17.1.3.4']"
MERGE (el12:AttackPattern {id:"attack-pattern--12e2d8bd-5da4-4ac5-a2a9-1daec8888089"})
ON CREATE SET el12.spec_version = "2.1", el12.created = "2026-08-01T09:23:00.174735Z"        
SET el12.modified = "2026-08-02T09:23:00.174735Z"
SET el12.type = "attack-pattern"
SET el12.name = "Application or System Exploitation"
MERGE (kcp23:KillChainPhase {phase_name:"impact"})
ON CREATE SET kcp23.kill_chain_name = "mitre-att&ck"
MERGE (el12)-[rel23:IN_PHASE {relationship_type: "property"}]->(kcp23)
MERGE (er24:ExternalReference {url:"https://attack.mitre.org/techniques/T1499/004/"})
ON CREATE SET er24.source_name = "mitre-att&ck"
ON CREATE SET er24.description = "Impact/Endpoint Denial of Service"
ON CREATE SET er24.external_id = "T1499.004"
MERGE (el12)-[rel24:HAS_EXTERNAL_REFERENCE {relationship_type: "property"}]->(er24)
MERGE (el13:Report {id:"report--4f248a94-40b2-456f-baea-250d35f232a8"})
ON CREATE SET el13.spec_version = "2.1", el13.created = "2026-08-25T09:23:00.175026Z"        
SET el13.modified = "2026-09-08T09:23:00.175026Z"
SET el13.type = "report"
SET el13.name = "New HTTP/2 Vulnerability Lets Hackers Crash Servers With Memory Exhaustion Attacks"
SET el13.report_types = ['vulnerability']
SET el13.published = "2026-07-24T09:07:01.424Z"
MERGE (el9)-[rel25:PRODUCED_BY {relationship_type: "reference"}]->(el0)
MERGE (el10)-[rel26:PRODUCED_BY {relationship_type: "reference"}]->(el1)
MERGE (el11)-[rel27:PRODUCED_BY {relationship_type: "reference"}]->(el2)
MERGE (el13)-[rel28:CREATED_BY {relationship_type: "reference"}]->(el5)
MERGE (el13)-[rel29:REFERS_TO {relationship_type: "reference"}]->(el3)
MERGE (el13)-[rel30:REFERS_TO {relationship_type: "reference"}]->(el4)
MERGE (el13)-[rel31:REFERS_TO {relationship_type: "reference"}]->(el6)
MERGE (el13)-[rel32:REFERS_TO {relationship_type: "reference"}]->(el7)
MERGE (el13)-[rel33:REFERS_TO {relationship_type: "reference"}]->(el8)
MERGE (el13)-[rel34:REFERS_TO {relationship_type: "reference"}]->(el12)
MERGE (el13)-[rel35:REFERS_TO {relationship_type: "reference"}]->(el9)
MERGE (el13)-[rel36:REFERS_TO {relationship_type: "reference"}]->(el10)
MERGE (el13)-[rel37:REFERS_TO {relationship_type: "reference"}]->(el11)
MERGE (el9)-[r14:HAS {id:"relationship--9995500e-c3ad-44a2-b1ce-4b05cc33bd1e"}]->(el6)    
ON CREATE SET r14.spec_version = "2.1", r14.created = "2026-08-02T09:23:00.175495Z", r14.modified = "2026-08-02T09:23:00.175495Z"
MERGE (el10)-[r15:HAS {id:"relationship--e92f522e-985a-4f69-bcb0-1b453a32f9ff"}]->(el7)    
ON CREATE SET r15.spec_version = "2.1", r15.created = "2026-08-02T09:23:00.176007Z", r15.modified = "2026-08-02T09:23:00.176007Z"
MERGE (el11)-[r16:HAS {id:"relationship--4e779dfe-95d0-4344-9158-79abee7d31e0"}]->(el8)    
ON CREATE SET r16.spec_version = "2.1", r16.created = "2026-08-02T09:23:00.17617Z", r16.modified = "2026-08-02T09:23:00.17617Z"
MERGE (el12)-[r17:TARGETS {id:"relationship--39621452-b7c1-4124-b5f4-0f07983a7d18"}]->(el6)    
ON CREATE SET r17.spec_version = "2.1", r17.created = "2026-08-01T09:23:00.17636Z", r17.modified = "2026-08-01T09:23:00.17636Z"
MERGE (el12)-[r18:TARGETS {id:"relationship--ab8c5f02-ecd2-409a-82eb-5280d4e9c61b"}]->(el7)    
ON CREATE SET r18.spec_version = "2.1", r18.created = "2026-08-01T09:23:00.176496Z", r18.modified = "2026-08-01T09:23:00.176496Z"
MERGE (el12)-[r19:TARGETS {id:"relationship--10d6c475-9a44-4994-845e-0af24c7a5fbd"}]->(el8)    
ON CREATE SET r19.spec_version = "2.1", r19.created = "2026-08-01T09:23:00.176625Z", r19.modified = "2026-08-01T09:23:00.176625Z"
MERGE (el3)-[r20:DISCOVERED {id:"relationship--a629f457-5f6d-44f2-ba0e-3862d3caa90b"}]->(el6)    
ON CREATE SET r20.spec_version = "2.1", r20.created = "2026-08-02T09:23:00.17675Z", r20.modified = "2026-08-02T09:23:00.17675Z"
MERGE (el3)-[r21:DISCOVERED {id:"relationship--ea5afd95-e6cf-4d8e-acbe-fb3030a8453d"}]->(el7)    
ON CREATE SET r21.spec_version = "2.1", r21.created = "2026-08-02T09:23:00.176874Z", r21.modified = "2026-08-02T09:23:00.176874Z"
MERGE (el3)-[r22:DISCOVERED {id:"relationship--c072a783-9249-4726-b648-9b0d92a21a2e"}]->(el8)    
ON CREATE SET r22.spec_version = "2.1", r22.created = "2026-08-02T09:23:00.177124Z", r22.modified = "2026-08-02T09:23:00.177124Z"
MERGE (el4)-[r23:COORDINATED_DISCLOSURE_OF {id:"relationship--5cc24586-58c1-418b-b96d-0865be4c52f9"}]->(el6)    
ON CREATE SET r23.spec_version = "2.1", r23.created = "2026-08-02T09:23:00.177337Z", r23.modified = "2026-08-02T09:23:00.177337Z"
MERGE (el4)-[r24:COORDINATED_DISCLOSURE_OF {id:"relationship--41d4038c-7a2f-4b2e-b86f-d202f221b6cc"}]->(el7)    
ON CREATE SET r24.spec_version = "2.1", r24.created = "2026-08-02T09:23:00.177484Z", r24.modified = "2026-08-02T09:23:00.177484Z"
MERGE (el4)-[r25:COORDINATED_DISCLOSURE_OF {id:"relationship--daa3e518-da8a-44c8-94d9-c6f271cc903e"}]->(el8)    
ON CREATE SET r25.spec_version = "2.1", r25.created = "2026-08-02T09:23:00.177631Z", r25.modified = "2026-08-02T09:23:00.177631Z"
RETURN el0, st1, rel1, st2, rel2, st3, rel3, el1, st4, rel4, el2, st5, rel5, st6, rel6, el3, st7, rel7, st8, rel8, el4, st9, rel9, st10, rel10, st11, rel11, el5, st12, rel12, st13, rel13, el6, er14, rel14, er15, rel15, er16, rel16, el7, er17, rel17, er18, rel18, er19, rel19, el8, er20, rel20, er21, rel21, er22, rel22, el9, el10, el11, el12, kcp23, rel23, er24, rel24, el13, rel25, rel26, rel27, rel28, rel29, rel30, rel31, rel32, rel33, rel34, rel35, rel36, rel37, r14, r15, r16, r17, r18, r19, r20, r21, r22, r23, r24, r25