*** Settings ***
Documentation  All manipulation IBCF section
Resource  ../../Resources/DataManager.robot
Resource  ../../Data/InputData.robot
Resource  ../../Resources/Common.robot
Resource  ../../Resources/ECSCF/ECSCF_IBCFApp.robot

Test Setup      Common.Begin Web Test
Test Teardown   Common.End Web Test

*** Tasks ***
	
Add IBCF
    [Documentation]     Add IBCF in ECSCF section with valid parameters
    [Tags]  sbc77	Smoke  ECSCF_IBCF
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${ECSCF_IBCF}  Add
    ECSCF_IBCFApp.Add Valid Cases  ${AdministrationScenarios}

Add invalid IBCF
    [Documentation]     Add IBCF in ECSCF section with invalid parameters
    [Tags]   sbc77	ECSCF_IBCF  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${ECSCF_IBCF}  Add_Errors
    ECSCF_IBCFApp.Add Invalid Cases  ${AdministrationScenarios}

Filter IBCF
    [Documentation]     Filter IBCF with IP, PORT
    [Tags]  sbc77	ECSCF_IBCF  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${ECSCF_IBCF}  Filter
    ECSCF_IBCFApp.Filter Cases  ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${ECSCF_IBCF}  Filter_Spechar
    ECSCF_IBCFApp.Filter Special Cases  ${AdministrationScenarios}

View IBCF
    [Documentation]     View IBCF in ECSCF section
    [Tags]  sbc77	ECSCF_IBCF  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${ECSCF_IBCF}  Edit
    ECSCF_IBCFApp.View Cases  ${AdministrationScenarios}

Sort IBCF
    [Documentation]     Sort IBCF in ECSCF section
    [Tags]  sbc77	ECSCF_IBCF  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${ECSCF_IBCF}  Sort
    ECSCF_IBCFApp.Sort Cases  ${AdministrationScenarios}

Edit IBCF
    [Documentation]     Edit IBCF in ECSCF section with valid parameters
    [Tags]  sbc77	Smoke  ECSCF_IBCF
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${ECSCF_IBCF}  Edit
    ECSCF_IBCFApp.Edit Valid Cases  ${AdministrationScenarios}

Edit invalid IBCF
    [Documentation]     Edit IBCF in ECSCF section with invalid parameters
    [Tags]   sbc77	ECSCF_IBCF  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${ECSCF_IBCF}  Edit_Errors
    ECSCF_IBCFApp.Edit Invalid Cases  ${AdministrationScenarios}

Delete IBCF
    [Documentation]     Del IBCF in ECSCF section
    [Tags]  sbc77	Smoke  ECSCF_IBCF  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${ECSCF_IBCF}  Delete
    ECSCF_IBCFApp.Delete Cases  ${AdministrationScenarios}