*** Settings ***
Documentation  This is all tests of PCSCF_TLS
Resource  ../../Resources/DataManager.robot
Resource  ../../Data/InputData.robot
Resource  ../../Resources/Common.robot
Resource  ../../Resources/PCSCF/PCSCF_TlsApp.robot

Test Setup      Common.Begin Web Test
Test Teardown   Common.End Web Test

*** Tasks ***
		
Add TLS
    [Documentation]     Add added proper TLS of PCSCF
    [Tags]    PCSCF_TLS  sbc77  IMP_18199  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_TLS}  TLS
    PCSCF_TlsApp.Add TLSPCSCF  ${AdministrationScenarios}
	
Sort TLS
    [Documentation]     Sort proper TLS for PCSCF
    [Tags]  PCSCF_TLS  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_TLS}  TLS
    PCSCF_TlsApp.Sort TLSPCSCF   ${AdministrationScenarios}
	
View TLS
    [Documentation]     View proper TLS for PCSCF
    [Tags]  PCSCF_TLS  sbc77  IMP_18199  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_TLS}  TLS
    PCSCF_TlsApp.View TLSPCSCF   ${AdministrationScenarios}
			
Filter TLS
    [Documentation]     Filter proper TLS for PCSCF
    [Tags]  PCSCF_TLS  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_TLS}  TLS_Edit
    PCSCF_TlsApp.Filter TLSPCSCF   ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_TLS}  TLS_Filter_Spechar
    PCSCF_TlsApp.Filter Special Character TLSPCSCF   ${AdministrationScenarios}
		
Edit TLS
    [Documentation]     Edit proper TLS of PCSCF
    [Tags]    PCSCF_TLS  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_TLS}  TLS_Edit
    PCSCF_TlsApp.Edit TLSPCSCF  ${AdministrationScenarios}
	
Delete TLS
    [Documentation]     Delete proper TLS of PCSCF
    [Tags]    PCSCF_TLS  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_TLS}  TLS_Delete
    PCSCF_TlsApp.Delete TLSPCSCF  ${AdministrationScenarios}
