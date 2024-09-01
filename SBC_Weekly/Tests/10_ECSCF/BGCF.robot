*** Settings ***
Documentation  This is all tests of BGCF in ECSCF
Resource  ../../Resources/DataManager.robot
Resource  ../../Data/InputData.robot
Resource  ../../Resources/Common.robot
Resource  ../../Resources/ECSCF/ECSCF_BGCFApp.robot

#Test Setup      Common.Begin Web Test
Test Teardown   Common.End Web Test

*** Tasks ***

Add BGCF
    [Documentation]   Verify The Add function on the BGCF page of ECSCF
    [Tags]   	ECSCF    ECSCF_BGCF	
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${ECSCF_BGCF}  Add
    ECSCF_BGCFApp.Add  ${AdministrationScenarios}

Add Invalid BGCF
    [Documentation]   Verify The Add Invalid function on the BGCF page of ECSCF
    [Tags]   	ECSCF    ECSCF_BGCF	  
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${ECSCF_BGCF}  Add_Errors
    ECSCF_BGCFApp.Add Invalid  ${AdministrationScenarios}

View BGCF
    [Documentation]   Verify The View function on the BGCF page of ECSCF
    [Tags]   	ECSCF    ECSCF_BGCF	  
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${ECSCF_BGCF}  View
    ECSCF_BGCFApp.View  ${AdministrationScenarios}

Sort BGCF
    [Documentation]   Verify The Sort function on the BGCF page of ECSCF
    [Tags]   	ECSCF    ECSCF_BGCF	    
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${ECSCF_BGCF}  Sort
    ECSCF_BGCFApp.Sort  ${AdministrationScenarios}

Filter BGCF
    [Documentation]   Verify The Filter function on the BGCF page of ECSCF
    [Tags]   	ECSCF    ECSCF_BGCF	  
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${ECSCF_BGCF}  Filter
    ECSCF_BGCFApp.Filter  ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${ECSCF_BGCF}  Filter_special
    ECSCF_BGCFApp.Filter special characters  ${AdministrationScenarios}

Edit Invalid BGCF
    [Documentation]   Verify The Edit Invalid function on the BGCF page of ECSCF
    [Tags]   	ECSCF    ECSCF_BGCF	      
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${ECSCF_BGCF}  Edit_Errors
    ECSCF_BGCFApp.Edit Invalid  ${AdministrationScenarios}

Edit BGCF
    [Documentation]   Verify The Edit function on the BGCF page of ECSCF
    [Tags]   	ECSCF    ECSCF_BGCF	
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${ECSCF_BGCF}  Edit
    ECSCF_BGCFApp.Edit  ${AdministrationScenarios}

Delete BGCF
    [Documentation]   Verify The Delete function on the BGCF page of ECSCF
    [Tags]   	ECSCF    ECSCF_BGCF		     
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${ECSCF_BGCF}  Delete
    ECSCF_BGCFApp.Delete  ${AdministrationScenarios}
