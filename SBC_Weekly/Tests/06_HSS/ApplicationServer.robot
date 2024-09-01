*** Settings ***
Documentation  This is all tests of Application Server in HSS
Resource  ../../Resources/DataManager.robot
Resource  ../../Data/InputData.robot
Resource  ../../Resources/Common.robot
Resource  ../../Resources/HSS/HSS_ApplicationServerApp.robot

#Test Setup      Common.Begin Web Test
Test Teardown   Common.End Web Test

*** Tasks ***

Add ApplicationServer
    [Documentation]   Verify The add function on the ApplicationServer page of HSS    [ims]
    [Tags]  HSS  HSS_ApplicationServer  
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${HSS_ApplicationServer}  Add
    HSS_ApplicationServerApp.Add  ${AdministrationScenarios}

Add Invalid ApplicationServer
    [Documentation]   Verify The add invalid function on the ApplicationServer page of HSS    [ims]
    [Tags]  HSS  HSS_ApplicationServer  	
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${HSS_ApplicationServer}  Add_Errors
    HSS_ApplicationServerApp.Add Invalid  ${AdministrationScenarios}

View ApplicationServer
    [Documentation]   Verify The view function on the ApplicationServer page of HSS    [ims]
    [Tags]  HSS  HSS_ApplicationServer  	  
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${HSS_ApplicationServer}  View
    HSS_ApplicationServerApp.View  ${AdministrationScenarios}

Sort ApplicationServer
    [Documentation]   Verify The sort function on the ApplicationServer page of HSS    [ims]
    [Tags]  HSS  HSS_ApplicationServer    
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${HSS_ApplicationServer}  Sort
    HSS_ApplicationServerApp.Sort  ${AdministrationScenarios}

Filter ApplicationServer
    [Documentation]   Verify The Filter function on the ApplicationServer page of HSS    [ims]
    [Tags]  HSS  HSS_ApplicationServer   	    
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${HSS_ApplicationServer}  Filter
    HSS_ApplicationServerApp.Filter  ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${HSS_ApplicationServer}  Filter_Special
    HSS_ApplicationServerApp.Filter special characters  ${AdministrationScenarios}

Delete ApplicationServer
    [Documentation]   Verify The Delete function on the ApplicationServer page of HSS    [ims]
    [Tags]  HSS  HSS_ApplicationServer 
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${HSS_ApplicationServer}  Delete
    HSS_ApplicationServerApp.Delete  ${AdministrationScenarios}