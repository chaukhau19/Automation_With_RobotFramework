*** Settings ***
Documentation  This is all tests of IP Destination in TAS
Resource  ../../Resources/DataManager.robot
Resource  ../../Data/InputData.robot
Resource  ../../Resources/Common.robot
Resource  ../../Resources/TAS/TAS_IPDestinationApp.robot

Test Setup      Common.Begin Web Test
Test Teardown   Common.End Web Test

*** Tasks ***


Add IPDestination
    [Documentation]     Add proper IPDestination of TAS
    [Tags]    Smoke  TAS_IPDestination	ims47
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${TAS_IPDestination}  Add
    TAS_IPDestinationApp.Add  ${AdministrationScenarios}

Add Invalid IPDestination
    [Documentation]     Add invalid IPDestination of TAS
    [Tags]     TAS_IPDestination	ims47  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${TAS_IPDestination}  Add_Errors
    TAS_IPDestinationApp.Add Invalid  ${AdministrationScenarios}


View IPDestination
    [Documentation]     View IPDestination of TAS section testing
    [Tags]    TAS_IPDestination	ims47  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${TAS_IPDestination}  Edit
    TAS_IPDestinationApp.View  ${AdministrationScenarios}

Sort IPDestination
    [Documentation]     Sort IPDestination of TAS section testing
    [Tags]    TAS_IPDestination	ims47  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${TAS_IPDestination}  Add
    TAS_IPDestinationApp.Sort  ${AdministrationScenarios}

Filter IPDestination
    [Documentation]     Filter IPDestination of TAS section testing
    [Tags]    TAS_IPDestination	ims47  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${TAS_IPDestination}  Filter
    TAS_IPDestinationApp.Filter  ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${TAS_IPDestination}  Filter_Special
    TAS_IPDestinationApp.Filter special characters  ${AdministrationScenarios}

Edit Invalid IPDestination
    [Documentation]     Edit invalid IPDestination of TAS
    [Tags]     TAS_IPDestination	ims47  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${TAS_IPDestination}  Edit_Errors
    TAS_IPDestinationApp.Edit Invalid  ${AdministrationScenarios}

Edit IPDestination
    [Documentation]     Edit the basic proper IPDestination of TAS
    [Tags]    Smoke  TAS_IPDestination	ims47
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${TAS_IPDestination}  Edit
    TAS_IPDestinationApp.Edit  ${AdministrationScenarios}