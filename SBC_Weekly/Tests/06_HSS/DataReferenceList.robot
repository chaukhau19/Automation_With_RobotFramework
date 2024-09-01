*** Settings ***
Documentation  This is all tests of Data Reference List in HSS
Resource  ../../Resources/DataManager.robot
Resource  ../../Data/InputData.robot
Resource  ../../Resources/Common.robot
Resource  ../../Resources/HSS/HSS_DataReferenceListApp.robot

#Test Setup      Common.Begin Web Test
Test Teardown   Common.End Web Test

*** Tasks ***

Add DataReferenceList
    [Documentation]   Verify The Add function on the DataReferenceList page of HSS    [ims]
    [Tags]    HSS  HSS_DataReferenceList	
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${HSS_DataReferenceList}  Add
    HSS_DataReferenceListApp.Add  ${AdministrationScenarios}

View DataReferenceList
    [Documentation]   Verify The View function on the DataReferenceList page of HSS    [ims]
    [Tags]    HSS  HSS_DataReferenceList	    
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${HSS_DataReferenceList}  View
    HSS_DataReferenceListApp.View  ${AdministrationScenarios}

Sort DataReferenceList
    [Documentation]   Verify The Sort function on the DataReferenceList page of HSS    [ims]
    [Tags]    HSS  HSS_DataReferenceList  
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${HSS_DataReferenceList}  Sort
    HSS_DataReferenceListApp.Sort  ${AdministrationScenarios}

Filter DataReferenceList
    [Documentation]   Verify The Filter function on the DataReferenceList page of HSS    [ims]
    [Tags]    HSS  HSS_DataReferenceList  
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${HSS_DataReferenceList}  Filter
    HSS_DataReferenceListApp.Filter  ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${HSS_DataReferenceList}  Filter_Special
    HSS_DataReferenceListApp.Filter special characters  ${AdministrationScenarios}

Edit DataReferenceList
    [Documentation]   Verify The Edit function on the DataReferenceList page of HSS    [ims]
    [Tags]    HSS  HSS_DataReferenceList
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${HSS_DataReferenceList}  Edit
    HSS_DataReferenceListApp.Edit  ${AdministrationScenarios}

Delete DataReferenceList
    [Documentation]   Verify The Delete function on the DataReferenceList page of HSS    [ims]
    [Tags]    HSS  HSS_DataReferenceList	  
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${HSS_DataReferenceList}  Delete
    HSS_DataReferenceListApp.Delete  ${AdministrationScenarios}
