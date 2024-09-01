*** Settings ***
Documentation  This is all tests of IBCF_TPIP
Resource  ../../Resources/DataManager.robot
Resource  ../../Data/InputData.robot
Resource  ../../Resources/Common.robot
Resource  ../../Resources/IBCF/IBCF_TpipApp.robot

#Test Setup      Common.Begin Web Test
Test Teardown   Common.End Web Test

*** Tasks ***

Add TPIP
    [Documentation]    Verify the functionality of 'Add TPIP' on the IBCF page
    [Tags]  IBCF  IBCF_TPIP 
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${IBCF_TPIP}  Add
    IBCF_TpipApp.Add  ${AdministrationScenarios}

Add Invalid TPIP
    [Documentation]    Verify the functionality of 'Add Invalid TPIP' on the IBCF page
    [Tags]  IBCF  IBCF_TPIP  
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${IBCF_TPIP}  Add_Errors
    IBCF_TpipApp.Add Invalid  ${AdministrationScenarios}

View TPIP
    [Documentation]    Verify the functionality of 'View TPIP' on the IBCF page
    [Tags]  IBCF  IBCF_TPIP      
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${IBCF_TPIP}  View
    IBCF_TpipApp.View  ${AdministrationScenarios}

Filter TPIP
    [Documentation]    Verify the functionality of 'Filter TPIP' on the IBCF page
    [Tags]  IBCF  IBCF_TPIP     
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${IBCF_TPIP}  Filter
    IBCF_TpipApp.Filter  ${AdministrationScenarios}

Sort TPIP
    [Documentation]    Verify the functionality of 'Sort TPIP' on the IBCF page
    [Tags]  IBCF  IBCF_TPIP   
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${IBCF_TPIP}  Sort
    IBCF_TpipApp.Sort  ${AdministrationScenarios}

Edit TPIP
    [Documentation]    Verify the functionality of 'Edit TPIP' on the IBCF page
    [Tags]  IBCF  IBCF_TPIP  
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${IBCF_TPIP}  Edit
    IBCF_TpipApp.Edit  ${AdministrationScenarios}