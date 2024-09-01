*** Settings ***
Documentation  This is all tests of Application Server in HSS
Resource  ../../Resources/DataManager.robot
Resource  ../../Data/InputData.robot
Resource  ../../Resources/Common.robot
Resource  ../../Resources/HSS/HSS_ApplicationServerApp.robot

Test Setup      Common.Begin Web Test
Test Teardown   Common.End Web Test

*** Tasks ***

Add ApplicationServer
    [Documentation]     Add proper ApplicationServer of HSS
    [Tags]  Smoke  HSS_ApplicationServer  ims47
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${HSS_ApplicationServer}  Add
    HSS_ApplicationServerApp.Add  ${AdministrationScenarios}

Add Invalid ApplicationServer
    [Documentation]     Add invalid ApplicationServer of HSS
    [Tags]   HSS_ApplicationServer	ims47  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${HSS_ApplicationServer}  Add_Errors
    HSS_ApplicationServerApp.Add Invalid  ${AdministrationScenarios}

View ApplicationServer
    [Documentation]     View ApplicationServer of HSS testing
    [Tags]  HSS_ApplicationServer	ims47  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${HSS_ApplicationServer}  Add
    HSS_ApplicationServerApp.View  ${AdministrationScenarios}

Sort ApplicationServer
    [Documentation]     Sort ApplicationServer of HSS testing
    [Tags]  HSS_ApplicationServer	ims47  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${HSS_ApplicationServer}  Add
    HSS_ApplicationServerApp.Sort  ${AdministrationScenarios}

Filter ApplicationServer
    [Documentation]     Filter ApplicationServer of HSS testing
    [Tags]  HSS_ApplicationServer	ims47  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${HSS_ApplicationServer}  Filter
    HSS_ApplicationServerApp.Filter  ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${HSS_ApplicationServer}  Filter_Special
    HSS_ApplicationServerApp.Filter special characters  ${AdministrationScenarios}

Delete ApplicationServer
    [Documentation]     Deleting proper ApplicationServer of HSS
    [Tags]  Smoke  HSS_ApplicationServer	ims47  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${HSS_ApplicationServer}  Delete
    HSS_ApplicationServerApp.Delete  ${AdministrationScenarios}