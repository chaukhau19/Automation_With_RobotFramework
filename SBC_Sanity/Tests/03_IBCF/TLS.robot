*** Settings ***
Documentation  This is all tests of IBCF_TLS
Resource  ../../Resources/DataManager.robot
Resource  ../../Data/InputData.robot
Resource  ../../Resources/Common.robot
Resource  ../../Resources/IBCF/IBCF_TlsApp.robot

Test Setup      Common.Begin Web Test
Test Teardown   Common.End Web Test

*** Tasks ***
		
Add TLS
    [Documentation]     Add added proper TLS of IBCF
    [Tags]    IBCF_TLS  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_TLS}  TLS
    IBCF_TlsApp.Add TLSIBCF  ${AdministrationScenarios}
	
Sort TLS
    [Documentation]     Sort proper TLS for IBCF
    [Tags]   IBCF_TLS  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_TLS}  TLS
    IBCF_TlsApp.Sort TLSIBCF   ${AdministrationScenarios}
		
View TLS
    [Documentation]     View proper TLS for IBCF
    [Tags]  IBCF_TLS  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_TLS}  TLS_Edit
    IBCF_TlsApp.View TLSIBCF   ${AdministrationScenarios}
		
Filter TLS
    [Documentation]     Filter proper TLS for IBCF
    [Tags]  IBCF_TLS  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_TLS}  TLS_Edit
    IBCF_TlsApp.Filter TLSIBCF   ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_TLS}  TLS_Filter_Spechar
    IBCF_TlsApp.Filter Special Character TLSIBCF   ${AdministrationScenarios}
		
Edit TLS
    [Documentation]     Edit proper TLS of IBCF
    [Tags]    IBCF_TLS  sbc77
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_TLS}  TLS_Edit
    IBCF_TlsApp.Edit TLSIBCF  ${AdministrationScenarios}
	
Delete TLS
    [Documentation]     Delete proper TLS of IBCF
    [Tags]    IBCF_TLS  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_TLS}  TLS_Delete
    IBCF_TlsApp.Delete TLSIBCF  ${AdministrationScenarios}