*** Settings ***
Documentation  This is all tests of Domain Route in TAS
Resource  ../../Resources/DataManager.robot
Resource  ../../Data/InputData.robot
Resource  ../../Resources/Common.robot
Resource  ../../Resources/TAS/TAS_DomainRoutesApp.robot

Test Setup      Common.Begin Web Test
Test Teardown   Common.End Web Test

*** Tasks ***

	
Add DomainRoutes
    [Documentation]     Add proper DomainRoutes of TAS
    [Tags]    Smoke  TAS_DomainRoutes	ims47
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${TAS_DomainRoutes}  Add
    TAS_DomainRoutesApp.Add  ${AdministrationScenarios}

Add Invalid DomainRoutes
    [Documentation]     Add invalid DomainRoutes of TAS
    [Tags]     TAS_DomainRoutes	ims47  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${TAS_DomainRoutes}  Add_Errors
    TAS_DomainRoutesApp.Add Invalid  ${AdministrationScenarios}


View DomainRoutes
    [Documentation]     View DomainRoutes of TAS section testing
    [Tags]    TAS_DomainRoutes	ims47  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${TAS_DomainRoutes}  Add
    TAS_DomainRoutesApp.View  ${AdministrationScenarios}

Sort DomainRoutes
    [Documentation]     Sort DomainRoutes of TAS section testing
    [Tags]    TAS_DomainRoutes	ims47  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${TAS_DomainRoutes}  Add
    TAS_DomainRoutesApp.Sort  ${AdministrationScenarios}

Filter DomainRoutes
    [Documentation]     Filter DomainRoutes of TAS section testing
    [Tags]    TAS_DomainRoutes	ims47  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${TAS_DomainRoutes}  Filter
    TAS_DomainRoutesApp.Filter  ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${TAS_DomainRoutes}  Filter_Special
    TAS_DomainRoutesApp.Filter special characters  ${AdministrationScenarios}

Edit Invalid DomainRoutes
    [Documentation]     Edit invalid DomainRoutes of TAS
    [Tags]     TAS_DomainRoutes	ims47  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${TAS_DomainRoutes}  Edit_Errors
    TAS_DomainRoutesApp.Edit Invalid  ${AdministrationScenarios}

Edit DomainRoutes
    [Documentation]     Edit the basic proper DomainRoutes of TAS
    [Tags]    Smoke  TAS_DomainRoutes	ims47
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${TAS_DomainRoutes}  Edit
    TAS_DomainRoutesApp.Edit  ${AdministrationScenarios}