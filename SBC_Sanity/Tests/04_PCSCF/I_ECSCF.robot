*** Settings ***
Documentation  This is all tests of ICSCF of PCSCF
Resource  ../../Resources/DataManager.robot
Resource  ../../Data/InputData.robot
Resource  ../../Resources/Common.robot
Resource  ../../Resources/PCSCF/PCSCF_I_ECSCFApp.robot

Test Setup      Common.Begin Web Test
Test Teardown   Common.End Web Test

*** Tasks ***

### ICSCF ####
		
Add ICSCF
    [Documentation]     This is the basic adding proper ICSCF for  PCSCF
    [Tags]  Smoke  PCSCF_ICSCF  sbc77
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_I_ECSCF}		PCSCF_ICSCF
    PCSCF_I_ECSCFApp.Add ICSCF   ${AdministrationScenarios}
	
Sort ICSCF
    [Documentation]     Sort proper ICSCF for PCSCF
    [Tags]  PCSCF_ICSCF  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_I_ECSCF}  PCSCF_ICSCF
    PCSCF_I_ECSCFApp.Sort ICSCF   ${AdministrationScenarios}
		
View ICSCF
    [Documentation]     View proper ICSCF for PCSCF
    [Tags]  PCSCF_ICSCF  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_I_ECSCF}  PCSCF_ICSCF_Edit
    PCSCF_I_ECSCFApp.View ICSCF   ${AdministrationScenarios}
		
Filter ICSCF
    [Documentation]     Filter proper ICSCF for PCSCF
    [Tags]  PCSCF_ICSCF  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_I_ECSCF}  PCSCF_ICSCF_Edit
    PCSCF_I_ECSCFApp.Filter ICSCF   ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_I_ECSCF}  Filter_Spechar
    PCSCF_I_ECSCFApp.Filter Special Character ICSCF   ${AdministrationScenarios}
		
Edit ICSCF
    [Documentation]     This is the basic editing proper ICSCF for  PCSCF
    [Tags]  Smoke  PCSCF_ICSCF  sbc77
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_I_ECSCF}		PCSCF_ICSCF_Edit
    PCSCF_I_ECSCFApp.Edit ICSCF   ${AdministrationScenarios}
	 	 
Delete ICSCF
    [Documentation]     This is the basic deleting proper ICSCF for  PCSCF
    [Tags]  Smoke  PCSCF_ICSCF  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_I_ECSCF}		PCSCF_ICSCF_Delete
     PCSCF_I_ECSCFApp.Delete ICSCF   ${AdministrationScenarios}

### ECSCF ####
		
Add ECSCF
    [Documentation]     This is the basic adding proper ECSCF for  PCSCF
    [Tags]  Smoke  PCSCF_ECSCF  sbc77
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_I_ECSCF}		PCSCF_ECSCF
    PCSCF_I_ECSCFApp.Add ECSCF   ${AdministrationScenarios}
	
Sort ECSCF
    [Documentation]     Sort proper ECSCF for PCSCF
    [Tags]  PCSCF_ECSCF  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_I_ECSCF}  PCSCF_ECSCF
    PCSCF_I_ECSCFApp.Sort ECSCF   ${AdministrationScenarios}
		
View ECSCF
    [Documentation]     View proper ECSCF for PCSCF
    [Tags]  PCSCF_ECSCF  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_I_ECSCF}  PCSCF_ECSCF_Edit
    PCSCF_I_ECSCFApp.View ECSCF   ${AdministrationScenarios}
		
Filter ECSCF
    [Documentation]     Filter proper ECSCF for PCSCF
    [Tags]  PCSCF_ECSCF  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_I_ECSCF}  PCSCF_ECSCF_Edit
    PCSCF_I_ECSCFApp.Filter ECSCF   ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_I_ECSCF}  Filter_Spechar
    PCSCF_I_ECSCFApp.Filter Special Character ECSCF   ${AdministrationScenarios}
		
Edit ECSCF
    [Documentation]     This is the basic editing proper ECSCF for  PCSCF
    [Tags]  Smoke  PCSCF_ECSCF  sbc77
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_I_ECSCF}		PCSCF_ECSCF_Edit
    PCSCF_I_ECSCFApp.Edit ECSCF   ${AdministrationScenarios}
	 	 
Delete ECSCF
    [Documentation]     This is the basic deleting proper ECSCF for  PCSCF
    [Tags]  Smoke  PCSCF_ECSCF  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_I_ECSCF}		PCSCF_ICSCF_Delete
     PCSCF_I_ECSCFApp.Delete ECSCF   ${AdministrationScenarios}