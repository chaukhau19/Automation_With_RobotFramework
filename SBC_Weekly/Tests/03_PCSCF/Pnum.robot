*** Settings ***
Documentation  This is all tests of PCSCF Pnum
Resource  ../../Resources/DataManager.robot
Resource  ../../Data/InputData.robot
Resource  ../../Resources/Common.robot
Resource  ../../Resources/PCSCF/PCSCF_PnumApp.robot

#Test Setup      Common.Begin Web Test
Test Teardown   Common.End Web Test

*** Tasks ***

############################################# UserToNet ###########################################

Add UserToNet
    [Documentation]    Verify the functionality of 'Add UserToNet' on the PCSCF page
    [Tags]      PCSCF    PCSCF_PNUM     PCSCF_PNUM_UserToNet 
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Pnum}  UserToNet_Add
    PCSCF_PnumApp.Add UserToNetPCSCF  ${AdministrationScenarios}

#Add Invalid UserToNet section
#    [Documentation]     Add Invalid UserToNet of PCSCF
#    [Tags]      PCSCF    PCSCF_PNUM     PCSCF_PNUM_UserToNet
#    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Pnum}  UserToNet_Add_Error
#    PCSCF_PnumApp.Add Invalid UserToNetPCSCF  ${AdministrationScenarios}

	
Sort UserToNet
    [Documentation]    Verify the functionality of 'Sort UserToNet' on the PCSCF page
    [Tags]      PCSCF    PCSCF_PNUM     PCSCF_PNUM_UserToNet     
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Pnum}  UserToNet_Sort
    PCSCF_PnumApp.Sort UserToNetPCSCF   ${AdministrationScenarios}

View UserToNet
    [Documentation]    Verify the functionality of 'View UserToNet' on the PCSCF page
    [Tags]      PCSCF    PCSCF_PNUM     PCSCF_PNUM_UserToNet   
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Pnum}   UserToNet_View
    PCSCF_PnumApp.View UserToNetPCSCF  ${AdministrationScenarios}

Filter UserToNet
    [Documentation]    Verify the functionality of 'Filter UserToNet' on the PCSCF page
    [Tags]      PCSCF    PCSCF_PNUM     PCSCF_PNUM_UserToNet    
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Pnum}  UserToNet_Filter
    PCSCF_PnumApp.Filter UserToNetPCSCF   ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Pnum}  UserToNet_Filter_Spechar
    PCSCF_PnumApp.Filter Special Character UserToNetPCSCF   ${AdministrationScenarios}

Edit UserToNet
    [Documentation]    Verify the functionality of 'Edit UserToNet' on the PCSCF page
    [Tags]      PCSCF    PCSCF_PNUM     PCSCF_PNUM_UserToNet    
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Pnum}  UserToNet_Edit
    PCSCF_PnumApp.Edit UserToNetPCSCF  ${AdministrationScenarios}

Delete UserToNet
    [Documentation]    Verify the functionality of 'Delete UserToNet' on the PCSCF page
    [Tags]      PCSCF    PCSCF_PNUM     PCSCF_PNUM_UserToNet   
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Pnum}  UserToNet_Delete
    PCSCF_PnumApp.Delete UserToNetPCSCF  ${AdministrationScenarios}




############################################## NetToUser ################################################
Add NetToUser
    [Documentation]    Verify the functionality of 'Add NetToUser' on the PCSCF page
    [Tags]      PCSCF    PCSCF_PNUM     PCSCF_PNUM_NetToUser  
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Pnum}  NetToUser_Add
    PCSCF_PnumApp.Add NetToUserPCSCF  ${AdministrationScenarios}

Sort NetToUser
    [Documentation]    Verify the functionality of 'Sort NetToUser' on the PCSCF page
    [Tags]      PCSCF    PCSCF_PNUM     PCSCF_PNUM_NetToUser  
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Pnum}  NetToUser_Sort
    PCSCF_PnumApp.Sort NetToUserPCSCF   ${AdministrationScenarios}

View NetToUser
    [Documentation]    Verify the functionality of 'View NetToUser' on the PCSCF page
    [Tags]      PCSCF    PCSCF_PNUM     PCSCF_PNUM_NetToUser  
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Pnum}  NetToUser_View
    PCSCF_PnumApp.View NetToUserPCSCF   ${AdministrationScenarios}

Filter NetToUser
    [Documentation]    Verify the functionality of 'Filter NetToUser' on the PCSCF page
    [Tags]      PCSCF    PCSCF_PNUM     PCSCF_PNUM_NetToUser 
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Pnum}  NetToUser_Filter
    PCSCF_PnumApp.Filter NetToUserPCSCF   ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Pnum}  NetToUser_Filter_Spechar
    PCSCF_PnumApp.Filter Special Character NetToUserPCSCF   ${AdministrationScenarios}

