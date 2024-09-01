*** Settings ***
Documentation  This is all tests of BGCF in SCSCF
Resource  ../../Resources/DataManager.robot
Resource  ../../Data/InputData.robot
Resource  ../../Resources/Common.robot
Resource  ../../Resources/SCSCF/SCSCF_BGCFApp.robot

Test Setup      Common.Begin Web Test
Test Teardown   Common.End Web Test

*** Tasks ***



Add BGCF
    [Documentation]     Add proper BGCF of SCSCF
    [Tags]    Smoke  SCSCF_BGCF  ims47
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${SCSCF_BGCF}  Add
    SCSCF_BGCFApp.Add  ${AdministrationScenarios}


Add Invalid BGCF
    [Documentation]     Add invalid BGCF of SCSCF
    [Tags]     SCSCF_BGCF  ims47  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${SCSCF_BGCF}  Add_Errors
    SCSCF_BGCFApp.Add Invalid  ${AdministrationScenarios}


View BGCF
    [Documentation]     View BGCF of SCSCF section testing
    [Tags]    SCSCF_BGCF  ims47  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${SCSCF_BGCF}  Edit
    SCSCF_BGCFApp.View  ${AdministrationScenarios}

Sort BGCF
    [Documentation]     Sort BGCF of SCSCF section testing
    [Tags]    SCSCF_BGCF  ims47  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${SCSCF_BGCF}  Add
    SCSCF_BGCFApp.Sort  ${AdministrationScenarios}

Filter BGCF
    [Documentation]     Filter BGCF of SCSCF section testing
    [Tags]    SCSCF_BGCF  ims47  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${SCSCF_BGCF}  Edit
    SCSCF_BGCFApp.Filter  ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${SCSCF_BGCF}  Filter
    SCSCF_BGCFApp.Filter special characters  ${AdministrationScenarios}

Edit Invalid BGCF
    [Documentation]     Edit invalid BGCF of SCSCF
    [Tags]     SCSCF_BGCF  ims47  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${SCSCF_BGCF}  Edit_Errors
    SCSCF_BGCFApp.Edit Invalid  ${AdministrationScenarios}

Edit BGCF
    [Documentation]     Edit the basic proper BGCF of SCSCF
    [Tags]    Smoke  SCSCF_BGCF  ims47
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${SCSCF_BGCF}  Edit
    SCSCF_BGCFApp.Edit  ${AdministrationScenarios}

Delete BGCF
    [Documentation]     Deleting proper BGCF of SCSCF
    [Tags]    Smoke  SCSCF_BGCF  ims47  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${SCSCF_BGCF}  Delete
    SCSCF_BGCFApp.Delete  ${AdministrationScenarios}

