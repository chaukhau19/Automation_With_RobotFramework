*** Settings ***
Documentation  This is all tests of PCSCF_Media Profile
Resource  ../../Resources/DataManager.robot
Resource  ../../Data/InputData.robot
Resource  ../../Resources/Common.robot
Resource  ../../Resources/PCSCF/PCSCF_MediaProfileApp.robot

#Test Setup      Common.Begin Web Test
Test Teardown   Common.End Web Test

*** Tasks ***

Add Media Profile
    [Documentation]    Verify the functionality of 'Add Media Profile' on the PCSCF page
    [Tags]  PCSCF  PCSCF_MP  
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_MP}		MP_ADD
    PCSCF_MediaProfileApp.Add Media Profile   ${AdministrationScenarios}

Sort Media Profile
    [Documentation]    Verify the functionality of 'Sort Media Profile' on the PCSCF page
    [Tags]  PCSCF  PCSCF_MP    
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_MP}  MP_SORT
    PCSCF_MediaProfileApp.Sort Media Profile   ${AdministrationScenarios}

View Media Profile
    [Documentation]    Verify the functionality of 'View Media Profile' on the PCSCF page
    [Tags]  PCSCF  PCSCF_MP  
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_MP}  MP_VIEW
    PCSCF_MediaProfileApp.View Media Profile   ${AdministrationScenarios}

Filter Media Profile
    [Documentation]    Verify the functionality of 'Filter Media Profile' on the PCSCF page
    [Tags]  PCSCF  PCSCF_MP      
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_MP}  MP_FILTER
    PCSCF_MediaProfileApp.Filter Media Profile   ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_MP}  Filter_Spechar
    PCSCF_MediaProfileApp.Filter Special Character Media Profile   ${AdministrationScenarios}

Edit Media Profile
    [Documentation]    Verify the functionality of 'Edit Media Profile' on the PCSCF page
    [Tags]  PCSCF  PCSCF_MP  
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_MP}		MP_EDIT
    PCSCF_MediaProfileApp.Edit Media Profile   ${AdministrationScenarios}

Delete Media Profile
    [Documentation]    Verify the functionality of 'Delete Media Profile' on the PCSCF page
    [Tags]  PCSCF  PCSCF_MP    
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_MP}		MP_DELETE
    PCSCF_MediaProfileApp.Delete Media Profile   ${AdministrationScenarios}