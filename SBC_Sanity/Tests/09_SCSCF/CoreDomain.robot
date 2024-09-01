*** Settings ***
Documentation  This is all tests of Core Domain of SCSCF
Resource  ../../Resources/DataManager.robot
Resource  ../../Data/InputData.robot
Resource  ../../Resources/Common.robot
Resource  ../../Resources/SCSCF/SCSCF_CoreDomainApp.robot

Test Setup      Common.Begin Web Test
Test Teardown   Common.End Web Test

*** Tasks ***

Add CoreDomain
    [Documentation]     Add SCSCF Core Domain section testing with valid parameters
    [Tags]     SCSCF_Core Domain  ims47
    ${AdministrationScenarios} =  DataManager.Get Excel Data    ${SCSCF_CoreDomain}  CoreDomain
    SCSCF_CoreDomainApp.Add CoreDomain  ${AdministrationScenarios}

Add Invalid CoreDomain
    [Documentation]     Add SCSCF CoreDomain section testing with invalid parameters
    [Tags]     SCSCF_CoreDomain  ims47  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data    ${SCSCF_CoreDomain}  CoreDomain_Errors
    SCSCF_CoreDomainApp.Add CoreDomain Invalid Cases  ${AdministrationScenarios}

Filter CoreDomain
    [Documentation]     Filter SCSCF CoreDomain section testing with valid parameters
    [Tags]     SCSCF_CoreDomain  ims47  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data    ${SCSCF_CoreDomain}  CoreDomain
    SCSCF_CoreDomainApp.Filter CoreDomain  ${AdministrationScenarios}

Delete CoreDomain
    [Documentation]     Delete SCSCF CoreDomain section testing with valid parameters
    [Tags]     SCSCF_CoreDomain  ims47  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data    ${SCSCF_CoreDomain}  CoreDomain
    SCSCF_CoreDomainApp.Delete CoreDomain  ${AdministrationScenarios}