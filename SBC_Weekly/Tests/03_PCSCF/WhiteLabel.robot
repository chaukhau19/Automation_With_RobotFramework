*** Settings ***
Documentation  This is all tests of Whitelabel of PCSCF
Resource  ../../Resources/DataManager.robot
Resource  ../../Data/InputData.robot
Resource  ../../Resources/Common.robot
Resource  ../../Resources/PCSCF/PCSCF_WhiteLabelApp.robot

#Test Setup      Common.Begin Web Test
Test Teardown   Common.End Web Test

*** Tasks ***

### ICSCF ####

Reset Whitelabel
    [Documentation]    Verify the functionality of 'Reset Whitelabel' on the PCSCF page
    [Tags]  PCSCF    PCSCF_Whitelabel  
    [Setup]  Begin Web Test
    PCSCF_WhiteLabelApp.Reset Whitelabel

Edit Whitelabel
    [Documentation]    Verify the functionality of 'Edit Whitelabel' on the PCSCF page
    [Tags]  PCSCF    PCSCF_Whitelabel      
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Whitelabel}		Edit
    PCSCF_WhiteLabelApp.Edit Whitelabel   ${AdministrationScenarios}

Filter Profile
    [Documentation]    Verify the functionality of 'Filter Whitelabel' on the PCSCF page
    [Tags]  PCSCF    PCSCF_Whitelabel    
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Whitelabel}		Filtering_Profile
    PCSCF_WhiteLabelApp.Filtering Whitelabel   ${AdministrationScenarios}
	