*** Settings ***
Documentation  This is all tests of IBCF Alerting
Resource  ../../Resources/DataManager.robot
Resource  ../../Data/InputData.robot
Resource  ../../Resources/Common.robot
Resource  ../../Resources/IBCF/IBCF_AlertingApp.robot

Test Setup      Common.Begin Web Test
Test Teardown   Common.End Web Test

*** Tasks ***


Add Alerting
    [Documentation]     Add added proper Alerting of IBCF
    [Tags]    Smoke  IBCF_Alerting  sbc77
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Alerting}  Alerting
    IBCF_AlertingApp.Add AlertingIBCF  ${AdministrationScenarios}	
	
Sort Alerting
    [Documentation]     Sort proper Alerting for IBCF
    [Tags]   IBCF_Alerting  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Alerting}  Alerting
    IBCF_AlertingApp.Sort AlertingIBCF   ${AdministrationScenarios}
	
View Alerting
    [Documentation]     View proper Alerting for IBCF
    [Tags]  IBCF_Alerting  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Alerting}  Alerting
    IBCF_AlertingApp.View AlertingIBCF   ${AdministrationScenarios}
		
Filter Alerting
    [Documentation]     Filter proper Alerting for IBCF
    [Tags]  IBCF_Alerting  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Alerting}  Alerting
    IBCF_AlertingApp.Filter AlertingIBCF   ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Alerting}  Alerting_Filter_Spechar
    IBCF_AlertingApp.Filter Special Character AlertingIBCF   ${AdministrationScenarios}
		
Edit Alerting
    [Documentation]     Edit proper Alerting of IBCF
    [Tags]    Smoke  IBCF_Alerting  sbc77
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Alerting}  Alerting
    IBCF_AlertingApp.Edit AlertingIBCF  ${AdministrationScenarios}
			
Delete Alerting
    [Documentation]     Delete proper Alerting of IBCF
    [Tags]    Smoke  IBCF_Alerting  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Alerting}  Alerting_Delete
    IBCF_AlertingApp.Delete AlertingIBCF  ${AdministrationScenarios}
