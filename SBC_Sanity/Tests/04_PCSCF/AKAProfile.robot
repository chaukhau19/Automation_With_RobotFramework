*** Settings ***
Documentation  This is all tests of PCSCF_AKAProfile
Resource  ../../Resources/DataManager.robot
Resource  ../../Data/InputData.robot
Resource  ../../Resources/Common.robot
Resource  ../../Resources/PCSCF/PCSCF_AKAProfileApp.robot

Test Setup      Common.Begin Web Test
Test Teardown   Common.End Web Test

*** Tasks ***


	
###################################################################################

Add AKA Profile
    [Documentation]     Add proper AKA profile for  PCSCF
    [Tags]  Smoke  PCSCF_AKA  sbc77
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_AKA}		PCSCF_AKA
    PCSCF_AKAProfileApp.Add AKA Profile   ${AdministrationScenarios}

Add invalid AKA Profile
    [Documentation]     Add invalid AKA profile for  PCSCF
    [Tags]   PCSCF_AKA  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_AKA}		PCSCF_AKA_invalid
    PCSCF_AKAProfileApp.Add invalid AKA Profile   ${AdministrationScenarios}

Sort AKA Profile
    [Documentation]     Sort proper AKA Profile for PCSCF
    [Tags]   PCSCF_AKA  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_AKA}  PCSCF_AKA
    PCSCF_AKAProfileApp.Sort AKA Profile   ${AdministrationScenarios}

View AKA Profile
    [Documentation]     View proper AKA Profile for PCSCF
    [Tags]  PCSCF_AKA  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_AKA}  PCSCF_AKA_View
    PCSCF_AKAProfileApp.View AKA Profile   ${AdministrationScenarios}

Filter AKA Profile
    [Documentation]     Filter proper AKA Profile for PCSCF
    [Tags]  PCSCF_AKA  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_AKA}  PCSCF_AKA_Filter
    PCSCF_AKAProfileApp.Filter AKA Profile   ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_AKA}  Filter_Spechar
    PCSCF_AKAProfileApp.Filter Special Character AKA Profile   ${AdministrationScenarios}

Edit invalid AKA Profile
    [Documentation]     Edit invalid AKA profile for  PCSCF
    [Tags]  PCSCF_AKA  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_AKA}		PCSCF_AKA_Editinvalid
    PCSCF_AKAProfileApp.Edit invalid AKA Profile   ${AdministrationScenarios}


Edit AKA Profile
    [Documentation]     Edit proper AKA profile for  PCSCF
    [Tags]  Smoke  PCSCF_AKA  sbc77
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_AKA}		PCSCF_AKA_Edit
    PCSCF_AKAProfileApp.Edit AKA Profile   ${AdministrationScenarios}


Delete AKA Profile
    [Documentation]     Delete proper AKA profile for  PCSCF
    [Tags]  Smoke  PCSCF_AKA  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_AKA}		PCSCF_AKA_Delete
    PCSCF_AKAProfileApp.Delete AKA Profile   ${AdministrationScenarios}