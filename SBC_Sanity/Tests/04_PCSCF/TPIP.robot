*** Settings ***
Documentation  This is all tests of PCSCF_TPIP
Resource  ../../Resources/DataManager.robot
Resource  ../../Data/InputData.robot
Resource  ../../Resources/Common.robot
Resource  ../../Resources/PCSCF/PCSCF_TpipApp.robot

Test Setup      Common.Begin Web Test
Test Teardown   Common.End Web Test

*** Tasks ***
	
Add TPIP
    [Documentation]     This is the basic adding proper TPIP of PCSCF
    [Tags]  Smoke  PCSCF_TPIP  sbc77  21918
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_TPIP}  TPIP6.6
    PCSCF_TpipApp.Add  ${AdministrationScenarios}
	
Add Invalid Protected TPIP
    [Documentation]     Add Invalid TPIP to PCSCF
    [Tags]  PCSCF_TPIP  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_TPIP}  TPIP6.6_Invalid
    PCSCF_TpipApp.Add Invalid Protected  ${AdministrationScenarios}
		
View TPIP
    [Documentation]     Viewing TPIP of PCSCF
    [Tags]  PCSCF_TPIP  sbc77  21918  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${PCSCF_TPIP}  TPIP_Edit
    PCSCF_TpipApp.View  ${AdministrationScenarios}
		
Filter TPIP
    [Documentation]     Filtering TPIP of PCSCF
    [Tags]  PCSCF_TPIP  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${PCSCF_TPIP}  TPIP_Edit
    PCSCF_TpipApp.Filter  ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${PCSCF_TPIP}  TPIP_Filter_Spechar
    PCSCF_TpipApp.Filter Special Character TPIP  ${AdministrationScenarios}
	
Sort TPIP
    [Documentation]     Sorting TPIP of PCSCF
    [Tags]  PCSCF_TPIP  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${PCSCF_TPIP}  TPIP
    PCSCF_TpipApp.Sort  ${AdministrationScenarios}
Edit TPIP section 66		
Edit TPIP
    [Documentation]     This is the basic editing proper TPIP of PCSCF
    [Tags]  Smoke  PCSCF_TPIP  sbc77
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_TPIP}  TPIP_Edit
    PCSCF_TpipApp.Edit  ${AdministrationScenarios}