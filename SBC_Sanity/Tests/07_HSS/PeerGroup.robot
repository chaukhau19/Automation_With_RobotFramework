*** Settings ***
Documentation  This is all tests of Peer Group in HSS
Resource  ../../Resources/DataManager.robot
Resource  ../../Data/InputData.robot
Resource  ../../Resources/Common.robot
Resource  ../../Resources/HSS/HSS_PeerGroupApp.robot

Test Setup      Common.Begin Web Test
Test Teardown   Common.End Web Test

*** Tasks ***
	
Add Peer Group
    [Documentation]     Add proper Peer Group of HSS
    [Tags]    Smoke  HSS_Peer Group	ims47
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${HSS_PeerGroup}  Add
    HSS_PeerGroupApp.Add  ${AdministrationScenarios}

Sort Peer Group
    [Documentation]     Sort Peer Group of HSS testing
    [Tags]    HSS_Peer Group	ims47  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${HSS_PeerGroup}  Add
    HSS_PeerGroupApp.Sort  ${AdministrationScenarios}

Filter Peer Group
    [Documentation]     Filter Peer Group of HSS testing
    [Tags]    HSS_Peer Group	ims47  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${HSS_PeerGroup}  Filter
    HSS_PeerGroupApp.Filter  ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${HSS_PeerGroup}  Filter_Special
    HSS_PeerGroupApp.Filter special characters  ${AdministrationScenarios}

Detach Peers from a Peer Group
    [Documentation]     Detach Peers from a Peer Group of HSS
    [Tags]     HSS_Peer Group	ims47  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${HSS_PeerGroup}  Detach
    HSS_PeerGroupApp.Detach  ${AdministrationScenarios}

Attach Peers to a Peer Group
    [Documentation]     Attach Peers from a Peer Group of HSS
    [Tags]     HSS_Peer Group	ims47  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${HSS_PeerGroup}  Attach
    HSS_PeerGroupApp.Attach  ${AdministrationScenarios}

Delete Peer Group
    [Documentation]     Deleting proper Peer Group of HSS
    [Tags]    Smoke  HSS_Peer Group	ims47  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${HSS_PeerGroup}  Delete
    HSS_PeerGroupApp.Delete  ${AdministrationScenarios}
	