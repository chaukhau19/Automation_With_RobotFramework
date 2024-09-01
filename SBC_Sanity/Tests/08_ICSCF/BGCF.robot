*** Settings ***
Documentation  This is all tests of BGCF in ICSCF
Resource  ../../Resources/DataManager.robot
Resource  ../../Data/InputData.robot
Resource  ../../Resources/Common.robot
Resource  ../../Resources/ICSCF/ICSCF_BGCFApp.robot

Test Setup      Common.Begin Web Test
Test Teardown   Common.End Web Test

*** Tasks ***

Add BGCF
    [Documentation]     Add proper BGCF of ICSCF
    [Tags]  ims47  Smoke  ICSCF_BGCF
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${ICSCF_BGCF}  Add
    ICSCF_BGCFApp.Add  ${AdministrationScenarios}

Add Invalid BGCF
    [Documentation]     Add invalid BGCF of ICSCF
    [Tags]  ims47   ICSCF_BGCF  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${ICSCF_BGCF}  Add_Errors
    ICSCF_BGCFApp.Add Invalid  ${AdministrationScenarios}

View BGCF
    [Documentation]     View BGCF of ICSCF section testing
    [Tags]  ims47  ICSCF_BGCF  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${ICSCF_BGCF}  Edit
    ICSCF_BGCFApp.View  ${AdministrationScenarios}

Sort BGCF
    [Documentation]     Sort BGCF of ICSCF section testing
    [Tags]  ims47  ICSCF_BGCF  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${ICSCF_BGCF}  Add
    ICSCF_BGCFApp.Sort  ${AdministrationScenarios}

Filter BGCF
    [Documentation]     Filter BGCF of ICSCF section testing
    [Tags]  ims47  ICSCF_BGCF  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${ICSCF_BGCF}  Filter
    ICSCF_BGCFApp.Filter  ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${ICSCF_BGCF}  Filter_special
    ICSCF_BGCFApp.Filter special characters  ${AdministrationScenarios}

Edit Invalid BGCF
    [Documentation]     Edit invalid BGCF of ICSCF
    [Tags]  ims47   ICSCF_BGCF  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${ICSCF_BGCF}  Edit_Errors
    ICSCF_BGCFApp.Edit Invalid  ${AdministrationScenarios}

Edit BGCF
    [Documentation]     Edit the basic proper BGCF of ICSCF
    [Tags]  ims47  Smoke  ICSCF_BGCF
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${ICSCF_BGCF}  Edit
    ICSCF_BGCFApp.Edit  ${AdministrationScenarios}

Delete BGCF
    [Documentation]     Deleting proper BGCF of ICSCF
    [Tags]  ims47  Smoke  ICSCF_BGCF  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${ICSCF_BGCF}  Delete
    ICSCF_BGCFApp.Delete  ${AdministrationScenarios}