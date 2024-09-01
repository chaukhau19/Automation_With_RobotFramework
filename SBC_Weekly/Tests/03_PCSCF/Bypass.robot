*** Settings ***
Documentation  This is all tests of PCSCF_Bypass
Resource  ../../Resources/DataManager.robot
Resource  ../../Data/InputData.robot
Resource  ../../Resources/Common.robot
Resource  ../../Resources/PCSCF/PCSCF_BypassApp.robot

#Test Setup      Common.Begin Web Test
Test Teardown   Common.End Web Test

*** Tasks ***

Add Bypass
    [Documentation]    Verify the functionality of 'Add Bypass' on the PCSCF page
    [Tags]  PCSCF  PCSCF_Bypass   
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Bypass}   Bypass_Add
    PCSCF_BypassApp.Add Bypass   ${AdministrationScenarios}

Sort Bypass
    [Documentation]    Verify the functionality of 'Sort Bypass' on the PCSCF page
    [Tags]  PCSCF  PCSCF_Bypass  
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Bypass}  Bypass_Sort
    PCSCF_BypassApp.Sort Bypass   ${AdministrationScenarios}

View Bypass
    [Documentation]    Verify the functionality of 'View Bypass' on the PCSCF page
    [Tags]  PCSCF  PCSCF_Bypass     
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Bypass}  Bypass_View
    PCSCF_BypassApp.View Bypass   ${AdministrationScenarios}

Filter Bypass
    [Documentation]    Verify the functionality of 'Filter Bypass' on the PCSCF page
    [Tags]  PCSCF  PCSCF_Bypass    
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Bypass}  Bypass_Filter
    PCSCF_BypassApp.Filter Bypass   ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Bypass}  Bypass_Filter_Spechar
    PCSCF_BypassApp.Filter Special Character Bypass   ${AdministrationScenarios}

Edit Bypass
    [Documentation]    Verify the functionality of 'Edit Bypass' on the PCSCF page
    [Tags]  PCSCF  PCSCF_Bypass      
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Bypass}   Bypass_Edit
    PCSCF_BypassApp.Edit Bypass   ${AdministrationScenarios}

Delete Bypass
    [Documentation]    Verify the functionality of 'Delete Bypass' on the PCSCF page
    [Tags]  PCSCF  PCSCF_Bypass   
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Bypass}   Bypass_Delete
    PCSCF_BypassApp.Delete Bypass   ${AdministrationScenarios}