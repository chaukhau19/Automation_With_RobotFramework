*** Settings ***
Documentation  This is all tests of Realm in HSS
Resource  ../../Resources/DataManager.robot
Resource  ../../Data/InputData.robot
Resource  ../../Resources/Common.robot
Resource  ../../Resources/HSS/HSS_RealmApp.robot

Test Setup      Common.Begin Web Test
Test Teardown   Common.End Web Test

*** Tasks ***
	
Add Realm
    [Documentation]     Add proper Realm of HSS
    [Tags]    Smoke  HSS_Realm	ims47  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${HSS_Realm}  Add
    HSS_RealmApp.Add  ${AdministrationScenarios}

Add Invalid Realm
    [Documentation]     Add invalid Realm of HSS
    [Tags]     HSS_Realm	ims47  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${HSS_Realm}  Add_Errors
    HSS_RealmApp.Add Invalid  ${AdministrationScenarios}

View Realm
    [Documentation]     View Realm of HSS  testing
    [Tags]    HSS_Realm	 ims47  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${HSS_Realm}  Add
    HSS_RealmApp.View  ${AdministrationScenarios}

Sort Realm
    [Documentation]     Sort Realm of HSS testing
    [Tags]    HSS_Realm	 ims47  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${HSS_Realm}  Add
    HSS_RealmApp.Sort  ${AdministrationScenarios}

Filter Realm
    [Documentation]     Filter Realm of HSS testing
    [Tags]    HSS_Realm	 ims47  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${HSS_Realm}  Filter
    HSS_RealmApp.Filter  ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${HSS_Realm}  Filter_Special
    HSS_RealmApp.Filter special characters  ${AdministrationScenarios}

Delete Realm
    [Documentation]     Deleting proper Realm of HSS
    [Tags]    Smoke  HSS_Realm	ims47  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${HSS_Realm}  Delete
    HSS_RealmApp.Delete  ${AdministrationScenarios}