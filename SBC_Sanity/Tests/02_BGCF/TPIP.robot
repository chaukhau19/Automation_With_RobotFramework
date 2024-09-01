*** Settings ***
Documentation  All manipulation TPIP section
Resource  ../../Resources/DataManager.robot
Resource  ../../Data/InputData.robot
Resource  ../../Resources/Common.robot
Resource  ../../Resources/BGCF/BGCF_TpipApp.robot

Test Setup      Common.Begin Web Test
Test Teardown   Common.End Web Test

*** Tasks ***
	
Add TPIP
    [Documentation]     Add TPIP in BGCF section with valid parameters
    [Tags]  Smoke  BGCF_TPIP  sbc77  21918
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${BGCF_TPIP}  Add
    BGCF_TpipApp.Add Valid Cases  ${AdministrationScenarios}

Add invalid TPIP
    [Documentation]     Add TPIP in BGCF section with invalid parameters
    [Tags]   BGCF_TPIP  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${BGCF_TPIP}  Add_Errors
    BGCF_TpipApp.Add Invalid Cases  ${AdministrationScenarios}

Filter TPIP
    [Documentation]     Filter TPIP with IP, PORT, WEIGHT
    [Tags]  BGCF_TPIP  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${BGCF_TPIP}  Add
    BGCF_TpipApp.Filter Cases  ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${BGCF_TPIP}  Filter_Spechar
    BGCF_TpipApp.Filter Special Cases  ${AdministrationScenarios}

View TPIP
    [Documentation]     View TPIP in BGCF section
    [Tags]  BGCF_TPIP  sbc77  21918  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${BGCF_TPIP}  Add
    BGCF_TpipApp.View Cases  ${AdministrationScenarios}
	
Sort TPIP
    [Documentation]     Sort TPIP in BGCF section
    [Tags]  BGCF_TPIP  sbc77  not_critical  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${BGCF_TPIP}  Add
    BGCF_TpipApp.Sort Cases  ${AdministrationScenarios}