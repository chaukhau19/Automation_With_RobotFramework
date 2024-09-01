*** Settings ***
Documentation  This is all tests of Realm in HSS
Resource  ../../Resources/DataManager.robot
Resource  ../../Data/InputData.robot
Resource  ../../Resources/Common.robot
Resource  ../../Resources/HSS/HSS_RealmApp.robot

#Test Setup      Common.Begin Web Test
Test Teardown   Common.End Web Test

*** Tasks ***

Add Realm
    [Documentation]   Verify The Add function on the Realm page of HSS    [ims]
    [Tags]    HSS  HSS_Realm
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${HSS_Realm}  Add
    HSS_RealmApp.Add  ${AdministrationScenarios}

Add Invalid Realm
    [Documentation]   Verify The Add Invalid function on the Realm page of HSS    [ims]
    [Tags]    HSS  HSS_Realm
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${HSS_Realm}  Add_Errors
    HSS_RealmApp.Add Invalid  ${AdministrationScenarios}

View Realm
    [Documentation]   Verify The View function on the Realm page of HSS    [ims]
    [Tags]    HSS  HSS_Realm
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${HSS_Realm}  View
    HSS_RealmApp.View  ${AdministrationScenarios}

Sort Realm
    [Documentation]   Verify The Sort function on the Realm page of HSS    [ims]
    [Tags]    HSS  HSS_Realm	   
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${HSS_Realm}  Sort
    HSS_RealmApp.Sort  ${AdministrationScenarios}

Filter Realm
    [Documentation]   Verify The Filter function on the Realm page of HSS    [ims]
    [Tags]    HSS  HSS_Realm
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${HSS_Realm}  Filter
    HSS_RealmApp.Filter  ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${HSS_Realm}  Filter_Special
    HSS_RealmApp.Filter special characters  ${AdministrationScenarios}

Delete Realm
    [Documentation]   Verify The Delete function on the Realm page of HSS    [ims]
    [Tags]    HSS  HSS_Realm
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${HSS_Realm}  Delete
    HSS_RealmApp.Delete  ${AdministrationScenarios}