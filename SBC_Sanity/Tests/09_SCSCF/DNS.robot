*** Settings ***
Documentation  This is all tests of DNS of SCSCF
Resource  ../../Resources/DataManager.robot
Resource  ../../Data/InputData.robot
Resource  ../../Resources/Common.robot
Resource  ../../Resources/SCSCF/SCSCF_DNSApp.robot

Test Setup      Common.Begin Web Test
Test Teardown   Common.End Web Test

*** Tasks ***
	
Edit DNS
    [Documentation]     Add proper DNS of SCSCF
    [Tags]    Smoke  SCSCF_DNS  ims47
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${SCSCF_DNS}  Edit_DNS
    SCSCF_DNSApp.Edit  ${AdministrationScenarios}

Add Resolver
    [Documentation]     Add Resolver in SCSCF section with valid parameters
    [Tags]    Smoke  SCSCF_DNS  ims47
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${SCSCF_DNS}  Add_Resolver
    SCSCF_DNSApp.Add Valid Cases  ${AdministrationScenarios}

Add invalid Resolver
    [Documentation]     Add Resolver in SCSCF section with invalid parameters
    [Tags]     SCSCF_DNS  ims47  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${SCSCF_DNS}  Add_Errors
    SCSCF_DNSApp.Add Invalid Cases  ${AdministrationScenarios}

Filter Resolver
    [Documentation]     Filter Resolver with IP, PORT, DOMAIN
    [Tags]    SCSCF_DNS  ims47  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${SCSCF_DNS}  Filter_Resolver
    SCSCF_DNSApp.Filter Cases  ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${SCSCF_DNS}  Filter_Spechar
    SCSCF_DNSApp.Filter Special Cases  ${AdministrationScenarios}

View Resolver
    [Documentation]     View Resolver in BGCF section
    [Tags]    SCSCF_DNS  ims47  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${SCSCF_DNS}  Edit_Resolver
    SCSCF_DNSApp.View Cases  ${AdministrationScenarios}

Sort Resolver
    [Documentation]     Sort Resolver in BGCF section
    [Tags]    SCSCF_DNS  ims47  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${SCSCF_DNS}  Sort
    SCSCF_DNSApp.Sort Cases  ${AdministrationScenarios}

Edit Resolver
    [Documentation]     Edit Resolver in BGCF section with valid parameters
    [Tags]    Smoke  SCSCF_DNS  ims47
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${SCSCF_DNS}  Edit_Resolver
    SCSCF_DNSApp.Edit Valid Cases  ${AdministrationScenarios}

Edit invalid Resolver
    [Documentation]     Edit Resolver in BGCF section with invalid parameters
    [Tags]     SCSCF_DNS  ims47  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${SCSCF_DNS}  Edit_Errors
    SCSCF_DNSApp.Edit Invalid Cases  ${AdministrationScenarios}

Delete Resolver
    [Documentation]     Del Resolver in BGCF section
    [Tags]    Smoke  SCSCF_DNS  ims47  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${SCSCF_DNS}  Delete_Resolver
    SCSCF_DNSApp.Delete Cases  ${AdministrationScenarios}
