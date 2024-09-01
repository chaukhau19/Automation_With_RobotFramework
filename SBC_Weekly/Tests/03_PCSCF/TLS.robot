*** Settings ***
Documentation  This is all tests of PCSCF_TLS
Resource  ../../Resources/DataManager.robot
Resource  ../../Data/InputData.robot
Resource  ../../Resources/Common.robot
Resource  ../../Resources/PCSCF/PCSCF_TlsApp.robot

#Test Setup      Common.Begin Web Test
Test Teardown   Common.End Web Test

*** Tasks ***

Add TLS
    [Documentation]    Verify the functionality of 'Add TLS' on the PCSCF page    [IMP_18199]
    [Tags]   PCSCF     PCSCF_TLS      
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_TLS}  TLS
    PCSCF_TlsApp.Add TLSPCSCF  ${AdministrationScenarios}

Sort TLS
    [Documentation]    Verify the functionality of 'Sort TLS' on the PCSCF page    [IMP_18199]
    [Tags]   PCSCF     PCSCF_TLS    
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_TLS}  Sort
    PCSCF_TlsApp.Sort TLSPCSCF   ${AdministrationScenarios}

# View TLS
#     [Documentation]    Verify the functionality of 'View TLS' on the PCSCF page    [IMP_18199]
#     [Tags]   PCSCF     PCSCF_TLS   
#     ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_TLS}  View
#     PCSCF_TlsApp.View TLSPCSCF   ${AdministrationScenarios}

Filter TLS
    [Documentation]    Verify the functionality of 'Filter TLS' on the PCSCF page    [IMP_18199]
    [Tags]   PCSCF     PCSCF_TLS  
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_TLS}  Filter
    PCSCF_TlsApp.Filter TLSPCSCF   ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_TLS}  TLS_Filter_Spechar
    PCSCF_TlsApp.Filter Special Character TLSPCSCF   ${AdministrationScenarios}

Edit TLS
    [Documentation]    Verify the functionality of 'Edit TLS' on the PCSCF page    [IMP_18199]
    [Tags]   PCSCF     PCSCF_TLS   
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_TLS}  TLS_Edit
    PCSCF_TlsApp.Edit TLSPCSCF  ${AdministrationScenarios}

Delete TLS
    [Documentation]    Verify the functionality of 'Delete TLS' on the PCSCF page    [IMP_18199]
    [Tags]   PCSCF     PCSCF_TLS    
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_TLS}  TLS_Delete
    PCSCF_TlsApp.Delete TLSPCSCF  ${AdministrationScenarios}
