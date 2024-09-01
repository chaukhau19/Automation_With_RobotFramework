*** Settings ***
Documentation  This is all tests of Domain Route in TAS
Resource  ../../Resources/DataManager.robot
Resource  ../../Data/InputData.robot
Resource  ../../Resources/Common.robot
Resource  ../../Resources/TAS/TAS_DomainRoutesApp.robot

#Test Setup      Common.Begin Web Test
Test Teardown   Common.End Web Test

*** Tasks ***

Add DomainRoutes
    [Documentation]   Verify The Add function on the DomainRoutes page of TAS    [ims]
    [Tags]    TAS  TAS_DomainRoutes	
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${TAS_DomainRoutes}  Add
    TAS_DomainRoutesApp.Add  ${AdministrationScenarios}

Add Invalid DomainRoutes
    [Documentation]   Verify The Add Invalid function on the DomainRoutes page of TAS    [ims]
    [Tags]    TAS  TAS_DomainRoutes	    
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${TAS_DomainRoutes}  Add_Errors
    TAS_DomainRoutesApp.Add Invalid  ${AdministrationScenarios}

View DomainRoutes
    [Documentation]   Verify The View function on the DomainRoutes page of TAS    [ims]
    [Tags]    TAS  TAS_DomainRoutes		  
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${TAS_DomainRoutes}  View
    TAS_DomainRoutesApp.View  ${AdministrationScenarios}

Sort DomainRoutes
    [Documentation]   Verify The Sort function on the DomainRoutes page of TAS    [ims]
    [Tags]    TAS  TAS_DomainRoutes	    
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${TAS_DomainRoutes}  Sort
    TAS_DomainRoutesApp.Sort  ${AdministrationScenarios}

Filter DomainRoutes
    [Documentation]   Verify The Filter function on the DomainRoutes page of TAS    [ims]
    [Tags]    TAS  TAS_DomainRoutes	  
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${TAS_DomainRoutes}  Filter
    TAS_DomainRoutesApp.Filter  ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${TAS_DomainRoutes}  Filter_Special
    TAS_DomainRoutesApp.Filter special characters  ${AdministrationScenarios}

Edit DomainRoutes
    [Documentation]   Verify The Edit Invalid function on the DomainRoutes page of TAS    [ims]
    [Tags]    TAS  TAS_DomainRoutes	 
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${TAS_DomainRoutes}  Edit
    TAS_DomainRoutesApp.Edit  ${AdministrationScenarios}

Edit Invalid DomainRoutes
    [Documentation]   Verify The Edit function on the DomainRoutes page of TAS    [ims]
    [Tags]    TAS  TAS_DomainRoutes	  
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${TAS_DomainRoutes}  Edit_Errors
    TAS_DomainRoutesApp.Edit Invalid  ${AdministrationScenarios}

