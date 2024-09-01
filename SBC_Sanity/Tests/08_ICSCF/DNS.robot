*** Settings ***
Documentation  This is all tests of DNS of ICSCF
Resource  ../../Resources/DataManager.robot
Resource  ../../Data/InputData.robot
Resource  ../../Resources/Common.robot
Resource  ../../Resources/ICSCF/ICSCF_DNSApp.robot

Test Setup      Common.Begin Web Test
Test Teardown   Common.End Web Test

*** Tasks ***
		
Edit DNS
    [Documentation]     Add proper DNS of ICSCF
    [Tags]  ims47  Smoke  ICSCF_DNS
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${ICSCF_DNS}  Edit_DNS
    ICSCF_DNSApp.Edit  ${AdministrationScenarios}

Add Resolver
    [Documentation]     Add Resolver in ICSCF section with valid parameters
    [Tags]  ims47  Smoke  ICSCF_DNS
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${ICSCF_DNS}  Add_Resolver
    ICSCF_DNSApp.Add Valid Cases  ${AdministrationScenarios}

Add invalid Resolver
    [Documentation]     Add Resolver in ICSCF section with invalid parameters
    [Tags]  ims47   ICSCF_DNS  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${ICSCF_DNS}  Add_Errors
    ICSCF_DNSApp.Add Invalid Cases  ${AdministrationScenarios}

Filter Resolver
    [Documentation]     Filter Resolver with IP, PORT, DOMAIN
    [Tags]  ims47  ICSCF_DNS  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${ICSCF_DNS}  Filter_Resolver
    ICSCF_DNSApp.Filter Cases  ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${ICSCF_DNS}  Filter_Spechar
    ICSCF_DNSApp.Filter Special Cases  ${AdministrationScenarios}

View Resolver
    [Documentation]     View Resolver in BGCF section
    [Tags]  ims47  ICSCF_DNS  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${ICSCF_DNS}  Edit_Resolver
    ICSCF_DNSApp.View Cases  ${AdministrationScenarios}

Sort Resolver
    [Documentation]     Sort Resolver in BGCF section
    [Tags]  ims47  ICSCF_DNS  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${ICSCF_DNS}  Sort
    ICSCF_DNSApp.Sort Cases  ${AdministrationScenarios}

Edit Resolver
    [Documentation]     Edit Resolver in BGCF section with valid parameters
    [Tags]  ims47  Smoke  ICSCF_DNS
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${ICSCF_DNS}  Edit_Resolver
    ICSCF_DNSApp.Edit Valid Cases  ${AdministrationScenarios}

Edit invalid Resolver
    [Documentation]     Edit Resolver in BGCF section with invalid parameters
    [Tags]  ims47   ICSCF_DNS  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${ICSCF_DNS}  Edit_Errors
    ICSCF_DNSApp.Edit Invalid Cases  ${AdministrationScenarios}

Delete Resolver
    [Documentation]     Del Resolver in BGCF section
    [Tags]  ims47  Smoke  ICSCF_DNS  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${ICSCF_DNS}  Delete_Resolver
    ICSCF_DNSApp.Delete Cases  ${AdministrationScenarios}