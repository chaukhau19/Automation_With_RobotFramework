*** Settings ***
Documentation  This is all tests of PCSCF_Bypass
Resource  ../../Resources/DataManager.robot
Resource  ../../Data/InputData.robot
Resource  ../../Resources/Common.robot
Resource  ../../Resources/PCSCF/PCSCF_BypassApp.robot

Test Setup      Common.Begin Web Test
Test Teardown   Common.End Web Test

*** Tasks ***
		
Add Bypass
    [Documentation]     This is the basic adding proper Bypass for PEER PCSCF
    [Tags]  Smoke  PCSCF_Bypass  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Bypass}   PCSCF_Bypass
    PCSCF_BypassApp.Add Bypass   ${AdministrationScenarios}
	
Sort Bypass
    [Documentation]     Sort proper Bypass for PCSCF
    [Tags]  PCSCF_Bypass  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Bypass}  PCSCF_Bypass
    PCSCF_BypassApp.Sort Bypass   ${AdministrationScenarios}
		
View Bypass
    [Documentation]     View proper Bypass for PCSCF
    [Tags]  PCSCF_Bypass  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Bypass}  PCSCF_Bypass_Edit
    PCSCF_BypassApp.View Bypass   ${AdministrationScenarios}
		
Filter Bypass
    [Documentation]     Filter proper Bypass for PCSCF
    [Tags]  PCSCF_Bypass  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Bypass}  PCSCF_Bypass_Edit
    PCSCF_BypassApp.Filter Bypass   ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Bypass}  Bypass_Filter_Spechar
    PCSCF_BypassApp.Filter Special Character Bypass   ${AdministrationScenarios}
		
Edit Bypass
    [Documentation]     This is the basic editing proper Bypass for PEER PCSCF
    [Tags]  Smoke  PCSCF_Bypass  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Bypass}   PCSCF_Bypass_Edit
    PCSCF_BypassApp.Edit Bypass   ${AdministrationScenarios}
		
Delete Bypass
    [Documentation]     This is the basic deleting proper Bypass for PEER PCSCF
    [Tags]  Smoke  PCSCF_Bypass  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Bypass}   PCSCF_Bypass_Delete
    PCSCF_BypassApp.Delete Bypass   ${AdministrationScenarios}