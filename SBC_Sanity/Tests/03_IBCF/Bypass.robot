*** Settings ***
Documentation  This is all tests of IBCF_Bypass
Resource  ../../Resources/DataManager.robot
Resource  ../../Data/InputData.robot
Resource  ../../Resources/Common.robot
Resource  ../../Resources/IBCF/IBCF_BypassApp.robot

Test Setup      Common.Begin Web Test
Test Teardown   Common.End Web Test

*** Tasks ***

Add Bypass section
    [Documentation]     This is the basic adding proper Bypass for PEER IBCF
    [Tags]  Smoke  IBCF_Bypass  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Bypass}   IBCF_Bypass
    IBCF_BypassApp.Add Bypass   ${AdministrationScenarios}

Sort Bypass section
    [Documentation]     Sort proper Bypass for IBCF
    [Tags]   IBCF_Bypass  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Bypass}  IBCF_Bypass
    IBCF_BypassApp.Sort Bypass   ${AdministrationScenarios}

View Bypass section
    [Documentation]     View proper Bypass for IBCF
    [Tags]  IBCF_Bypass  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Bypass}  IBCF_Bypass_Edit
    IBCF_BypassApp.View Bypass   ${AdministrationScenarios}

Filter Bypass section
    [Documentation]     Filter proper Bypass for IBCF
    [Tags]  IBCF_Bypass  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Bypass}  IBCF_Bypass_Edit
    IBCF_BypassApp.Filter Bypass   ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Bypass}  Bypass_Filter_Spechar
    IBCF_BypassApp.Filter Special Character Bypass   ${AdministrationScenarios}

Edit Bypass section
    [Documentation]     This is the basic editing proper Bypass for PEER IBCF
    [Tags]  Smoke  sbc77  IBCF_Bypass
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Bypass}   IBCF_Bypass_Edit
    IBCF_BypassApp.Edit Bypass   ${AdministrationScenarios}

Delete Bypass section
    [Documentation]     This is the basic deleting proper Bypass for PEER IBCF
    [Tags]  Smoke  IBCF_Bypass  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Bypass}   IBCF_Bypass_Delete
    IBCF_BypassApp.Delete Bypass   ${AdministrationScenarios}