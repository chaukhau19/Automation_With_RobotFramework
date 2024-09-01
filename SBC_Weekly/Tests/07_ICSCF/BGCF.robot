*** Settings ***
Documentation  This is all tests of BGCF in ICSCF
Resource  ../../Resources/DataManager.robot
Resource  ../../Data/InputData.robot
Resource  ../../Resources/Common.robot
Resource  ../../Resources/ICSCF/ICSCF_BGCFApp.robot

#Test Setup      Common.Begin Web Test
Test Teardown   Common.End Web Test

*** Tasks ***

Add BGCF
    [Documentation]   Verify The Add function on the BGCF page of ICSCF    [ims]
    [Tags]  ICSCF  ICSCF_BGCF    
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${ICSCF_BGCF}  Add
    ICSCF_BGCFApp.Add  ${AdministrationScenarios}

Add Invalid BGCF
    [Documentation]   Verify The Add Invalid function on the BGCF page of ICSCF    [ims]
    [Tags]  ICSCF  ICSCF_BGCF    
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${ICSCF_BGCF}  Add_Errors
    ICSCF_BGCFApp.Add Invalid  ${AdministrationScenarios}

View BGCF
    [Documentation]   Verify The View function on the BGCF page of ICSCF    [ims]
    [Tags]  ICSCF  ICSCF_BGCF
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${ICSCF_BGCF}  View
    ICSCF_BGCFApp.View  ${AdministrationScenarios}

Sort BGCF
    [Documentation]   Verify The Sort function on the BGCF page of ICSCF    [ims]
    [Tags]  ICSCF  ICSCF_BGCF       
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${ICSCF_BGCF}  Add
    ICSCF_BGCFApp.Sort  ${AdministrationScenarios}

Filter BGCF
    [Documentation]   Verify The Filter function on the BGCF page of ICSCF    [ims]
    [Tags]  ICSCF  ICSCF_BGCF      
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${ICSCF_BGCF}  Filter
    ICSCF_BGCFApp.Filter  ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${ICSCF_BGCF}  Filter_special
    ICSCF_BGCFApp.Filter special characters  ${AdministrationScenarios}


Edit BGCF
    [Documentation]   Verify The Edit Invalid function on the BGCF page of ICSCF    [ims]
    [Tags]  ICSCF  ICSCF_BGCF      
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${ICSCF_BGCF}  Edit
    ICSCF_BGCFApp.Edit  ${AdministrationScenarios}
    
Edit Invalid BGCF
    [Documentation]   Verify The Edit function on the BGCF page of ICSCF    [ims]
    [Tags]  ICSCF  ICSCF_BGCF      
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${ICSCF_BGCF}  Edit_Errors
    ICSCF_BGCFApp.Edit Invalid  ${AdministrationScenarios}


Delete BGCF
    [Documentation]   Verify The Delete function on the BGCF page of ICSCF    [ims]
    [Tags]  ICSCF  ICSCF_BGCF    
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${ICSCF_BGCF}  Delete
    ICSCF_BGCFApp.Delete  ${AdministrationScenarios}