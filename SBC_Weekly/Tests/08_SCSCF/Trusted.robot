*** Settings ***
Documentation  This is all tests of Trusted/Not Trusted of SCSCF
Resource  ../../Resources/DataManager.robot
Resource  ../../Data/InputData.robot
Resource  ../../Resources/Common.robot
Resource  ../../Resources/SCSCF/SCSCF_TrustedApp.robot

#Test Setup      Common.Begin Web Test
Test Teardown   Common.End Web Test

*** Tasks ***

############################## Trusted #######################################
Add Trusted
    [Documentation]   Verify The Add function on the Trusted page of SCSCF    [ims]
    [Tags]    SCSCF     SCSCF_Trusted/NotTrusted     SCSCF_Trusted/NotTrusted_Trusted  /NotTrusted     SCSCF_Trusted/NotTrusted_Trusted  
    ${AdministrationScenarios} =  DataManager.Get Excel Data    ${SCSCF_Trusted}  Trusted
    SCSCF_TrustedApp.Add Trusted  ${AdministrationScenarios}

Add Invalid Trusted
    [Documentation]   Verify The Add Invalid function on the Trusted page of SCSCF    [ims]
    [Tags]    SCSCF     SCSCF_Trusted/NotTrusted     SCSCF_Trusted/NotTrusted_Trusted  
    ${AdministrationScenarios} =  DataManager.Get Excel Data    ${SCSCF_Trusted}  Trusted_Errors
    SCSCF_TrustedApp.Add Trusted Invalid Cases  ${AdministrationScenarios}

Filter Trusted
    [Documentation]   Verify The Filter function on the Trusted page of SCSCF    [ims]
    [Tags]    SCSCF     SCSCF_Trusted/NotTrusted     SCSCF_Trusted/NotTrusted_Trusted  /NotTrusted     SCSCF_Trusted/NotTrusted_Trusted   
    ${AdministrationScenarios} =  DataManager.Get Excel Data    ${SCSCF_Trusted}  Trusted_Filter
    SCSCF_TrustedApp.Filter Trusted  ${AdministrationScenarios}

Delete Trusted
    [Documentation]   Verify The Delete function on the Trusted page of SCSCF    [ims]
    [Tags]    SCSCF     SCSCF_Trusted/NotTrusted     SCSCF_Trusted/NotTrusted_Trusted  
    ${AdministrationScenarios} =  DataManager.Get Excel Data    ${SCSCF_Trusted}  Trusted_Delete
    SCSCF_TrustedApp.Delete Trusted  ${AdministrationScenarios}


########################### Not Trusted #####################################
Add Not Trusted
    [Documentation]   Verify The Add function on the Not Trusted page of SCSCF    [ims]
    [Tags]    SCSCF     SCSCF_Trusted/NotTrusted     SCSCF_Trusted/NotTrusted_NotTrusted
    ${AdministrationScenarios} =  DataManager.Get Excel Data    ${SCSCF_Trusted}  NotTrusted
    SCSCF_TrustedApp.Add Not Trusted  ${AdministrationScenarios}

Add Invalid Not Trusted
    [Documentation]   Verify The Add Invalid function on the Not Trusted page of SCSCF    [ims]
    [Tags]    SCSCF     SCSCF_Trusted/NotTrusted     SCSCF_Trusted/NotTrusted_NotTrusted 
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${SCSCF_Trusted}  NotTrusted_Errors
    SCSCF_TrustedApp.Add Not Trusted Invalid Cases  ${AdministrationScenarios}

Filter Not Trusted
    [Documentation]   Verify The Filter function on the Not Trusted page of SCSCF    [ims]
    [Tags]    SCSCF     SCSCF_Trusted/NotTrusted     SCSCF_Trusted/NotTrusted_NotTrusted
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${SCSCF_Trusted}  NotTrusted_Filter
    SCSCF_TrustedApp.Filter Not Trusted  ${AdministrationScenarios}

Delete Not Trusted
    [Documentation]   Verify The Delete function on the Not Trusted page of SCSCF    [ims]
    [Tags]    SCSCF     SCSCF_Trusted/NotTrusted     SCSCF_Trusted/NotTrusted_NotTrusted  
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${SCSCF_Trusted}  NotTrusted_Delete
    SCSCF_TrustedApp.Delete Not Trusted  ${AdministrationScenarios}