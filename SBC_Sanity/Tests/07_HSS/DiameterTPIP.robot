*** Settings ***
Documentation  This is all tests of Diameter TPIP in HSS
Resource  ../../Resources/DataManager.robot
Resource  ../../Data/InputData.robot
Resource  ../../Resources/Common.robot
Resource  ../../Resources/HSS/HSS_DiameterTPIPApp.robot

Test Setup      Common.Begin Web Test
Test Teardown   Common.End Web Test

*** Tasks ***
		
Add DiameterTPIP
    [Documentation]     Add proper DiameterTPIP of HSS
    [Tags]    Smoke  HSS_DiameterTPIP	ims47
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${HSS_DiameterTPIP}  Add
    HSS_DiameterTPIPApp.Add  ${AdministrationScenarios}

Add Invalid DiameterTPIP
    [Documentation]     Add invalid DiameterTPIP of HSS
    [Tags]     HSS_DiameterTPIP	ims47  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${HSS_DiameterTPIP}  Add_Errors
    HSS_DiameterTPIPApp.Add Invalid  ${AdministrationScenarios}

View DiameterTPIP
    [Documentation]     View DiameterTPIP of HSS testing
    [Tags]    HSS_DiameterTPIP	ims47  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${HSS_DiameterTPIP}  Add
    HSS_DiameterTPIPApp.View  ${AdministrationScenarios}

Sort DiameterTPIP
    [Documentation]     Sort DiameterTPIP of H testing
    [Tags]    HSS_DiameterTPIP	ims47  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${HSS_DiameterTPIP}  Add
    HSS_DiameterTPIPApp.Sort  ${AdministrationScenarios}

Filter DiameterTPIP
    [Documentation]     Filter DiameterTPIP of testing
    [Tags]    HSS_DiameterTPIP	ims47  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${HSS_DiameterTPIP}  Filter
    HSS_DiameterTPIPApp.Filter  ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${HSS_DiameterTPIP}  Filter_Special
    HSS_DiameterTPIPApp.Filter special characters  ${AdministrationScenarios}

Delete DiameterTPIP
    [Documentation]     Deleting proper DiameterTPIP of HSS
    [Tags]    Smoke  HSS_DiameterTPIP	ims47  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${HSS_DiameterTPIP}  Delete
    HSS_DiameterTPIPApp.Delete  ${AdministrationScenarios}
