*** Settings ***
*** Settings ***
Documentation  This is all tests of IBCF_SCSCF
Resource  ../../Resources/DataManager.robot
Resource  ../../Data/InputData.robot
Resource  ../../Resources/Common.robot
Resource  ../../Resources/IBCF/IBCF_SCSCFApp.robot

#Test Setup      Common.Begin Web Test
Test Teardown   Common.End Web Test

*** Tasks ***



########################################## Capability ###########################################
Add Capability
    [Documentation]    Verify the functionality of 'Add Capability' on the IBCF page
    [Tags]  IBCF    IBCF_SCSCF    IBCF_SCSCF_Capability  
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_SCSCF}  Capability_Add
    IBCF_SCSCFApp.Add Capability   ${AdministrationScenarios}

Add Invalid Capability
    [Documentation]    Verify the functionality of 'Add Invalid Capability' on the IBCF page
    [Tags]  IBCF    IBCF_SCSCF    IBCF_SCSCF_Capability   
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_SCSCF}  Capability_Add_Errors
    IBCF_SCSCFApp.Add Invalid Capability   ${AdministrationScenarios}

Edit Capability
    [Documentation]    Verify the functionality of 'Edit Capability' on the IBCF page
    [Tags]  IBCF    IBCF_SCSCF    IBCF_SCSCF_Capability  
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_SCSCF}  Capability_Edit
    IBCF_SCSCFApp.Edit Capability   ${AdministrationScenarios}

Edit Invalid Capability
    [Documentation]    Verify the functionality of 'Edit Invalid Capability' on the IBCF page
    [Tags]  IBCF    IBCF_SCSCF    IBCF_SCSCF_Capability     
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_SCSCF}  Capability_Edit_Errors
    IBCF_SCSCFApp.Edit Invalid Capability   ${AdministrationScenarios}

Sort Capability
    [Documentation]    Verify the functionality of 'Sort Capability' on the IBCF page
    [Tags]  IBCF    IBCF_SCSCF    IBCF_SCSCF_Capability   
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_SCSCF}  Capability_Sort
    IBCF_SCSCFApp.Sort Capability   ${AdministrationScenarios}

View Capability
    [Documentation]    Verify the functionality of 'View Capability' on the IBCF page
    [Tags]  IBCF    IBCF_SCSCF    IBCF_SCSCF_Capability    
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_SCSCF}  Capability_View
    IBCF_SCSCFApp.View Capability   ${AdministrationScenarios}

Filter Capability
    [Documentation]    Verify the functionality of 'Filter Capability' on the IBCF page
    [Tags]  IBCF    IBCF_SCSCF    IBCF_SCSCF_Capability  
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_SCSCF}  Capability_Filter
    IBCF_SCSCFApp.Filter Capability   ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_SCSCF}  Capability_Filter_Spechar
    IBCF_SCSCFApp.Filter Special Character Capability   ${AdministrationScenarios}

Delete Capability
    [Documentation]    Verify the functionality of 'Delete Capability' on the IBCF page
    [Tags]  IBCF    IBCF_SCSCF    IBCF_SCSCF_Capability    
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_SCSCF}  Capability_Delete
    IBCF_SCSCFApp.Delete Capability   ${AdministrationScenarios}






################################################# SCSCF ##########################################################

Add Valid Scscf
   [Documentation]    Verify the functionality of 'Add Scscf' on the IBCF page
    [Tags]  IBCF    IBCF_SCSCF    IBCF_SCSCF_Scscf 
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_SCSCF}  Scscf
    IBCF_SCSCFApp.Add Scscf   ${AdministrationScenarios}

Add Invalid Scscf
    [Documentation]    Verify the functionality of 'Add Invalid Scscf' on the IBCF page
    [Tags]  IBCF    IBCF_SCSCF    IBCF_SCSCF_Scscf   
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_SCSCF}  Scscf_Errors
    IBCF_SCSCFApp.Add Invalid Scscf   ${AdministrationScenarios}

Edit Scscf
    [Documentation]    Verify the functionality of 'Edit Scscf' on the IBCF page
    [Tags]  IBCF    IBCF_SCSCF    IBCF_SCSCF_Scscf 
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_SCSCF}  Scscf_Edit
    IBCF_SCSCFApp.Edit Scscf   ${AdministrationScenarios}

Edit Invalid Scscf
    [Documentation]    Verify the functionality of 'Edit Invalid Scscf' on the IBCF page
    [Tags]  IBCF    IBCF_SCSCF    IBCF_SCSCF_Scscf  
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_SCSCF}  Scscf_Edit_Errors
    IBCF_SCSCFApp.Edit Invalid Scscf   ${AdministrationScenarios}

Sort Scscf
    [Documentation]    Verify the functionality of 'Sort Scscf' on the IBCF page
    [Tags]  IBCF    IBCF_SCSCF    IBCF_SCSCF_Scscf   
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_SCSCF}  Scscf_Sort
    IBCF_SCSCFApp.Sort Capability   ${AdministrationScenarios}

View Scscf
    [Documentation]    Verify the functionality of 'View Scscf' on the IBCF page
    [Tags]  IBCF    IBCF_SCSCF    IBCF_SCSCF_Scscf   
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_SCSCF}  Scscf_View
    IBCF_SCSCFApp.View Scscf   ${AdministrationScenarios}

Filter Scscf
    [Documentation]    Verify the functionality of 'Filter Scscf' on the IBCF page
    [Tags]  IBCF    IBCF_SCSCF    IBCF_SCSCF_Scscf 
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_SCSCF}  Scscf_Filter
    IBCF_SCSCFApp.Filter Scscf   ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_SCSCF}  Scscf_Filter_Spechar
    IBCF_SCSCFApp.Filter Special Character Scscf   ${AdministrationScenarios}

Delete Scscf
    [Documentation]    Verify the functionality of 'Delete Scscf' on the IBCF page
    [Tags]  IBCF    IBCF_SCSCF    IBCF_SCSCF_Scscf      
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_SCSCF}  Scscf_Delete
    IBCF_SCSCFApp.Delete Scscf   ${AdministrationScenarios}