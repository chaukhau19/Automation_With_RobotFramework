*** Settings ***
Documentation  This is all tests of IBCF Pnum
Resource  ../../Resources/DataManager.robot
Resource  ../../Data/InputData.robot
Resource  ../../Resources/Common.robot
Resource  ../../Resources/IBCF/IBCF_PnumApp.robot

#Test Setup      Common.Begin Web Test
Test Teardown   Common.End Web Test

*** Tasks ***

######################################### User to Net #################################################
Add UserToNet
    [Documentation]    Verify the functionality of 'Add UserToNet' on the IBCF page
    [Tags]  IBCF    IBCF_PNUM    IBCF_PNUM_UserToNet  
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Pnum}  UserToNet_Add
    IBCF_PnumApp.Add UserToNetIBCF  ${AdministrationScenarios}

Sort UserToNet
    [Documentation]    Verify the functionality of 'Sort UserToNet' on the IBCF page
    [Tags]  IBCF    IBCF_PNUM    IBCF_PNUM_UserToNet  
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Pnum}  UserToNet_Sort
    IBCF_PnumApp.Sort UserToNetIBCF   ${AdministrationScenarios}

View UserToNet
    [Documentation]    Verify the functionality of 'View UserToNet' on the IBCF page
    [Tags]  IBCF    IBCF_PNUM    IBCF_PNUM_UserToNet   
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Pnum}   UserToNet_View
    IBCF_PnumApp.View UserToNetIBCF  ${AdministrationScenarios}

Filter UserToNet
    [Documentation]    Verify the functionality of 'Filter UserToNet' on the IBCF page
    [Tags]  IBCF    IBCF_PNUM    IBCF_PNUM_UserToNet      
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Pnum}  UserToNet_Filter
    IBCF_PnumApp.Filter UserToNetIBCF   ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Pnum}  UserToNet_Filter_Spechar
    IBCF_PnumApp.Filter Special Character UserToNetIBCF   ${AdministrationScenarios}

Edit UserToNet
    [Documentation]    Verify the functionality of 'Edit UserToNet' on the IBCF page
    [Tags]  IBCF    IBCF_PNUM    IBCF_PNUM_UserToNet  
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Pnum}  UserToNet_Edit
    IBCF_PnumApp.Edit UserToNetIBCF  ${AdministrationScenarios}

Delete UserToNet
    [Documentation]    Verify the functionality of 'Delete UserToNet' on the IBCF page
    [Tags]  IBCF    IBCF_PNUM    IBCF_PNUM_UserToNet        
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Pnum}  UserToNet_Delete
    IBCF_PnumApp.Delete UserToNetIBCF  ${AdministrationScenarios}





#################################### Net to User #################################################
Add NetToUser
    [Documentation]    Verify the functionality of 'Add UserToNet' on the IBCF page
    [Tags]  IBCF    IBCF_PNUM    IBCF_PNUM_NetToUser  
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Pnum}  NetToUser_Add
    IBCF_PnumApp.Add NetToUserIBCF  ${AdministrationScenarios}

Sort NetToUser
    [Documentation]    Verify the functionality of 'Sort UserToNet' on the IBCF page
    [Tags]  IBCF    IBCF_PNUM    IBCF_PNUM_NetToUser  
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Pnum}  NetToUser_Sort
    IBCF_PnumApp.Sort NetToUserIBCF   ${AdministrationScenarios}

View NetToUser
    [Documentation]    Verify the functionality of 'View UserToNet' on the IBCF page
    [Tags]  IBCF    IBCF_PNUM    IBCF_PNUM_NetToUser 
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Pnum}  NetToUser_View
    IBCF_PnumApp.View NetToUserIBCF   ${AdministrationScenarios}

Filter NetToUser
    [Documentation]    Verify the functionality of 'Filter UserToNet' on the IBCF page
    [Tags]  IBCF    IBCF_PNUM    IBCF_PNUM_NetToUser     
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Pnum}  NetToUser_Filter
    IBCF_PnumApp.Filter NetToUserIBCF   ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Pnum}  NetToUser_Filter_Spechar
    IBCF_PnumApp.Filter Special Character NetToUserIBCF   ${AdministrationScenarios}

