*** Settings ***
Documentation  This is all tests of IBCF_TPIP
Resource  ../../Resources/DataManager.robot
Resource  ../../Data/InputData.robot
Resource  ../../Resources/Common.robot
Resource  ../../Resources/IBCF/IBCF_TpipApp.robot

Test Setup      Common.Begin Web Test
Test Teardown   Common.End Web Test

*** Tasks ***
		
Add TPIP
    [Documentation]     Adding proper TPIP of IBCF
    [Tags]  Smoke  IBCF_TPIP  sbc77  21918
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${IBCF_TPIP}  TPIP
    IBCF_TpipApp.Add  ${AdministrationScenarios}
		
Add Invalid TPIP
    [Documentation]     Adding invalid TPIP of IBCF
    [Tags]  IBCF_TPIP  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${IBCF_TPIP}  TPIP_Errors
    IBCF_TpipApp.Add Invalid  ${AdministrationScenarios}
		
View TPIP
    [Documentation]     Viewing TPIP of IBCF
    [Tags]  IBCF_TPIP  sbc77  21918  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${IBCF_TPIP}  TPIP_View
    IBCF_TpipApp.View  ${AdministrationScenarios}
		
Filter TPIP
    [Documentation]     Filtering TPIP of IBCF
    [Tags]  IBCF_TPIP  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${IBCF_TPIP}  TPIP_Edit
    IBCF_TpipApp.Filter  ${AdministrationScenarios}
	
Sort TPIP
    [Documentation]     Sorting TPIP of IBCF
    [Tags]  IBCF_TPIP  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${IBCF_TPIP}  TPIP
    IBCF_TpipApp.Sort  ${AdministrationScenarios}
		
Edit TPIP
    [Documentation]     Editing proper TPIP of IBCF
    [Tags]  Smoke  IBCF_TPIP  sbc77
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${IBCF_TPIP}  TPIP_Edit
    IBCF_TpipApp.Edit  ${AdministrationScenarios}