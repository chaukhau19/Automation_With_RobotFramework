*** Settings ***
Documentation  All manipulation PEER section
Resource  ../../Resources/BGCF/BGCF_PeerApp.robot
Resource  ../../Resources/DataManager.robot
Resource  ../../Data/InputData.robot
Resource  ../../Resources/Common.robot


Test Setup      Begin Web Test
Test Teardown   End Web Test

*** Tasks ***
	
Add Peer
    [Documentation]     Add BGCF PEER section testing with valid parameters
    [Tags]  Smoke  BGCF_Peer  sbc77
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${BGCF_Peer}  Add65
    BGCF_PeerApp.Add65  ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${BGCF_Peer}  Add_Multidomains
    BGCF_PeerApp.Add with multi domains  ${AdministrationScenarios}
	
Add Invalid Peer
    [Documentation]     Add BGCF PEER section testing with invalid parameters
    [Tags]   BGCF_Peer  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${BGCF_Peer}  Add_Errors65
    BGCF_PeerApp.Add Invalid Peer  ${AdministrationScenarios}

	
View Peer
    [Documentation]     View BGCF PEER section testing with valid parameters
    [Tags]  BGCF_Peer  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${BGCF_Peer}  Edit
    BGCF_PeerApp.View  ${AdministrationScenarios}

	
Sort Peer
    [Documentation]     Sort BGCF PEER section testing with valid parameters
    [Tags]  BGCF_Peer  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${BGCF_Peer}  Add
    BGCF_PeerApp.Sort  ${AdministrationScenarios}
		
Filter Peer
    [Documentation]     Filter BGCF PEER section testing with valid parameters
    [Tags]  BGCF_Peer  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${BGCF_Peer}  Edit
    BGCF_PeerApp.Filter  ${AdministrationScenarios}

		
Edit Invalid Peer
    [Documentation]     Edit BGCF PEER section testing with invalid parameters
    [Tags]   BGCF_Peer  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${BGCF_Peer}  Edit_Errors65
    BGCF_PeerApp.Edit Invalid Peer  ${AdministrationScenarios}
    
		
Edit Peer
    [Documentation]     Add BGCF PEER section testing with valid parameters
    [Tags]  Smoke  BGCF_Peer  sbc77
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${BGCF_Peer}  Edit65
    BGCF_PeerApp.Edit65  ${AdministrationScenarios}
    		
Delete Peer
    [Documentation]     Delete BGCF PEER section
    [Tags]  Smoke  BGCF_Peer  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${BGCF_Peer}  Delete
    BGCF_PeerApp.Delete  ${AdministrationScenarios}

Peer Configuration
    [Documentation]     Peer configuration in BGCF PEER section
    [Tags]  BGCF_Peer  sbc77
    BGCF_PeerApp.Peer Configuration
		
Add Trusted
    [Documentation]     Add BGCF PEER Trusted section testing with valid parameters
    [Tags]   BGCF_Peer  BGCF_Trusted  sbc77
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${BGCF_Peer}  Trusted
    BGCF_PeerApp.Add Trusted  ${AdministrationScenarios}
			
Add Invalid Trusted
    [Documentation]     Add BGCF PEER Trusted section testing with invalid parameters
    [Tags]   BGCF_Peer  BGCF_Trusted  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${BGCF_Peer}  Trusted_Errors
    BGCF_PeerApp.Add Trusted Invalid Cases  ${AdministrationScenarios}
	
Filter Trusted
    [Documentation]     Filter BGCF PEER Trusted section testing with valid parameters
    [Tags]   BGCF_Peer  BGCF_Trusted  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${BGCF_Peer}  Trusted
    BGCF_PeerApp.Filter Trusted  ${AdministrationScenarios}
			
Delete Trusted
    [Documentation]     Delete BGCF PEER Trusted section testing with valid parameters
    [Tags]   BGCF_Peer  BGCF_Trusted  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${BGCF_Peer}  Trusted
    BGCF_PeerApp.Delete Trusted  ${AdministrationScenarios}
		
Add Not Trusted
    [Documentation]     Add BGCF PEER Not Trusted section testing with valid parameters
    [Tags]   BGCF_Peer  BGCF_NotTrusted  sbc77
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${BGCF_Peer}  NotTrusted
    BGCF_PeerApp.Add Not Trusted  ${AdministrationScenarios}
		
Add Invalid Not Trusted
    [Documentation]     Add BGCF PEER Not Trusted section testing with invalid parameters
    [Tags]   BGCF_Peer  BGCF_NotTrusted  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${BGCF_Peer}  NotTrusted_Errors
    BGCF_PeerApp.Add Not Trusted Invalid Cases  ${AdministrationScenarios}
		
Filter Not Trusted
    [Documentation]     Filter BGCF PEER Not Trusted section testing with valid parameters
    [Tags]   BGCF_Peer  BGCF_NotTrusted  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${BGCF_Peer}  NotTrusted
    BGCF_PeerApp.Filter Not Trusted  ${AdministrationScenarios}
	
Delete Not Trusted
    [Documentation]     Delete BGCF PEER Not Trusted section testing with valid parameters
    [Tags]   BGCF_Peer  BGCF_NotTrusted  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${BGCF_Peer}  NotTrusted
    BGCF_PeerApp.Delete Not Trusted  ${AdministrationScenarios}