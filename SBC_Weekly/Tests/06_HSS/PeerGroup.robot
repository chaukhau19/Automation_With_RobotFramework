*** Settings ***
Documentation  This is all tests of Peer Group in HSS
Resource  ../../Resources/DataManager.robot
Resource  ../../Data/InputData.robot
Resource  ../../Resources/Common.robot
Resource  ../../Resources/HSS/HSS_PeerGroupApp.robot

#Test Setup      Common.Begin Web Test
Test Teardown   Common.End Web Test

*** Tasks ***

Add Peer Group
    [Documentation]   Verify The Add function on the Peer Group page of HSS    [ims]
    [Tags]    HSS  HSS_PeerGroup		
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${HSS_PeerGroup}  Add
    HSS_PeerGroupApp.Add  ${AdministrationScenarios}

Sort Peer Group
    [Documentation]   Verify The Sort function on the Peer Group page of HSS    [ims]
    [Tags]    HSS  HSS_PeerGroup	  
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${HSS_PeerGroup}  Sort
    HSS_PeerGroupApp.Sort  ${AdministrationScenarios}

Filter Peer Group
    [Documentation]   Verify The Filter function on the Peer Group page of HSS    [ims]
    [Tags]    HSS  HSS_PeerGroup	 
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${HSS_PeerGroup}  Filter
    HSS_PeerGroupApp.Filter  ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${HSS_PeerGroup}  Filter_Special
    HSS_PeerGroupApp.Filter special characters  ${AdministrationScenarios}

Detach Peers from a Peer Group
    [Documentation]   Verify The Detach Peers function on the Peer Group page of HSS    [ims]
    [Tags]    HSS  HSS_PeerGroup
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${HSS_PeerGroup}  Detach
    HSS_PeerGroupApp.Detach  ${AdministrationScenarios}

Attach Peers to a Peer Group
    [Documentation]   Verify The Attach Peers function on the Peer Group page of HSS    [ims]
    [Tags]    HSS  HSS_PeerGroup		  
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${HSS_PeerGroup}  Attach
    HSS_PeerGroupApp.Attach  ${AdministrationScenarios}

Delete Peer Group
    [Documentation]   Verify The Delete Peers function on the Peer Group page of HSS    [ims]
    [Tags]    HSS  HSS_PeerGroup
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${HSS_PeerGroup}  Delete
    HSS_PeerGroupApp.Delete  ${AdministrationScenarios}
	