*** Settings ***
Documentation  This is all tests of PCSCF Pnum
Resource  ../../Resources/DataManager.robot
Resource  ../../Data/InputData.robot
Resource  ../../Resources/Common.robot
Resource  ../../Resources/PCSCF/PCSCF_PnumApp.robot

Test Setup      Common.Begin Web Test
Test Teardown   Common.End Web Test

*** Tasks ***

###User to Net
		
Add UserToNet
    [Documentation]     Add added proper UserToNet of PCSCF
    [Tags]    Smoke  PCSCF_UserToNet  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Pnum}  UserToNet_Add
    PCSCF_PnumApp.Add UserToNetPCSCF  ${AdministrationScenarios}
#    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Pnum}  UserToNet_Add_Error
#    PCSCF_PnumApp.Add Invalid UserToNetPCSCF  ${AdministrationScenarios}
	
Sort UserToNet
    [Documentation]     Sort proper UserToNet for PCSCF
    [Tags]  PCSCF_UserToNet  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Pnum}  UserToNet_Add
    PCSCF_PnumApp.Sort UserToNetPCSCF   ${AdministrationScenarios}
		
View UserToNet
    [Documentation]     View proper UserToNet for PCSCF
    [Tags]  PCSCF_UserToNet  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Pnum}   UserToNet_Edit
    PCSCF_PnumApp.View UserToNetPCSCF  ${AdministrationScenarios}
	
Filter UserToNet
    [Documentation]     Filter proper UserToNet for PCSCF
    [Tags]  PCSCF_UserToNet  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Pnum}  UserToNet_Filter
    PCSCF_PnumApp.Filter UserToNetPCSCF   ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Pnum}  UserToNet_Filter_Spechar
    PCSCF_PnumApp.Filter Special Character UserToNetPCSCF   ${AdministrationScenarios}
			
Edit UserToNet
    [Documentation]     Edit proper UserToNet of PCSCF
    [Tags]    Smoke  PCSCF_UserToNet  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Pnum}  UserToNet_Edit
    PCSCF_PnumApp.Edit UserToNetPCSCF  ${AdministrationScenarios}
		
Delete UserToNet
    [Documentation]     Delete proper UserToNet of PCSCF
    [Tags]    Smoke  PCSCF_UserToNet  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Pnum}  UserToNet_Delete
    PCSCF_PnumApp.Delete UserToNetPCSCF  ${AdministrationScenarios}

### Net to User		
Add NetToUser
    [Documentation]     Add added proper NetToUser of PCSCF
    [Tags]    Smoke  PCSCF_NetToUser  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Pnum}  UserToNet_Add
    PCSCF_PnumApp.Add NetToUserPCSCF  ${AdministrationScenarios}
	
Sort NetToUser
    [Documentation]     Sort proper NetToUser for PCSCF
    [Tags]  PCSCF_NetToUser  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Pnum}  UserToNet_Add
    PCSCF_PnumApp.Sort NetToUserPCSCF   ${AdministrationScenarios}
		
View NetToUser
    [Documentation]     View proper NetToUser for PCSCF
    [Tags]  PCSCF_NetToUser  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Pnum}  UserToNet_Edit
    PCSCF_PnumApp.View NetToUserPCSCF   ${AdministrationScenarios}
		
Filter NetToUser
    [Documentation]     Filter proper NetToUser for PCSCF
    [Tags]  PCSCF_NetToUser  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Pnum}  UserToNet_Edit
    PCSCF_PnumApp.Filter NetToUserPCSCF   ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Pnum}  UserToNet_Filter_Spechar
    PCSCF_PnumApp.Filter Special Character NetToUserPCSCF   ${AdministrationScenarios}
	
Edit NetToUser
    [Documentation]     Edit proper NetToUser of PCSCF
    [Tags]    Smoke  PCSCF_NetToUser  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Pnum}  UserToNet_Edit
    PCSCF_PnumApp.Edit NetToUserPCSCF  ${AdministrationScenarios}
			
Delete NetToUser
    [Documentation]     Delete proper NetToUser of PCSCF
    [Tags]    Smoke  PCSCF_NetToUser  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Pnum}  UserToNet_Delete
    PCSCF_PnumApp.Delete NetToUserPCSCF  ${AdministrationScenarios}

#####Extension
		
Add Extension
    [Documentation]     Add added proper Extension of PCSCF
    [Tags]    Smoke  PCSCF_Extension  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Pnum}  Extension
    PCSCF_PnumApp.Add ExtensionPCSCF  ${AdministrationScenarios}
	
Sort Extension
    [Documentation]     Sort proper Extension for PCSCF
    [Tags]  PCSCF_Extension  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Pnum}  Extension
    PCSCF_PnumApp.Sort ExtensionPCSCF   ${AdministrationScenarios}
		
Filter Extension
    [Documentation]     Filter proper Extension for PCSCF
    [Tags]  PCSCF_Extension  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Pnum}  Extension_Edit
    PCSCF_PnumApp.Filter ExtensionPCSCF   ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Pnum}  Extension_Filter_Spechar
    PCSCF_PnumApp.Filter Special Character ExtensionPCSCF   ${AdministrationScenarios}
		
Edit Extension
    [Documentation]     Edit proper Extension of PCSCF
    [Tags]    Smoke  PCSCF_Extension  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Pnum}  Extension_Edit
    PCSCF_PnumApp.Edit ExtensionPCSCF  ${AdministrationScenarios}
		
Delete Extension
    [Documentation]     Delete proper Extension of PCSCF
    [Tags]    Smoke  PCSCF_Extension  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Pnum}  Extension_Delete
    PCSCF_PnumApp.Delete ExtensionPCSCF  ${AdministrationScenarios}

####Local area
		
Add Local_area
    [Documentation]     Add added proper Local_area of PCSCF
    [Tags]    Smoke  PCSCF_Local_area  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Pnum}  Local_area
    PCSCF_PnumApp.Add Local_areaPCSCF  ${AdministrationScenarios}
		
Sort Local_area
    [Documentation]     Sort proper Local_area for PCSCF
    [Tags]   PCSCF_Local_area  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Pnum}  Local_area
    PCSCF_PnumApp.Sort Local_areaPCSCF   ${AdministrationScenarios}
		
Filter Local_area
    [Documentation]     Filter proper Local_area for PCSCF
    [Tags]  PCSCF_Local_area  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Pnum}  Local_area_Edit
    PCSCF_PnumApp.Filter Local_areaPCSCF   ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Pnum}  Local_area_Filter_Spechar
    PCSCF_PnumApp.Filter Special Character Local_areaPCSCF   ${AdministrationScenarios}
	
Edit Local_area
    [Documentation]     Edit proper Local_area of PCSCF
    [Tags]    Smoke  PCSCF_Local_area  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Pnum}  Local_area_Edit
    PCSCF_PnumApp.Edit Local_areaPCSCF  ${AdministrationScenarios}
			
Delete Local_area
    [Documentation]     Delete proper Local_area of PCSCF
    [Tags]    Smoke  PCSCF_Local_area  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Pnum}  Local_area_Delete
    PCSCF_PnumApp.Delete Local_areaPCSCF  ${AdministrationScenarios}
