*** Settings ***
Documentation  All manipulation PEER section
Resource  ../../Resources/BGCF/BGCF_PeerApp.robot
Resource  ../../Resources/DataManager.robot
Resource  ../../Data/InputData.robot
Resource  ../../Resources/Common.robot


#Test Setup      Begin Web Test
Test Teardown   End Web Test

*** Tasks ***
################ Peer ##################
Add Peer
    [Documentation]    Verify the functionality of 'Add Peer' on the BGCF page
    [Tags]  BGCF    BGCF_Peer    BGCF_Peer_Peer    BGCF_Peer_Peer      
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${BGCF_Peer}  Add_Peer_Valid
    BGCF_PeerApp.Add Peer  ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${BGCF_Peer}  Add_Multidomains
    BGCF_PeerApp.Add with multi domains  ${AdministrationScenarios}
	
Add Invalid Peer
    [Documentation]    Verify the functionality of 'Add Invalid Peer' on the BGCF page
    [Tags]  BGCF    BGCF_Peer    BGCF_Peer_Peer    BGCF_Peer_Peer   
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${BGCF_Peer}  Add_Peer_Invalid
    BGCF_PeerApp.Add Invalid Peer  ${AdministrationScenarios}

	
View Peer
    [Documentation]    Verify the functionality of 'View Peer' on the BGCF page
    [Tags]  BGCF    BGCF_Peer    BGCF_Peer_Peer  
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${BGCF_Peer}  View_Peer
    BGCF_PeerApp.View Peer  ${AdministrationScenarios}

Sort Peer
    [Documentation]    Verify the functionality of 'Sort Peer' on the BGCF page
    [Tags]  BGCF   BGCF_Peer   
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${BGCF_Peer}  Sort_Peer
    BGCF_PeerApp.Sort Peer  ${AdministrationScenarios}

	
Filter Peer
    [Documentation]    Verify the functionality of 'Filter Peer' on the BGCF page
    [Tags]  BGCF    BGCF_Peer    BGCF_Peer_Peer     
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${BGCF_Peer}  Filter_Peer
    BGCF_PeerApp.Filter Peer  ${AdministrationScenarios}


Edit Peer
    [Documentation]    Verify the functionality of 'Edit Peer' on the BGCF page
    [Tags]  BGCF    BGCF_Peer    BGCF_Peer_Peer     
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${BGCF_Peer}  Edit_Peer_Valid
    BGCF_PeerApp.Edit Peer  ${AdministrationScenarios}

Edit Invalid Peer
    [Documentation]     Edit BGCF PEER section testing with invalid parameters
    [Tags]    BGCF  BGCF_Peer    
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${BGCF_Peer}  Edit_Peer_Invalid
    BGCF_PeerApp.Edit Invalid Peer  ${AdministrationScenarios}

	
Delete Peer
    [Documentation]    Verify the functionality of 'Delete Peer' on the BGCF page
    [Tags]  BGCF    BGCF_Peer    BGCF_Peer_Peer         
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${BGCF_Peer}  Delete_Peer
    BGCF_PeerApp.Delete Peer  ${AdministrationScenarios}

Peer Configuration
    [Documentation]    Verify the functionality of 'Peer Configuration' on the BGCF page
    [Tags]  BGCF    BGCF_Peer    BGCF_Peer_PeerConfiguration  
    [Setup]  Begin Web Test
    BGCF_PeerApp.Peer Configuration
##################### Trusted #################

Add Trusted
    [Documentation]    Verify the functionality of 'Add Trusted' on the BGCF page
    [Tags]   BGCF    BGCF_Peer    BGCF_Peer_Trusted  
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${BGCF_Peer}  Trusted_Add
    BGCF_PeerApp.Add Trusted  ${AdministrationScenarios}

	
Add Invalid Trusted
    [Documentation]    Verify the functionality of 'Add Invalid Trusted' on the BGCF page
    [Tags]   BGCF    BGCF_Peer    BGCF_Peer_Trusted  
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${BGCF_Peer}  Trusted_Add_Invalid
    BGCF_PeerApp.Add Trusted Invalid Cases  ${AdministrationScenarios}


Filter Trusted
    [Documentation]    Verify the functionality of 'Add Filter Trusted' on the BGCF page
    [Tags]   BGCF    BGCF_Peer    BGCF_Peer_Trusted     
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${BGCF_Peer}  Trusted_Filter
    BGCF_PeerApp.Filter Trusted  ${AdministrationScenarios}

	
Delete Trusted
    [Documentation]    Verify the functionality of 'Delete Trusted' on the BGCF page
    [Tags]   BGCF    BGCF_Peer    BGCF_Peer_Trusted  
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${BGCF_Peer}  Trusted_Delete
    BGCF_PeerApp.Delete Trusted  ${AdministrationScenarios}

###################### 	Not Trusted ##################
Add Not Trusted
    [Documentation]    Verify the functionality of 'Add Not Trusted' on the BGCF page
    [Tags]   BGCF    BGCF_Peer    BGCF_Peer_NotTrusted 
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${BGCF_Peer}  NotTrusted_Add
    BGCF_PeerApp.Add Not Trusted  ${AdministrationScenarios}

Add Invalid Not Trusted
    [Documentation]    Verify the functionality of 'Add Invalid Not Trusted' on the BGCF page
    [Tags]   BGCF    BGCF_Peer    BGCF_Peer_NotTrusted 
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${BGCF_Peer}  NotTrusted_Add_Invalid
    BGCF_PeerApp.Add Not Trusted Invalid Cases  ${AdministrationScenarios}

	
Filter Not Trusted
    [Documentation]    Verify the functionality of 'Filter Not Trusted' on the BGCF page
    [Tags]   BGCF    BGCF_Peer    BGCF_Peer_NotTrusted 
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${BGCF_Peer}  NotTrusted_Filter
    BGCF_PeerApp.Filter Not Trusted  ${AdministrationScenarios}

	
Delete Not Trusted
    [Documentation]    Verify the functionality of 'Filter Not Trusted' on the BGCF page
    [Tags]   BGCF    BGCF_Peer    BGCF_Peer_NotTrusted   
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${BGCF_Peer}  NotTrusted_Delete
    BGCF_PeerApp.Delete Not Trusted  ${AdministrationScenarios}