*** Settings ***
Documentation  This is all tests of IBCF_SRTP
Resource  ../../Resources/DataManager.robot
Resource  ../../Data/InputData.robot
Resource  ../../Resources/Common.robot
Resource  ../../Resources/IBCF/IBCF_SrtpApp.robot

Test Setup      Common.Begin Web Test
Test Teardown   Common.End Web Test

*** Tasks ***
Add SRTP
    [Documentation]     Add added proper SRTP of IBCF
    [Tags]    IBCF_SRTP  sbc77
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_SRTP}  SRTP
    IBCF_SrtpApp.Add SRTPIBCF  ${AdministrationScenarios}

Sort SRTP
    [Documentation]     Sort proper SRTP for IBCF
    [Tags]   IBCF_SRTP  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_SRTP}  SRTP
    IBCF_SrtpApp.Sort SRTPIBCF   ${AdministrationScenarios}

View SRTP
    [Documentation]     View proper SRTP for IBCF
    [Tags]  IBCF_SRTP  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_SRTP}  SRTP_Edit
    IBCF_SrtpApp.View SRTPIBCF   ${AdministrationScenarios}

Filter SRTP
    [Documentation]     Filter proper SRTP for IBCF
    [Tags]  IBCF_SRTP  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_SRTP}  SRTP_Edit
    IBCF_SRTPApp.Filter SRTPIBCF   ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_SRTP}  SRTP_Filter_Spechar
    IBCF_SrtpApp.Filter Special Character SRTPIBCF   ${AdministrationScenarios}

Edit SRTP
    [Documentation]     Edit proper SRTP of IBCF
    [Tags]    IBCF_SRTP  sbc77
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_SRTP}  SRTP_Edit
    IBCF_SRTPApp.Edit SRTPIBCF  ${AdministrationScenarios}
	
Delete SRTP
    [Documentation]     Delete proper SRTP of IBCF
    [Tags]    IBCF_SRTP  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_SRTP}  SRTP_Delete
    IBCF_SrtpApp.Delete SRTPIBCF  ${AdministrationScenarios}
