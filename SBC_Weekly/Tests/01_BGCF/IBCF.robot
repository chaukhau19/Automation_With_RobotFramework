*** Settings ***
Documentation  All manipulation IBCF section
Resource  ../../Resources/DataManager.robot
Resource  ../../Data/InputData.robot
Resource  ../../Resources/Common.robot
Resource  ../../Resources/BGCF/BGCF_IBCFApp.robot

# Test Setup      Common.Begin Web Test
Test Teardown   Common.End Web Test

*** Tasks ***


Add IBCF
    [Documentation]    Verify the functionality of 'Add IBCF' on the BGCF page
    [Tags]  BGCF  BGCF_IBCF    
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${BGCF_IBCF}  Add_Valid
    BGCF_IBCFApp.Add Valid Cases   ${AdministrationScenarios}
	
Add Invalid IBCF
    [Documentation]     Verify the functionality of 'Add Invalid IBCF' on the BGCF page
    [Tags]  BGCF  BGCF_IBCF          
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${BGCF_IBCF}  Add_Invalid
    BGCF_IBCFApp.Add Invalid Cases   ${AdministrationScenarios}

	
Filter IBCF
    [Documentation]      Verify the functionality of 'Filter IBCF' on the BGCF page
    [Tags]  BGCF    BGCF_IBCF            
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${BGCF_IBCF}  Filter
    BGCF_IBCFApp.Filter Cases   ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${BGCF_IBCF}  Filter_Spechar
    BGCF_IBCFApp.Filter Special Cases   ${AdministrationScenarios}

	
View IBCF
    [Documentation]     Verify the functionality of 'View IBCF' on the BGCF page
    [Tags]  BGCF    BGCF_IBCF             
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${BGCF_IBCF}  View
    BGCF_IBCFApp.View Cases   ${AdministrationScenarios}

	
Sort IBCF
    [Documentation]     Verify the functionality of 'Edit Valid IBCF' on the BGCF page
    [Tags]  BGCF    BGCF_IBCF       
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${BGCF_IBCF}  Sort
    BGCF_IBCFApp.Sort Cases   ${AdministrationScenarios}

	
Edit IBCF
    [Documentation]     Verify the functionality of 'Edit Valid IBCF' on the BGCF page
    [Tags]  BGCF    BGCF_IBCF     
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${BGCF_IBCF}  Edit_Valid
    BGCF_IBCFApp.Edit Valid Cases   ${AdministrationScenarios}

	
Edit Invalid IBCF
    [Documentation]      Verify the functionality of 'Edit Invalid IBCF' on the BGCF page
    [Tags]  BGCF    BGCF_IBCF          
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${BGCF_IBCF}  Edit_Invalid
    BGCF_IBCFApp.Edit Invalid Cases   ${AdministrationScenarios}

	
Delete IBCF
    [Documentation]      Verify the functionality of 'Delete IBCF' on the BGCF page
    [Tags]  BGCF    BGCF_IBCF       
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${BGCF_IBCF}  Delete
    BGCF_IBCFApp.Delete Cases  ${AdministrationScenarios}