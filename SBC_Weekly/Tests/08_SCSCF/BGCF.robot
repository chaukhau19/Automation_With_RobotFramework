*** Settings ***
Documentation  This is all tests of BGCF in SCSCF
Resource  ../../Resources/DataManager.robot
Resource  ../../Data/InputData.robot
Resource  ../../Resources/Common.robot
Resource  ../../Resources/SCSCF/SCSCF_BGCFApp.robot

#Test Setup      Common.Begin Web Test
Test Teardown   Common.End Web Test

*** Tasks ***

Add BGCF
    [Documentation]   Verify The Add function on the BGCF page of SCSCF    [ims]
    [Tags]    SCSCF     SCSCF_BGCF   
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${SCSCF_BGCF}  Add
    SCSCF_BGCFApp.Add  ${AdministrationScenarios}


Add Invalid BGCF
    [Documentation]   Verify The Add Invalid function on the BGCF page of SCSCF    [ims]
    [Tags]    SCSCF     SCSCF_BGCF     
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${SCSCF_BGCF}  Add_Errors
    SCSCF_BGCFApp.Add Invalid  ${AdministrationScenarios}


View BGCF
    [Documentation]   Verify The View function on the BGCF page of SCSCF    [ims]
    [Tags]    SCSCF     SCSCF_BGCF   
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${SCSCF_BGCF}  View
    SCSCF_BGCFApp.View  ${AdministrationScenarios}

Sort BGCF
    [Documentation]   Verify The Sort function on the BGCF page of SCSCF    [ims]
    [Tags]    SCSCF     SCSCF_BGCF    
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${SCSCF_BGCF}  Sort
    SCSCF_BGCFApp.Sort  ${AdministrationScenarios}

Filter BGCF
    [Documentation]   Verify The Filter function on the BGCF page of SCSCF    [ims]
    [Tags]    SCSCF     SCSCF_BGCF     
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${SCSCF_BGCF}  Filter
    SCSCF_BGCFApp.Filter  ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${SCSCF_BGCF}  Filter_characters
    SCSCF_BGCFApp.Filter special characters  ${AdministrationScenarios}

Edit Invalid BGCF
    [Documentation]   Verify The Edit Invalid function on the BGCF page of SCSCF    [ims]
    [Tags]    SCSCF     SCSCF_BGCF   
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${SCSCF_BGCF}  Edit_Errors
    SCSCF_BGCFApp.Edit Invalid  ${AdministrationScenarios}

Edit BGCF
    [Documentation]   Verify The Edit function on the BGCF page of SCSCF    [ims]
    [Tags]    SCSCF     SCSCF_BGCF   
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${SCSCF_BGCF}  Edit
    SCSCF_BGCFApp.Edit  ${AdministrationScenarios}

Delete BGCF
    [Documentation]   Verify The Delete function on the BGCF page of SCSCF    [ims]
    [Tags]    SCSCF     SCSCF_BGCF  
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${SCSCF_BGCF}  Delete
    SCSCF_BGCFApp.Delete  ${AdministrationScenarios}

