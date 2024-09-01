*** Settings ***
Documentation  This is all tests of IBCF Alerting
Resource  ../../Resources/DataManager.robot
Resource  ../../Data/InputData.robot
Resource  ../../Resources/Common.robot
Resource  ../../Resources/IBCF/IBCF_AlertingApp.robot

#Test Setup      Common.Begin Web Test
Test Teardown   Common.End Web Test

*** Tasks ***


Add Alerting
    [Documentation]    Verify the functionality of 'Add Alerting' on the IBCF page
    [Tags]    IBCF  IBCF_Alerting  
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Alerting}  Alerting_Add
    IBCF_AlertingApp.Add AlertingIBCF  ${AdministrationScenarios}	

Sort Alerting
    [Documentation]    Verify the functionality of 'Sort Alerting' on the IBCF page
    [Tags]   IBCF    IBCF_Alerting    
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Alerting}  Alerting_Sort
    IBCF_AlertingApp.Sort AlertingIBCF   ${AdministrationScenarios}

	
# View Alerting
#     [Documentation]    Verify the functionality of 'View Alerting' on the IBCF page
#     [Tags]  IBCF    IBCF_Alerting 
#     ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Alerting}  Alerting_View
#     IBCF_AlertingApp.View AlertingIBCF   ${AdministrationScenarios}

	
Filter Alerting
    [Documentation]    Verify the functionality of 'Filter Alerting' on the IBCF page
    [Tags]  IBCF     IBCF_Alerting   
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Alerting}  Alerting_Filter
    IBCF_AlertingApp.Filter AlertingIBCF   ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Alerting}  Alerting_Filter_Spechar
    IBCF_AlertingApp.Filter Special Character AlertingIBCF   ${AdministrationScenarios}


Edit Alerting
    [Documentation]    Verify the functionality of 'Edit Alerting' on the IBCF page
    [Tags]    IBCF  IBCF_Alerting    
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Alerting}  Alerting_Edit
    IBCF_AlertingApp.Edit AlertingIBCF  ${AdministrationScenarios}

	
Delete Alerting
    [Documentation]    Verify the functionality of 'Delete Alerting' on the IBCF page
    [Tags]    IBCF  IBCF_Alerting      
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Alerting}  Alerting_Delete
    IBCF_AlertingApp.Delete AlertingIBCF  ${AdministrationScenarios}
