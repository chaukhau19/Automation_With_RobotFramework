*** Settings ***
Documentation  This is all tests of Data Reference List in HSS
Resource  ../../Resources/DataManager.robot
Resource  ../../Data/InputData.robot
Resource  ../../Resources/Common.robot
Resource  ../../Resources/HSS/HSS_DataReferenceListApp.robot

Test Setup      Common.Begin Web Test
Test Teardown   Common.End Web Test

*** Tasks ***
		
Add DataReferenceList
    [Documentation]     Add proper DataReferenceList of HSS
    [Tags]    Smoke  HSS_DataReferenceList	ims47
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${HSS_DataReferenceList}  Add
    HSS_DataReferenceListApp.Add  ${AdministrationScenarios}

View DataReferenceList
    [Documentation]     View DataReferenceList of HSS testing
    [Tags]    HSS_DataReferenceList	ims47  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${HSS_DataReferenceList}  Delete
    HSS_DataReferenceListApp.View  ${AdministrationScenarios}

Sort DataReferenceList
    [Documentation]     Sort DataReferenceList of HSS testing
    [Tags]    HSS_DataReferenceList	ims47  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${HSS_DataReferenceList}  Add
    HSS_DataReferenceListApp.Sort  ${AdministrationScenarios}

Filter DataReferenceList
    [Documentation]     Filter DataReferenceList of HSS testing
    [Tags]    HSS_DataReferenceList	ims47  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${HSS_DataReferenceList}  Filter
    HSS_DataReferenceListApp.Filter  ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${HSS_DataReferenceList}  Filter_Special
    HSS_DataReferenceListApp.Filter special characters  ${AdministrationScenarios}

Edit DataReferenceList
    [Documentation]     Add proper DataReferenceList of HSS
    [Tags]    Smoke  HSS_DataReferenceList	ims47
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${HSS_DataReferenceList}  Edit
    HSS_DataReferenceListApp.Edit  ${AdministrationScenarios}

Delete DataReferenceList
    [Documentation]     Deleting proper DataReferenceList of HSS
    [Tags]    Smoke  HSS_DataReferenceList	ims47  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${HSS_DataReferenceList}  Delete
    HSS_DataReferenceListApp.Delete  ${AdministrationScenarios}