Edit NetToUser
    [Documentation]    Verify the functionality of 'Edit NetToUser' on the PCSCF page
    [Tags]      PCSCF    PCSCF_PNUM     PCSCF_PNUM_NetToUser 
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Pnum}  NetToUser_Edit
    PCSCF_PnumApp.Edit NetToUserPCSCF  ${AdministrationScenarios}

Delete NetToUser
    [Documentation]    Verify the functionality of 'Delete NetToUser' on the PCSCF page
    [Tags]      PCSCF    PCSCF_PNUM     PCSCF_PNUM_NetToUser  
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Pnum}  NetToUser_Delete
    PCSCF_PnumApp.Delete NetToUserPCSCF  ${AdministrationScenarios}




########################################## Extension ##################################################

Add Extension
    [Documentation]    Verify the functionality of 'Add Extension' on the PCSCF page
    [Tags]      PCSCF    PCSCF_PNUM     PCSCF_PNUM_Extension 
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Pnum}  Extension
    PCSCF_PnumApp.Add ExtensionPCSCF  ${AdministrationScenarios}

Sort Extension
    [Documentation]    Verify the functionality of 'Sort Extension' on the PCSCF page
    [Tags]      PCSCF    PCSCF_PNUM     PCSCF_PNUM_Extension
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Pnum}  Extension_Sort
    PCSCF_PnumApp.Sort ExtensionPCSCF   ${AdministrationScenarios}

Filter Extension
    [Documentation]    Verify the functionality of 'Filter Extension' on the PCSCF page
    [Tags]      PCSCF    PCSCF_PNUM     PCSCF_PNUM_Extension
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Pnum}  Extension_Filter
    PCSCF_PnumApp.Filter ExtensionPCSCF   ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Pnum}  Extension_Filter_Spechar
    PCSCF_PnumApp.Filter Special Character ExtensionPCSCF   ${AdministrationScenarios}

Edit Extension
    [Documentation]    Verify the functionality of 'Edit Extension' on the PCSCF page
    [Tags]      PCSCF    PCSCF_PNUM     PCSCF_PNUM_Extension   
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Pnum}  Extension_Edit
    PCSCF_PnumApp.Edit ExtensionPCSCF  ${AdministrationScenarios}

Delete Extension
    [Documentation]    Verify the functionality of 'Delete Extension' on the PCSCF page
    [Tags]      PCSCF    PCSCF_PNUM     PCSCF_PNUM_Extension 
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Pnum}  Extension_Delete
    PCSCF_PnumApp.Delete ExtensionPCSCF  ${AdministrationScenarios}




###################################### Local area ################################################

Add Local_area
    [Documentation]    Verify the functionality of 'Add Local_area' on the PCSCF page
    [Tags]      PCSCF    PCSCF_PNUM     PCSCF_PNUM_LocalArea  
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Pnum}  Local_area
    PCSCF_PnumApp.Add Local_areaPCSCF  ${AdministrationScenarios}

Sort Local_area
    [Documentation]    Verify the functionality of 'Sort Local_area' on the PCSCF page
    [Tags]      PCSCF    PCSCF_PNUM     PCSCF_PNUM_LocalArea  
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Pnum}  Local_area_Sort
    PCSCF_PnumApp.Sort Local_areaPCSCF   ${AdministrationScenarios}

Filter Local_area
    [Documentation]    Verify the functionality of 'Filter Local_area' on the PCSCF page
    [Tags]      PCSCF    PCSCF_PNUM     PCSCF_PNUM_LocalArea
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Pnum}  Local_area_Filter
    PCSCF_PnumApp.Filter Local_areaPCSCF   ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Pnum}  Local_area_Filter_Spechar
    PCSCF_PnumApp.Filter Special Character Local_areaPCSCF   ${AdministrationScenarios}

Edit Local_area
    [Documentation]    Verify the functionality of 'Edit Local_area' on the PCSCF page
    [Tags]      PCSCF    PCSCF_PNUM     PCSCF_PNUM_LocalArea  
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Pnum}  Local_area_Edit
    PCSCF_PnumApp.Edit Local_areaPCSCF  ${AdministrationScenarios}

Delete Local_area
    [Documentation]    Verify the functionality of 'Delete Local_area' on the PCSCF page
    [Tags]      PCSCF    PCSCF_PNUM     PCSCF_PNUM_LocalArea  
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Pnum}  Local_area_Delete
    PCSCF_PnumApp.Delete Local_areaPCSCF  ${AdministrationScenarios}
