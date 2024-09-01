*** Settings ***
*** Settings ***
Documentation  This is all tests of ICSCF_SCSCF
Resource  ../../Resources/DataManager.robot
Resource  ../../Data/InputData.robot
Resource  ../../Resources/Common.robot
Resource  ../../Resources/ICSCF/ICSCF_SCSCFApp.robot

#Test Setup      Common.Begin Web Test
Test Teardown   Common.End Web Test

*** Tasks ***


################################# Capability ############################################
Delete Capability
    [Documentation]   Verify The Delete function on the Capability page of ICSCF    [ims]
    [Tags]    ICSCF    ICSCF_SCSCF    ICSCF_SCSCF_Capability
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${ICSCF_SCSCF}  Capability_Delete
    ICSCF_SCSCFApp.Delete Capability   ${AdministrationScenarios}

Add Capability
    [Documentation]   Verify The Add function on the Capability page of ICSCF    [ims]
    [Tags]    ICSCF    ICSCF_SCSCF    ICSCF_SCSCF_Capability
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${ICSCF_SCSCF}  Capability
    ICSCF_SCSCFApp.Add Capability   ${AdministrationScenarios}

Add Invalid Capability
    [Documentation]   Verify The Add Invalid function on the Capability page of ICSCF    [ims]
    [Tags]    ICSCF    ICSCF_SCSCF    ICSCF_SCSCF_Capability
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${ICSCF_SCSCF}  Capability_Errors
    ICSCF_SCSCFApp.Add Invalid Capability   ${AdministrationScenarios}

Edit Capability
    [Documentation]   Verify The Edit function on the Capability page of ICSCF    [ims]
    [Tags]    ICSCF    ICSCF_SCSCF    ICSCF_SCSCF_Capability
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${ICSCF_SCSCF}  Capability_Edit
    ICSCF_SCSCFApp.Edit Capability   ${AdministrationScenarios}

Edit Invalid Capability
    [Documentation]   Verify The Edit Invalid function on the Capability page of ICSCF    [ims]
    [Tags]    ICSCF    ICSCF_SCSCF    ICSCF_SCSCF_Capability
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${ICSCF_SCSCF}  Capability_Edit_Errors
    ICSCF_SCSCFApp.Edit Invalid Capability   ${AdministrationScenarios}

Sort Capability
    [Documentation]   Verify The Sort function on the Capability page of ICSCF    [ims]
    [Tags]    ICSCF    ICSCF_SCSCF    ICSCF_SCSCF_Capability 
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${ICSCF_SCSCF}  Capability_Sort
    ICSCF_SCSCFApp.Sort Capability   ${AdministrationScenarios}

View Capability
    [Documentation]   Verify The View function on the Capability page of ICSCF    [ims]
    [Tags]    ICSCF    ICSCF_SCSCF    ICSCF_SCSCF_Capability	  
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${ICSCF_SCSCF}  Capability_View
    ICSCF_SCSCFApp.View Capability   ${AdministrationScenarios}

Filter Capability
    [Documentation]   Verify The Filter function on the Capability page of ICSCF    [ims]
    [Tags]    ICSCF    ICSCF_SCSCF    ICSCF_SCSCF_Capability	
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${ICSCF_SCSCF}  Capability_Filter
    ICSCF_SCSCFApp.Filter Capability   ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${ICSCF_SCSCF}  Capability_Filter_Spechar
    ICSCF_SCSCFApp.Filter Special Character Capability   ${AdministrationScenarios}



##################################### SCSCF ###########################################

Add Valid Scscf
    [Documentation]   Verify The Add function on the Scscf page of ICSCF    [ims]
    [Tags]    ICSCF    ICSCF_SCSCF    ICSCF_SCSCF_SCSCF
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${ICSCF_SCSCF}  Scscf
    ICSCF_SCSCFApp.Add Scscf   ${AdministrationScenarios}

Add Invalid Scscf
    [Documentation]   Verify The Add Invalid function on the Scscf page of ICSCF    [ims]
    [Tags]    ICSCF    ICSCF_SCSCF    ICSCF_SCSCF_SCSCF  
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${ICSCF_SCSCF}  Scscf_Errors
    ICSCF_SCSCFApp.Add Invalid Scscf   ${AdministrationScenarios}

Edit Scscf
    [Documentation]   Verify The Edit function on the Scscf page of ICSCF    [ims]
    [Tags]    ICSCF    ICSCF_SCSCF    ICSCF_SCSCF_SCSCF
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${ICSCF_SCSCF}  Scscf_Edit
    ICSCF_SCSCFApp.Edit Scscf   ${AdministrationScenarios}

Edit Invalid Scscf
    [Documentation]   Verify The Edit Invalid function on the Scscf page of ICSCF    [ims]
    [Tags]    ICSCF    ICSCF_SCSCF    ICSCF_SCSCF_SCSCF
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${ICSCF_SCSCF}  Scscf_Edit_Errors
    ICSCF_SCSCFApp.Edit Invalid Scscf   ${AdministrationScenarios}

Sort Scscf
    [Documentation]   Verify The Sort function on the Scscf page of ICSCF    [ims]
    [Tags]    ICSCF    ICSCF_SCSCF    ICSCF_SCSCF_SCSCF	  
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${ICSCF_SCSCF}  Scscf_Sort
    ICSCF_SCSCFApp.Sort Capability   ${AdministrationScenarios}

View Scscf
    [Documentation]   Verify The View function on the Scscf page of ICSCF    [ims]
    [Tags]    ICSCF    ICSCF_SCSCF    ICSCF_SCSCF_SCSCF
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${ICSCF_SCSCF}  Scscf_View
    ICSCF_SCSCFApp.View Scscf   ${AdministrationScenarios}

Filter Scscf
    [Documentation]   Verify The Filter function on the Scscf page of ICSCF    [ims]
    [Tags]    ICSCF    ICSCF_SCSCF    ICSCF_SCSCF_SCSCF  
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${ICSCF_SCSCF}  Scscf_Filter
    ICSCF_SCSCFApp.Filter Scscf   ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${ICSCF_SCSCF}  Scscf_Filter_Spechar
    ICSCF_SCSCFApp.Filter Special Character Scscf   ${AdministrationScenarios}

Delete Scscf
    [Documentation]   Verify The Delete function on the Scscf page of ICSCF    [ims]
    [Tags]    ICSCF    ICSCF_SCSCF    ICSCF_SCSCF_SCSCF	  
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${ICSCF_SCSCF}  Scscf_Delete
    ICSCF_SCSCFApp.Delete Scscf   ${AdministrationScenarios}

	
