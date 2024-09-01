*** Settings ***
Documentation  This is all tests of DNS of ICSCF
Resource  ../../Resources/DataManager.robot
Resource  ../../Data/InputData.robot
Resource  ../../Resources/Common.robot
Resource  ../../Resources/ICSCF/ICSCF_DNSApp.robot

#Test Setup      Common.Begin Web Test
Test Teardown   Common.End Web Test

*** Tasks ***

Edit DNS
    [Documentation]   Verify The Edit function on the DNS page of ICSCF    [ims]
    [Tags]    ICSCF    ICSCF_DNS    ICSCF_DNS_Resolver 
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${ICSCF_DNS}  Edit_DNS
    ICSCF_DNSApp.Edit  ${AdministrationScenarios}

Add Resolver
    [Documentation]   Verify The Add function on the Resolver page of ICSCF    [ims]
    [Tags]    ICSCF    ICSCF_DNS    ICSCF_DNS_Resolver   
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${ICSCF_DNS}  Add_Resolver
    ICSCF_DNSApp.Add Valid Cases  ${AdministrationScenarios}

Add Invalid Resolver
    [Documentation]   Verify The Add Invalid function on the Resolver page of ICSCF    [ims]
    [Tags]    ICSCF    ICSCF_DNS    ICSCF_DNS_Resolver     
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${ICSCF_DNS}  Add_Errors
    ICSCF_DNSApp.Add Invalid Cases  ${AdministrationScenarios}

Filter Resolver
    [Documentation]   Verify The Filter function on the Resolver page of ICSCF    [ims]
    [Tags]    ICSCF    ICSCF_DNS    ICSCF_DNS_Resolver      
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${ICSCF_DNS}  Filter_Resolver
    ICSCF_DNSApp.Filter Cases  ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${ICSCF_DNS}  Filter_Spechar
    ICSCF_DNSApp.Filter Special Cases  ${AdministrationScenarios}

# View Resolver
#     [Documentation]   Verify The View function on the Resolver page of ICSCF    [ims]
#     [Tags]    ICSCF    ICSCF_DNS    ICSCF_DNS_Resolver  
#     ${AdministrationScenarios} =  DataManager.Get Excel Data  ${ICSCF_DNS}  View_Resolver
#     ICSCF_DNSApp.View Cases  ${AdministrationScenarios}

Sort Resolver
    [Documentation]   Verify The Sort function on the Resolver page of ICSCF    [ims]
    [Tags]    ICSCF    ICSCF_DNS    ICSCF_DNS_Resolver   
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${ICSCF_DNS}  Sort
    ICSCF_DNSApp.Sort Cases  ${AdministrationScenarios}

Edit Resolver
    [Documentation]   Verify The Edit function on the Resolver page of ICSCF    [ims]
    [Tags]    ICSCF    ICSCF_DNS    ICSCF_DNS_Resolver 
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${ICSCF_DNS}  Edit_Resolver
    ICSCF_DNSApp.Edit Valid Cases  ${AdministrationScenarios}

Edit Invalid Resolver
    [Documentation]   Verify The Edit Invalid function on the Resolver page of ICSCF    [ims]
    [Tags]    ICSCF    ICSCF_DNS    ICSCF_DNS_Resolver     
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${ICSCF_DNS}  Edit_Errors
    ICSCF_DNSApp.Edit Invalid Cases  ${AdministrationScenarios}

Delete Resolver
    [Documentation]   Verify The Delete function on the Resolver page of ICSCF    [ims]
    [Tags]    ICSCF    ICSCF_DNS    ICSCF_DNS_Resolver    
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${ICSCF_DNS}  Delete_Resolver
    ICSCF_DNSApp.Delete Cases  ${AdministrationScenarios}