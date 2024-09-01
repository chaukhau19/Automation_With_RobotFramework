*** Settings ***
Documentation  This is all tests of Whitelabel of PCSCF
Resource  ../../Resources/DataManager.robot
Resource  ../../Data/InputData.robot
Resource  ../../Resources/Common.robot
Resource  ../../Resources/PCSCF/PCSCF_WhiteLabelApp.robot

Test Setup      Common.Begin Web Test
Test Teardown   Common.End Web Test

*** Tasks ***

### ICSCF ####
	
Reset Whitelabel
    [Documentation]     Reset White label for  PCSCF
    [Tags]  PCSCF_Whitelabel_sbc65  sbc77  not_critical
    PCSCF_WhiteLabelApp.Reset Whitelabel
	
Edit Whitelabel
    [Documentation]     Editting proper White label for  PCSCF
    [Tags]  PCSCF_Whitelabel_sbc65  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Whitelabel}		Edit
    PCSCF_WhiteLabelApp.Edit Whitelabel   ${AdministrationScenarios}
	
Filtering Profile
    [Documentation]     Filtering profile for  PCSCF
    [Tags]   PCSCF_Whitelabel_sbc65  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Whitelabel}		Filtering_Profile
    PCSCF_WhiteLabelApp.Filtering Whitelabel   ${AdministrationScenarios}
	