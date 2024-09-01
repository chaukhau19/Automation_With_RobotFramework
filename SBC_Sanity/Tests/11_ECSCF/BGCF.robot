*** Settings ***
Documentation  This is all tests of BGCF in ECSCF
Resource  ../../Resources/DataManager.robot
Resource  ../../Data/InputData.robot
Resource  ../../Resources/Common.robot
Resource  ../../Resources/ECSCF/ECSCF_BGCFApp.robot

Test Setup      Common.Begin Web Test
Test Teardown   Common.End Web Test

*** Tasks ***

Add BGCF
    [Documentation]     Add proper BGCF of ECSCF
    [Tags]   sbc77	Smoke  ECSCF_BGCF	
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${ECSCF_BGCF}  Add
    ECSCF_BGCFApp.Add  ${AdministrationScenarios}

Add Invalid BGCF
    [Documentation]     Add invalid BGCF of ECSCF
    [Tags]   sbc77	ECSCF_BGCF  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${ECSCF_BGCF}  Add_Errors
    ECSCF_BGCFApp.Add Invalid  ${AdministrationScenarios}

View BGCF
    [Documentation]     View BGCF of ECSCF section testing
    [Tags]   sbc77	ECSCF_BGCF  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${ECSCF_BGCF}  Edit
    ECSCF_BGCFApp.View  ${AdministrationScenarios}

Sort BGCF
    [Documentation]     Sort BGCF of ECSCF section testing
    [Tags]  sbc77  ECSCF_BGCF  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${ECSCF_BGCF}  Add
    ECSCF_BGCFApp.Sort  ${AdministrationScenarios}

Filter BGCF
    [Documentation]     Filter BGCF of ECSCF section testing
    [Tags]  sbc77	ECSCF_BGCF  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${ECSCF_BGCF}  Edit
    ECSCF_BGCFApp.Filter  ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${ECSCF_BGCF}  Filter
    ECSCF_BGCFApp.Filter special characters  ${AdministrationScenarios}

Edit Invalid BGCF
    [Documentation]     Edit invalid BGCF of ECSCF
    [Tags]  sbc77   ECSCF_BGCF  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${ECSCF_BGCF}  Edit_Errors
    ECSCF_BGCFApp.Edit Invalid  ${AdministrationScenarios}

Edit BGCF
    [Documentation]     Edit the basic proper BGCF of ECSCF
    [Tags]  sbc77  Smoke  ECSCF_BGCF
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${ECSCF_BGCF}  Edit
    ECSCF_BGCFApp.Edit  ${AdministrationScenarios}

Delete BGCF
    [Documentation]     Deleting proper BGCF of ECSCF
    [Tags]  sbc77	Smoke  ECSCF_BGCF  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${ECSCF_BGCF}  Delete
    ECSCF_BGCFApp.Delete  ${AdministrationScenarios}
