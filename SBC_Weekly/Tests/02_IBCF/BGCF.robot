*** Settings ***
Documentation  This is all tests of BGCF in IBCF
Resource  ../../Resources/DataManager.robot
Resource  ../../Data/InputData.robot
Resource  ../../Resources/Common.robot
Resource  ../../Resources/IBCF/IBCF_BGCFApp.robot

#Test Setup      Common.Begin Web Test
Test Teardown   Common.End Web Test

*** Tasks ***

Add BGCF
    [Documentation]    Verify the functionality of 'Add BGCF' on the IBCF page
    [Tags]   IBCF    IBCF_BGCF  
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${IBCF_BGCF}  Add_Valid
    IBCF_BGCFApp.Add  ${AdministrationScenarios}    

Add Invalid BGCF
    [Documentation]    Verify the functionality of 'Add Invalid BGCF' on the IBCF page
    [Tags]   IBCF    IBCF_BGCF  
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${IBCF_BGCF}  Add_Invalid
    IBCF_BGCFApp.Add Invalid   ${AdministrationScenarios}

View BGCF
    [Documentation]    Verify the functionality of 'View BGCF' on the IBCF page
    [Tags]  IBCF    IBCF_BGCF   
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${IBCF_BGCF}  View
    IBCF_BGCFApp.View  ${AdministrationScenarios}

Sort BGCF
    [Documentation]    Verify the functionality of 'Sort BGCF' on the IBCF page
    [Tags]  IBCF    IBCF_BGCF  
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${IBCF_BGCF}  Sort
    IBCF_BGCFApp.Sort  ${AdministrationScenarios}

Filter BGCF
    [Documentation]    Verify the functionality of 'Filter BGCF' on the IBCF page
    [Tags]  IBCF    IBCF_BGCF    
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${IBCF_BGCF}  Filter
    IBCF_BGCFApp.Filter  ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${IBCF_BGCF}  Filter_special
    IBCF_BGCFApp.Filter special characters  ${AdministrationScenarios}

Edit Invalid BGCF
    [Documentation]    Verify the functionality of 'Edit Invalid BGCF' on the IBCF page
    [Tags]   IBCF    IBCF_BGCF    
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${IBCF_BGCF}  Edit_Invalid
    IBCF_BGCFApp.Edit Invalid  ${AdministrationScenarios}

Edit BGCF
    [Documentation]    Verify the functionality of 'Edit BGCF' on the IBCF page
    [Tags]  IBCF  IBCF_BGCF   
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${IBCF_BGCF}  Edit
    IBCF_BGCFApp.Edit  ${AdministrationScenarios}

Delete BGCF
    [Documentation]    Verify the functionality of 'Delete BGCF' on the IBCF page
    [Tags]  IBCF  IBCF_BGCF    
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${IBCF_BGCF}  Delete
    IBCF_BGCFApp.Delete  ${AdministrationScenarios}

Retry Preference and Domain Origin 
    [Documentation]    Verify the functionality of 'RetryOnStar and ExtractDomain' on the IBCF page
    [Tags]   IBCF    IBCF_BGCF   
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${IBCF_BGCF}  Retry
    IBCF_BGCFApp.Retry_Domain  ${AdministrationScenarios}