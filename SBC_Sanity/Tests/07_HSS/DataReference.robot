*** Settings ***
Documentation  This is all tests of Data Reference in HSS
Resource  ../../Resources/DataManager.robot
Resource  ../../Data/InputData.robot
Resource  ../../Resources/Common.robot
Resource  ../../Resources/HSS/HSS_DataReferenceApp.robot

Test Setup      Common.Begin Web Test
Test Teardown   Common.End Web Test

*** Tasks ***
	
Add DataReferences
    [Documentation]     Add proper DataReference of HSS
    [Tags]  Smoke  HSS_DataReference  ims47
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${HSS_DataReference}  Add
    HSS_DataReferenceApp.Add  ${AdministrationScenarios}

Add Invalid DataReferences
    [Documentation]     Add invalid DataReference of HSS
    [Tags]   HSS_DataReference  ims47  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${HSS_DataReference}  Add_Errors
    HSS_DataReferenceApp.Add Invalid  ${AdministrationScenarios}

View DataReferences
    [Documentation]     View DataReference of HSS testing
    [Tags]  HSS_DataReference  ims47  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${HSS_DataReference}  Add
    HSS_DataReferenceApp.View  ${AdministrationScenarios}

Sort DataReferences
    [Documentation]     Sort DataReference of HSS testing
    [Tags]  HSS_DataReference  ims47  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${HSS_DataReference}  Add
    HSS_DataReferenceApp.Sort  ${AdministrationScenarios}

Filter DataReferences
    [Documentation]     Filter DataReference of HSS testing
    [Tags]  HSS_DataReference  ims47  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${HSS_DataReference}  Filter
    HSS_DataReferenceApp.Filter  ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${HSS_DataReference}  Filter_Special
    HSS_DataReferenceApp.Filter special characters  ${AdministrationScenarios}

Delete DataReferences
    [Documentation]     Deleting proper DataReference of HSS
    [Tags]  Smoke  HSS_DataReference	ims47  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${HSS_DataReference}  Delete
    HSS_DataReferenceApp.Delete  ${AdministrationScenarios}