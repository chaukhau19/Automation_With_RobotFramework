*** Settings ***
Documentation  This is all tests of PCSCF_Media Profile
Resource  ../../Resources/DataManager.robot
Resource  ../../Data/InputData.robot
Resource  ../../Resources/Common.robot
Resource  ../../Resources/PCSCF/PCSCF_MediaProfileApp.robot

Test Setup      Common.Begin Web Test
Test Teardown   Common.End Web Test

*** Tasks ***
	
Add Media Profile
    [Documentation]     Add proper media profile for  PCSCF
    [Tags]  Smoke  PCSCF_MP  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_MP}		PCSCF_MP
    PCSCF_MediaProfileApp.Add Media Profile   ${AdministrationScenarios}
		
Sort Media Profile
    [Documentation]     Sort proper Media Profile for PCSCF
    [Tags]  PCSCF_MP  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_MP}  PCSCF_MP
    PCSCF_MediaProfileApp.Sort Media Profile   ${AdministrationScenarios}
		
View Media Profile
    [Documentation]     View proper Media Profile for PCSCF
    [Tags]  PCSCF_MP  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_MP}  PCSCF_MP_Edit
    PCSCF_MediaProfileApp.View Media Profile   ${AdministrationScenarios}
	
Filter Media Profile
    [Documentation]     Filter proper Media Profile for PCSCF
    [Tags]  PCSCF_MP  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_MP}  PCSCF_MP_Edit
    PCSCF_MediaProfileApp.Filter Media Profile   ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_MP}  Filter_Spechar
    PCSCF_MediaProfileApp.Filter Special Character Media Profile   ${AdministrationScenarios}
			
Edit Media Profile
    [Documentation]     Edit proper media profile for  PCSCF
    [Tags]  Smoke  PCSCF_MP  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_MP}		PCSCF_MP_Edit
    PCSCF_MediaProfileApp.Edit Media Profile   ${AdministrationScenarios}
		
Delete Media Profile
    [Documentation]     Delete proper media profile for  PCSCF
    [Tags]  Smoke  PCSCF_MP  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_MP}		PCSCF_MP_Delete
    PCSCF_MediaProfileApp.Delete Media Profile   ${AdministrationScenarios}