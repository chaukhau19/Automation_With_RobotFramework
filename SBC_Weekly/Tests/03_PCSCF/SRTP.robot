*** Settings ***
Documentation  This is all tests of PCSCF_SRTP
Resource  ../../Resources/DataManager.robot
Resource  ../../Data/InputData.robot
Resource  ../../Resources/Common.robot
Resource  ../../Resources/PCSCF/PCSCF_SrtpApp.robot

#Test Setup      Common.Begin Web Test
Test Teardown   Common.End Web Test

*** Tasks ***

Add SRTP
    [Documentation]    Verify the functionality of 'Add SRTP' on the PCSCF page
    [Tags]      PCSCF   PCSCF_SRTP  
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_SRTP}  SRTP
    PCSCF_SrtpApp.Add SRTPPCSCF  ${AdministrationScenarios}

Sort SRTP
    [Documentation]    Verify the functionality of 'Sort SRTP' on the PCSCF page
    [Tags]      PCSCF   PCSCF_SRTP    
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_SRTP}  Sort
    PCSCF_SrtpApp.Sort SRTPPCSCF   ${AdministrationScenarios}

View SRTP
    [Documentation]    Verify the functionality of 'View SRTP' on the PCSCF page
    [Tags]      PCSCF   PCSCF_SRTP     
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_SRTP}  View
    PCSCF_SrtpApp.View SRTPPCSCF   ${AdministrationScenarios}

Filter SRTP
    [Documentation]    Verify the functionality of 'Filter SRTP' on the PCSCF page
    [Tags]      PCSCF   PCSCF_SRTP 
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_SRTP}  Filter
    PCSCF_SRTPApp.Filter SRTPPCSCF   ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_SRTP}  SRTP_Filter_Spechar
    PCSCF_SrtpApp.Filter Special Character SRTPPCSCF   ${AdministrationScenarios}

Edit SRTP
    [Documentation]    Verify the functionality of 'Edit SRTP' on the PCSCF page
    [Tags]      PCSCF   PCSCF_SRTP  
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_SRTP}  SRTP_Edit
    PCSCF_SRTPApp.Edit SRTPPCSCF  ${AdministrationScenarios}

Delete SRTP
    [Documentation]    Verify the functionality of 'Delete SRTP' on the PCSCF page
    [Tags]      PCSCF   PCSCF_SRTP
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_SRTP}  SRTP_Delete
    PCSCF_SrtpApp.Delete SRTPPCSCF  ${AdministrationScenarios}
