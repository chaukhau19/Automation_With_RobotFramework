*** Settings ***
Documentation  All manipulation IBCF section
Resource  ../../Resources/DataManager.robot
Resource  ../../Data/InputData.robot
Resource  ../../Resources/Common.robot
Resource  ../../Resources/BGCF/BGCF_IBCFApp.robot

Test Setup      Common.Begin Web Test
Test Teardown   Common.End Web Test

*** Tasks ***


Add IBCF
    [Documentation]     Add IBCF in BGCF section with valid parameters
    [Tags]  Smoke  BGCF_IBCF  sbc77
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${BGCF_IBCF}  Add
    BGCF_IBCFApp.Add Valid Cases 65  ${AdministrationScenarios}
	
Add invalid IBCF
    [Documentation]     Add IBCF in BGCF section with invalid parameters
    [Tags]   BGCF_IBCF  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${BGCF_IBCF}  Add_Errors65
    BGCF_IBCFApp.Add Invalid Cases 65  ${AdministrationScenarios}

	
Filter IBCF
    [Documentation]     Filter IBCF with IP, PORT, WEIGHT
    [Tags]  BGCF_IBCF  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${BGCF_IBCF}  Filter
    BGCF_IBCFApp.Filter Cases 65  ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${BGCF_IBCF}  Filter_Spechar
    BGCF_IBCFApp.Filter Special Cases 65  ${AdministrationScenarios}

	
View IBCF
    [Documentation]     View IBCF in BGCF section
    [Tags]  BGCF_IBCF  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${BGCF_IBCF}  Edit
    BGCF_IBCFApp.View Cases 65  ${AdministrationScenarios}

	
Sort IBCF
    [Documentation]     Sort IBCF in BGCF section
    [Tags]  BGCF_IBCF   sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${BGCF_IBCF}  Sort
    BGCF_IBCFApp.Sort Cases  ${AdministrationScenarios}

	
Edit IBCF
    [Documentation]     Edit IBCF in BGCF section with valid parameters
    [Tags]  Smoke  BGCF_IBCF  sbc77
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${BGCF_IBCF}  Edit
    BGCF_IBCFApp.Edit Valid Cases 65  ${AdministrationScenarios}

	
Edit invalid IBCF
    [Documentation]     Edit IBCF in BGCF section with invalid parameters
    [Tags]   BGCF_IBCF  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${BGCF_IBCF}  Edit_Errors65
    BGCF_IBCFApp.Edit Invalid Cases 65  ${AdministrationScenarios}

	
Delete IBCF
    [Documentation]     Del IBCF in BGCF section
    [Tags]  Smoke  BGCF_IBCF  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${BGCF_IBCF}  Delete
    BGCF_IBCFApp.Delete Cases 65  ${AdministrationScenarios}