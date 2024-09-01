*** Settings ***
Documentation  This is all tests of PBXAS of SCSCF
Resource  ../../Resources/DataManager.robot
Resource  ../../Data/InputData.robot
Resource  ../../Resources/Common.robot
Resource  ../../Resources/SCSCF/SCSCF_PBXASApp.robot

Test Setup      Common.Begin Web Test
Test Teardown   Common.End Web Test

*** Tasks ***

Add PBXAS
    [Documentation]     Add SCSCF PBXAS section testing with valid parameters
    [Tags]     SCSCF_PBXAS  ims47
    ${AdministrationScenarios} =  DataManager.Get Excel Data    ${SCSCF_PBXAS}  PBXAS
    SCSCF_PBXASApp.Add PBXAS  ${AdministrationScenarios}

Add Invalid PBXAS
    [Documentation]     Add SCSCF PBXAS section testing with invalid parameters
    [Tags]     SCSCF_PBXAS  ims47  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data    ${SCSCF_PBXAS}  PBXAS_Errors
    SCSCF_PBXASApp.Add PBXAS Invalid Cases  ${AdministrationScenarios}

Filter PBXAS
    [Documentation]     Filter SCSCF PBXAS section testing with valid parameters
    [Tags]     SCSCF_PBXAS  ims47  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data    ${SCSCF_PBXAS}  PBXAS
    SCSCF_PBXASApp.Filter PBXAS  ${AdministrationScenarios}

Delete PBXAS
    [Documentation]     Delete SCSCF PBXAS section testing with valid parameters
    [Tags]     SCSCF_PBXAS  ims47  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data    ${SCSCF_PBXAS}  PBXAS
    SCSCF_PBXASApp.Delete PBXAS  ${AdministrationScenarios}
	