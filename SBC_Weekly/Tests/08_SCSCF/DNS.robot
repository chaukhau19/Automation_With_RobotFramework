*** Settings ***
Documentation  This is all tests of DNS of SCSCF
Resource  ../../Resources/DataManager.robot
Resource  ../../Data/InputData.robot
Resource  ../../Resources/Common.robot
Resource  ../../Resources/SCSCF/SCSCF_DNSApp.robot

#Test Setup      Common.Begin Web Test
Test Teardown   Common.End Web Test

*** Tasks ***

Edit DNS
    [Documentation]   Verify The Edit function on the DNS page of SCSCF    [ims]
    [Tags]     SCSCF    SCSCF_DNS    SCSCF_DNS_Resolver
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${SCSCF_DNS}  Edit_DNS
    SCSCF_DNSApp.Edit  ${AdministrationScenarios}

Add Resolver
    [Documentation]   Verify The Add function on the Resolver page of SCSCF    [ims]
    [Tags]     SCSCF    SCSCF_DNS    SCSCF_DNS_Resolver
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${SCSCF_DNS}  Add_Resolver
    SCSCF_DNSApp.Add Valid Cases  ${AdministrationScenarios}

Add Invalid Resolver
    [Documentation]   Verify The Add Invalid function on the Resolver page of SCSCF    [ims]
    [Tags]     SCSCF    SCSCF_DNS    SCSCF_DNS_Resolver 
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${SCSCF_DNS}  Add_Errors
    SCSCF_DNSApp.Add Invalid Cases  ${AdministrationScenarios}

Filter Resolver
    [Documentation]   Verify The Filter function on the Resolver page of SCSCF    [ims]
    [Tags]     SCSCF    SCSCF_DNS    SCSCF_DNS_Resolver 
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${SCSCF_DNS}  Filter_Resolver
    SCSCF_DNSApp.Filter Cases  ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${SCSCF_DNS}  Filter_Spechar
    SCSCF_DNSApp.Filter Special Cases  ${AdministrationScenarios}

# View Resolver
#     [Documentation]   Verify The View function on the Resolver page of SCSCF    [ims]
#     [Tags]     SCSCF    SCSCF_DNS    SCSCF_DNS_Resolver 
#     ${AdministrationScenarios} =  DataManager.Get Excel Data  ${SCSCF_DNS}  View_Resolver
#     SCSCF_DNSApp.View Cases  ${AdministrationScenarios}

Sort Resolver
    [Documentation]   Verify The Sort function on the Resolver page of SCSCF    [ims]
    [Tags]     SCSCF    SCSCF_DNS    SCSCF_DNS_Resolver  
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${SCSCF_DNS}  Sort
    SCSCF_DNSApp.Sort Cases  ${AdministrationScenarios}

Edit Resolver
    [Documentation]   Verify The Edit function on the Resolver page of SCSCF    [ims]
    [Tags]    SCSCF  SCSCF_Resolver
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${SCSCF_DNS}  Edit_Resolver
    SCSCF_DNSApp.Edit Valid Cases  ${AdministrationScenarios}

Edit Invalid Resolver
    [Documentation]   Verify The Edit Invalid function on the Resolver page of SCSCF    [ims]
    [Tags]     SCSCF    SCSCF_DNS    SCSCF_DNS_Resolver
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${SCSCF_DNS}  Edit_Errors
    SCSCF_DNSApp.Edit Invalid Cases  ${AdministrationScenarios}

Delete Resolver
    [Documentation]   Verify The Delete function on the Resolver page of SCSCF    [ims]
    [Tags]    SCSCF  SCSCF_Resolver
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${SCSCF_DNS}  Delete_Resolver
    SCSCF_DNSApp.Delete Cases  ${AdministrationScenarios}
