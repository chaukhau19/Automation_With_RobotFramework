*** Settings ***
Documentation  This is all tests of PCSCF Alerting
Resource  ../../Resources/DataManager.robot
Resource  ../../Data/InputData.robot
Resource  ../../Resources/Common.robot
Resource  ../../Resources/PCSCF/PCSCF_AlertingApp.robot

#Test Setup      Common.Begin Web Test
Test Teardown   Common.End Web Test

*** Tasks ***

Add Alerting
    [Documentation]    Verify the functionality of 'Add Alerting' on the PCSCF page
    [Tags]    PCSCF  PCSCF_Alerting      
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Alerting}  Add
    PCSCF_AlertingApp.Add AlertingPCSCF  ${AdministrationScenarios}

Sort Alerting
    [Documentation]    Verify the functionality of 'Sort Alerting' on the PCSCF page
    [Tags]    PCSCF  PCSCF_Alerting     
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Alerting}  Sort
    PCSCF_AlertingApp.Sort AlertingPCSCF   ${AdministrationScenarios}

View Alerting
    [Documentation]    Verify the functionality of 'View Alerting' on the PCSCF page
    [Tags]    PCSCF  PCSCF_Alerting    
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Alerting}  View
    PCSCF_AlertingApp.View AlertingPCSCF   ${AdministrationScenarios}

Filter Alerting
    [Documentation]    Verify the functionality of 'Filter Alerting' on the PCSCF page
    [Tags]    PCSCF  PCSCF_Alerting  
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Alerting}  Filter
    PCSCF_AlertingApp.Filter AlertingPCSCF   ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Alerting}  Alerting_Filter_Spechar
    PCSCF_AlertingApp.Filter Special Character AlertingPCSCF   ${AdministrationScenarios}

Edit Alerting
    [Documentation]    Verify the functionality of 'Edit Alerting' on the PCSCF page
    [Tags]    PCSCF  PCSCF_Alerting  
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Alerting}  Edit
    PCSCF_AlertingApp.Edit AlertingPCSCF  ${AdministrationScenarios}

Delete Alerting
    [Documentation]    Verify the functionality of 'Delete Alerting' on the PCSCF page
    [Tags]    PCSCF  PCSCF_Alerting   
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Alerting}  Delete
    PCSCF_AlertingApp.Delete AlertingPCSCF  ${AdministrationScenarios}