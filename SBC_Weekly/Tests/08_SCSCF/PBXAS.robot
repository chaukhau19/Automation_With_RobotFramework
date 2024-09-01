*** Settings ***
Documentation  This is all tests of PBXAS of SCSCF
Resource  ../../Resources/DataManager.robot
Resource  ../../Data/InputData.robot
Resource  ../../Resources/Common.robot
Resource  ../../Resources/SCSCF/SCSCF_PBXASApp.robot

#Test Setup      Common.Begin Web Test
Test Teardown   Common.End Web Test

*** Tasks ***

Add PBXAS
    [Documentation]   Verify The Add function on the PBXAS page of SCSCF    [ims]
    [Tags]     SCSCF    SCSCF_PBXAS 
    ${AdministrationScenarios} =  DataManager.Get Excel Data    ${SCSCF_PBXAS}  PBXAS
    SCSCF_PBXASApp.Add PBXAS  ${AdministrationScenarios}

Add Invalid PBXAS
    [Documentation]   Verify The Add Invalid function on the PBXAS page of SCSCF    [ims]
    [Tags]     SCSCF    SCSCF_PBXAS   
    ${AdministrationScenarios} =  DataManager.Get Excel Data    ${SCSCF_PBXAS}  PBXAS_Errors
    SCSCF_PBXASApp.Add PBXAS Invalid Cases  ${AdministrationScenarios}

Filter PBXAS
    [Documentation]   Verify The Filter function on the PBXAS page of SCSCF    [ims]
    [Tags]     SCSCF    SCSCF_PBXAS   
    ${AdministrationScenarios} =  DataManager.Get Excel Data    ${SCSCF_PBXAS}  PBXAS_Filter
    SCSCF_PBXASApp.Filter PBXAS  ${AdministrationScenarios}

Delete PBXAS
    [Documentation]   Verify The Delete function on the PBXAS page of SCSCF    [ims]
    [Tags]     SCSCF    SCSCF_PBXAS 
    ${AdministrationScenarios} =  DataManager.Get Excel Data    ${SCSCF_PBXAS}  PBXAS_Delete
    SCSCF_PBXASApp.Delete PBXAS  ${AdministrationScenarios}
	