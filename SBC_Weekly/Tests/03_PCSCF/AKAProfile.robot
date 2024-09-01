*** Settings ***
Documentation  This is all tests of PCSCF_AKAProfile
Resource  ../../Resources/DataManager.robot
Resource  ../../Data/InputData.robot
Resource  ../../Resources/Common.robot
Resource  ../../Resources/PCSCF/PCSCF_AKAProfileApp.robot

#Test Setup      Common.Begin Web Test
Test Teardown   Common.End Web Test

*** Tasks ***

Add AKA Profile
    [Documentation]    Verify the functionality of 'Add AKA Profile' on the PCSCF page
    [Tags]  PCSCF  PCSCF_AKA 
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_AKA}		Add
    PCSCF_AKAProfileApp.Add AKA Profile   ${AdministrationScenarios}

Add Invalid AKA Profile
    [Documentation]    Verify the functionality of 'Add Invalid AKA Profile' on the PCSCF page
    [Tags]  PCSCF  PCSCF_AKA  
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_AKA}		Add_invalid
    PCSCF_AKAProfileApp.Add invalid AKA Profile   ${AdministrationScenarios}

Sort AKA Profile
    [Documentation]    Verify the functionality of 'Sort AKA Profile' on the PCSCF page
    [Tags]  PCSCF  PCSCF_AKA      
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_AKA}  Sort
    PCSCF_AKAProfileApp.Sort AKA Profile   ${AdministrationScenarios}

View AKA Profile
    [Documentation]    Verify the functionality of 'View AKA Profile' on the PCSCF page
    [Tags]  PCSCF  PCSCF_AKA   
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_AKA}  View
    PCSCF_AKAProfileApp.View AKA Profile   ${AdministrationScenarios}

Filter AKA Profile
    [Documentation]    Verify the functionality of 'Filter AKA Profile' on the PCSCF page
    [Tags]  PCSCF  PCSCF_AKA    
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_AKA}  Filter
    PCSCF_AKAProfileApp.Filter AKA Profile   ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_AKA}  Filter_Spechar
    PCSCF_AKAProfileApp.Filter Special Character AKA Profile   ${AdministrationScenarios}

Edit Invalid AKA Profile
    [Documentation]    Verify the functionality of 'Edit Invalid AKA Profile' on the PCSCF page
    [Tags]  PCSCF  PCSCF_AKA     
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_AKA}		Edit_Invalid
    PCSCF_AKAProfileApp.Edit invalid AKA Profile   ${AdministrationScenarios}


Edit AKA Profile
    [Documentation]    Verify the functionality of 'Edit AKA Profile' on the PCSCF page
    [Tags]  PCSCF  PCSCF_AKA
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_AKA}		Edit
    PCSCF_AKAProfileApp.Edit AKA Profile   ${AdministrationScenarios}


Delete AKA Profile
    [Documentation]    Verify the functionality of 'Delete AKA Profile' on the PCSCF page
    [Tags]  PCSCF  PCSCF_AKA   
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_AKA}		Delete
    PCSCF_AKAProfileApp.Delete AKA Profile   ${AdministrationScenarios}