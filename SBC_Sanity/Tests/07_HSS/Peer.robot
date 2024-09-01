*** Settings ***
Documentation  This is all tests of Peer in HSS
Resource  ../../Resources/DataManager.robot
Resource  ../../Data/InputData.robot
Resource  ../../Resources/Common.robot
Resource  ../../Resources/HSS/HSS_PeerApp.robot

Test Setup      Common.Begin Web Test
Test Teardown   Common.End Web Test

*** Tasks ***
		
Add Peer
    [Documentation]     Add proper Peer of HSS
    [Tags]    Smoke  HSS_Peer	ims47
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${HSS_Peer}  Add
    HSS_PeerApp.Add  ${AdministrationScenarios}

Add Invalid Peer
    [Documentation]     Add invalid Peer of HSS
    [Tags]     HSS_Peer	ims47  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${HSS_Peer}  Add_Errors
    HSS_PeerApp.Add Invalid  ${AdministrationScenarios}

View Peer
    [Documentation]     View Peer of HSS testing
    [Tags]    HSS_Peer	ims47  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${HSS_Peer}  Add
    HSS_PeerApp.View  ${AdministrationScenarios}

Sort Peer
    [Documentation]     Sort Peer of HSS testing
    [Tags]    HSS_Peer	ims47  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${HSS_Peer}  Add
    HSS_PeerApp.Sort  ${AdministrationScenarios}

Filter Peer
    [Documentation]     Filter Peer of HSS testing
    [Tags]    HSS_Peer	ims47  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${HSS_Peer}  Filter
    HSS_PeerApp.Filter  ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${HSS_Peer}  Filter_Special
    HSS_PeerApp.Filter special characters  ${AdministrationScenarios}

Delete Peer
    [Documentation]     Deleting proper Peer of HSS
    [Tags]    Smoke  HSS_Peer	ims47  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${HSS_Peer}  Delete
    HSS_PeerApp.Delete  ${AdministrationScenarios}
