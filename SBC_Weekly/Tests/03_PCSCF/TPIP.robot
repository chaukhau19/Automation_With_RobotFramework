*** Settings ***
Documentation  This is all tests of PCSCF_TPIP
Resource  ../../Resources/DataManager.robot
Resource  ../../Data/InputData.robot
Resource  ../../Resources/Common.robot
Resource  ../../Resources/PCSCF/PCSCF_TpipApp.robot

#Test Setup      Common.Begin Web Test
Test Teardown   Common.End Web Test

*** Tasks ***

Add TPIP
    [Documentation]    Verify the functionality of 'Add TPIP' on the PCSCF page
    [Tags]  PCSCF  PCSCF_TPIP 
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_TPIP}  TPIP6.6
    PCSCF_TpipApp.Add  ${AdministrationScenarios}

Add Invalid Protected TPIP
    [Documentation]    Verify the functionality of 'Add Invalid Protected TPIP' on the PCSCF page
    [Tags]  PCSCF  PCSCF_TPIP   
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_TPIP}  TPIP6.6_Invalid
    PCSCF_TpipApp.Add Invalid Protected  ${AdministrationScenarios}

View TPIP
    [Documentation]    Verify the functionality of 'Add Invalid Protected TPIP' on the PCSCF page
    [Tags]  PCSCF  PCSCF_TPIP   
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${PCSCF_TPIP}  TPIP_View
    PCSCF_TpipApp.View  ${AdministrationScenarios}

Filter TPIP
    [Documentation]    Verify the functionality of 'Filter TPIP' on the PCSCF page
    [Tags]  PCSCF  PCSCF_TPIP  
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${PCSCF_TPIP}  TPIP_Filter
    PCSCF_TpipApp.Filter  ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${PCSCF_TPIP}  TPIP_Filter_Spechar
    PCSCF_TpipApp.Filter Special Character TPIP  ${AdministrationScenarios}

Sort TPIP
    [Documentation]    Verify the functionality of 'Sort TPIP' on the PCSCF page
    [Tags]  PCSCF  PCSCF_TPIP   
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${PCSCF_TPIP}  TPIP_Sort
    PCSCF_TpipApp.Sort  ${AdministrationScenarios}

Edit TPIP
    [Documentation]    Verify the functionality of 'Edit TPIP' on the PCSCF page
    [Tags]  PCSCF  PCSCF_TPIP  
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_TPIP}  TPIP_Edit
    PCSCF_TpipApp.Edit  ${AdministrationScenarios}