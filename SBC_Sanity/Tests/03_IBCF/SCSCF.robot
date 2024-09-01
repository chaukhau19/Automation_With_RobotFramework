*** Settings ***
*** Settings ***
Documentation  This is all tests of IBCF_SCSCF
Resource  ../../Resources/DataManager.robot
Resource  ../../Data/InputData.robot
Resource  ../../Resources/Common.robot
Resource  ../../Resources/IBCF/IBCF_SCSCFApp.robot

Test Setup      Common.Begin Web Test
Test Teardown   Common.End Web Test

*** Tasks ***
### Capability #########################################################################################################	
Add Capability
    [Documentation]     Add proper Capability for IBCF_SCSCF
    [Tags]  Smoke  IBCF_Capability  sbc77
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_SCSCF}  Capability
    IBCF_SCSCFApp.Add Capability   ${AdministrationScenarios}

Add Invalid Capability
    [Documentation]     Add invalid Capability for IBCF_SCSCF
    [Tags]    IBCF_Capability  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_SCSCF}  Capability_Errors
    IBCF_SCSCFApp.Add Invalid Capability   ${AdministrationScenarios}

Edit Capability
    [Documentation]     Edit proper Capability for IBCF_SCSCF
    [Tags]  Smoke  IBCF_Capability  sbc77
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_SCSCF}  Capability_Edit
    IBCF_SCSCFApp.Edit Capability   ${AdministrationScenarios}

Edit Invalid Capability
    [Documentation]     Edit invalid Capability for IBCF_SCSCF
    [Tags]    IBCF_Capability  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_SCSCF}  Capability_Edit_Errors
    IBCF_SCSCFApp.Edit Invalid Capability   ${AdministrationScenarios}

Sort Capability
    [Documentation]     Sort proper Capability for IBCF_SCSCF
    [Tags]    IBCF_Capability  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_SCSCF}  Capability_Edit
    IBCF_SCSCFApp.Sort Capability   ${AdministrationScenarios}

View Capability
    [Documentation]     View proper Capability for IBCF_SCSCF
    [Tags]    IBCF_Capability  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_SCSCF}  Capability_Edit
    IBCF_SCSCFApp.View Capability   ${AdministrationScenarios}

Filter Capability
    [Documentation]     Filter proper Capability for IBCF_SCSCF
    [Tags]    IBCF_Capability  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_SCSCF}  Capability_Filter
    IBCF_SCSCFApp.Filter Capability   ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_SCSCF}  Capability_Filter_Spechar
    IBCF_SCSCFApp.Filter Special Character Capability   ${AdministrationScenarios}

Delete Capability
    [Documentation]     Delete proper Capability for IBCF_SCSCF
    [Tags]  Smoke  IBCF_Capability  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_SCSCF}  Capability_Delete
    IBCF_SCSCFApp.Delete Capability   ${AdministrationScenarios}

### SCSCF #########################################################################################################
	
Add Scscf
    [Documentation]     Add proper Scscf for IBCF_SCSCF
    [Tags]  Smoke  IBCF_Scscf  sbc77
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_SCSCF}  Scscf
    IBCF_SCSCFApp.Add Scscf   ${AdministrationScenarios}

Add Invalid Scscf
    [Documentation]     Add invalid Scscf for IBCF_SCSCF
    [Tags]    Scscf  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_SCSCF}  Scscf_Errors
    IBCF_SCSCFApp.Add Invalid Scscf   ${AdministrationScenarios}

Edit Scscf
    [Documentation]     Edit proper Scscf for IBCF_SCSCF
    [Tags]  Smoke  IBCF_Scscf  sbc77
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_SCSCF}  Scscf_Edit
    IBCF_SCSCFApp.Edit Scscf   ${AdministrationScenarios}

Edit Invalid Scscf
    [Documentation]     Edit invalid Scscf for IBCF_SCSCF
    [Tags]    IBCF_Scscf  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_SCSCF}  Scscf_Edit_Errors
    IBCF_SCSCFApp.Edit Invalid Scscf   ${AdministrationScenarios}

Sort Scscf
    [Documentation]     Sort proper Scscf for IBCF_SCSCF
    [Tags]    IBCF_Scscf  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_SCSCF}  Scscf_Edit
    IBCF_SCSCFApp.Sort Capability   ${AdministrationScenarios}

View Scscf
    [Documentation]     View proper Scscf for IBCF_SCSCF
    [Tags]    IBCF_Capability  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_SCSCF}  Scscf_Edit
    IBCF_SCSCFApp.View Scscf   ${AdministrationScenarios}

Filter Scscf
    [Documentation]     Filter proper Scscf for IBCF_SCSCF
    [Tags]    IBCF_Scscf  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_SCSCF}  Scscf_Filter
    IBCF_SCSCFApp.Filter Scscf   ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_SCSCF}  Scscf_Filter_Spechar
    IBCF_SCSCFApp.Filter Special Character Scscf   ${AdministrationScenarios}

Delete Scscf
    [Documentation]     Delete proper Scscf for IBCF_SCSCF
    [Tags]  Smoke  IBCF_Scscf  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_SCSCF}  Scscf_Delete
    IBCF_SCSCFApp.Delete Scscf   ${AdministrationScenarios}