*** Settings ***
Documentation  This is all tests of ICSCF of PCSCF
Resource  ../../Resources/DataManager.robot
Resource  ../../Data/InputData.robot
Resource  ../../Resources/Common.robot
Resource  ../../Resources/PCSCF/PCSCF_I_ECSCFApp.robot

#Test Setup      Common.Begin Web Test
Test Teardown   Common.End Web Test

*** Tasks ***

################################### ICSCF #####################################

Add ICSCF
    [Documentation]    Verify the functionality of 'Add ICSCF' on the PCSCF page
    [Tags]  PCSCF  PCSCF_ICSCF  
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_I_ECSCF}		ICSCF_Add
    PCSCF_I_ECSCFApp.Add ICSCF   ${AdministrationScenarios}

Sort ICSCF
    [Documentation]    Verify the functionality of 'Sort ICSCF' on the PCSCF page
    [Tags]  PCSCF    PCSCF_ICSCF    
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_I_ECSCF}  ICSCF_Sort
    PCSCF_I_ECSCFApp.Sort ICSCF   ${AdministrationScenarios}

View ICSCF
    [Documentation]    Verify the functionality of 'View ICSCF' on the PCSCF page
    [Tags]  PCSCF    PCSCF_ICSCF    
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_I_ECSCF}  ICSCF_View
    PCSCF_I_ECSCFApp.View ICSCF   ${AdministrationScenarios}

Filter ICSCF
    [Documentation]    Verify the functionality of 'Filter ICSCF' on the PCSCF page
    [Tags]  PCSCF    PCSCF_ICSCF  
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_I_ECSCF}  ICSCF_Filter
    PCSCF_I_ECSCFApp.Filter ICSCF   ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_I_ECSCF}  Filter_Spechar
    PCSCF_I_ECSCFApp.Filter Special Character ICSCF   ${AdministrationScenarios}

Edit ICSCF
    [Documentation]    Verify the functionality of 'Edit ICSCF' on the PCSCF page
    [Tags]  PCSCF  PCSCF_ICSCF   
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_I_ECSCF}		ICSCF_Edit
    PCSCF_I_ECSCFApp.Edit ICSCF   ${AdministrationScenarios}

Delete ICSCF
    [Documentation]    Verify the functionality of 'Delete ICSCF' on the PCSCF page
    [Tags]  PCSCF  PCSCF_ICSCF     
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_I_ECSCF}		ICSCF_Delete
     PCSCF_I_ECSCFApp.Delete ICSCF   ${AdministrationScenarios}





################################ ECSCF ##########################################

Add ECSCF
    [Documentation]    Verify the functionality of 'Add ECSCF' on the PCSCF page
    [Tags]  PCSCF  PCSCF_ECSCF  
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_I_ECSCF}		ECSCF_Add
    PCSCF_I_ECSCFApp.Add ECSCF   ${AdministrationScenarios}

Sort ECSCF
    [Documentation]    Verify the functionality of 'Sort ECSCF' on the PCSCF page
    [Tags]  PCSCF  PCSCF_ECSCF       
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_I_ECSCF}  ECSCF_Sort
    PCSCF_I_ECSCFApp.Sort ECSCF   ${AdministrationScenarios}

View ECSCF
    [Documentation]    Verify the functionality of 'View ECSCF' on the PCSCF page
    [Tags]  PCSCF  PCSCF_ECSCF  
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_I_ECSCF}  ECSCF_View
    PCSCF_I_ECSCFApp.View ECSCF   ${AdministrationScenarios}

Filter ECSCF
    [Documentation]    Verify the functionality of 'Filter ECSCF' on the PCSCF page
    [Tags]  PCSCF  PCSCF_ECSCF    
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_I_ECSCF}  ECSCF_Filter
    PCSCF_I_ECSCFApp.Filter ECSCF   ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_I_ECSCF}  Filter_Spechar
    PCSCF_I_ECSCFApp.Filter Special Character ECSCF   ${AdministrationScenarios}

Edit ECSCF
    [Documentation]    Verify the functionality of 'Edit ECSCF' on the PCSCF page
    [Tags]  PCSCF  PCSCF_ECSCF  
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_I_ECSCF}		ECSCF_Edit
    PCSCF_I_ECSCFApp.Edit ECSCF   ${AdministrationScenarios}

Delete ECSCF
    [Documentation]    Verify the functionality of 'Delete ECSCF' on the PCSCF page
    [Tags]  PCSCF  PCSCF_ECSCF   
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_I_ECSCF}		ECSCF_Delete
    PCSCF_I_ECSCFApp.Delete ECSCF   ${AdministrationScenarios}