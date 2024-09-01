*** Settings ***
Documentation  This is all tests of IBCF in SCSCF
Resource  ../../Resources/DataManager.robot
Resource  ../../Data/InputData.robot
Resource  ../../Resources/Common.robot
Resource  ../../Resources/SCSCF/SCSCF_IBCFApp.robot

#Test Setup      Common.Begin Web Test
Test Teardown   Common.End Web Test

*** Tasks ***

Add IBCF
    [Documentation]   Verify The Add function on the IBCF page of SCSCF    [ims]
    [Tags]    SCSCF  SCSCF_IBCF 
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${SCSCF_IBCF}  Add
    SCSCF_IBCFApp.Add Valid Cases  ${AdministrationScenarios}

Add Invalid IBCF
    [Documentation]   Verify The Add Invalid function on the IBCF page of SCSCF    [ims]
    [Tags]    SCSCF  SCSCF_IBCF  
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${SCSCF_IBCF}  Add_Errors
    SCSCF_IBCFApp.Add Invalid Cases  ${AdministrationScenarios}

Filter IBCF
    [Documentation]   Verify The Filter function on the IBCF page of SCSCF    [ims]
    [Tags]    SCSCF  SCSCF_IBCF	  
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${SCSCF_IBCF}  Filter
    SCSCF_IBCFApp.Filter Cases  ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${SCSCF_IBCF}  Filter_Spechar
    SCSCF_IBCFApp.Filter Special Cases  ${AdministrationScenarios}

View IBCF
    [Documentation]   Verify The View function on the IBCF page of SCSCF    [ims]
    [Tags]    SCSCF  SCSCF_IBCF 
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${SCSCF_IBCF}  View
    SCSCF_IBCFApp.View Cases  ${AdministrationScenarios}

Sort IBCF
    [Documentation]   Verify The Sort function on the IBCF page of SCSCF    [ims]
    [Tags]    SCSCF  SCSCF_IBCF	  
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${SCSCF_IBCF}  Sort
    SCSCF_IBCFApp.Sort Cases  ${AdministrationScenarios}

Edit IBCF
    [Documentation]   Verify The Edit function on the IBCF page of SCSCF    [ims]
    [Tags]    SCSCF  SCSCF_IBCF
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${SCSCF_IBCF}  Edit
    SCSCF_IBCFApp.Edit Valid Cases  ${AdministrationScenarios}

Edit Invalid IBCF
    [Documentation]   Verify The Edit Invalid function on the IBCF page of SCSCF    [ims]
    [Tags]    SCSCF  SCSCF_IBCF  
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${SCSCF_IBCF}  Edit_Errors
    SCSCF_IBCFApp.Edit Invalid Cases  ${AdministrationScenarios}

Delete IBCF
    [Documentation]   Verify The Delete function on the IBCF page of SCSCF    [ims]
    [Tags]    SCSCF  SCSCF_IBCF
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${SCSCF_IBCF}  Delete
    SCSCF_IBCFApp.Delete Cases  ${AdministrationScenarios}