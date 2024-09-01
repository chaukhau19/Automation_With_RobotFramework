*** Settings ***
Documentation  All manipulation IBCF section
Resource  ../../Resources/DataManager.robot
Resource  ../../Data/InputData.robot
Resource  ../../Resources/Common.robot
Resource  ../../Resources/ECSCF/ECSCF_IBCFApp.robot

#Test Setup      Common.Begin Web Test
Test Teardown   Common.End Web Test

*** Tasks ***

Add IBCF
    [Documentation]   Verify The Add function on the IBCF page of ECSCF
    [Tags]  	ECSCF    ECSCF_IBCF 
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${ECSCF_IBCF}  Add
    ECSCF_IBCFApp.Add Valid Cases  ${AdministrationScenarios}

Add Invalid IBCF
    [Documentation]   Verify The Add Invalid function on the IBCF page of ECSCF
    [Tags]  	ECSCF    ECSCF_IBCF
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${ECSCF_IBCF}  Add_Errors
    ECSCF_IBCFApp.Add Invalid Cases  ${AdministrationScenarios}

Filter IBCF
    [Documentation]   Verify The Filter function on the IBCF page of ECSCF
    [Tags]  	ECSCF    ECSCF_IBCF     
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${ECSCF_IBCF}  Filter
    ECSCF_IBCFApp.Filter Cases  ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${ECSCF_IBCF}  Filter_Spechar
    ECSCF_IBCFApp.Filter Special Cases  ${AdministrationScenarios}

View IBCF
    [Documentation]   Verify The View function on the IBCF page of ECSCF
    [Tags]  	ECSCF    ECSCF_IBCF       
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${ECSCF_IBCF}  View
    ECSCF_IBCFApp.View Cases  ${AdministrationScenarios}

Sort IBCF
    [Documentation]   Verify The Sort function on the IBCF page of ECSCF
    [Tags]  	ECSCF    ECSCF_IBCF
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${ECSCF_IBCF}  Sort
    ECSCF_IBCFApp.Sort Cases  ${AdministrationScenarios}

Edit IBCF
    [Documentation]   Verify The Edit function on the IBCF page of ECSCF
    [Tags]  	ECSCF    ECSCF_IBCF
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${ECSCF_IBCF}  Edit
    ECSCF_IBCFApp.Edit Valid Cases  ${AdministrationScenarios}

Edit Invalid IBCF
    [Documentation]   Verify The Edit Invalid function on the IBCF page of ECSCF
    [Tags]  	ECSCF    ECSCF_IBCF   
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${ECSCF_IBCF}  Edit_Errors
    ECSCF_IBCFApp.Edit Invalid Cases  ${AdministrationScenarios}

Delete IBCF
    [Documentation]   Verify The Delete function on the IBCF page of ECSCF
    [Tags]  	ECSCF    ECSCF_IBCF  
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${ECSCF_IBCF}  Delete
    ECSCF_IBCFApp.Delete Cases  ${AdministrationScenarios}