Edit NetToUser
    [Documentation]    Verify the functionality of 'Edit UserToNet' on the IBCF page
    [Tags]  IBCF    IBCF_PNUM    IBCF_PNUM_NetToUser  
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Pnum}  NetToUser_Edit
    IBCF_PnumApp.Edit NetToUserIBCF  ${AdministrationScenarios}

Delete NetToUser
    [Documentation]    Verify the functionality of 'Delete UserToNet' on the IBCF page
    [Tags]  IBCF    IBCF_PNUM    IBCF_PNUM_NetToUser 
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Pnum}  NetToUser_Delete
    IBCF_PnumApp.Delete NetToUserIBCF  ${AdministrationScenarios}




##### ############################# Extension #################################################

Add Extension
    [Documentation]    Verify the functionality of 'Add Extension' on the IBCF page
    [Tags]  IBCF    IBCF_PNUM    IBCF_PNUM_Extension  
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Pnum}  Extension_Add
    IBCF_PnumApp.Add ExtensionIBCF  ${AdministrationScenarios}

Sort Extension
    [Documentation]    Verify the functionality of 'Sort Extension' on the IBCF page
    [Tags]  IBCF    IBCF_PNUM    IBCF_PNUM_Extension   
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Pnum}  Extension_Sort
    IBCF_PnumApp.Sort ExtensionIBCF   ${AdministrationScenarios}

Filter Extension
    [Documentation]    Verify the functionality of 'Filter Extension' on the IBCF page
    [Tags]  IBCF    IBCF_PNUM    IBCF_PNUM_Extension     
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Pnum}  Extension_Filter
    IBCF_PnumApp.Filter ExtensionIBCF   ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Pnum}  Extension_Filter_Spechar
    IBCF_PnumApp.Filter Special Character ExtensionIBCF   ${AdministrationScenarios}

Edit Extension
    [Documentation]    Verify the functionality of 'Edit Extension' on the IBCF page
    [Tags]  IBCF    IBCF_PNUM    IBCF_PNUM_Extension  
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Pnum}  Extension_Edit
    IBCF_PnumApp.Edit ExtensionIBCF  ${AdministrationScenarios}

Delete Extension
    [Documentation]    Verify the functionality of 'Delete Extension' on the IBCF page
    [Tags]  IBCF    IBCF_PNUM    IBCF_PNUM_Extension    
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Pnum}  Extension_Delete
    IBCF_PnumApp.Delete ExtensionIBCF  ${AdministrationScenarios}
	



### # ##################################### Local area ###############################################

Add Local_area
    [Documentation]    Verify the functionality of 'Add Local_area' on the IBCF page
    [Tags]  IBCF    IBCF_PNUM    IBCF_PNUM_LocalArea   
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Pnum}  Local_area
    IBCF_PnumApp.Add Local_areaIBCF  ${AdministrationScenarios}

Sort Local_area
    [Documentation]    Verify the functionality of 'Add Local_area' on the IBCF page
    [Tags]  IBCF    IBCF_PNUM    IBCF_PNUM_LocalArea    
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Pnum}  Local_area_Sort
    IBCF_PnumApp.Sort Local_areaIBCF   ${AdministrationScenarios}

Filter Local_area
    [Documentation]    Verify the functionality of 'Filter Local_area' on the IBCF page
    [Tags]  IBCF    IBCF_PNUM    IBCF_PNUM_LocalArea  
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Pnum}  Local_area_Filter
    IBCF_PnumApp.Filter Local_areaIBCF   ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Pnum}  Local_area_Filter_Spechar
    IBCF_PnumApp.Filter Special Character Local_areaIBCF   ${AdministrationScenarios}

Edit Local_area
    [Documentation]    Verify the functionality of 'Edit Local_area' on the IBCF page
    [Tags]  IBCF    IBCF_PNUM    IBCF_PNUM_LocalArea     
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Pnum}  Local_area_Edit
    IBCF_PnumApp.Edit Local_areaIBCF  ${AdministrationScenarios}

Delete Local_area
    [Documentation]    Verify the functionality of 'Delete Local_area' on the IBCF page
    [Tags]  IBCF    IBCF_PNUM    IBCF_PNUM_LocalArea      
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Pnum}  Local_area_Delete
    IBCF_PnumApp.Delete Local_areaIBCF  ${AdministrationScenarios}