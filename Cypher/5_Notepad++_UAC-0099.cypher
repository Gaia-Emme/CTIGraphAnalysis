MERGE (el0:Identity {id:"identity--24673cb3-c9fb-45cf-95f8-6f7419f1812b"})
ON CREATE SET el0.spec_version = "2.1", el0.created = "2026-08-02T09:23:00.174927Z"        
SET el0.modified = "2026-08-02T09:23:00.174927Z"
SET el0.type = "identity"
SET el0.name = "Cyber Security News"
SET el0.roles = ['news-media', 'threat-intel-aggregator']
SET el0.identity_class = "organization"
MERGE (st1:Sector {type:"communications"})
MERGE (el0)-[rel1:IN_SECTOR {relationship_type: "property"}]->(st1)
MERGE (st2:Sector {type:"technology"})
MERGE (el0)-[rel2:IN_SECTOR {relationship_type: "property"}]->(st2)
SET el0.contact_information = "https://cybersecuritynews.com"
MERGE (el1:Identity {id:"identity--4e29f9f4-5e46-4b9f-b450-5e9f91867f1f"})
ON CREATE SET el1.spec_version = "2.1", el1.created = "2026-08-03T17:08:53.241124Z"        
SET el1.modified = "2026-08-03T17:08:53.241124Z"
SET el1.type = "identity"
SET el1.name = "CERT-UA"
SET el1.roles = ['csirt', 'cybersecurity', 'incident-response-team']
SET el1.identity_class = "organization"
MERGE (st3:Sector {type:"government-national"})
MERGE (el1)-[rel3:IN_SECTOR {relationship_type: "property"}]->(st3)
MERGE (st4:Sector {type:"communications"})
MERGE (el1)-[rel4:IN_SECTOR {relationship_type: "property"}]->(st4)
MERGE (st5:Sector {type:"defence"})
MERGE (el1)-[rel5:IN_SECTOR {relationship_type: "property"}]->(st5)
SET el1.contact_information = "https://cert.gov.ua/"
MERGE (el2:Identity {id:"identity--e96e82b2-cdde-5d8e-96c0-d25ae79ecd6a"})
ON CREATE SET el2.spec_version = "2.1", el2.created = "2026-08-04T16:43:52.076Z"        
SET el2.modified = "2026-08-04T16:43:52.076Z"
SET el2.type = "identity"
SET el2.name = "Gaia Emme"
SET el2.identity_class = "individual"
MERGE (el3:Campaign {id:"campaign--04090d0b-329d-4e87-b657-2539f895c2c6"})
ON CREATE SET el3.spec_version = "2.1", el3.created = "2026-08-03T17:08:53.241124Z"        
SET el3.modified = "2026-09-08T16:26:55.562Z"
SET el3.type = "campaign"
SET el3.name = "Abuse Notepad++ Plugins with LUNCHPOKE, BURNYBEAR and MATCHBOIL.V2"
SET el3.first_seen = "2026-07-20T17:08:53.241124Z"
MERGE (el4:IntrusionSet {id:"intrusion-set--7d5f5917-641d-4b94-9694-c49f78985764"})
ON CREATE SET el4.spec_version = "2.1", el4.created = "2026-08-03T17:08:53.241124Z"        
SET el4.modified = "2026-08-03T17:08:53.241124Z"
SET el4.type = "intrusion-set"
SET el4.name = "UAC-0099"
MERGE (el5:AttackPattern {id:"attack-pattern--aa8e337a-b7d5-426d-85f9-98b6614ed681"})
ON CREATE SET el5.spec_version = "2.1", el5.created = "2026-08-03T17:08:53.241124Z"        
SET el5.modified = "2026-08-03T17:08:53.241124Z"
SET el5.type = "attack-pattern"
SET el5.name = "Phishing"
MERGE (kcp6:KillChainPhase {phase_name:"initial-access"})
ON CREATE SET kcp6.kill_chain_name = "mitre-att&ck"
MERGE (el5)-[rel6:IN_PHASE {relationship_type: "property"}]->(kcp6)
MERGE (er7:ExternalReference {url:"https://attack.mitre.org/techniques/T1566/"})
ON CREATE SET er7.source_name = "mitre-att&ck"
ON CREATE SET er7.description = "Phishing"
ON CREATE SET er7.external_id = "T1566"
MERGE (el5)-[rel7:HAS_EXTERNAL_REFERENCE {relationship_type: "property"}]->(er7)
MERGE (el6:AttackPattern {id:"attack-pattern--e10c1fbd-adb4-4b11-9ec2-9ef3b3f00efe"})
ON CREATE SET el6.spec_version = "2.1", el6.created = "2026-08-03T17:08:53.241124Z"        
SET el6.modified = "2026-08-25T17:08:53.241124Z"
SET el6.type = "attack-pattern"
SET el6.name = "Double File Extension"
MERGE (kcp8:KillChainPhase {phase_name:"stealth"})
ON CREATE SET kcp8.kill_chain_name = "mitre-att&ck"
MERGE (el6)-[rel8:IN_PHASE {relationship_type: "property"}]->(kcp8)
MERGE (er9:ExternalReference {url:"https://attack.mitre.org/techniques/T1036/007/"})
ON CREATE SET er9.source_name = "mitre-att&ck"
ON CREATE SET er9.description = "Masquerading:Double File Extension"
ON CREATE SET er9.external_id = "T1036.007"
MERGE (el6)-[rel9:HAS_EXTERNAL_REFERENCE {relationship_type: "property"}]->(er9)
MERGE (el7:AttackPattern {id:"attack-pattern--d1b8cf16-8f52-49cd-b82f-b52c7960abd2"})
ON CREATE SET el7.spec_version = "2.1", el7.created = "2026-08-03T17:08:53.241124Z"        
SET el7.modified = "2026-08-03T17:08:53.241124Z"
SET el7.type = "attack-pattern"
SET el7.name = "User Execution"
MERGE (kcp10:KillChainPhase {phase_name:"execution"})
ON CREATE SET kcp10.kill_chain_name = "mitre-att&ck"
MERGE (el7)-[rel10:IN_PHASE {relationship_type: "property"}]->(kcp10)
MERGE (er11:ExternalReference {url:"https://attack.mitre.org/techniques/T1204/"})
ON CREATE SET er11.source_name = "mitre-att&ck"
ON CREATE SET er11.description = "User Execution"
ON CREATE SET er11.external_id = "T1204"
MERGE (el7)-[rel11:HAS_EXTERNAL_REFERENCE {relationship_type: "property"}]->(er11)
MERGE (el8:AttackPattern {id:"attack-pattern--0c00f039-8843-4c65-a7e3-4dd1e1765650"})
ON CREATE SET el8.spec_version = "2.1", el8.created = "2026-08-03T17:08:53.241124Z"        
SET el8.modified = "2026-08-03T17:08:53.241124Z"
SET el8.type = "attack-pattern"
SET el8.name = "Command and Scripting Interpreter"
MERGE (kcp12:KillChainPhase {phase_name:"execution"})
ON CREATE SET kcp12.kill_chain_name = "mitre-att&ck"
MERGE (el8)-[rel12:IN_PHASE {relationship_type: "property"}]->(kcp12)
MERGE (er13:ExternalReference {url:"https://attack.mitre.org/techniques/T1059/"})
ON CREATE SET er13.source_name = "mitre-att&ck"
ON CREATE SET er13.description = "Command and Scripting Interpreter"
ON CREATE SET er13.external_id = "T1059"
MERGE (el8)-[rel13:HAS_EXTERNAL_REFERENCE {relationship_type: "property"}]->(er13)
MERGE (el9:AttackPattern {id:"attack-pattern--719777c8-ab87-4803-b3dd-5771c156c3fc"})
ON CREATE SET el9.spec_version = "2.1", el9.created = "2026-08-03T17:08:53.241124Z"        
SET el9.modified = "2026-08-25T17:08:53.241124Z"
SET el9.type = "attack-pattern"
SET el9.name = "DLL"
MERGE (kcp14:KillChainPhase {phase_name:"execution"})
ON CREATE SET kcp14.kill_chain_name = "mitre-att&ck"
MERGE (el9)-[rel14:IN_PHASE {relationship_type: "property"}]->(kcp14)
MERGE (kcp15:KillChainPhase {phase_name:"stealth"})
ON CREATE SET kcp15.kill_chain_name = "mitre-att&ck"
MERGE (el9)-[rel15:IN_PHASE {relationship_type: "property"}]->(kcp15)
MERGE (er16:ExternalReference {url:"https://attack.mitre.org/techniques/T1574/001/"})
ON CREATE SET er16.source_name = "mitre-att&ck"
ON CREATE SET er16.description = "Hijack Execution Flow:DLL"
ON CREATE SET er16.external_id = "T1574.001"
MERGE (el9)-[rel16:HAS_EXTERNAL_REFERENCE {relationship_type: "property"}]->(er16)
MERGE (el10:AttackPattern {id:"attack-pattern--a17e8cb5-be31-42b2-82de-10ab6a8e91db"})
ON CREATE SET el10.spec_version = "2.1", el10.created = "2026-08-03T17:08:53.241124Z"        
SET el10.modified = "2026-08-25T17:08:56.670211Z"
SET el10.type = "attack-pattern"
SET el10.name = "Rename Legitimate Utilities"
MERGE (kcp17:KillChainPhase {phase_name:"stealth"})
ON CREATE SET kcp17.kill_chain_name = "mitre-att&ck"
MERGE (el10)-[rel17:IN_PHASE {relationship_type: "property"}]->(kcp17)
MERGE (er18:ExternalReference {url:"https://attack.mitre.org/techniques/T1036/003/"})
ON CREATE SET er18.source_name = "mitre-att&ck"
ON CREATE SET er18.description = "Masquerading:Rename Legitimate Utilities"
ON CREATE SET er18.external_id = "T1036.003"
MERGE (el10)-[rel18:HAS_EXTERNAL_REFERENCE {relationship_type: "property"}]->(er18)
MERGE (el11:AttackPattern {id:"attack-pattern--8985752a-db3a-430c-b33d-ccf276735166"})
ON CREATE SET el11.spec_version = "2.1", el11.created = "2026-08-03T17:08:53.241124Z"        
SET el11.modified = "2026-08-03T17:08:53.241124Z"
SET el11.type = "attack-pattern"
SET el11.name = "Scheduled Task/Job"
MERGE (kcp19:KillChainPhase {phase_name:"persistence"})
ON CREATE SET kcp19.kill_chain_name = "mitre-att&ck"
MERGE (el11)-[rel19:IN_PHASE {relationship_type: "property"}]->(kcp19)
MERGE (kcp20:KillChainPhase {phase_name:"privilege-escalation"})
ON CREATE SET kcp20.kill_chain_name = "mitre-att&ck"
MERGE (el11)-[rel20:IN_PHASE {relationship_type: "property"}]->(kcp20)
MERGE (er21:ExternalReference {url:"https://attack.mitre.org/techniques/T1053/"})
ON CREATE SET er21.source_name = "mitre-att&ck"
ON CREATE SET er21.description = "Scheduled Task/Job"
ON CREATE SET er21.external_id = "T1053"
MERGE (el11)-[rel21:HAS_EXTERNAL_REFERENCE {relationship_type: "property"}]->(er21)
MERGE (el12:AttackPattern {id:"attack-pattern--07b1e2ba-d8de-47ec-976c-33afc87f5e66"})
ON CREATE SET el12.spec_version = "2.1", el12.created = "2026-08-03T17:08:53.241124Z"        
SET el12.modified = "2026-08-03T17:08:53.241124Z"
SET el12.type = "attack-pattern"
SET el12.name = "Ingress Tool Transfer"
MERGE (kcp22:KillChainPhase {phase_name:"command-and-control"})
ON CREATE SET kcp22.kill_chain_name = "mitre-att&ck"
MERGE (el12)-[rel22:IN_PHASE {relationship_type: "property"}]->(kcp22)
MERGE (er23:ExternalReference {url:"https://attack.mitre.org/techniques/T1105/"})
ON CREATE SET er23.source_name = "mitre-att&ck"
ON CREATE SET er23.description = "Ingress Tool Transfer"
ON CREATE SET er23.external_id = "T1105"
MERGE (el12)-[rel23:HAS_EXTERNAL_REFERENCE {relationship_type: "property"}]->(er23)
MERGE (el13:AttackPattern {id:"attack-pattern--614df31c-e2e8-4261-9771-0239b0d8b915"})
ON CREATE SET el13.spec_version = "2.1", el13.created = "2026-09-11T15:15:14.426Z"        
SET el13.modified = "2026-09-11T15:15:14.426Z"
SET el13.type = "attack-pattern"
SET el13.name = "Time Based Checks"
MERGE (kcp24:KillChainPhase {phase_name:"stealth"})
ON CREATE SET kcp24.kill_chain_name = "mitre-att&ck"
MERGE (el13)-[rel24:IN_PHASE {relationship_type: "property"}]->(kcp24)
MERGE (er25:ExternalReference {url:"https://attack.mitre.org/techniques/T1497/003/"})
ON CREATE SET er25.source_name = "mitre-att&ck"
ON CREATE SET er25.description = "Virtualization/Sandbox Evasion: Time Based Checks"
ON CREATE SET er25.external_id = "T1497.003"
MERGE (el13)-[rel25:HAS_EXTERNAL_REFERENCE {relationship_type: "property"}]->(er25)
MERGE (el14:AttackPattern {id:"attack-pattern--93aa8029-5a9c-48ee-8e4a-c9b9d1459e35"})
ON CREATE SET el14.spec_version = "2.1", el14.created = "2026-09-11T15:15:14.426Z"        
SET el14.modified = "2026-09-11T15:15:14.426Z"
SET el14.type = "attack-pattern"
SET el14.name = "Compression"
MERGE (kcp26:KillChainPhase {phase_name:"stealth"})
ON CREATE SET kcp26.kill_chain_name = "mitre-att&ck"
MERGE (el14)-[rel26:IN_PHASE {relationship_type: "property"}]->(kcp26)
MERGE (er27:ExternalReference {url:"https://attack.mitre.org/techniques/T1027/015/"})
ON CREATE SET er27.source_name = "mitre-att&ck"
ON CREATE SET er27.description = "Obfuscated Files or Information: Compression"
ON CREATE SET er27.external_id = "T1027.015"
MERGE (el14)-[rel27:HAS_EXTERNAL_REFERENCE {relationship_type: "property"}]->(er27)
MERGE (el15:Tool {id:"tool--375cabff-65de-4a37-ae8c-30fbaeaf171c"})
ON CREATE SET el15.spec_version = "2.1", el15.created = "2026-08-03T17:08:53.241124Z"        
SET el15.modified = "2026-08-03T17:08:53.241124Z"
SET el15.type = "tool"
SET el15.name = "WinRAR"
MERGE (el16:File {id:"file--80e5302a-a12c-5f35-9838-09892b4e0b99"})
ON CREATE SET el16.spec_version = "2.1"
SET el16.type = "file"
MERGE (hs28:Hash {md5: "087981426061c62e5be314c9b761c729"})
MERGE (el16)-[rel28:HAS_HASH {relationship_type: "property"}]->(hs28)
MERGE (hs29:Hash {sha_256: "9021d92a530bbb7b865d4842cc1b933e5b397d7a95c3f6a02db1c2512684222d"})
MERGE (el16)-[rel29:HAS_HASH {relationship_type: "property"}]->(hs29)
SET el16.size = 10559
SET el16.name = "Заводський район.pdf    .vbs"
SET el16.mtime = "2026-07-21T08:08:53.241124Z"
MERGE (el17:File {id:"file--98a9e61f-1557-5ac2-bb59-97978c9af340"})
ON CREATE SET el17.spec_version = "2.1"
SET el17.type = "file"
MERGE (hs30:Hash {md5: "acb3aa53d4d388f67cda8185e8da5423"})
MERGE (el17)-[rel30:HAS_HASH {relationship_type: "property"}]->(hs30)
MERGE (hs31:Hash {sha_256: "1c3457cf3cbe02b80236e6bf5346cfea46e2bf6063c7d92848f2780d87f93c0a"})
MERGE (el17)-[rel31:HAS_HASH {relationship_type: "property"}]->(hs31)
SET el17.size = 10559
SET el17.name = "Додатки до розпорядження.zip"
MERGE (el18:File {id:"file--9ce91d28-7d4d-5330-bc20-f97f3a54d378"})
ON CREATE SET el18.spec_version = "2.1"
SET el18.type = "file"
MERGE (hs32:Hash {md5: "88af5d862489f3bf1e7d7dd2a23ac3e8"})
MERGE (el18)-[rel32:HAS_HASH {relationship_type: "property"}]->(hs32)
MERGE (hs33:Hash {sha_256: "9ff73802dfbfd20b78ab62ecc1a56bf739ecaf1475806a14ac6ccf02150adaa8"})
MERGE (el18)-[rel33:HAS_HASH {relationship_type: "property"}]->(hs33)
SET el18.name = "Додаток    7.pdf    .vbs"
MERGE (el19:File {id:"file--b2a6336d-6f44-51a9-8435-76456bd64bf0"})
ON CREATE SET el19.spec_version = "2.1"
SET el19.type = "file"
MERGE (hs34:Hash {md5: "f976c38af91074f20c2fa6f84fce0fc3"})
MERGE (el19)-[rel34:HAS_HASH {relationship_type: "property"}]->(hs34)
MERGE (hs35:Hash {sha_256: "bfb1d0238d56615e792cfdbc1c5cd1bffc1e70535b0d243c351d7b534006bc80"})
MERGE (el19)-[rel35:HAS_HASH {relationship_type: "property"}]->(hs35)
SET el19.name = "Додатки    до    розпорядження.zip"
MERGE (el20:File {id:"file--c7762b27-7453-57ea-b872-f7bb4cefc392"})
ON CREATE SET el20.spec_version = "2.1"
SET el20.type = "file"
MERGE (hs36:Hash {md5: "0aa3fda5567844eb0d626bd0d272bc63"})
MERGE (el20)-[rel36:HAS_HASH {relationship_type: "property"}]->(hs36)
MERGE (hs37:Hash {sha_256: "3118b82c47b96140c7d6d51394a202ac0ad889f53431e2b7d11062260e691cc3"})
MERGE (el20)-[rel37:HAS_HASH {relationship_type: "property"}]->(hs37)
SET el20.name = "9206.docx    .vbs"
MERGE (el21:File {id:"file--af3cb0a5-b2e8-5020-8ffe-c9b2be78846d"})
ON CREATE SET el21.spec_version = "2.1"
SET el21.type = "file"
MERGE (hs38:Hash {md5: "c4beef83fc6557319afda9708e235bcd"})
MERGE (el21)-[rel38:HAS_HASH {relationship_type: "property"}]->(hs38)
MERGE (hs39:Hash {sha_256: "3e23b2513275a744788bb69553e603587234bee8781ed4b6215efd270c0f690c"})
MERGE (el21)-[rel39:HAS_HASH {relationship_type: "property"}]->(hs39)
SET el21.name = "запит    №9206.zip"
MERGE (el22:File {id:"file--a4d8e44b-4496-508d-9662-87bca98f1dbf"})
ON CREATE SET el22.spec_version = "2.1"
SET el22.type = "file"
SET el22.size = 8719360
SET el22.name = "notepad++.exe"
MERGE (el23:File {id:"file--95956e6e-9b5c-5be6-badf-985c8e0739e1"})
ON CREATE SET el23.spec_version = "2.1"
SET el23.type = "file"
MERGE (hs40:Hash {md5: "51e0149f93935807996dc12f7cde37c0"})
MERGE (el23)-[rel40:HAS_HASH {relationship_type: "property"}]->(hs40)
MERGE (hs41:Hash {sha_256: "25859c3855587309ac3e93dce531e8eca317d69568cc63b0f3c1f9466919c312"})
MERGE (el23)-[rel41:HAS_HASH {relationship_type: "property"}]->(hs41)
SET el23.size = 29020462
SET el23.name = "Evernote.zip"
MERGE (el24:File {id:"file--83f5ad71-11a8-5597-8882-4c81535589d0"})
ON CREATE SET el24.spec_version = "2.1"
SET el24.type = "file"
MERGE (hs42:Hash {md5: "86399225cad28f3a6f5808a16d5b324b"})
MERGE (el24)-[rel42:HAS_HASH {relationship_type: "property"}]->(hs42)
MERGE (hs43:Hash {sha_256: "87a574b6c3c0d2229c869388875c698fe491776dab7724e4cf3aded2c67b5364"})
MERGE (el24)-[rel43:HAS_HASH {relationship_type: "property"}]->(hs43)
SET el24.name = "Evernote.zip"
MERGE (el25:File {id:"file--b8d5be69-921c-53c0-b1d1-4c2db023a255"})
ON CREATE SET el25.spec_version = "2.1"
SET el25.type = "file"
MERGE (hs44:Hash {md5: "19f43fac5e0240faf027872b83a495b0"})
MERGE (el25)-[rel44:HAS_HASH {relationship_type: "property"}]->(hs44)
MERGE (hs45:Hash {sha_256: "bf5c85bb3149a88be3ce56783f209ee5ebeee1ee60c71ed4b3f7bc1ebcef3b2c"})
MERGE (el25)-[rel45:HAS_HASH {relationship_type: "property"}]->(hs45)
SET el25.name = "Заводський район.pdf"
MERGE (el26:File {id:"file--6787930c-993f-5c3a-9db1-9a4f68cbf8f3"})
ON CREATE SET el26.spec_version = "2.1"
SET el26.type = "file"
MERGE (hs46:Hash {md5: "2d1dd89241625feb8bb2571c042b1e4c"})
MERGE (el26)-[rel46:HAS_HASH {relationship_type: "property"}]->(hs46)
MERGE (hs47:Hash {sha_256: "f5b6b6972a09e83d4f660339af8162075248015756733c94832e466a82f5e987"})
MERGE (el26)-[rel47:HAS_HASH {relationship_type: "property"}]->(hs47)
SET el26.name = "9206.docx"
MERGE (el27:File {id:"file--22bab314-d5ea-5a2a-aaa0-81394da3c47e"})
ON CREATE SET el27.spec_version = "2.1"
SET el27.type = "file"
SET el27.name = "Додаток 7.pdf"
MERGE (el28:File {id:"file--72b598d6-ccf4-5f9f-a02e-0b74f1d47dd9"})
ON CREATE SET el28.spec_version = "2.1"
SET el28.type = "file"
MERGE (hs48:Hash {md5: "c5850b3ebae3790941614429a7d9322b"})
MERGE (el28)-[rel48:HAS_HASH {relationship_type: "property"}]->(hs48)
MERGE (hs49:Hash {sha_256: "c270432a3f16241c24d0b57838b17b2fa438a24eebf29dcbda08622de725fe21"})
MERGE (el28)-[rel49:HAS_HASH {relationship_type: "property"}]->(hs49)
SET el28.size = 133632
SET el28.name = "NppExport.dll"
SET el28.mtime = "2024-07-06T12:35:00Z"
MERGE (el29:File {id:"file--832b4434-8c80-5d3a-8464-a629cac96b77"})
ON CREATE SET el29.spec_version = "2.1"
SET el29.type = "file"
MERGE (hs50:Hash {md5: "59644121b4301ed64a5b44efc2c4b279"})
MERGE (el29)-[rel50:HAS_HASH {relationship_type: "property"}]->(hs50)
MERGE (hs51:Hash {sha_256: "2ab26f8d6a51694bd4c143b9389db824f48d496b1616a38b5edb882e50b2a906"})
MERGE (el29)-[rel51:HAS_HASH {relationship_type: "property"}]->(hs51)
SET el29.name = "NppExport.dll"
MERGE (el30:File {id:"file--2e3b49e9-7aa7-59b0-8183-e201ce488e86"})
ON CREATE SET el30.spec_version = "2.1"
SET el30.type = "file"
MERGE (hs52:Hash {md5: "b304986e947fe26a40e454426d90ef50"})
MERGE (el30)-[rel52:HAS_HASH {relationship_type: "property"}]->(hs52)
MERGE (hs53:Hash {sha_256: "838512a8a88f584a5d9a61cff17da0db7fa5886cccce2f84652ccb6e7808b090"})
MERGE (el30)-[rel53:HAS_HASH {relationship_type: "property"}]->(hs53)
SET el30.size = 25600
SET el30.name = "RemoteLibUpdater.exe"
SET el30.mtime = "2024-07-06T12:45:00Z"
MERGE (el31:File {id:"file--82feb9b6-a3ce-550b-9268-256117c0c53e"})
ON CREATE SET el31.spec_version = "2.1"
SET el31.type = "file"
MERGE (hs54:Hash {md5: "65a14c42358f8da7a450089141bdc690"})
MERGE (el31)-[rel54:HAS_HASH {relationship_type: "property"}]->(hs54)
MERGE (hs55:Hash {sha_256: "78cb23c739d24513b25f477183566c9fce0b329696e05482065f1bf01629c606"})
MERGE (el31)-[rel55:HAS_HASH {relationship_type: "property"}]->(hs55)
SET el31.size = 108032
SET el31.name = "InitTest.dll"
SET el31.mtime = "2026-07-07T10:17:00Z"
MERGE (el32:File {id:"file--cc0be47c-4353-575b-9bb7-961036c6b39e"})
ON CREATE SET el32.spec_version = "2.1"
SET el32.type = "file"
MERGE (hs56:Hash {md5: "5f4cefc64eab929296f4fe25b04d37ab"})
MERGE (el32)-[rel56:HAS_HASH {relationship_type: "property"}]->(hs56)
MERGE (hs57:Hash {sha_256: "85126d45d9fcdbcc084e2a7fdc449337a12dd50c6a25fd8903c41f5b351556f8"})
MERGE (el32)-[rel57:HAS_HASH {relationship_type: "property"}]->(hs57)
SET el32.size = 299518
SET el32.name = "updater.rar"
SET el32.mtime = "2026-07-07T10:17:00Z"
MERGE (el33:File {id:"file--8ee2ca40-b7e5-5fb1-b2cf-58313b32ba9b"})
ON CREATE SET el33.spec_version = "2.1"
SET el33.type = "file"
MERGE (hs58:Hash {md5: "ca1f7daf21f1524c724a20a6fc2533d0"})
MERGE (el33)-[rel58:HAS_HASH {relationship_type: "property"}]->(hs58)
MERGE (hs59:Hash {sha_256: "100102966d6d5c000b556e0451c63d03702b31c755f3f46071ea4077a1aab892"})
MERGE (el33)-[rel59:HAS_HASH {relationship_type: "property"}]->(hs59)
SET el33.name = "RemoteLibUpdater.exe"
MERGE (el34:File {id:"file--01481524-1b04-5c7e-8f4c-cc94e239f1e1"})
ON CREATE SET el34.spec_version = "2.1"
SET el34.type = "file"
MERGE (hs60:Hash {md5: "6fdd9b6040b943d5a24701149020e7a4"})
MERGE (el34)-[rel60:HAS_HASH {relationship_type: "property"}]->(hs60)
MERGE (hs61:Hash {sha_256: "d40b83d827f5b749ecec66eee09cd2c455094ad939a83a35c42af3f641871e2c"})
MERGE (el34)-[rel61:HAS_HASH {relationship_type: "property"}]->(hs61)
SET el34.name = "InitTest.dll"
MERGE (el35:File {id:"file--8df4a37c-43ff-5a3b-ad16-81e3b801bd7a"})
ON CREATE SET el35.spec_version = "2.1"
SET el35.type = "file"
MERGE (hs62:Hash {md5: "25889b954a33377f3260637c13f93ccf"})
MERGE (el35)-[rel62:HAS_HASH {relationship_type: "property"}]->(hs62)
MERGE (hs63:Hash {sha_256: "285f788ca4153994cbc4e017222b43a2c3ae9405650707cf617bf1575e90f3b9"})
MERGE (el35)-[rel63:HAS_HASH {relationship_type: "property"}]->(hs63)
SET el35.name = "updater.rar"
MERGE (el36:File {id:"file--dfa2a68c-69b2-5ae7-aa3e-03bc11a865de"})
ON CREATE SET el36.spec_version = "2.1"
SET el36.type = "file"
SET el36.size = 3286680
SET el36.name = "winrar.exe"
SET el36.mtime = "2024-05-15T10:35:00Z"
MERGE (el37:File {id:"file--15b71ba8-8bfd-5035-9c91-896e42d0e788"})
ON CREATE SET el37.spec_version = "2.1"
SET el37.type = "file"
SET el37.name = "WinRAR.exe"
MERGE (el38:File {id:"file--637f418b-4661-52cf-884b-e0e1c8a33148"})
ON CREATE SET el38.spec_version = "2.1"
SET el38.type = "file"
SET el38.name = "schtasks.exe"
MERGE (el39:File {id:"file--c33e7ae0-21ee-53fa-93a7-03384144529e"})
ON CREATE SET el39.spec_version = "2.1"
SET el39.type = "file"
SET el39.name = "Background.exe"
MERGE (el40:File {id:"file--c199e11c-5d2b-507e-8340-597d07659413"})
ON CREATE SET el40.spec_version = "2.1"
SET el40.type = "file"
SET el40.name = "Thumbs.DB"
MERGE (el41:File {id:"file--2a516555-e078-5773-8193-5cd8f76c0617"})
ON CREATE SET el41.spec_version = "2.1"
SET el41.type = "file"
SET el41.name = "Thumbs.rar"
MERGE (el42:File {id:"file--96f0e93b-9cbe-55a9-8b34-f41adea949e2"})
ON CREATE SET el42.spec_version = "2.1"
SET el42.type = "file"
SET el42.name = "SMTPClientApplication.exe"
MERGE (el43:File {id:"file--cea4a181-de9a-5d9c-8da1-4705aa37a6bf"})
ON CREATE SET el43.spec_version = "2.1"
SET el43.type = "file"
SET el43.name = "config.ini"
MERGE (el44:File {id:"file--2ddffd44-b8dc-5981-8466-1556e1336852"})
ON CREATE SET el44.spec_version = "2.1"
SET el44.type = "file"
SET el44.name = "RemoteFileViewer.exe"
MERGE (el45:Directory {id:"directory--23bf6bc2-e16f-559f-ac3c-afba4ba2acd5"})
ON CREATE SET el45.spec_version = "2.1"
SET el45.type = "directory"
SET el45.path = "%PUBLIC%\\Libs_%RAND_INT_0-999999%\\Notepad\\"
MERGE (el46:Directory {id:"directory--684e4a98-0f33-5e71-9f3f-1b557e4b5c3f"})
ON CREATE SET el46.spec_version = "2.1"
SET el46.type = "directory"
SET el46.path = "%PUBLIC%\\Libs_%RAND_INT_0-999999%\\"
MERGE (el47:Directory {id:"directory--99efb676-3c0e-59cf-a437-b1672959f8e4"})
ON CREATE SET el47.spec_version = "2.1"
SET el47.type = "directory"
SET el47.path = "%PUBLIC%\\Temp Documents\\"
MERGE (el48:Directory {id:"directory--7f30a648-3ccd-5847-8436-4c332df2821b"})
ON CREATE SET el48.spec_version = "2.1"
SET el48.type = "directory"
SET el48.path = "\\plugins\\NppExport"
MERGE (el49:Directory {id:"directory--174f2cbc-4277-5664-a7e0-108e5ce164f6"})
ON CREATE SET el49.spec_version = "2.1"
SET el49.type = "directory"
SET el49.path = "%LOCALAPPDATA%\\Temp\\"
MERGE (el50:Directory {id:"directory--80af4813-ab3b-57ab-b369-9a05fcf1df52"})
ON CREATE SET el50.spec_version = "2.1"
SET el50.type = "directory"
SET el50.path = "%PUBLIC%\\Libraries\\W1n3r-U09oTy-Ap5\\"
MERGE (el51:Directory {id:"directory--9d9f8b32-906f-5df8-9c4b-f73dcec3b59e"})
ON CREATE SET el51.spec_version = "2.1"
SET el51.type = "directory"
SET el51.path = "%PUBLIC%\\Libraries\\fFthY3-Ytrevc3w-ab3\\"
MERGE (el52:Directory {id:"directory--77d95dba-cc87-50dd-8d2b-f1d8edaf2768"})
ON CREATE SET el52.spec_version = "2.1"
SET el52.type = "directory"
SET el52.path = "C:\\Windows\\System32\\"
MERGE (el53:Directory {id:"directory--9906a7f2-633b-51c5-8c97-4f7a109fe5ed"})
ON CREATE SET el53.spec_version = "2.1"
SET el53.type = "directory"
SET el53.path = "%PUBLIC%\\Wallpapers\\"
MERGE (el54:Directory {id:"directory--03d01600-1352-5704-8a3d-a6cbed82ee73"})
ON CREATE SET el54.spec_version = "2.1"
SET el54.type = "directory"
SET el54.path = "%PUBLIC%\\Documents\\"
MERGE (el55:Directory {id:"directory--4951bf7b-8208-598d-a019-c001d494174d"})
ON CREATE SET el55.spec_version = "2.1"
SET el55.type = "directory"
SET el55.path = "%LOCALAPPDATA%\\SMTPClient\\"
MERGE (el56:Directory {id:"directory--cd2ef70d-329a-5527-95a0-ea858afa43ea"})
ON CREATE SET el56.spec_version = "2.1"
SET el56.type = "directory"
SET el56.path = "%LOCALAPPDATA%\\RemoteClient\\"
MERGE (el57:Url {id:"url--9da1a306-bc08-51e4-8de9-5f7d8de98c3e"})
ON CREATE SET el57.spec_version = "2.1"
SET el57.type = "url"
SET el57.value = "hXXps://2111.filemail[.]com/api/file/get?filekey=_GyHdjqA1jZk9GBKUwPTyvQXi1845xJM8aJ90NJYqQfZr09s2Kbv21C8oOXYSoamIdNKjcHZpFbwRMiLelxCD_DuAz3B"
SET el57.defanged = True
MERGE (el58:Url {id:"url--14e679a5-a174-56cb-8ee0-e5fe11d43f41"})
ON CREATE SET el58.spec_version = "2.1"
SET el58.type = "url"
SET el58.value = "hXXps://3008.filemail[.]com/api/file/get?filekey=3abVeFuPB6y_BRqYcrv3SiX_xX76hS5HS0o7uNSA5_5vIyhNnXCinrJ50pUQJ6zP0nxjpl4K"
SET el58.defanged = True
MERGE (el59:Url {id:"url--70cbe0af-8725-5605-a27c-0e8da279d9bc"})
ON CREATE SET el59.spec_version = "2.1"
SET el59.type = "url"
SET el59.value = "hXXps://2117.filemail[.]com/api/file/get?filekey=Edzhz0KXaXC1Ncob7gwQcdfcUYmO78aRW5qZ66N0Xe7cTgTBS-LAPZYHzQ"
SET el59.defanged = True
MERGE (el60:Url {id:"url--dcc7ec0c-7466-5c28-a2cc-c9e388b88b91"})
ON CREATE SET el60.spec_version = "2.1"
SET el60.type = "url"
SET el60.value = "hXXps://9d0be5e43042be826d3e5e2a880a311d.r2.cloudflarestorage[.]com/easysend/4c6b5985b6ea1bd365a9426ff2f96a1e.zip"
SET el60.defanged = True
MERGE (el61:Url {id:"url--969acd39-756e-53e4-8ddc-fb32cb5c8067"})
ON CREATE SET el61.spec_version = "2.1"
SET el61.type = "url"
SET el61.value = "hXXps://9d0be5e43042be826d3e5e2a880a311d.r2.cloudflarestorage[.]com/easysend/0f86e2fc7ca538e9f5c0f04ea1856e03.zip"
SET el61.defanged = True
MERGE (el62:Url {id:"url--58e4850c-c279-5bdf-ac3d-9f307ce9573f"})
ON CREATE SET el62.spec_version = "2.1"
SET el62.type = "url"
SET el62.value = "hXXps://cdn.imageurlgenerator[.]com/uploads/19b5c23d-a191-4a73-b200-1a89ff953607.txt"
SET el62.defanged = True
MERGE (el63:Url {id:"url--63511fbd-0430-5d76-8e08-f6ca9cde5d4c"})
ON CREATE SET el63.spec_version = "2.1"
SET el63.type = "url"
SET el63.value = "hXXps://cdn.imageurlgenerator[.]com/uploads/4dc169b0-dbed-4485-bcc0-1c0f78316445.zip"
SET el63.defanged = True
MERGE (el64:Url {id:"url--e7cdb86b-bacd-529c-8ed5-71720ff27046"})
ON CREATE SET el64.spec_version = "2.1"
SET el64.type = "url"
SET el64.value = "hXXps://www.dropbox[.]com/scl/fi/yewyhqs2zlclen1q9i7mp/WinRAR.exe?rlkey=ks0f020ufkfgbf8hb20fayz2w&st=vcaaa4ld&dl=1"
SET el64.defanged = True
MERGE (el65:Url {id:"url--25a03888-c3ed-53cc-a510-03e70bed4ae1"})
ON CREATE SET el65.spec_version = "2.1"
SET el65.type = "url"
SET el65.value = "hXXps://kaufen-qpon[.]icu/manager/%TOKEN%"
SET el65.defanged = True
MERGE (el66:Url {id:"url--d52213b4-2900-587d-9e0e-a8f9795b3046"})
ON CREATE SET el66.spec_version = "2.1"
SET el66.type = "url"
SET el66.value = "hXXps://cutt[.]ly/cywqWxow"
SET el66.defanged = True
MERGE (el67:Url {id:"url--9072fb95-ef27-5c2b-ac13-62192d3f57d6"})
ON CREATE SET el67.spec_version = "2.1"
SET el67.type = "url"
SET el67.value = "hXXps://cutt[.]ly/OytaqyAq"
SET el67.defanged = True
MERGE (el68:Url {id:"url--7d34f164-617f-5ef2-8338-05db5a23feb4"})
ON CREATE SET el68.spec_version = "2.1"
SET el68.type = "url"
SET el68.value = "hXXps://cutt[.]ly/kt6zygri"
SET el68.defanged = True
MERGE (el69:Url {id:"url--27de9e5b-3358-56eb-8d41-0fd63454cf9d"})
ON CREATE SET el69.spec_version = "2.1"
SET el69.type = "url"
SET el69.value = "hXXps://easysend[.]co/d/6160"
SET el69.defanged = True
MERGE (el70:EmailAddr {id:"email-addr--d8a665e8-2440-52cd-9e6b-f543428f9527"})
ON CREATE SET el70.spec_version = "2.1"
SET el70.type = "email-addr"
SET el70.value = "kancel.mkrada@ukr.net"
SET el70.display_name = "Миколаївська МР"
MERGE (el71:EmailMessage {id:"email-message--6ccbe8f6-4c32-5615-be69-f7ea9fe1fd98"})
ON CREATE SET el71.spec_version = "2.1"
SET el71.type = "email-message"
SET el71.is_multipart = True
SET el71.content_type = "multipart/mixed"
SET el71.subject = "Зміни у плані перевірок"
CREATE (mp64:BodyMultipart)
SET mp64.body_raw_ref = "file--98a9e61f-1557-5ac2-bb59-97978c9af340"
SET mp64.content_type = "application/zip"
MERGE (el71)-[rel64:HAS_MULTIPART {relationship_type: "property"}]->(mp64)
MERGE (el72:DomainName {id:"domain-name--868ba14b-0579-5044-b155-1a5dc3b3d39c"})
ON CREATE SET el72.spec_version = "2.1"
SET el72.type = "domain-name"
SET el72.value = "kaufen-qpon[.]icu"
SET el72.defanged = True
MERGE (el73:DomainName {id:"domain-name--2db03d15-67b6-552b-9da6-a43329a12ea4"})
ON CREATE SET el73.spec_version = "2.1"
SET el73.type = "domain-name"
SET el73.value = "cdn.imageurlgenerator[.]com"
SET el73.defanged = True
MERGE (el74:DomainName {id:"domain-name--7ea06000-475a-5a34-9df3-0ba5eb1e0e85"})
ON CREATE SET el74.spec_version = "2.1"
SET el74.type = "domain-name"
SET el74.value = "easysend[.]co"
SET el74.defanged = True
MERGE (el75:DomainName {id:"domain-name--18443008-3550-5e57-a93a-b2dfb833f087"})
ON CREATE SET el75.spec_version = "2.1"
SET el75.type = "domain-name"
SET el75.value = "filemail[.]com "
SET el75.defanged = True
MERGE (el76:Ipv4Addr {id:"ipv4-addr--4f73ce97-5559-55be-aacd-3943c41811af"})
ON CREATE SET el76.spec_version = "2.1"
SET el76.type = "ipv4-addr"
SET el76.value = "64.94.84[.]204"
SET el76.defanged = True
MERGE (el77:Process {id:"process--8d2eb09b-71f8-4cb8-a240-6099c3f88798"})
ON CREATE SET el77.spec_version = "2.1"
SET el77.type = "process"
SET el77.command_line = "\\\"C:\\\\Users\\\\Public\\\\Wallpapers\\\\Background.exe\\\" /create /sc minute /mo 3 /tn \\\"Win3r-U09oTy-Ap5\\\\Updates\\\" /tr \\\"C:\\\\Users\\\\Public\\\\Libraries\\\\W1n3r-U09oTy-Ap5\\\\RemoteLibUpdater.exe setup nodisplay\\\" /f"
MERGE (el78:Indicator {id:"indicator--ea318be6-89b6-4b3b-9318-954253069c80"})
ON CREATE SET el78.spec_version = "2.1", el78.created = "2026-08-04T10:09:20.802223Z"        
SET el78.modified = "2026-08-04T10:09:20.802223Z"
SET el78.type = "indicator"
SET el78.pattern = "[file:name = 'Заводський район.pdf    .vbs' OR file:name = 'Додаток    7.pdf    .vbs' OR file:name = '9206.docx    .vbs'] OR [file:hashes.'SHA-256' = '9021d92a530bbb7b865d4842cc1b933e5b397d7a95c3f6a02db1c2512684222d' OR file:hashes.'SHA-256' = '9ff73802dfbfd20b78ab62ecc1a56bf739ecaf1475806a14ac6ccf02150adaa8' OR file:hashes.'SHA-256' = '3118b82c47b96140c7d6d51394a202ac0ad889f53431e2b7d11062260e691cc3']"
SET el78.pattern_type = "stix"
SET el78.pattern_version = "2.1"
SET el78.valid_from = "2026-07-01T09:07:01.424Z"
MERGE (kcp65:KillChainPhase {phase_name:"stealth"})
ON CREATE SET kcp65.kill_chain_name = "mitre-att&ck"
MERGE (el78)-[rel65:IN_PHASE {relationship_type: "property"}]->(kcp65)
MERGE (el79:Indicator {id:"indicator--d0380574-8478-44cf-ac99-3a4a073b17c0"})
ON CREATE SET el79.spec_version = "2.1", el79.created = "2026-08-04T10:09:20.802223Z"        
SET el79.modified = "2026-09-12T16:04:01.043Z"
SET el79.type = "indicator"
SET el79.pattern = "[file:name = 'NppExport.dll'] OR [file:hashes.'SHA-256' = 'c270432a3f16241c24d0b57838b17b2fa438a24eebf29dcbda08622de725fe21' OR file:hashes.'SHA-256' = '2ab26f8d6a51694bd4c143b9389db824f48d496b1616a38b5edb882e50b2a906']"
SET el79.pattern_type = "stix"
SET el79.pattern_version = "2.1"
SET el79.valid_from = "2026-07-01T09:07:01.424Z"
MERGE (kcp66:KillChainPhase {phase_name:"stealth"})
ON CREATE SET kcp66.kill_chain_name = "mitre-att&ck"
MERGE (el79)-[rel66:IN_PHASE {relationship_type: "property"}]->(kcp66)
MERGE (kcp67:KillChainPhase {phase_name:"execution"})
ON CREATE SET kcp67.kill_chain_name = "mitre-att&ck"
MERGE (el79)-[rel67:IN_PHASE {relationship_type: "property"}]->(kcp67)
MERGE (el80:Indicator {id:"indicator--e8207255-6ea5-48e0-8c14-1a163d512bd9"})
ON CREATE SET el80.spec_version = "2.1", el80.created = "2026-08-04T10:09:20.802223Z"        
SET el80.modified = "2026-08-05T09:55:56.678907Z"
SET el80.type = "indicator"
SET el80.pattern = "[file:name = 'RemoteLibUpdater.exe'] OR [file:hashes.'SHA-256' = '838512a8a88f584a5d9a61cff17da0db7fa5886cccce2f84652ccb6e7808b090' OR file:hashes.'SHA-256' = '100102966d6d5c000b556e0451c63d03702b31c755f3f46071ea4077a1aab892']"
SET el80.pattern_type = "stix"
SET el80.pattern_version = "2.1"
SET el80.valid_from = "2026-07-01T09:07:01.424Z"
MERGE (kcp68:KillChainPhase {phase_name:"stealth"})
ON CREATE SET kcp68.kill_chain_name = "mitre-att&ck"
MERGE (el80)-[rel68:IN_PHASE {relationship_type: "property"}]->(kcp68)
MERGE (kcp69:KillChainPhase {phase_name:"execution"})
ON CREATE SET kcp69.kill_chain_name = "mitre-att&ck"
MERGE (el80)-[rel69:IN_PHASE {relationship_type: "property"}]->(kcp69)
MERGE (el81:Indicator {id:"indicator--72776ac5-3659-4d03-a42f-90d1bcc12362"})
ON CREATE SET el81.spec_version = "2.1", el81.created = "2026-08-04T10:09:20.802223Z"        
SET el81.modified = "2026-08-05T09:55:56.678907Z"
SET el81.type = "indicator"
SET el81.pattern = "[file:name = 'InitTest.dll'] OR [file:hashes.'SHA-256' = '78cb23c739d24513b25f477183566c9fce0b329696e05482065f1bf01629c606' OR file:hashes.'SHA-256' = 'd40b83d827f5b749ecec66eee09cd2c455094ad939a83a35c42af3f641871e2c']"
SET el81.pattern_type = "stix"
SET el81.pattern_version = "2.1"
SET el81.valid_from = "2026-07-01T09:07:01.424Z"
MERGE (kcp70:KillChainPhase {phase_name:"command-and-control"})
ON CREATE SET kcp70.kill_chain_name = "mitre-att&ck"
MERGE (el81)-[rel70:IN_PHASE {relationship_type: "property"}]->(kcp70)
MERGE (el82:Indicator {id:"indicator--38756227-b0c6-451f-b6cc-a0be62dcf4bd"})
ON CREATE SET el82.spec_version = "2.1", el82.created = "2026-08-04T10:09:20.802223Z"        
SET el82.modified = "2026-08-05T09:55:56.678907Z"
SET el82.type = "indicator"
SET el82.pattern = "[file:name = 'Додатки до розпорядження.zip' OR file:name = 'Додатки    до    розпорядження.zip' OR file:name = 'запит    №9206.zip'] OR [file:hashes.'SHA-256' = '1c3457cf3cbe02b80236e6bf5346cfea46e2bf6063c7d92848f2780d87f93c0a' OR file:hashes.'SHA-256' = 'bfb1d0238d56615e792cfdbc1c5cd1bffc1e70535b0d243c351d7b534006bc80' OR file:hashes.'SHA-256' = '3e23b2513275a744788bb69553e603587234bee8781ed4b6215efd270c0f690c']"
SET el82.pattern_type = "stix"
SET el82.pattern_version = "2.1"
SET el82.valid_from = "2026-07-01T09:07:01.424Z"
MERGE (kcp71:KillChainPhase {phase_name:"initial-access"})
ON CREATE SET kcp71.kill_chain_name = "mitre-att&ck"
MERGE (el82)-[rel71:IN_PHASE {relationship_type: "property"}]->(kcp71)
MERGE (el83:Indicator {id:"indicator--615f5eef-fb4b-4338-a888-8dd51510d4af"})
ON CREATE SET el83.spec_version = "2.1", el83.created = "2026-08-04T10:09:20.802223Z"        
SET el83.modified = "2026-08-04T10:09:20.802223Z"
SET el83.type = "indicator"
SET el83.pattern = "(?i).*\\\\Background\\.exe.*\\\\RemoteLibUpdater\\.exe.*"
SET el83.pattern_type = "pcre"
SET el83.valid_from = "2026-07-01T09:07:01.424Z"
MERGE (kcp72:KillChainPhase {phase_name:"persistence"})
ON CREATE SET kcp72.kill_chain_name = "mitre-att&ck"
MERGE (el83)-[rel72:IN_PHASE {relationship_type: "property"}]->(kcp72)
MERGE (kcp73:KillChainPhase {phase_name:"privilege-escalation"})
ON CREATE SET kcp73.kill_chain_name = "mitre-att&ck"
MERGE (el83)-[rel73:IN_PHASE {relationship_type: "property"}]->(kcp73)
MERGE (el84:Malware {id:"malware--ca6130f8-1773-4ebe-b9b9-c76105eaa673"})
ON CREATE SET el84.spec_version = "2.1", el84.created = "2026-08-03T17:08:53.241124Z"        
SET el84.modified = "2026-09-09T10:41:58.155Z"
SET el84.type = "malware"
SET el84.name = "VBS Dropper"
SET el84.malware_types = ['dropper', 'downloader']
SET el84.is_family = True
SET el84.first_seen = "2026-07-21T08:08:58.155Z"
SET el84.capabilities = ['installs-other-components']
MERGE (el85:Malware {id:"malware--e02e6686-2e63-409e-85f7-f81da3cbec9e"})
ON CREATE SET el85.spec_version = "2.1", el85.created = "2026-08-03T17:08:53.241124Z"        
SET el85.modified = "2026-09-09T11:41:58.155Z"
SET el85.type = "malware"
SET el85.name = "LUNCHPOKE"
SET el85.description = "Create a hidden Libraries folder, extracts an archive, copy the Windows schtasks.exe file to mask the persistence configuration and run BURNYBEAR every 3 minutes"
SET el85.malware_types = ['dropper']
SET el85.is_family = True
MERGE (el86:Malware {id:"malware--2987439c-9bc5-48f3-af1d-a9d666744634"})
ON CREATE SET el86.spec_version = "2.1", el86.created = "2026-08-03T17:08:53.241124Z"        
SET el86.modified = "2026-08-04T10:09:20.811005Z"
SET el86.type = "malware"
SET el86.name = "BURNYBEAR"
SET el86.description = "Loading InitTest.dll and if it runs without arguments, it switches to a resource-exhaustion routine"
SET el86.malware_types = ['dropper', 'resource-exploitation']
SET el86.is_family = True
SET el86.capabilities = ['violates-system-operational-integrity']
MERGE (el87:Malware {id:"malware--3cc2d632-7436-4d26-8d9f-18cabf3f5c30"})
ON CREATE SET el87.spec_version = "2.1", el87.created = "2026-08-03T17:08:53.241124Z"        
SET el87.modified = "2026-08-04T10:09:20.811005Z"
SET el87.type = "malware"
SET el87.name = "MATCHBOIL.V2"
SET el87.malware_types = ['downloader', 'backdoor']
SET el87.is_family = True
SET el87.capabilities = ['anti-sandbox', 'communicates-with-c2']
MERGE (el88:Note {id:"note--4cae1441-c567-4cb0-a126-68882f7131c8"})
ON CREATE SET el88.spec_version = "2.1", el88.created = "2026-09-08T16:26:55.562Z"        
SET el88.modified = "2026-09-11T11:02:11.928Z"
SET el88.type = "note"
SET el88.abstract = "Confidenza media riguardo la data della prima osservazione"
SET el88.content = "L'articolo parla di \"metà estate\", ma non specifica una data in particolare"
MERGE (el89:Note {id:"note--e93a02a5-4d23-421d-8595-6d300c471ee0"})
ON CREATE SET el89.spec_version = "2.1", el89.created = "2026-09-11T11:02:11.928Z"        
SET el89.modified = "2026-09-11T11:02:11.928Z"
SET el89.type = "note"
SET el89.abstract = "Riflessione sul doppio richiamo a winrar nel corso della catena di attacco"
SET el89.content = "Il fatto che WinRAR venga sia ottenuto tramite Evernote.zip nelle prime fasi,  sia riscaricato nella fase finale da MATCHBOIL, qualora non già presente in ProgramFiles, mi fa pensare che la catena di attacco sia stata perfezionata e, quindi, non si tratti  della sua prima versione. Ciò può significare che precedenti tentativi non fossero andati  a buon fine, oppure che la TTP fosse stata scoperta e si è reso necessario cambiare metodo."
MERGE (el90:Report {id:"report--140e5882-d0d5-457e-9c82-909fad8d3bb9"})
ON CREATE SET el90.spec_version = "2.1", el90.created = "2026-08-03T17:08:53.241124Z"        
SET el90.modified = "2026-08-04T10:09:20.811005Z"
SET el90.type = "report"
SET el90.name = "Hackers Abuse Notepad++ Plugins to Compromise Your System Silently"
SET el90.report_types = ['attack-pattern', 'intrusion-set', 'campaign']
SET el90.published = "2026-07-23T09:07:01.424Z"
MERGE (er74:ExternalReference {url:"https://cybersecuritynews.com/hackers-abuse-notepad-plugins/"})
ON CREATE SET er74.source_name = "cyber-security-news"
MERGE (el90)-[rel74:HAS_EXTERNAL_REFERENCE {relationship_type: "property"}]->(er74)
MERGE (el91:Report {id:"report--0cc0dc1e-9909-4dc5-bc30-423716c8cf35"})
ON CREATE SET el91.spec_version = "2.1", el91.created = "2026-08-03T17:08:53.241124Z"        
SET el91.modified = "2026-09-11T15:45:14.426Z"
SET el91.type = "report"
SET el91.name = "UAC-0099: LUNCHPOKE, BURNYBEAR, оновлений MATCHBOIL.V2 та використання Notepad++ 8.8.3"
SET el91.report_types = ['attack-pattern', 'intrusion-set', 'campaign']
SET el91.published = "2026-07-21T09:07:01.424Z"
MERGE (er75:ExternalReference {url:"https://cert.gov.ua/article/6318634"})
ON CREATE SET er75.source_name = "cert-ua"
MERGE (el91)-[rel75:HAS_EXTERNAL_REFERENCE {relationship_type: "property"}]->(er75)
CREATE (ext1:Extension {extension_type:"archive-ext"})
MERGE (ext1)-[rel76:CONTAINS {relationship_type: "reference"}]->(el16)
MERGE (el17)-[rel77:HAS_EXTENSION {relationship_type: "property"}]->(ext1)
CREATE (ext2:Extension {extension_type:"archive-ext"})
MERGE (ext2)-[rel78:CONTAINS {relationship_type: "reference"}]->(el18)
MERGE (el19)-[rel79:HAS_EXTENSION {relationship_type: "property"}]->(ext2)
CREATE (ext3:Extension {extension_type:"archive-ext"})
MERGE (ext3)-[rel80:CONTAINS {relationship_type: "reference"}]->(el20)
MERGE (el21)-[rel81:HAS_EXTENSION {relationship_type: "property"}]->(ext3)
MERGE (el22)-[rel82:HAS_PARENT_DIRECTORY {relationship_type: "reference"}]->(el45)
CREATE (ext4:Extension {extension_type:"windows-pebinary-ext"})
SET ext4.pe_type = "exe"
SET ext4.time_date_stamp = "2025-07-09T02:41:00Z"
MERGE (el22)-[rel83:HAS_EXTENSION {relationship_type: "property"}]->(ext4)
MERGE (el23)-[rel84:HAS_PARENT_DIRECTORY {relationship_type: "reference"}]->(el46)
CREATE (ext5:Extension {extension_type:"archive-ext"})
MERGE (ext5)-[rel85:CONTAINS {relationship_type: "reference"}]->(el22)
MERGE (ext5)-[rel86:CONTAINS {relationship_type: "reference"}]->(el48)
MERGE (el23)-[rel87:HAS_EXTENSION {relationship_type: "property"}]->(ext5)
MERGE (el24)-[rel88:HAS_PARENT_DIRECTORY {relationship_type: "reference"}]->(el46)
CREATE (ext6:Extension {extension_type:"archive-ext"})
MERGE (ext6)-[rel89:CONTAINS {relationship_type: "reference"}]->(el22)
MERGE (ext6)-[rel90:CONTAINS {relationship_type: "reference"}]->(el48)
MERGE (el24)-[rel91:HAS_EXTENSION {relationship_type: "property"}]->(ext6)
MERGE (el25)-[rel92:HAS_PARENT_DIRECTORY {relationship_type: "reference"}]->(el47)
MERGE (el26)-[rel93:HAS_PARENT_DIRECTORY {relationship_type: "reference"}]->(el47)
MERGE (el27)-[rel94:HAS_PARENT_DIRECTORY {relationship_type: "reference"}]->(el47)
MERGE (el28)-[rel95:HAS_PARENT_DIRECTORY {relationship_type: "reference"}]->(el48)
CREATE (ext7:Extension {extension_type:"windows-pebinary-ext"})
SET ext7.pe_type = "dll"
MERGE (el28)-[rel96:HAS_EXTENSION {relationship_type: "property"}]->(ext7)
MERGE (el29)-[rel97:HAS_PARENT_DIRECTORY {relationship_type: "reference"}]->(el48)
MERGE (el30)-[rel98:HAS_PARENT_DIRECTORY {relationship_type: "reference"}]->(el50)
MERGE (el32)-[rel99:HAS_PARENT_DIRECTORY {relationship_type: "reference"}]->(el48)
CREATE (ext8:Extension {extension_type:"archive-ext"})
MERGE (ext8)-[rel100:CONTAINS {relationship_type: "reference"}]->(el30)
MERGE (ext8)-[rel101:CONTAINS {relationship_type: "reference"}]->(el31)
MERGE (el32)-[rel102:HAS_EXTENSION {relationship_type: "property"}]->(ext8)
MERGE (el33)-[rel103:HAS_PARENT_DIRECTORY {relationship_type: "reference"}]->(el50)
MERGE (el35)-[rel104:HAS_PARENT_DIRECTORY {relationship_type: "reference"}]->(el48)
CREATE (ext9:Extension {extension_type:"archive-ext"})
MERGE (ext9)-[rel105:CONTAINS {relationship_type: "reference"}]->(el33)
MERGE (ext9)-[rel106:CONTAINS {relationship_type: "reference"}]->(el34)
MERGE (el35)-[rel107:HAS_EXTENSION {relationship_type: "property"}]->(ext9)
MERGE (el36)-[rel108:HAS_PARENT_DIRECTORY {relationship_type: "reference"}]->(el48)
CREATE (ext10:Extension {extension_type:"windows-pebinary-ext"})
SET ext10.pe_type = "exe"
MERGE (el36)-[rel109:HAS_EXTENSION {relationship_type: "property"}]->(ext10)
MERGE (el37)-[rel110:HAS_PARENT_DIRECTORY {relationship_type: "reference"}]->(el49)
CREATE (ext11:Extension {extension_type:"windows-pebinary-ext"})
SET ext11.pe_type = "exe"
MERGE (el37)-[rel111:HAS_EXTENSION {relationship_type: "property"}]->(ext11)
MERGE (el38)-[rel112:HAS_PARENT_DIRECTORY {relationship_type: "reference"}]->(el52)
MERGE (el39)-[rel113:HAS_PARENT_DIRECTORY {relationship_type: "reference"}]->(el53)
MERGE (el40)-[rel114:HAS_PARENT_DIRECTORY {relationship_type: "reference"}]->(el54)
MERGE (el41)-[rel115:HAS_PARENT_DIRECTORY {relationship_type: "reference"}]->(el54)
MERGE (el42)-[rel116:HAS_PARENT_DIRECTORY {relationship_type: "reference"}]->(el55)
MERGE (el43)-[rel117:HAS_PARENT_DIRECTORY {relationship_type: "reference"}]->(el55)
MERGE (el44)-[rel118:HAS_PARENT_DIRECTORY {relationship_type: "reference"}]->(el56)
MERGE (el45)-[rel119:CONTAINS {relationship_type: "reference"}]->(el22)
MERGE (el46)-[rel120:CONTAINS {relationship_type: "reference"}]->(el45)
MERGE (el46)-[rel121:CONTAINS {relationship_type: "reference"}]->(el23)
MERGE (el46)-[rel122:CONTAINS {relationship_type: "reference"}]->(el24)
MERGE (el47)-[rel123:CONTAINS {relationship_type: "reference"}]->(el25)
MERGE (el47)-[rel124:CONTAINS {relationship_type: "reference"}]->(el26)
MERGE (el47)-[rel125:CONTAINS {relationship_type: "reference"}]->(el27)
MERGE (el48)-[rel126:CONTAINS {relationship_type: "reference"}]->(el28)
MERGE (el48)-[rel127:CONTAINS {relationship_type: "reference"}]->(el32)
MERGE (el48)-[rel128:CONTAINS {relationship_type: "reference"}]->(el36)
MERGE (el48)-[rel129:CONTAINS {relationship_type: "reference"}]->(el29)
MERGE (el48)-[rel130:CONTAINS {relationship_type: "reference"}]->(el35)
MERGE (el49)-[rel131:CONTAINS {relationship_type: "reference"}]->(el36)
MERGE (el50)-[rel132:CONTAINS {relationship_type: "reference"}]->(el30)
MERGE (el50)-[rel133:CONTAINS {relationship_type: "reference"}]->(el33)
MERGE (el51)-[rel134:CONTAINS {relationship_type: "reference"}]->(el30)
MERGE (el51)-[rel135:CONTAINS {relationship_type: "reference"}]->(el33)
MERGE (el51)-[rel136:CONTAINS {relationship_type: "reference"}]->(el31)
MERGE (el51)-[rel137:CONTAINS {relationship_type: "reference"}]->(el34)
MERGE (el53)-[rel138:CONTAINS {relationship_type: "reference"}]->(el39)
MERGE (el54)-[rel139:CONTAINS {relationship_type: "reference"}]->(el40)
MERGE (el54)-[rel140:CONTAINS {relationship_type: "reference"}]->(el41)
MERGE (el55)-[rel141:CONTAINS {relationship_type: "reference"}]->(el42)
MERGE (el55)-[rel142:CONTAINS {relationship_type: "reference"}]->(el43)
MERGE (el56)-[rel143:CONTAINS {relationship_type: "reference"}]->(el44)
MERGE (el71)-[rel144:FROM {relationship_type: "reference"}]->(el70)
MERGE (el77)-[rel145:HAS_IMAGE_REF {relationship_type: "reference"}]->(el30)
MERGE (el84)-[rel146:HAS_SAMPLE {relationship_type: "reference"}]->(el16)
MERGE (el84)-[rel147:HAS_SAMPLE {relationship_type: "reference"}]->(el18)
MERGE (el84)-[rel148:HAS_SAMPLE {relationship_type: "reference"}]->(el20)
MERGE (el85)-[rel149:HAS_SAMPLE {relationship_type: "reference"}]->(el28)
MERGE (el85)-[rel150:HAS_SAMPLE {relationship_type: "reference"}]->(el29)
MERGE (el86)-[rel151:HAS_SAMPLE {relationship_type: "reference"}]->(el30)
MERGE (el86)-[rel152:HAS_SAMPLE {relationship_type: "reference"}]->(el33)
MERGE (el87)-[rel153:HAS_SAMPLE {relationship_type: "reference"}]->(el31)
MERGE (el87)-[rel154:HAS_SAMPLE {relationship_type: "reference"}]->(el34)
MERGE (el88)-[rel155:CREATED_BY {relationship_type: "reference"}]->(el2)
MERGE (el88)-[rel156:REFERS_TO {relationship_type: "reference"}]->(el3)
MERGE (el89)-[rel157:CREATED_BY {relationship_type: "reference"}]->(el2)
MERGE (el89)-[rel158:REFERS_TO {relationship_type: "reference"}]->(el36)
MERGE (el89)-[rel159:REFERS_TO {relationship_type: "reference"}]->(el37)
MERGE (el89)-[rel160:REFERS_TO {relationship_type: "reference"}]->(el15)
MERGE (el89)-[rel161:REFERS_TO {relationship_type: "reference"}]->(el84)
MERGE (el89)-[rel162:REFERS_TO {relationship_type: "reference"}]->(el87)
MERGE (el90)-[rel163:CREATED_BY {relationship_type: "reference"}]->(el0)
MERGE (el90)-[rel164:REFERS_TO {relationship_type: "reference"}]->(el4)
MERGE (el90)-[rel165:REFERS_TO {relationship_type: "reference"}]->(el84)
MERGE (el90)-[rel166:REFERS_TO {relationship_type: "reference"}]->(el85)
MERGE (el90)-[rel167:REFERS_TO {relationship_type: "reference"}]->(el86)
MERGE (el90)-[rel168:REFERS_TO {relationship_type: "reference"}]->(el87)
MERGE (el90)-[rel169:REFERS_TO {relationship_type: "reference"}]->(el5)
MERGE (el90)-[rel170:REFERS_TO {relationship_type: "reference"}]->(el6)
MERGE (el90)-[rel171:REFERS_TO {relationship_type: "reference"}]->(el7)
MERGE (el90)-[rel172:REFERS_TO {relationship_type: "reference"}]->(el8)
MERGE (el90)-[rel173:REFERS_TO {relationship_type: "reference"}]->(el9)
MERGE (el90)-[rel174:REFERS_TO {relationship_type: "reference"}]->(el10)
MERGE (el90)-[rel175:REFERS_TO {relationship_type: "reference"}]->(el11)
MERGE (el90)-[rel176:REFERS_TO {relationship_type: "reference"}]->(el12)
MERGE (el90)-[rel177:REFERS_TO {relationship_type: "reference"}]->(el13)
MERGE (el90)-[rel178:REFERS_TO {relationship_type: "reference"}]->(el3)
MERGE (el90)-[rel179:REFERS_TO {relationship_type: "reference"}]->(el15)
MERGE (el90)-[rel180:REFERS_TO {relationship_type: "reference"}]->(el1)
MERGE (el90)-[rel181:REFERS_TO {relationship_type: "reference"}]->(el16)
MERGE (el90)-[rel182:REFERS_TO {relationship_type: "reference"}]->(el17)
MERGE (el90)-[rel183:REFERS_TO {relationship_type: "reference"}]->(el18)
MERGE (el91)-[rel184:CREATED_BY {relationship_type: "reference"}]->(el1)
MERGE (el91)-[rel185:REFERS_TO {relationship_type: "reference"}]->(el4)
MERGE (el91)-[rel186:REFERS_TO {relationship_type: "reference"}]->(el45)
MERGE (el91)-[rel187:REFERS_TO {relationship_type: "reference"}]->(el46)
MERGE (el91)-[rel188:REFERS_TO {relationship_type: "reference"}]->(el47)
MERGE (el91)-[rel189:REFERS_TO {relationship_type: "reference"}]->(el48)
MERGE (el91)-[rel190:REFERS_TO {relationship_type: "reference"}]->(el49)
MERGE (el91)-[rel191:REFERS_TO {relationship_type: "reference"}]->(el50)
MERGE (el91)-[rel192:REFERS_TO {relationship_type: "reference"}]->(el51)
MERGE (el91)-[rel193:REFERS_TO {relationship_type: "reference"}]->(el52)
MERGE (el91)-[rel194:REFERS_TO {relationship_type: "reference"}]->(el53)
MERGE (el91)-[rel195:REFERS_TO {relationship_type: "reference"}]->(el54)
MERGE (el91)-[rel196:REFERS_TO {relationship_type: "reference"}]->(el55)
MERGE (el91)-[rel197:REFERS_TO {relationship_type: "reference"}]->(el56)
MERGE (el91)-[rel198:REFERS_TO {relationship_type: "reference"}]->(el77)
MERGE (el91)-[rel199:REFERS_TO {relationship_type: "reference"}]->(el71)
MERGE (el91)-[rel200:REFERS_TO {relationship_type: "reference"}]->(el3)
MERGE (el91)-[rel201:REFERS_TO {relationship_type: "reference"}]->(el5)
MERGE (el91)-[rel202:REFERS_TO {relationship_type: "reference"}]->(el6)
MERGE (el91)-[rel203:REFERS_TO {relationship_type: "reference"}]->(el7)
MERGE (el91)-[rel204:REFERS_TO {relationship_type: "reference"}]->(el8)
MERGE (el91)-[rel205:REFERS_TO {relationship_type: "reference"}]->(el9)
MERGE (el91)-[rel206:REFERS_TO {relationship_type: "reference"}]->(el10)
MERGE (el91)-[rel207:REFERS_TO {relationship_type: "reference"}]->(el11)
MERGE (el91)-[rel208:REFERS_TO {relationship_type: "reference"}]->(el12)
MERGE (el91)-[rel209:REFERS_TO {relationship_type: "reference"}]->(el13)
MERGE (el91)-[rel210:REFERS_TO {relationship_type: "reference"}]->(el14)
MERGE (el91)-[rel211:REFERS_TO {relationship_type: "reference"}]->(el84)
MERGE (el91)-[rel212:REFERS_TO {relationship_type: "reference"}]->(el85)
MERGE (el91)-[rel213:REFERS_TO {relationship_type: "reference"}]->(el86)
MERGE (el91)-[rel214:REFERS_TO {relationship_type: "reference"}]->(el87)
MERGE (el91)-[rel215:REFERS_TO {relationship_type: "reference"}]->(el15)
MERGE (el91)-[rel216:REFERS_TO {relationship_type: "reference"}]->(el70)
MERGE (el91)-[rel217:REFERS_TO {relationship_type: "reference"}]->(el72)
MERGE (el91)-[rel218:REFERS_TO {relationship_type: "reference"}]->(el73)
MERGE (el91)-[rel219:REFERS_TO {relationship_type: "reference"}]->(el74)
MERGE (el91)-[rel220:REFERS_TO {relationship_type: "reference"}]->(el75)
MERGE (el91)-[rel221:REFERS_TO {relationship_type: "reference"}]->(el76)
MERGE (el91)-[rel222:REFERS_TO {relationship_type: "reference"}]->(el16)
MERGE (el91)-[rel223:REFERS_TO {relationship_type: "reference"}]->(el17)
MERGE (el91)-[rel224:REFERS_TO {relationship_type: "reference"}]->(el18)
MERGE (el91)-[rel225:REFERS_TO {relationship_type: "reference"}]->(el19)
MERGE (el91)-[rel226:REFERS_TO {relationship_type: "reference"}]->(el20)
MERGE (el91)-[rel227:REFERS_TO {relationship_type: "reference"}]->(el21)
MERGE (el91)-[rel228:REFERS_TO {relationship_type: "reference"}]->(el22)
MERGE (el91)-[rel229:REFERS_TO {relationship_type: "reference"}]->(el23)
MERGE (el91)-[rel230:REFERS_TO {relationship_type: "reference"}]->(el24)
MERGE (el91)-[rel231:REFERS_TO {relationship_type: "reference"}]->(el25)
MERGE (el91)-[rel232:REFERS_TO {relationship_type: "reference"}]->(el26)
MERGE (el91)-[rel233:REFERS_TO {relationship_type: "reference"}]->(el27)
MERGE (el91)-[rel234:REFERS_TO {relationship_type: "reference"}]->(el28)
MERGE (el91)-[rel235:REFERS_TO {relationship_type: "reference"}]->(el29)
MERGE (el91)-[rel236:REFERS_TO {relationship_type: "reference"}]->(el32)
MERGE (el91)-[rel237:REFERS_TO {relationship_type: "reference"}]->(el35)
MERGE (el91)-[rel238:REFERS_TO {relationship_type: "reference"}]->(el36)
MERGE (el91)-[rel239:REFERS_TO {relationship_type: "reference"}]->(el30)
MERGE (el91)-[rel240:REFERS_TO {relationship_type: "reference"}]->(el33)
MERGE (el91)-[rel241:REFERS_TO {relationship_type: "reference"}]->(el31)
MERGE (el91)-[rel242:REFERS_TO {relationship_type: "reference"}]->(el34)
MERGE (el91)-[rel243:REFERS_TO {relationship_type: "reference"}]->(el38)
MERGE (el91)-[rel244:REFERS_TO {relationship_type: "reference"}]->(el39)
MERGE (el91)-[rel245:REFERS_TO {relationship_type: "reference"}]->(el40)
MERGE (el91)-[rel246:REFERS_TO {relationship_type: "reference"}]->(el41)
MERGE (el91)-[rel247:REFERS_TO {relationship_type: "reference"}]->(el42)
MERGE (el91)-[rel248:REFERS_TO {relationship_type: "reference"}]->(el43)
MERGE (el91)-[rel249:REFERS_TO {relationship_type: "reference"}]->(el44)
MERGE (el91)-[rel250:REFERS_TO {relationship_type: "reference"}]->(el57)
MERGE (el91)-[rel251:REFERS_TO {relationship_type: "reference"}]->(el58)
MERGE (el91)-[rel252:REFERS_TO {relationship_type: "reference"}]->(el59)
MERGE (el91)-[rel253:REFERS_TO {relationship_type: "reference"}]->(el60)
MERGE (el91)-[rel254:REFERS_TO {relationship_type: "reference"}]->(el61)
MERGE (el91)-[rel255:REFERS_TO {relationship_type: "reference"}]->(el62)
MERGE (el91)-[rel256:REFERS_TO {relationship_type: "reference"}]->(el63)
MERGE (el91)-[rel257:REFERS_TO {relationship_type: "reference"}]->(el64)
MERGE (el91)-[rel258:REFERS_TO {relationship_type: "reference"}]->(el65)
MERGE (el91)-[rel259:REFERS_TO {relationship_type: "reference"}]->(el66)
MERGE (el91)-[rel260:REFERS_TO {relationship_type: "reference"}]->(el67)
MERGE (el91)-[rel261:REFERS_TO {relationship_type: "reference"}]->(el68)
MERGE (el91)-[rel262:REFERS_TO {relationship_type: "reference"}]->(el69)
MERGE (el3)-[r92:ATTRIBUTED_TO {id:"relationship--b7a4055d-4143-41e8-8b63-2c89f29bc3a4"}]->(el4)    
ON CREATE SET r92.spec_version = "2.1", r92.created = "2026-08-03T17:08:53.242982Z", r92.modified = "2026-08-03T17:08:53.242982Z"
MERGE (el3)-[r93:USES {id:"relationship--b4bf4287-6c42-404a-84f8-1abfc7364d90"}]->(el5)    
ON CREATE SET r93.spec_version = "2.1", r93.created = "2026-08-03T17:08:53.242982Z", r93.modified = "2026-08-03T17:08:53.242982Z"
MERGE (el3)-[r94:USES {id:"relationship--5d6ceda6-feeb-436d-8bf8-d62d0e334c7d"}]->(el6)    
ON CREATE SET r94.spec_version = "2.1", r94.created = "2026-08-03T17:08:53.242982Z", r94.modified = "2026-08-03T17:08:53.242982Z"
MERGE (el3)-[r95:USES {id:"relationship--b2bd6983-e50e-4055-b783-886d11488a23"}]->(el7)    
ON CREATE SET r95.spec_version = "2.1", r95.created = "2026-08-03T17:08:53.242982Z", r95.modified = "2026-08-03T17:08:53.242982Z"
MERGE (el3)-[r96:USES {id:"relationship--662af63b-584c-4920-88c2-1ab1d5f0a632"}]->(el8)    
ON CREATE SET r96.spec_version = "2.1", r96.created = "2026-08-03T17:08:53.242982Z", r96.modified = "2026-08-03T17:08:53.242982Z"
MERGE (el3)-[r97:USES {id:"relationship--b53a57a3-7a6a-49e9-b23b-88c17e34616b"}]->(el9)    
ON CREATE SET r97.spec_version = "2.1", r97.created = "2026-08-03T17:08:53.242982Z", r97.modified = "2026-08-03T17:08:53.242982Z"
MERGE (el3)-[r98:USES {id:"relationship--4e487994-a803-45d6-89ed-811658a86a22"}]->(el10)    
ON CREATE SET r98.spec_version = "2.1", r98.created = "2026-08-03T17:08:53.242982Z", r98.modified = "2026-08-03T17:08:53.242982Z"
MERGE (el3)-[r99:USES {id:"relationship--58bd1d35-8894-4850-af08-3085229c2b5a"}]->(el11)    
ON CREATE SET r99.spec_version = "2.1", r99.created = "2026-08-03T17:08:53.242982Z", r99.modified = "2026-08-03T17:08:53.242982Z"
MERGE (el3)-[r100:USES {id:"relationship--c710628f-313b-4e6b-a9df-00defdf73e85"}]->(el12)    
ON CREATE SET r100.spec_version = "2.1", r100.created = "2026-08-03T17:08:53.242982Z", r100.modified = "2026-08-03T17:08:53.242982Z"
MERGE (el3)-[r101:USES {id:"relationship--25557b42-5cdc-405b-aa6c-8946cec74d22"}]->(el13)    
ON CREATE SET r101.spec_version = "2.1", r101.created = "2026-08-03T17:08:53.242982Z", r101.modified = "2026-08-03T17:08:53.242982Z"
MERGE (el1)-[r102:DISCOVERED {id:"relationship--9f8cddd8-39b7-4091-8c7b-043308278ba3"}]->(el3)    
ON CREATE SET r102.spec_version = "2.1", r102.created = "2026-08-03T17:08:53.242982Z", r102.modified = "2026-08-03T17:08:53.242982Z"
MERGE (el5)-[r103:RELATED_TO {id:"relationship--2c4abbd1-8958-4e87-a141-14df01f50ddb"}]->(el71)    
ON CREATE SET r103.spec_version = "2.1", r103.created = "2026-09-08T17:01:09.172Z", r103.modified = "2026-09-08T17:01:09.172Z"
MERGE (el6)-[r104:RELATED_TO {id:"relationship--c763cf2c-1c86-4599-8936-c7a8bad3f467"}]->(el16)    
ON CREATE SET r104.spec_version = "2.1", r104.created = "2026-09-09T10:35:58.155Z", r104.modified = "2026-09-09T10:35:58.155Z"
MERGE (el7)-[r105:RELATED_TO {id:"relationship--b20abacc-305f-483c-aebc-d187052ab4e9"}]->(el16)    
ON CREATE SET r105.spec_version = "2.1", r105.created = "2026-09-09T10:38:58.155Z", r105.modified = "2026-09-09T10:38:58.155Z"
MERGE (el3)-[r106:USES {id:"relationship--730b2777-cea2-485a-b1a6-b60779d573d4"}]->(el84)    
ON CREATE SET r106.spec_version = "2.1", r106.created = "2026-08-03T17:08:53.242982Z", r106.modified = "2026-08-03T17:08:53.242982Z"
MERGE (el84)-[r107:USES {id:"relationship--32530477-170b-470b-9a7b-3515cad3221e"}]->(el8)    
ON CREATE SET r107.spec_version = "2.1", r107.created = "2026-08-03T17:08:53.242982Z", r107.modified = "2026-08-03T17:08:53.242982Z"
MERGE (el84)-[r108:CREATES {id:"relationship--e6a219bc-a38b-4269-99ce-3af520fc8ce8"}]->(el46)    
ON CREATE SET r108.spec_version = "2.1", r108.created = "2026-09-09T10:41:58.155Z", r108.modified = "2026-09-09T10:41:58.155Z"
MERGE (el84)-[r109:COMMUNICATES_WITH {id:"relationship--1584328a-9c00-42ab-b657-2c1fb72e25aa"}]->(el57)    
ON CREATE SET r109.spec_version = "2.1", r109.created = "2026-09-09T10:41:58.155Z", r109.modified = "2026-09-09T10:41:58.155Z"
MERGE (el84)-[r110:DOWNLOADS {id:"relationship--95bb89be-a104-41a6-8f7f-d6e690d9784f"}]->(el25)    
ON CREATE SET r110.spec_version = "2.1", r110.created = "2026-09-09T10:41:58.155Z", r110.modified = "2026-09-09T10:41:58.155Z"
MERGE (el57)-[r111:RELATED_TO {id:"relationship--5ddb531e-a5ce-4f7c-98b8-a57bbd5a628b"}]->(el25)    
ON CREATE SET r111.spec_version = "2.1", r111.created = "2026-09-09T10:41:58.155Z", r111.modified = "2026-09-09T10:41:58.155Z"
MERGE (el84)-[r112:COMMUNICATES_WITH {id:"relationship--7b9d00bc-e962-4497-a046-add15a618b23"}]->(el62)    
ON CREATE SET r112.spec_version = "2.1", r112.created = "2026-09-09T10:41:58.155Z", r112.modified = "2026-09-09T10:41:58.155Z"
MERGE (el84)-[r113:DOWNLOADS {id:"relationship--ab44cc29-2af0-4ebe-94ee-e91322d8a3bf"}]->(el23)    
ON CREATE SET r113.spec_version = "2.1", r113.created = "2026-09-09T10:41:58.155Z", r113.modified = "2026-09-09T10:41:58.155Z"
MERGE (el84)-[r114:CREATES {id:"relationship--a0a3866f-7ffd-4e51-aff6-c227a391db27"}]->(el45)    
ON CREATE SET r114.spec_version = "2.1", r114.created = "2026-09-09T10:41:58.155Z", r114.modified = "2026-09-09T10:41:58.155Z"
MERGE (el62)-[r115:RELATED_TO {id:"relationship--1c85161d-0137-4fdd-8860-47aaa4ca4a46"}]->(el23)    
ON CREATE SET r115.spec_version = "2.1", r115.created = "2026-09-09T10:41:58.155Z", r115.modified = "2026-09-09T10:41:58.155Z"
MERGE (el84)-[r116:DROPS {id:"relationship--073f97b8-77b8-4c40-be42-4b0ee45bda1e"}]->(el22)    
ON CREATE SET r116.spec_version = "2.1", r116.created = "2026-09-09T10:41:58.155Z", r116.modified = "2026-09-09T10:41:58.155Z"
MERGE (el84)-[r117:DROPS {id:"relationship--16f8bf8e-93df-4337-9857-ac4fad45fa40"}]->(el85)    
ON CREATE SET r117.spec_version = "2.1", r117.created = "2026-09-09T17:41:58.155Z", r117.modified = "2026-09-09T17:41:58.155Z"
MERGE (el84)-[r118:DROPS {id:"relationship--93b811ef-48f4-486c-a820-1bd265a0f847"}]->(el32)    
ON CREATE SET r118.spec_version = "2.1", r118.created = "2026-09-09T17:41:58.155Z", r118.modified = "2026-09-09T17:41:58.155Z"
MERGE (el84)-[r119:DROPS {id:"relationship--90648e33-4832-4121-bc8f-ad354d901d25"}]->(el36)    
ON CREATE SET r119.spec_version = "2.1", r119.created = "2026-09-09T17:41:58.155Z", r119.modified = "2026-09-09T17:41:58.155Z"
MERGE (el84)-[r120:USES {id:"relationship--66bc0427-7dc2-4cb0-b378-09f2458cbedc"}]->(el9)    
ON CREATE SET r120.spec_version = "2.1", r120.created = "2026-09-11T09:47:19.671Z", r120.modified = "2026-09-11T09:47:19.671Z"
MERGE (el9)-[r121:RELATED_TO {id:"relationship--38c2cfad-fd98-44ac-91a5-1ee3ef57cc7a"}]->(el85)    
ON CREATE SET r121.spec_version = "2.1", r121.created = "2026-09-11T09:47:19.671Z", r121.modified = "2026-09-11T09:47:19.671Z"
MERGE (el9)-[r122:RELATED_TO {id:"relationship--b82a772d-c72a-4e5f-8e46-e8b9dfa5edfc"}]->(el22)    
ON CREATE SET r122.spec_version = "2.1", r122.created = "2026-09-11T09:47:19.671Z", r122.modified = "2026-09-11T09:47:19.671Z"
MERGE (el85)-[r123:USES {id:"relationship--a320c280-88ff-4735-bc73-a8a3137813aa"}]->(el53)    
ON CREATE SET r123.spec_version = "2.1", r123.created = "2026-09-11T09:47:19.671Z", r123.modified = "2026-09-11T09:47:19.671Z"
MERGE (el85)-[r124:USES {id:"relationship--ef97e495-89fd-4d06-9ab2-9a6ea254c949"}]->(el10)    
ON CREATE SET r124.spec_version = "2.1", r124.created = "2026-08-03T17:08:53.242982Z", r124.modified = "2026-08-03T17:08:53.242982Z"
MERGE (el10)-[r125:RELATED_TO {id:"relationship--7ced010c-c48e-4c5d-90f4-9ab7d4e0f085"}]->(el38)    
ON CREATE SET r125.spec_version = "2.1", r125.created = "2026-09-11T09:47:19.671Z", r125.modified = "2026-09-11T09:47:19.671Z"
MERGE (el10)-[r126:RELATED_TO {id:"relationship--b8c28a95-3e5d-4acd-a505-ab5215e5876f"}]->(el39)    
ON CREATE SET r126.spec_version = "2.1", r126.created = "2026-09-11T09:47:19.671Z", r126.modified = "2026-09-11T09:47:19.671Z"
MERGE (el85)-[r127:CREATES {id:"relationship--3b116408-d90b-4be8-a468-47d478b9892e"}]->(el50)    
ON CREATE SET r127.spec_version = "2.1", r127.created = "2026-09-11T09:47:19.671Z", r127.modified = "2026-09-11T09:47:19.671Z"
MERGE (el85)-[r128:USES {id:"relationship--2e35311f-56c3-4a9c-b3a8-ae945b527a9b"}]->(el11)    
ON CREATE SET r128.spec_version = "2.1", r128.created = "2026-08-03T17:08:53.242982Z", r128.modified = "2026-08-03T17:08:53.242982Z"
MERGE (el11)-[r129:RELATED_TO {id:"relationship--268650de-f2f0-4a76-af0c-909bc896042f"}]->(el77)    
ON CREATE SET r129.spec_version = "2.1", r129.created = "2026-09-11T10:23:14.998Z", r129.modified = "2026-09-11T10:23:14.998Z"
MERGE (el86)-[r130:LOADS {id:"relationship--f3fd9f0e-3142-4dd2-8c00-0de651ffc003"}]->(el87)    
ON CREATE SET r130.spec_version = "2.1", r130.created = "2026-08-03T17:08:53.242982Z", r130.modified = "2026-09-11T10:23:14.998Z"
MERGE (el87)-[r131:COMMUNICATES_WITH {id:"relationship--9b921629-2bbe-4bee-a594-eae4ead582aa"}]->(el64)    
ON CREATE SET r131.spec_version = "2.1", r131.created = "2026-08-03T17:08:53.242982Z", r131.modified = "2026-08-03T17:08:53.242982Z"
MERGE (el87)-[r132:DOWNLOADS {id:"relationship--af3e4d35-115a-4d5c-9403-fd38abb2ecaa"}]->(el37)    
ON CREATE SET r132.spec_version = "2.1", r132.created = "2026-08-03T17:08:53.242982Z", r132.modified = "2026-09-11T11:02:11.928Z"
MERGE (el15)-[r133:RELATED_TO {id:"relationship--a532ce8d-d0b6-49c9-9113-cff2fa58107d"}]->(el36)    
ON CREATE SET r133.spec_version = "2.1", r133.created = "2026-08-03T17:08:53.242982Z", r133.modified = "2026-09-11T11:02:11.928Z"
MERGE (el15)-[r134:RELATED_TO {id:"relationship--dcdc40ec-8918-40e5-b49f-4cf97943861a"}]->(el37)    
ON CREATE SET r134.spec_version = "2.1", r134.created = "2026-09-11T11:02:11.928Z", r134.modified = "2026-09-11T11:02:11.928Z"
MERGE (el87)-[r135:USES {id:"relationship--91300cd1-30cd-456e-bdbb-930ebfb6c8f2"}]->(el12)    
ON CREATE SET r135.spec_version = "2.1", r135.created = "2026-08-03T17:08:53.242982Z", r135.modified = "2026-08-03T17:08:53.242982Z"
MERGE (el87)-[r136:USES {id:"relationship--9a2f2267-fb4f-4e3c-8646-59c321675970"}]->(el13)    
ON CREATE SET r136.spec_version = "2.1", r136.created = "2026-09-11T15:15:14.426Z", r136.modified = "2026-09-11T15:15:14.426Z"
MERGE (el3)-[r137:USES {id:"relationship--1632804f-0f54-44e5-938b-5ee7454a326f"}]->(el14)    
ON CREATE SET r137.spec_version = "2.1", r137.created = "2026-09-11T15:15:14.426Z", r137.modified = "2026-09-11T15:15:14.426Z"
MERGE (el25)-[r138:RELATED_TO {id:"relationship--e7b0e168-a353-43b9-b1a5-b3a2f0ac1456"}]->(el16)    
ON CREATE SET r138.spec_version = "2.1", r138.created = "2026-09-11T15:45:14.426Z", r138.modified = "2026-09-11T15:45:14.426Z"
MERGE (el26)-[r139:RELATED_TO {id:"relationship--decf8ca4-5149-45de-9c01-6c1f968e9c64"}]->(el20)    
ON CREATE SET r139.spec_version = "2.1", r139.created = "2026-09-11T15:45:14.426Z", r139.modified = "2026-09-11T15:45:14.426Z"
MERGE (el87)-[r140:RELATED_TO {id:"relationship--38b02986-0180-414a-87fc-fc0bc654d257"}]->(el40)    
ON CREATE SET r140.spec_version = "2.1", r140.created = "2026-08-04T10:09:20.802223Z", r140.modified = "2026-08-04T10:09:20.802223Z"
MERGE (el87)-[r141:RELATED_TO {id:"relationship--38f4c808-25d4-4586-9c3c-9dc488f54a43"}]->(el41)    
ON CREATE SET r141.spec_version = "2.1", r141.created = "2026-08-04T10:09:20.802223Z", r141.modified = "2026-08-04T10:09:20.802223Z"
MERGE (el87)-[r142:RELATED_TO {id:"relationship--96dc826d-c8ab-4af7-abad-f4259af26f20"}]->(el43)    
ON CREATE SET r142.spec_version = "2.1", r142.created = "2026-08-04T10:09:20.802223Z", r142.modified = "2026-08-04T10:09:20.802223Z"
MERGE (el87)-[r143:RELATED_TO {id:"relationship--9d5eb0dc-5439-4e73-bb1e-27f8b95d8dd9"}]->(el44)    
ON CREATE SET r143.spec_version = "2.1", r143.created = "2026-08-04T10:09:20.802223Z", r143.modified = "2026-08-04T10:09:20.802223Z"
MERGE (el14)-[r144:RELATED_TO {id:"relationship--281e9464-cae5-4b60-aebd-2d52a4c36561"}]->(el17)    
ON CREATE SET r144.spec_version = "2.1", r144.created = "2026-09-11T16:14:11.458Z", r144.modified = "2026-09-11T16:14:11.458Z"
MERGE (el14)-[r145:RELATED_TO {id:"relationship--b9322eea-d218-481e-b625-7336d82e9cd7"}]->(el19)    
ON CREATE SET r145.spec_version = "2.1", r145.created = "2026-09-11T16:14:11.458Z", r145.modified = "2026-09-11T16:14:11.458Z"
MERGE (el14)-[r146:RELATED_TO {id:"relationship--43d05054-866b-4db3-8bdd-02db0eddacd1"}]->(el21)    
ON CREATE SET r146.spec_version = "2.1", r146.created = "2026-09-11T16:14:11.458Z", r146.modified = "2026-09-11T16:14:11.458Z"
MERGE (el14)-[r147:RELATED_TO {id:"relationship--280c15d6-2329-41cd-811f-4bf5caf06957"}]->(el30)    
ON CREATE SET r147.spec_version = "2.1", r147.created = "2026-09-11T16:14:11.458Z", r147.modified = "2026-09-11T16:14:11.458Z"
MERGE (el14)-[r148:RELATED_TO {id:"relationship--1746c142-bad0-41cc-af16-141a4c5f60eb"}]->(el32)    
ON CREATE SET r148.spec_version = "2.1", r148.created = "2026-09-11T16:14:11.458Z", r148.modified = "2026-09-11T16:14:11.458Z"
MERGE (el78)-[r149:INDICATES {id:"relationship--bfb40e12-34eb-4363-a28d-f2b658a2bb42"}]->(el84)    
ON CREATE SET r149.spec_version = "2.1", r149.created = "2026-08-03T17:08:53.242982Z", r149.modified = "2026-08-03T17:08:53.242982Z"
MERGE (el78)-[r150:BASED_ON {id:"relationship--0181baf1-2310-48d2-a3b2-c90a6b2518fd"}]->(el16)    
ON CREATE SET r150.spec_version = "2.1", r150.created = "2026-08-03T17:08:53.242982Z", r150.modified = "2026-08-03T17:08:53.242982Z"
MERGE (el78)-[r151:BASED_ON {id:"relationship--3a440499-2c25-4756-80ed-c482816e842d"}]->(el18)    
ON CREATE SET r151.spec_version = "2.1", r151.created = "2026-08-03T17:08:53.242982Z", r151.modified = "2026-08-03T17:08:53.242982Z"
MERGE (el78)-[r152:BASED_ON {id:"relationship--bab48c51-5047-4b55-8e35-cc74a814eea5"}]->(el20)    
ON CREATE SET r152.spec_version = "2.1", r152.created = "2026-08-03T17:08:53.242982Z", r152.modified = "2026-08-03T17:08:53.242982Z"
MERGE (el79)-[r153:INDICATES {id:"relationship--8291b81b-ef31-4c63-90bd-755a5c6b0d81"}]->(el85)    
ON CREATE SET r153.spec_version = "2.1", r153.created = "2026-08-03T17:08:53.242982Z", r153.modified = "2026-08-03T17:08:53.242982Z"
MERGE (el79)-[r154:BASED_ON {id:"relationship--11d8357f-7075-44f4-9c42-21d683905e74"}]->(el28)    
ON CREATE SET r154.spec_version = "2.1", r154.created = "2026-08-03T17:08:53.242982Z", r154.modified = "2026-08-03T17:08:53.242982Z"
MERGE (el79)-[r155:BASED_ON {id:"relationship--9adffa27-bf86-4fa6-b561-2c607ce25289"}]->(el29)    
ON CREATE SET r155.spec_version = "2.1", r155.created = "2026-08-03T17:08:53.242982Z", r155.modified = "2026-08-03T17:08:53.242982Z"
MERGE (el80)-[r156:INDICATES {id:"relationship--bd604386-ce9b-40eb-adc4-26019e0fd323"}]->(el86)    
ON CREATE SET r156.spec_version = "2.1", r156.created = "2026-08-03T17:08:53.242982Z", r156.modified = "2026-08-03T17:08:53.242982Z"
MERGE (el80)-[r157:BASED_ON {id:"relationship--d07d1bef-08e6-40d2-af7a-3b81812b85c0"}]->(el30)    
ON CREATE SET r157.spec_version = "2.1", r157.created = "2026-08-03T17:08:53.242982Z", r157.modified = "2026-08-03T17:08:53.242982Z"
MERGE (el80)-[r158:BASED_ON {id:"relationship--db99e2a1-a0cd-4a67-8ff3-4c66168dcb9b"}]->(el33)    
ON CREATE SET r158.spec_version = "2.1", r158.created = "2026-08-03T17:08:53.242982Z", r158.modified = "2026-08-03T17:08:53.242982Z"
MERGE (el81)-[r159:INDICATES {id:"relationship--ef1408c1-05ca-4384-888e-6625591805d7"}]->(el87)    
ON CREATE SET r159.spec_version = "2.1", r159.created = "2026-08-03T17:08:53.242982Z", r159.modified = "2026-08-03T17:08:53.242982Z"
MERGE (el81)-[r160:BASED_ON {id:"relationship--a7cf4210-74c2-43ac-902a-3c41e03cbb3b"}]->(el31)    
ON CREATE SET r160.spec_version = "2.1", r160.created = "2026-08-03T17:08:53.242982Z", r160.modified = "2026-08-03T17:08:53.242982Z"
MERGE (el81)-[r161:BASED_ON {id:"relationship--ea396ebd-0554-4d7b-9af0-105702664fbd"}]->(el34)    
ON CREATE SET r161.spec_version = "2.1", r161.created = "2026-08-03T17:08:53.242982Z", r161.modified = "2026-08-03T17:08:53.242982Z"
MERGE (el82)-[r162:INDICATES {id:"relationship--b0c4d890-ac51-4c4f-a828-f4206ef9e702"}]->(el3)    
ON CREATE SET r162.spec_version = "2.1", r162.created = "2026-08-04T10:09:20.802223Z", r162.modified = "2026-08-04T10:09:20.802223Z"
MERGE (el82)-[r163:BASED_ON {id:"relationship--411e7f30-420c-4e42-8a7e-be66d0589e59"}]->(el17)    
ON CREATE SET r163.spec_version = "2.1", r163.created = "2026-08-04T10:09:20.802223Z", r163.modified = "2026-08-04T10:09:20.802223Z"
MERGE (el82)-[r164:BASED_ON {id:"relationship--c1f314f9-fdb0-4e6f-af14-719e0b4e3842"}]->(el19)    
ON CREATE SET r164.spec_version = "2.1", r164.created = "2026-08-04T10:09:20.802223Z", r164.modified = "2026-08-04T10:09:20.802223Z"
MERGE (el82)-[r165:BASED_ON {id:"relationship--366645fb-fdb1-4d8e-adfe-f2a05aa115ee"}]->(el21)    
ON CREATE SET r165.spec_version = "2.1", r165.created = "2026-08-04T10:09:20.802223Z", r165.modified = "2026-08-04T10:09:20.802223Z"
MERGE (el83)-[r166:INDICATES {id:"relationship--ee36cc99-07ca-416d-bdeb-d9f9d936c193"}]->(el85)    
ON CREATE SET r166.spec_version = "2.1", r166.created = "2026-08-04T10:09:20.802223Z", r166.modified = "2026-08-04T10:09:20.802223Z"
MERGE (el83)-[r167:BASED_ON {id:"relationship--413d5122-eb80-42f9-a3ff-61c70ad22b7f"}]->(el77)    
ON CREATE SET r167.spec_version = "2.1", r167.created = "2026-08-04T10:09:20.802223Z", r167.modified = "2026-08-04T10:09:20.802223Z"
RETURN el0, st1, rel1, st2, rel2, el1, st3, rel3, st4, rel4, st5, rel5, el2, el3, el4, el5, kcp6, rel6, er7, rel7, el6, kcp8, rel8, er9, rel9, el7, kcp10, rel10, er11, rel11, el8, kcp12, rel12, er13, rel13, el9, kcp14, rel14, kcp15, rel15, er16, rel16, el10, kcp17, rel17, er18, rel18, el11, kcp19, rel19, kcp20, rel20, er21, rel21, el12, kcp22, rel22, er23, rel23, el13, kcp24, rel24, er25, rel25, el14, kcp26, rel26, er27, rel27, el15, el16, hs28, rel28, hs29, rel29, el17, hs30, rel30, hs31, rel31, el18, hs32, rel32, hs33, rel33, el19, hs34, rel34, hs35, rel35, el20, hs36, rel36, hs37, rel37, el21, hs38, rel38, hs39, rel39, el22, el23, hs40, rel40, hs41, rel41, el24, hs42, rel42, hs43, rel43, el25, hs44, rel44, hs45, rel45, el26, hs46, rel46, hs47, rel47, el27, el28, hs48, rel48, hs49, rel49, el29, hs50, rel50, hs51, rel51, el30, hs52, rel52, hs53, rel53, el31, hs54, rel54, hs55, rel55, el32, hs56, rel56, hs57, rel57, el33, hs58, rel58, hs59, rel59, el34, hs60, rel60, hs61, rel61, el35, hs62, rel62, hs63, rel63, el36, el37, el38, el39, el40, el41, el42, el43, el44, el45, el46, el47, el48, el49, el50, el51, el52, el53, el54, el55, el56, el57, el58, el59, el60, el61, el62, el63, el64, el65, el66, el67, el68, el69, el70, el71, mp64, rel64, el72, el73, el74, el75, el76, el77, el78, kcp65, rel65, el79, kcp66, rel66, kcp67, rel67, el80, kcp68, rel68, kcp69, rel69, el81, kcp70, rel70, el82, kcp71, rel71, el83, kcp72, rel72, kcp73, rel73, el84, el85, el86, el87, el88, el89, el90, er74, rel74, el91, er75, rel75, rel76, ext1, rel77, rel78, ext2, rel79, rel80, ext3, rel81, rel82, ext4, rel83, rel84, rel85, rel86, ext5, rel87, rel88, rel89, rel90, ext6, rel91, rel92, rel93, rel94, rel95, ext7, rel96, rel97, rel98, rel99, rel100, rel101, ext8, rel102, rel103, rel104, rel105, rel106, ext9, rel107, rel108, ext10, rel109, rel110, ext11, rel111, rel112, rel113, rel114, rel115, rel116, rel117, rel118, rel119, rel120, rel121, rel122, rel123, rel124, rel125, rel126, rel127, rel128, rel129, rel130, rel131, rel132, rel133, rel134, rel135, rel136, rel137, rel138, rel139, rel140, rel141, rel142, rel143, rel144, rel145, rel146, rel147, rel148, rel149, rel150, rel151, rel152, rel153, rel154, rel155, rel156, rel157, rel158, rel159, rel160, rel161, rel162, rel163, rel164, rel165, rel166, rel167, rel168, rel169, rel170, rel171, rel172, rel173, rel174, rel175, rel176, rel177, rel178, rel179, rel180, rel181, rel182, rel183, rel184, rel185, rel186, rel187, rel188, rel189, rel190, rel191, rel192, rel193, rel194, rel195, rel196, rel197, rel198, rel199, rel200, rel201, rel202, rel203, rel204, rel205, rel206, rel207, rel208, rel209, rel210, rel211, rel212, rel213, rel214, rel215, rel216, rel217, rel218, rel219, rel220, rel221, rel222, rel223, rel224, rel225, rel226, rel227, rel228, rel229, rel230, rel231, rel232, rel233, rel234, rel235, rel236, rel237, rel238, rel239, rel240, rel241, rel242, rel243, rel244, rel245, rel246, rel247, rel248, rel249, rel250, rel251, rel252, rel253, rel254, rel255, rel256, rel257, rel258, rel259, rel260, rel261, rel262, r92, r93, r94, r95, r96, r97, r98, r99, r100, r101, r102, r103, r104, r105, r106, r107, r108, r109, r110, r111, r112, r113, r114, r115, r116, r117, r118, r119, r120, r121, r122, r123, r124, r125, r126, r127, r128, r129, r130, r131, r132, r133, r134, r135, r136, r137, r138, r139, r140, r141, r142, r143, r144, r145, r146, r147, r148, r149, r150, r151, r152, r153, r154, r155, r156, r157, r158, r159, r160, r161, r162, r163, r164, r165, r166, r167