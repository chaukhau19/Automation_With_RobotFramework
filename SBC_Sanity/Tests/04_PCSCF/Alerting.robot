*** Settings ***
Documentation  This is all tests of PCSCF Alerting
Resource  ../../Resources/DataManager.robot
Resource  ../../Data/InputData.robot
Resource  ../../Resources/Common.robot
Resource  ../../Resources/PCSCF/PCSCF_AlertingApp.robot

Test Setup      Common.Begin Web Test
Test Teardown   Common.End Web Test

*** Tasks ***
		
Add Alerting
    [Documentation]     Add added proper Alerting of PCSCF
    [Tags]    Smoke  PCSCF_Alerting  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Alerting}  Alerting
    PCSCF_AlertingApp.Add AlertingPCSCF  ${AdministrationScenarios}
	
Sort Alerting
    [Documentation]     Sort proper Alerting for PCSCF
    [Tags]  PCSCF_Alerting  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Alerting}  Alerting
    PCSCF_AlertingApp.Sort AlertingPCSCF   ${AdministrationScenarios}
		
View Alerting
    [Documentation]     View proper Alerting for PCSCF
    [Tags]  PCSCF_Alerting  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Alerting}  Alerting
    PCSCF_AlertingApp.View AlertingPCSCF   ${AdministrationScenarios}
		
Filter Alerting
    [Documentation]     Filter proper Alerting for PCSCF
    [Tags]  PCSCF_Alerting  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Alerting}  Alerting
    PCSCF_AlertingApp.Filter AlertingPCSCF   ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Alerting}  Alerting_Filter_Spechar
    PCSCF_AlertingApp.Filter Special Character AlertingPCSCF   ${AdministrationScenarios}
		
Edit Alerting
    [Documentation]     Edit proper Alerting of PCSCF
    [Tags]    Smoke  PCSCF_Alerting  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Alerting}  Alerting
    PCSCF_AlertingApp.Edit AlertingPCSCF  ${AdministrationScenarios}
	
Delete Alerting
    [Documentation]     Delete proper Alerting of PCSCF
    [Tags]    Smoke  PCSCF_Alerting  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Alerting}  Alerting_Delete
    PCSCF_AlertingApp.Delete AlertingPCSCF  ${AdministrationScenarios}