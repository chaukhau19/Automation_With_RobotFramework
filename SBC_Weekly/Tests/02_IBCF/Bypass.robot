*** Settings ***
Documentation  This is all tests of IBCF_Bypass
Resource  ../../Resources/DataManager.robot
Resource  ../../Data/InputData.robot
Resource  ../../Resources/Common.robot
Resource  ../../Resources/IBCF/IBCF_BypassApp.robot

#Test Setup      Common.Begin Web Test
Test Teardown   Common.End Web Test

*** Tasks ***

Add Bypass 
    [Documentation]    Verify the functionality of 'Add Bypass' on the IBCF page
    [Tags]  IBCF  IBCF_Bypass    
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Bypass}   Bypass_Add
    IBCF_BypassApp.Add Bypass   ${AdministrationScenarios}

Sort Bypass 
    [Documentation]    Verify the functionality of 'Sort Bypass' on the IBCF page
    [Tags]   IBCF    IBCF_Bypass    
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Bypass}   Bypass_Sort
    IBCF_BypassApp.Sort Bypass   ${AdministrationScenarios}

View Bypass 
    [Documentation]    Verify the functionality of 'View Bypass' on the IBCF page
    [Tags]  IBCF    IBCF_Bypass   
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Bypass}   Bypass_View
    IBCF_BypassApp.View Bypass   ${AdministrationScenarios}

Filter Bypass 
    [Documentation]    Verify the functionality of 'Filter Bypass' on the IBCF page
    [Tags]  IBCF    IBCF_Bypass    
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Bypass}  Bypass_Filter
    IBCF_BypassApp.Filter Bypass   ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Bypass}  Bypass_Filter_Spechar
    IBCF_BypassApp.Filter Special Character Bypass   ${AdministrationScenarios}

Edit Bypass 
    [Documentation]    Verify the functionality of 'Edit Bypass' on the IBCF page
    [Tags]  IBCF  IBCF_Bypass
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Bypass}   Bypass_Edit
    IBCF_BypassApp.Edit Bypass   ${AdministrationScenarios}

Delete Bypass 
    [Documentation]    Verify the functionality of 'Delete Bypass' on the IBCF page
    [Tags]  IBCF  IBCF_Bypass     
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Bypass}   Bypass_Delete
    IBCF_BypassApp.Delete Bypass   ${AdministrationScenarios}