*** Settings ***
Documentation  This is all tests of Data Reference in HSS
Resource  ../../Resources/DataManager.robot
Resource  ../../Data/InputData.robot
Resource  ../../Resources/Common.robot
Resource  ../../Resources/HSS/HSS_DataReferenceApp.robot

#Test Setup      Common.Begin Web Test
Test Teardown   Common.End Web Test

*** Tasks ***

Add DataReferences
    [Documentation]   Verify The Add function on the DataReferences page of HSS    [ims]
    [Tags]  HSS  HSS_DataReference  
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${HSS_DataReference}  Add
    HSS_DataReferenceApp.Add  ${AdministrationScenarios}

Add Invalid DataReferences
    [Documentation]   Verify The Add Invalid function on the DataReferences page of HSS    [ims]
    [Tags]  HSS  HSS_DataReference      
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${HSS_DataReference}  Add_Errors
    HSS_DataReferenceApp.Add Invalid  ${AdministrationScenarios}

View DataReferences
    [Documentation]   Verify The View function on the DataReferences page of HSS    [ims]
    [Tags]  HSS  HSS_DataReference      
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${HSS_DataReference}  View
    HSS_DataReferenceApp.View  ${AdministrationScenarios}

Sort DataReferences
    [Documentation]   Verify The Sort function on the DataReferences page of HSS    [ims]
    [Tags]  HSS  HSS_DataReference       
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${HSS_DataReference}  Sort
    HSS_DataReferenceApp.Sort  ${AdministrationScenarios}

Filter DataReferences
    [Documentation]   Verify The Filter function on the DataReferences page of HSS    [ims]
    [Tags]  HSS  HSS_DataReference        
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${HSS_DataReference}  Filter
    HSS_DataReferenceApp.Filter  ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${HSS_DataReference}  Filter_Special
    HSS_DataReferenceApp.Filter special characters  ${AdministrationScenarios}

Delete DataReferences
    [Documentation]   Verify The Delete function on the DataReferences page of HSS    [ims]
    [Tags]  HSS  HSS_DataReference   
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${HSS_DataReference}  Delete
    HSS_DataReferenceApp.Delete  ${AdministrationScenarios}