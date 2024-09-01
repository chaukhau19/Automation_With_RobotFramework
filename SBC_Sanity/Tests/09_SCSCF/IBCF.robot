*** Settings ***
Documentation  This is all tests of IBCF in SCSCF
Resource  ../../Resources/DataManager.robot
Resource  ../../Data/InputData.robot
Resource  ../../Resources/Common.robot
Resource  ../../Resources/SCSCF/SCSCF_IBCFApp.robot

Test Setup      Common.Begin Web Test
Test Teardown   Common.End Web Test

*** Tasks ***
	
Add IBCF
    [Documentation]     Add IBCF in SCSCF section with valid parameters
    [Tags]    Smoke  SCSCF_IBCF  ims47
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${SCSCF_IBCF}  Add
    SCSCF_IBCFApp.Add Valid Cases  ${AdministrationScenarios}

Add invalid IBCF
    [Documentation]     Add IBCF in SCSCF section with invalid parameters
    [Tags]     SCSCF_IBCF	ims47  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${SCSCF_IBCF}  Add_Errors
    SCSCF_IBCFApp.Add Invalid Cases  ${AdministrationScenarios}

Filter IBCF
    [Documentation]     Filter IBCF with IP, PORT, DOMAIN
    [Tags]    SCSCF_IBCF	ims47  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${SCSCF_IBCF}  Filter
    SCSCF_IBCFApp.Filter Cases  ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${SCSCF_IBCF}  Filter_Spechar
    SCSCF_IBCFApp.Filter Special Cases  ${AdministrationScenarios}

View IBCF
    [Documentation]     View IBCF in BGCF section
    [Tags]    SCSCF_IBCF	ims47  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${SCSCF_IBCF}  Edit
    SCSCF_IBCFApp.View Cases  ${AdministrationScenarios}

Sort IBCF
    [Documentation]     Sort IBCF in BGCF section
    [Tags]    SCSCF_IBCF	ims47  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${SCSCF_IBCF}  Sort
    SCSCF_IBCFApp.Sort Cases  ${AdministrationScenarios}

Edit IBCF
    [Documentation]     Edit IBCF in BGCF section with valid parameters
    [Tags]    Smoke  SCSCF_IBCF  ims47
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${SCSCF_IBCF}  Edit
    SCSCF_IBCFApp.Edit Valid Cases  ${AdministrationScenarios}

Edit invalid IBCF
    [Documentation]     Edit IBCF in BGCF section with invalid parameters
    [Tags]     SCSCF_IBCF	ims47  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${SCSCF_IBCF}  Edit_Errors
    SCSCF_IBCFApp.Edit Invalid Cases  ${AdministrationScenarios}

Delete IBCF
    [Documentation]     Del IBCF in BGCF section
    [Tags]    Smoke  SCSCF_IBCF  ims47  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${SCSCF_IBCF}  Delete
    SCSCF_IBCFApp.Delete Cases  ${AdministrationScenarios}