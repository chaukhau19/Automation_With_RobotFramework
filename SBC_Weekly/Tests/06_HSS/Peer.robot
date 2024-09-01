*** Settings ***
Documentation  This is all tests of Peer in HSS
Resource  ../../Resources/DataManager.robot
Resource  ../../Data/InputData.robot
Resource  ../../Resources/Common.robot
Resource  ../../Resources/HSS/HSS_PeerApp.robot

#Test Setup      Common.Begin Web Test
Test Teardown   Common.End Web Test

*** Tasks ***

Add Peer
    [Documentation]   Verify The Add function on the Peer page of HSS    [ims]
    [Tags]    HSS  HSS_Peer	
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${HSS_Peer}  Add
    HSS_PeerApp.Add  ${AdministrationScenarios}

Add Invalid Peer
    [Documentation]   Verify The Add Invalid function on the Peer page of HSS    [ims]
    [Tags]    HSS  HSS_Peer	
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${HSS_Peer}  Add_Errors
    HSS_PeerApp.Add Invalid  ${AdministrationScenarios}

View Peer
    [Documentation]   Verify The View function on the Peer page of HSS    [ims]
    [Tags]    HSS  HSS_Peer		  
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${HSS_Peer}  View
    HSS_PeerApp.View  ${AdministrationScenarios}

Sort Peer
    [Documentation]   Verify The Sort function on the Peer page of HSS    [ims]
    [Tags]    HSS  HSS_Peer	
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${HSS_Peer}  Sort
    HSS_PeerApp.Sort  ${AdministrationScenarios}

Filter Peer
    [Documentation]   Verify The Filter function on the Peer page of HSS    [ims]
    [Tags]    HSS  HSS_Peer	
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${HSS_Peer}  Filter
    HSS_PeerApp.Filter  ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${HSS_Peer}  Filter_Special
    HSS_PeerApp.Filter special characters  ${AdministrationScenarios}

Delete Peer
    [Documentation]   Verify The Delete function on the Peer page of HSS    [ims]
    [Tags]    HSS  HSS_Peer	  
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${HSS_Peer}  Delete
    HSS_PeerApp.Delete  ${AdministrationScenarios}
