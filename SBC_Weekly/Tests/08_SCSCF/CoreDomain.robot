*** Settings ***
Documentation  This is all tests of Core Domain of SCSCF
Resource  ../../Resources/DataManager.robot
Resource  ../../Data/InputData.robot
Resource  ../../Resources/Common.robot
Resource  ../../Resources/SCSCF/SCSCF_CoreDomainApp.robot

#Test Setup      Common.Begin Web Test
Test Teardown   Common.End Web Test

*** Tasks ***

Add CoreDomain
    [Documentation]   Verify The Add function on the CoreDomain page of SCSCF    [ims]
    [Tags]    SCSCF     SCSCF_CoreDomain  
    ${AdministrationScenarios} =  DataManager.Get Excel Data    ${SCSCF_CoreDomain}  CoreDomain
    SCSCF_CoreDomainApp.Add CoreDomain  ${AdministrationScenarios}

Add Invalid CoreDomain
    [Documentation]   Verify The Add Invalid function on the CoreDomain page of SCSCF    [ims]
    [Tags]    SCSCF     SCSCF_CoreDomain   
    ${AdministrationScenarios} =  DataManager.Get Excel Data    ${SCSCF_CoreDomain}  CoreDomain_Errors
    SCSCF_CoreDomainApp.Add CoreDomain Invalid Cases  ${AdministrationScenarios}

Filter CoreDomain
    [Documentation]   Verify The Filter function on the CoreDomain page of SCSCF    [ims]
    [Tags]    SCSCF     SCSCF_CoreDomain    
    ${AdministrationScenarios} =  DataManager.Get Excel Data    ${SCSCF_CoreDomain}  CoreDomain_Filter
    SCSCF_CoreDomainApp.Filter CoreDomain  ${AdministrationScenarios}

Delete CoreDomain
    [Documentation]   Verify The Delete function on the CoreDomain page of SCSCF    [ims]
    [Tags]    SCSCF     SCSCF_CoreDomain  
    ${AdministrationScenarios} =  DataManager.Get Excel Data    ${SCSCF_CoreDomain}  CoreDomain_Delete
    SCSCF_CoreDomainApp.Delete CoreDomain  ${AdministrationScenarios}