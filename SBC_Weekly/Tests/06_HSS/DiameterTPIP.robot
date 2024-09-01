*** Settings ***
Documentation  This is all tests of Diameter TPIP in HSS
Resource  ../../Resources/DataManager.robot
Resource  ../../Data/InputData.robot
Resource  ../../Resources/Common.robot
Resource  ../../Resources/HSS/HSS_DiameterTPIPApp.robot

#Test Setup      Common.Begin Web Test
Test Teardown   Common.End Web Test

*** Tasks ***

Add DiameterTPIP
    [Documentation]   Verify The Add function on the DiameterTPIP page of HSS    [ims]
    [Tags]    HSS  HSS_DiameterTPIP	
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${HSS_DiameterTPIP}  Add
    HSS_DiameterTPIPApp.Add  ${AdministrationScenarios}

Add Invalid DiameterTPIP
    [Documentation]   Verify The Add Invalid function on the DiameterTPIP page of HSS    [ims]
    [Tags]    HSS  HSS_DiameterTPIP	    
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${HSS_DiameterTPIP}  Add_Errors
    HSS_DiameterTPIPApp.Add Invalid  ${AdministrationScenarios}

View DiameterTPIP
    [Documentation]   Verify The View function on the DiameterTPIP page of HSS    [ims]
    [Tags]    HSS  HSS_DiameterTPIP	    
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${HSS_DiameterTPIP}  View
    HSS_DiameterTPIPApp.View  ${AdministrationScenarios}

Sort DiameterTPIP
    [Documentation]   Verify The Sort function on the DiameterTPIP page of HSS    [ims]
    [Tags]    HSS  HSS_DiameterTPIP	  
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${HSS_DiameterTPIP}  Sort
    HSS_DiameterTPIPApp.Sort  ${AdministrationScenarios}

Filter DiameterTPIP
    [Documentation]   Verify The Filter function on the DiameterTPIP page of HSS    [ims]
    [Tags]    HSS  HSS_DiameterTPIP		  
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${HSS_DiameterTPIP}  Filter
    HSS_DiameterTPIPApp.Filter  ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${HSS_DiameterTPIP}  Filter_Special
    HSS_DiameterTPIPApp.Filter special characters  ${AdministrationScenarios}

Delete DiameterTPIP
    [Documentation]   Verify The Delete function on the DiameterTPIP page of HSS    [ims]
    [Tags]    HSS  HSS_DiameterTPIP	  
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${HSS_DiameterTPIP}  Delete
    HSS_DiameterTPIPApp.Delete  ${AdministrationScenarios}
