*** Settings ***
Documentation  This is all tests of IBCF_SRTP
Resource  ../../Resources/DataManager.robot
Resource  ../../Data/InputData.robot
Resource  ../../Resources/Common.robot
Resource  ../../Resources/IBCF/IBCF_SrtpApp.robot

#Test Setup      Common.Begin Web Test
Test Teardown   Common.End Web Test

*** Tasks ***

Add SRTP
    [Documentation]    Verify the functionality of 'Add SRTP' on the IBCF page
    [Tags]   IBCF  IBCF_SRTP  
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_SRTP}  Add
    IBCF_SrtpApp.Add SRTPIBCF  ${AdministrationScenarios}

Sort SRTP
    [Documentation]    Verify the functionality of 'Sort SRTP' on the IBCF page
    [Tags]   IBCF  IBCF_SRTP     
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_SRTP}  Sort
    IBCF_SrtpApp.Sort SRTPIBCF   ${AdministrationScenarios}

View SRTP
    [Documentation]    Verify the functionality of 'Sort SRTP' on the IBCF page
    [Tags]   IBCF  IBCF_SRTP   
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_SRTP}  View
    IBCF_SrtpApp.View SRTPIBCF   ${AdministrationScenarios}

Filter SRTP
    [Documentation]    Verify the functionality of 'Filter SRTP' on the IBCF page
    [Tags]   IBCF  IBCF_SRTP   
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_SRTP}  Filter
    IBCF_SRTPApp.Filter SRTPIBCF   ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_SRTP}  SRTP_Filter_Spechar
    IBCF_SrtpApp.Filter Special Character SRTPIBCF   ${AdministrationScenarios}

Edit SRTP
    [Documentation]    Verify the functionality of 'Edit SRTP' on the IBCF page
    [Tags]   IBCF  IBCF_SRTP  
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_SRTP}  SRTP_Edit
    IBCF_SRTPApp.Edit SRTPIBCF  ${AdministrationScenarios}

Delete SRTP
    [Documentation]    Verify the functionality of 'Delete SRTP' on the IBCF page
    [Tags]   IBCF  IBCF_SRTP    
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_SRTP}  SRTP_Delete
    IBCF_SrtpApp.Delete SRTPIBCF  ${AdministrationScenarios}
