*** Settings ***
Documentation  This is all tests of IBCF_TLS
Resource  ../../Resources/DataManager.robot
Resource  ../../Data/InputData.robot
Resource  ../../Resources/Common.robot
Resource  ../../Resources/IBCF/IBCF_TlsApp.robot

#Test Setup      Common.Begin Web Test
Test Teardown   Common.End Web Test

*** Tasks ***

Add TLS
    [Documentation]    Verify the functionality of 'Add SRTP' on the IBCF page
    [Tags]   IBCF     IBCF_TLS   
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_TLS}  Add
    IBCF_TlsApp.Add TLSIBCF  ${AdministrationScenarios}

Sort TLS
    [Documentation]    Verify the functionality of 'Sort SRTP' on the IBCF page
    [Tags]   IBCF    IBCF_TLS    
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_TLS}  Sort
    IBCF_TlsApp.Sort TLSIBCF   ${AdministrationScenarios}

View TLS
    [Documentation]    Verify the functionality of 'View SRTP' on the IBCF page
    [Tags]   IBCF    IBCF_TLS 
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_TLS}  View
    IBCF_TlsApp.View TLSIBCF   ${AdministrationScenarios}

Filter TLS
    [Documentation]    Verify the functionality of 'Filter SRTP' on the IBCF page
    [Tags]   IBCF    IBCF_TLS 
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_TLS}  Filter
    IBCF_TlsApp.Filter TLSIBCF   ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_TLS}  TLS_Filter_Spechar
    IBCF_TlsApp.Filter Special Character TLSIBCF   ${AdministrationScenarios}

Edit TLS
    [Documentation]    Verify the functionality of 'Edit SRTP' on the IBCF page
    [Tags]   IBCF    IBCF_TLS 
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_TLS}  TLS_Edit
    IBCF_TlsApp.Edit TLSIBCF  ${AdministrationScenarios}

Delete TLS
    [Documentation]    Verify the functionality of 'Delete SRTP' on the IBCF page
    [Tags]   IBCF    IBCF_TLS 
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_TLS}  TLS_Delete
    IBCF_TlsApp.Delete TLSIBCF  ${AdministrationScenarios}