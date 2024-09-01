*** Settings ***
Documentation  This is all tests of Whitelabel of PCSCF
Resource  ../../Resources/DataManager.robot
Resource  ../../Data/InputData.robot
Resource  ../../Resources/Common.robot
Resource  ../../Resources/PCSCF/PCSCF_RegisteredUserApp.robot

Test Setup      Common.Begin Web Test
Test Teardown   Common.End Web Test

*** Tasks ***
		
View Registered User
    [Documentation]     View Registered User for  PCSCF
    [Tags]   Smoke  PCSCF_ReisteredUser  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_RegisteredUser}		View
    PCSCF_RegisteredUserApp.View Registered User   ${AdministrationScenarios}

Delete Registered User
    [Documentation]     Delete Registered User for  PCSCF
    [Tags]    Smoke  PCSCF_ReisteredUser  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_RegisteredUser}  View
    PCSCF_RegisteredUserApp.Delete Registered User  ${AdministrationScenarios}
