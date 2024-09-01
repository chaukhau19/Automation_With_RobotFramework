*** Settings ***
Documentation  This is all tests of PCSCF_SRTP
Resource  ../../Resources/DataManager.robot
Resource  ../../Data/InputData.robot
Resource  ../../Resources/Common.robot
Resource  ../../Resources/PCSCF/PCSCF_SrtpApp.robot

Test Setup      Common.Begin Web Test
Test Teardown   Common.End Web Test

*** Tasks ***
	
Add SRTP
    [Documentation]     Add added proper SRTP of PCSCF
    [Tags]    PCSCF_SRTP  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_SRTP}  SRTP
    PCSCF_SrtpApp.Add SRTPPCSCF  ${AdministrationScenarios}
		
Sort SRTP
    [Documentation]     Sort proper SRTP for PCSCF
    [Tags]  PCSCF_SRTP  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_SRTP}  SRTP
    PCSCF_SrtpApp.Sort SRTPPCSCF   ${AdministrationScenarios}
		
View SRTP
    [Documentation]     View proper SRTP for PCSCF
    [Tags]  PCSCF_SRTP  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_SRTP}  SRTP_Edit
    PCSCF_SrtpApp.View SRTPPCSCF   ${AdministrationScenarios}
		
Filter SRTP
    [Documentation]     Filter proper SRTP for PCSCF
    [Tags]  PCSCF_SRTP  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_SRTP}  SRTP_Edit
    PCSCF_SRTPApp.Filter SRTPPCSCF   ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_SRTP}  SRTP_Filter_Spechar
    PCSCF_SrtpApp.Filter Special Character SRTPPCSCF   ${AdministrationScenarios}
		
Edit SRTP
    [Documentation]     Edit proper SRTP of PCSCF
    [Tags]    PCSCF_SRTP  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_SRTP}  SRTP_Edit
    PCSCF_SRTPApp.Edit SRTPPCSCF  ${AdministrationScenarios}
		
Delete SRTP
    [Documentation]     Delete proper SRTP of PCSCF
    [Tags]    PCSCF_SRTP  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_SRTP}  SRTP_Delete
    PCSCF_SrtpApp.Delete SRTPPCSCF  ${AdministrationScenarios}
