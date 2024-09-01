*** Settings ***
Documentation  This is all tests of Register of PCSCF
Resource  ../../Resources/DataManager.robot
Resource  ../../Data/InputData.robot
Resource  ../../Resources/Common.robot
Resource  ../../Resources/PCSCF/PCSCF_RegisteredUserApp.robot

#Test Setup      Common.Begin Web Test
Test Teardown   Common.End Web Test

*** Tasks ***

View Registered User
    [Documentation]    Verify the functionality of 'View Registered User' on the PCSCF page
    [Tags]   PCSCF  PCSCF_ReisteredUser    
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_RegisteredUser}		View
    PCSCF_RegisteredUserApp.View Registered User   ${AdministrationScenarios}


Filter Registered User
    [Documentation]    Verify the functionality of 'Filter Registered User' on the PCSCF page
    [Tags]   PCSCF  PCSCF_ReisteredUser  
    [Timeout]  300s  
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_RegisteredUser}  Filter
    PCSCF_RegisteredUserApp.Filter Registered User  ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_RegisteredUser}  ReisteredUser_Filter_Spechar
    PCSCF_RegisteredUserApp.Filter Special Character Registered User function   ${AdministrationScenarios}

Delete Registered User
    [Documentation]    Verify the functionality of 'Delete Registered User' on the PCSCF page
    [Tags]   PCSCF  PCSCF_ReisteredUser 
    [Timeout]  300s     
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_RegisteredUser}  Delete
    PCSCF_RegisteredUserApp.Delete Registered User  ${AdministrationScenarios}


