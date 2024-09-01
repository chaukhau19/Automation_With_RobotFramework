*** Settings ***
Documentation  This is all tests of Trusted/Not Trusted of SCSCF
Resource  ../../Resources/DataManager.robot
Resource  ../../Data/InputData.robot
Resource  ../../Resources/Common.robot
Resource  ../../Resources/SCSCF/SCSCF_TrustedApp.robot

Test Setup      Common.Begin Web Test
Test Teardown   Common.End Web Test

*** Tasks ***
	
Add Trusted
    [Documentation]     Add SCSCF Trusted section testing with valid parameters
    [Tags]     SCSCF_Trusted  ims47  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data    ${SCSCF_Trusted}  Trusted
    SCSCF_TrustedApp.Add Trusted  ${AdministrationScenarios}

Add Invalid Trusted
    [Documentation]     Add SCSCF Trusted section testing with invalid parameters
    [Tags]     SCSCF_Trusted  ims47  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data    ${SCSCF_Trusted}  Trusted_Errors
    SCSCF_TrustedApp.Add Trusted Invalid Cases  ${AdministrationScenarios}

Filter Trusted
    [Documentation]     Filter SCSCF Trusted section testing with valid parameters
    [Tags]     SCSCF_Trusted  ims47  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data    ${SCSCF_Trusted}  Trusted
    SCSCF_TrustedApp.Filter Trusted  ${AdministrationScenarios}

Delete Trusted
    [Documentation]     Delete SCSCF Trusted section testing with valid parameters
    [Tags]     SCSCF_Trusted  ims47  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data    ${SCSCF_Trusted}  Trusted
    SCSCF_TrustedApp.Delete Trusted  ${AdministrationScenarios}

Add Not Trusted
    [Documentation]     Add SCSCF Not Trusted section testing with valid parameters
    [Tags]     SCSCF_NotTrusted  ims47  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data    ${SCSCF_Trusted}  NotTrusted
    SCSCF_TrustedApp.Add Not Trusted  ${AdministrationScenarios}

Add Invalid Not Trusted
    [Documentation]     Add SCSCF Not Trusted section testing with invalid parameters
    [Tags]     SCSCF_NotTrusted  ims47  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${SCSCF_Trusted}  NotTrusted_Errors
    SCSCF_TrustedApp.Add Not Trusted Invalid Cases  ${AdministrationScenarios}

Filter Not Trusted
    [Documentation]     Filter SCSCF Not Trusted section testing with valid parameters
    [Tags]     SCSCF_NotTrusted  ims47  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${SCSCF_Trusted}  NotTrusted
    SCSCF_TrustedApp.Filter Not Trusted  ${AdministrationScenarios}

Delete Not Trusted
    [Documentation]     Delete SCSCF Not Trusted section testing with valid parameters
    [Tags]     SCSCF_NotTrusted  ims47  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${SCSCF_Trusted}  NotTrusted
    SCSCF_TrustedApp.Delete Not Trusted  ${AdministrationScenarios}