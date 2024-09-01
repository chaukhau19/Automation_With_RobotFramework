*** Settings ***
Documentation  This is all tests of IBCF Pnum
Resource  ../../Resources/DataManager.robot
Resource  ../../Data/InputData.robot
Resource  ../../Resources/Common.robot
Resource  ../../Resources/IBCF/IBCF_PnumApp.robot

Test Setup      Common.Begin Web Test
Test Teardown   Common.End Web Test

*** Tasks ***

#User to Net

	
Add UserToNet
    [Documentation]     Add added proper UserToNet of IBCF
    [Tags]  Smoke  IBCF_UserToNet  sbc77
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Pnum}  UserToNet_Add
    IBCF_PnumApp.Add UserToNetIBCF  ${AdministrationScenarios}
	
Sort UserToNet
    [Documentation]     Sort proper UserToNet for IBCF
    [Tags]  IBCF_UserToNet  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Pnum}  UserToNet_Add
    IBCF_PnumApp.Sort UserToNetIBCF   ${AdministrationScenarios}

	
View UserToNet
    [Documentation]     View proper UserToNet for IBCF
    [Tags]  IBCF_UserToNet  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Pnum}   UserToNet_Edit
    IBCF_PnumApp.View UserToNetIBCF  ${AdministrationScenarios}

	
Filter UserToNet
    [Documentation]     Filter proper UserToNet for IBCF
    [Tags]  IBCF_UserToNet  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Pnum}  UserToNet_Filter
    IBCF_PnumApp.Filter UserToNetIBCF   ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Pnum}  UserToNet_Filter_Spechar
    IBCF_PnumApp.Filter Special Character UserToNetIBCF   ${AdministrationScenarios}
	
Edit UserToNet
    [Documentation]     Edit proper UserToNet of IBCF
    [Tags]    Smoke  IBCF_UserToNet  sbc77
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Pnum}  UserToNet_Edit
    IBCF_PnumApp.Edit UserToNetIBCF  ${AdministrationScenarios}
	
Delete UserToNet
    [Documentation]     Delete proper UserToNet of IBCF
    [Tags]    Smoke  IBCF_UserToNet  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Pnum}  UserToNet_Delete
    IBCF_PnumApp.Delete UserToNetIBCF  ${AdministrationScenarios}

### Net to User
	
Add NetToUser
    [Documentation]     Add added proper NetToUser of IBCF
    [Tags]    Smoke  IBCF_NetToUser  sbc77
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Pnum}  UserToNet_Add
    IBCF_PnumApp.Add NetToUserIBCF  ${AdministrationScenarios}
	
Sort NetToUser
    [Documentation]     Sort proper NetToUser for IBCF
    [Tags]  IBCF_NetToUser  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Pnum}  UserToNet_Add
    IBCF_PnumApp.Sort NetToUserIBCF   ${AdministrationScenarios}

	
View NetToUser
    [Documentation]     View proper NetToUser for IBCF
    [Tags]  IBCF_NetToUser  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Pnum}  UserToNet_Edit
    IBCF_PnumApp.View NetToUserIBCF   ${AdministrationScenarios}

	
Filter NetToUser
    [Documentation]     Filter proper NetToUser for IBCF
    [Tags]  IBCF_NetToUser  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Pnum}  UserToNet_Filter
    IBCF_PnumApp.Filter NetToUserIBCF   ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Pnum}  UserToNet_Filter_Spechar
    IBCF_PnumApp.Filter Special Character NetToUserIBCF   ${AdministrationScenarios}

	
Edit NetToUser
    [Documentation]     Edit proper NetToUser of IBCF
    [Tags]    Smoke  IBCF_NetToUser  sbc77
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Pnum}  UserToNet_Edit
    IBCF_PnumApp.Edit NetToUserIBCF  ${AdministrationScenarios}

	
Delete NetToUser
    [Documentation]     Delete proper NetToUser of IBCF
    [Tags]    Smoke  IBCF_NetToUser  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Pnum}  UserToNet_Delete
    IBCF_PnumApp.Delete NetToUserIBCF  ${AdministrationScenarios}

#####Extension
		
Add Extension
    [Documentation]     Add added proper Extension of IBCF
    [Tags]    Smoke  IBCF_Extension  sbc77
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Pnum}  Extension
    IBCF_PnumApp.Add ExtensionIBCF  ${AdministrationScenarios}
	
Sort Extension
    [Documentation]     Sort proper Extension for IBCF
    [Tags]  IBCF_Extension  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Pnum}  Extension
    IBCF_PnumApp.Sort ExtensionIBCF   ${AdministrationScenarios}
		
Filter Extension
    [Documentation]     Filter proper Extension for IBCF
    [Tags]  IBCF_Extension  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Pnum}  Extension_Edit
    IBCF_PnumApp.Filter ExtensionIBCF   ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Pnum}  Extension_Filter_Spechar
    IBCF_PnumApp.Filter Special Character ExtensionIBCF   ${AdministrationScenarios}
		
Edit Extension
    [Documentation]     Edit proper Extension of IBCF
    [Tags]    Smoke  IBCF_Extension  sbc77
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Pnum}  Extension_Edit
    IBCF_PnumApp.Edit ExtensionIBCF  ${AdministrationScenarios}

Delete Extension
    [Documentation]     Delete proper Extension of IBCF
    [Tags]    Smoke  IBCF_Extension  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Pnum}  Extension_Delete
    IBCF_PnumApp.Delete ExtensionIBCF  ${AdministrationScenarios}
	
####Local area
		
Add Local_area
    [Documentation]     Add added proper Local_area of IBCF
    [Tags]    Smoke  IBCF_Local_area  sbc77
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Pnum}  Local_area
    IBCF_PnumApp.Add Local_areaIBCF  ${AdministrationScenarios}
	
Sort Local_area
    [Documentation]     Sort proper Local_area for IBCF
    [Tags]  IBCF_Local_area  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Pnum}  Local_area
    IBCF_PnumApp.Sort Local_areaIBCF   ${AdministrationScenarios}
		
Filter Local_area
    [Documentation]     Filter proper Local_area for IBCF
    [Tags]  IBCF_Local_area  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Pnum}  Local_area_Edit
    IBCF_PnumApp.Filter Local_areaIBCF   ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Pnum}  Local_area_Filter_Spechar
    IBCF_PnumApp.Filter Special Character Local_areaIBCF   ${AdministrationScenarios}
		
Edit Local_area
    [Documentation]     Edit proper Local_area of IBCF
    [Tags]    Smoke  IBCF_Local_area  sbc77
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Pnum}  Local_area_Edit
    IBCF_PnumApp.Edit Local_areaIBCF  ${AdministrationScenarios}
	
Delete Local_area
    [Documentation]     Delete proper Local_area of IBCF
    [Tags]    Smoke  IBCF_Local_area  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Pnum}  Local_area_Delete
    IBCF_PnumApp.Delete Local_areaIBCF  ${AdministrationScenarios}