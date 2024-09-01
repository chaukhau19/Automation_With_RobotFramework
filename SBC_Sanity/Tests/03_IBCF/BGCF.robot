*** Settings ***
Documentation  This is all tests of BGCF in IBCF
Resource  ../../Resources/DataManager.robot
Resource  ../../Data/InputData.robot
Resource  ../../Resources/Common.robot
Resource  ../../Resources/IBCF/IBCF_BGCFApp.robot

Test Setup      Common.Begin Web Test
Test Teardown   Common.End Web Test

*** Tasks ***

	
Add BGCF
    [Documentation]     Add proper BGCF of IBCF
    [Tags]  Smoke  IBCF_BGCF  sbc77
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${IBCF_BGCF}  Add
    IBCF_BGCFApp.Add64  ${AdministrationScenarios}    

	
Add Invalid BGCF
    [Documentation]     Add invalid BGCF of IBCF
    [Tags]   IBCF_BGCF  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${IBCF_BGCF}  Add_Errors
    IBCF_BGCFApp.Add Invalid 64  ${AdministrationScenarios}
    		
View BGCF
    [Documentation]     View BGCF of IBCF section testing
    [Tags]  IBCF_BGCF  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${IBCF_BGCF}  Edit
    IBCF_BGCFApp.View  ${AdministrationScenarios}
	
Sort BGCF
    [Documentation]     Sort BGCF of IBCF section testing
    [Tags]  IBCF_BGCF  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${IBCF_BGCF}  Add
    IBCF_BGCFApp.Sort  ${AdministrationScenarios}

Filter BGCF
    [Documentation]     Filter BGCF of IBCF section testing
    [Tags]  IBCF_BGCF  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${IBCF_BGCF}  Edit
    IBCF_BGCFApp.Filter  ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${IBCF_BGCF}  Filter
    IBCF_BGCFApp.Filter special characters  ${AdministrationScenarios}
	
Edit Invalid BGCF
    [Documentation]     Edit invalid BGCF of IBCF
    [Tags]   IBCF_BGCF  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${IBCF_BGCF}  Edit_Errors
    IBCF_BGCFApp.Edit Invalid 64  ${AdministrationScenarios}

Edit BGCF
    [Documentation]     Edit the basic proper BGCF of IBCF
    [Tags]  Smoke  IBCF_BGCF  sbc77
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${IBCF_BGCF}  Edit
    IBCF_BGCFApp.Edit64  ${AdministrationScenarios}
    		
Delete BGCF
    [Documentation]     Deleting proper BGCF of IBCF
    [Tags]  Smoke  IBCF_BGCF  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${IBCF_BGCF}  Delete
    IBCF_BGCFApp.Delete  ${AdministrationScenarios}

Retry Preference and Domain Origin 71
    [Documentation]     RetryOnStar and ExtractDomain in BGCF of IBCF
    [Tags]   IBCF_BGCF  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${IBCF_BGCF}  Retry
    IBCF_BGCFApp.Retry_Domain  ${AdministrationScenarios}