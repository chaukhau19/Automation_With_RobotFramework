*** Settings ***
Documentation  This is all tests of IBCF_MediaProfile
Resource  ../../Resources/DataManager.robot
Resource  ../../Data/InputData.robot
Resource  ../../Resources/Common.robot
Resource  ../../Resources/IBCF/IBCF_MediaProfileApp.robot

Test Setup      Common.Begin Web Test
Test Teardown   Common.End Web Test

*** Tasks ***
		
Add Media Profile
    [Documentation]     This is the basic adding proper media profile for PEER IBCF
    [Tags]  Smoke  IBCF_MP  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_MP}   IBCF_MP
    IBCF_MediaProfileApp.Add Media Profile   ${AdministrationScenarios}
	
Sort Media Profile
    [Documentation]     Sort proper Media Profile for IBCF
    [Tags]   IBCF_MP  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_MP}  IBCF_MP
    IBCF_MediaProfileApp.Sort Media Profile   ${AdministrationScenarios}
		
View Media Profile
    [Documentation]     View proper Media Profile for IBCF
    [Tags]  IBCF_MP  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_MP}  IBCF_MP_Edit
    IBCF_MediaProfileApp.View Media Profile   ${AdministrationScenarios}
	
Filter Media Profile
    [Documentation]     Filter proper Media Profile for IBCF
    [Tags]  IBCF_MP  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_MP}  IBCF_MP_Edit
    IBCF_MediaProfileApp.Filter Media Profile   ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_MP}  MP_Filter_Spechar
    IBCF_MediaProfileApp.Filter Special Character Media Profile   ${AdministrationScenarios}
			
Edit Media Profile
    [Documentation]     This is the basic editing proper media profile for PEER IBCF
    [Tags]  Smoke  IBCF_MP  sbc77
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_MP}   IBCF_MP_Edit
    IBCF_MediaProfileApp.Edit Media Profile   ${AdministrationScenarios}
		
Delete Media Profile
    [Documentation]     This is the basic deleting proper media profile for PEER IBCF
    [Tags]  Smoke  IBCF_MP  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_MP}   IBCF_MP_Delete
    IBCF_MediaProfileApp.Delete Media Profile   ${AdministrationScenarios}