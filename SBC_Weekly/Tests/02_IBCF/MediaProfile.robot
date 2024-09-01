*** Settings ***
Documentation  This is all tests of IBCF_MediaProfile
Resource  ../../Resources/DataManager.robot
Resource  ../../Data/InputData.robot
Resource  ../../Resources/Common.robot
Resource  ../../Resources/IBCF/IBCF_MediaProfileApp.robot

#Test Setup      Common.Begin Web Test
Test Teardown   Common.End Web Test

*** Tasks ***

Add Media Profile
    [Documentation]    Verify the functionality of 'Add Media Profile' on the IBCF page
     [Tags]   IBCF    IBCF_MP  
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_MP}   MP_Add
    IBCF_MediaProfileApp.Add Media Profile   ${AdministrationScenarios}

Sort Media Profile
    [Documentation]    Verify the functionality of 'Sort Media Profile' on the IBCF page
    [Tags]   IBCF    IBCF_MP   
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_MP}  MP_Sort
    IBCF_MediaProfileApp.Sort Media Profile   ${AdministrationScenarios}

	
View Media Profile
    [Documentation]    Verify the functionality of 'View Media Profile' on the IBCF page
    [Tags]  IBCF    IBCF_MP     
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_MP}  MP_View
    IBCF_MediaProfileApp.View Media Profile   ${AdministrationScenarios}

	
Filter Media Profile
    [Documentation]    Verify the functionality of 'Filter Media Profile' on the IBCF page
    [Tags]  IBCF    IBCF_MP    
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_MP}  MP_Filter
    IBCF_MediaProfileApp.Filter Media Profile   ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_MP}  MP_Filter_Spechar
    IBCF_MediaProfileApp.Filter Special Character Media Profile   ${AdministrationScenarios}

	
Edit Media Profile
    [Documentation]    Verify the functionality of 'Edit Media Profile' on the IBCF page
    [Tags]  IBCF  IBCF_MP  
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_MP}   MP_Edit
    IBCF_MediaProfileApp.Edit Media Profile   ${AdministrationScenarios}

	
Delete Media Profile
    [Documentation]    Verify the functionality of 'Delete Media Profile' on the IBCF page
    [Tags]  IBCF  IBCF_MP   
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_MP}   MP_Delete
    IBCF_MediaProfileApp.Delete Media Profile   ${AdministrationScenarios}