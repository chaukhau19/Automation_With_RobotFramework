*** Settings ***
Documentation  All manipulation Incoming Proxy section
Resource  ../../Resources/BGCF/BGCF_IncomingProxyApp.robot
Resource  ../../Resources/DataManager.robot
Resource  ../../Data/InputData.robot
Resource  ../../Resources/Common.robot

Test Setup      Begin Web Test
Test Teardown   End Web Test


*** Tasks ***
	
Add Incoming Proxy
    [Documentation]     Add BGCF Incoming Proxy section testing with valid parameters
    [Tags]  Smoke  BGCF_Incoming Proxy  sbc77
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${BGCF_IncomingProxy}  Add
    BGCF_IncomingProxyApp.Add Valid  ${AdministrationScenarios}

Add Invalid Incoming Proxy
    [Documentation]     Add BGCF Incoming Proxy section testing with invalid parameters
    [Tags]   BGCF_Incoming Proxy  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${BGCF_IncomingProxy}  Add_Errors
    BGCF_IncomingProxyApp.Add Invalid  ${AdministrationScenarios}

Filter Incoming Proxy
    [Documentation]     Filter BGCF Incoming Proxy section testing
    [Tags]   BGCF_Incoming Proxy  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${BGCF_IncomingProxy}  Add
    BGCF_IncomingProxyApp.Filter IncomingProxy  ${AdministrationScenarios}

Delete Incoming Proxy
    [Documentation]     Delete BGCF Incoming Proxy section testing with valid and invalid parameters
    [Tags]  Smoke  BGCF_Incoming Proxy  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${BGCF_IncomingProxy}  Delete
    BGCF_IncomingProxyApp.Delete  ${AdministrationScenarios}