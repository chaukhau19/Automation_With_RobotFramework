*** Settings ***
*** Settings ***
Documentation  This is all tests of ICSCF_SCSCF
Resource  ../../Resources/DataManager.robot
Resource  ../../Data/InputData.robot
Resource  ../../Resources/Common.robot
Resource  ../../Resources/ICSCF/ICSCF_SCSCFApp.robot

Test Setup      Common.Begin Web Test
Test Teardown   Common.End Web Test

*** Tasks ***
### Capability #########################################################################################################	

Delete Capability
    [Documentation]     Delete proper Capability for ICSCF_SCSCF
    [Tags]  Smoke  ICSCF_Capability	ims47  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${ICSCF_SCSCF}  Capability_Delete
    ICSCF_SCSCFApp.Delete Capability   ${AdministrationScenarios}

Add Capability
    [Documentation]     Add proper Capability for ICSCF_SCSCF
    [Tags]  Smoke  ICSCF_Capability	 ims47
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${ICSCF_SCSCF}  Capability
    ICSCF_SCSCFApp.Add Capability   ${AdministrationScenarios}

Add Invalid Capability
    [Documentation]     Add invalid Capability for ICSCF_SCSCF
    [Tags]    ICSCF_Capability	ims47  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${ICSCF_SCSCF}  Capability_Errors
    ICSCF_SCSCFApp.Add Invalid Capability   ${AdministrationScenarios}

Edit Capability
    [Documentation]     Edit proper Capability for ICSCF_SCSCF
    [Tags]  Smoke  ICSCF_Capability	 ims47
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${ICSCF_SCSCF}  Capability_Edit
    ICSCF_SCSCFApp.Edit Capability   ${AdministrationScenarios}

Edit Invalid Capability
    [Documentation]     Edit invalid Capability for ICSCF_SCSCF
    [Tags]    ICSCF_Capability	ims47  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${ICSCF_SCSCF}  Capability_Edit_Errors
    ICSCF_SCSCFApp.Edit Invalid Capability   ${AdministrationScenarios}

Sort Capability
    [Documentation]     Sort proper Capability for ICSCF_SCSCF
    [Tags]    ICSCF_Capability	ims47  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${ICSCF_SCSCF}  Capability_Edit
    ICSCF_SCSCFApp.Sort Capability   ${AdministrationScenarios}

View Capability
    [Documentation]     View proper Capability for ICSCF_SCSCF
    [Tags]    ICSCF_Capability	ims47  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${ICSCF_SCSCF}  Capability_Edit
    ICSCF_SCSCFApp.View Capability   ${AdministrationScenarios}

Filter Capability
    [Documentation]     Filter proper Capability for ICSCF_SCSCF
    [Tags]    ICSCF_Capability	ims47  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${ICSCF_SCSCF}  Capability_Filter
    ICSCF_SCSCFApp.Filter Capability   ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${ICSCF_SCSCF}  Capability_Filter_Spechar
    ICSCF_SCSCFApp.Filter Special Character Capability   ${AdministrationScenarios}



### SCSCF #########################################################################################################
	

Add Scscf
    [Documentation]     Add proper Scscf for ICSCF_SCSCF
    [Tags]  Smoke  ICSCF_Scscf	ims47
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${ICSCF_SCSCF}  Scscf
    ICSCF_SCSCFApp.Add Scscf   ${AdministrationScenarios}

Add Invalid Scscf
    [Documentation]     Add invalid Scscf for ICSCF_SCSCF
    [Tags]    Scscf	 ims47  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${ICSCF_SCSCF}  Scscf_Errors
    ICSCF_SCSCFApp.Add Invalid Scscf   ${AdministrationScenarios}

Edit Scscf
    [Documentation]     Edit proper Scscf for ICSCF_SCSCF
    [Tags]  Smoke  ICSCF_Scscf	ims47
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${ICSCF_SCSCF}  Scscf_Edit
    ICSCF_SCSCFApp.Edit Scscf   ${AdministrationScenarios}

Edit Invalid Scscf
    [Documentation]     Edit invalid Scscf for ICSCF_SCSCF
    [Tags]    ICSCF_Scscf  ims47  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${ICSCF_SCSCF}  Scscf_Edit_Errors
    ICSCF_SCSCFApp.Edit Invalid Scscf   ${AdministrationScenarios}

Sort Scscf
    [Documentation]     Sort proper Scscf for ICSCF_SCSCF
    [Tags]    ICSCF_Scscf  ims47  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${ICSCF_SCSCF}  Scscf_Edit
    ICSCF_SCSCFApp.Sort Capability   ${AdministrationScenarios}

View Scscf
    [Documentation]     View proper Scscf for ICSCF_SCSCF
    [Tags]    ICSCF_Capability	ims47  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${ICSCF_SCSCF}  Scscf_Edit
    ICSCF_SCSCFApp.View Scscf   ${AdministrationScenarios}

Filter Scscf
    [Documentation]     Filter proper Scscf for ICSCF_SCSCF
    [Tags]    ICSCF_Scscf  ims47  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${ICSCF_SCSCF}  Scscf_Filter
    ICSCF_SCSCFApp.Filter Scscf   ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${ICSCF_SCSCF}  Scscf_Filter_Spechar
    ICSCF_SCSCFApp.Filter Special Character Scscf   ${AdministrationScenarios}

Delete Scscf
    [Documentation]     Delete proper Scscf for ICSCF_SCSCF
    [Tags]  Smoke  ICSCF_Scscf	ims47  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${ICSCF_SCSCF}  Scscf_Delete
    ICSCF_SCSCFApp.Delete Scscf   ${AdministrationScenarios}

	
