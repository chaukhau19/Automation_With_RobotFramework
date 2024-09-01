*** Settings ***
Documentation  This is all tests of IP Destination in TAS
Resource  ../../Resources/DataManager.robot
Resource  ../../Data/InputData.robot
Resource  ../../Resources/Common.robot
Resource  ../../Resources/TAS/TAS_IPDestinationApp.robot

#Test Setup      Common.Begin Web Test
Test Teardown   Common.End Web Test

*** Tasks ***
Add IPDestination
    [Documentation]   Verify The Add function on the IPDestination page of TAS    [ims]
    [Tags]      TAS   TAS_IPDestination	
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${TAS_IPDestination}  Add
    TAS_IPDestinationApp.Add  ${AdministrationScenarios}

Add Invalid IPDestination
    [Documentation]   Verify The Add Invalid function on the IPDestination page of TAS    [ims]
    [Tags]      TAS   TAS_IPDestination	 
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${TAS_IPDestination}  Add_Errors
    TAS_IPDestinationApp.Add Invalid  ${AdministrationScenarios}


View IPDestination
    [Documentation]   Verify The View function on the IPDestination page of TAS    [ims]
    [Tags]      TAS   TAS_IPDestination	  	  
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${TAS_IPDestination}  View
    TAS_IPDestinationApp.View  ${AdministrationScenarios}

Sort IPDestination
    [Documentation]   Verify The Sort function on the IPDestination page of TAS    [ims]
    [Tags]      TAS   TAS_IPDestination	  	  
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${TAS_IPDestination}  Sort
    TAS_IPDestinationApp.Sort  ${AdministrationScenarios}

Filter IPDestination
    [Documentation]   Verify The Filter function on the IPDestination page of TAS    [ims]
    [Tags]      TAS   TAS_IPDestination	    
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${TAS_IPDestination}  Filter
    TAS_IPDestinationApp.Filter  ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${TAS_IPDestination}  Filter_Special
    TAS_IPDestinationApp.Filter special characters  ${AdministrationScenarios}

Edit IPDestination
    [Documentation]   Verify The Edit function on the IPDestination page of TAS    [ims]
    [Tags]      TAS   TAS_IPDestination		
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${TAS_IPDestination}  Edit
    TAS_IPDestinationApp.Edit  ${AdministrationScenarios}

Edit Invalid IPDestination
    [Documentation]   Verify The Edit Invalid function on the IPDestination page of TAS    [ims]
    [Tags]      TAS   TAS_IPDestination		   
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${TAS_IPDestination}  Edit_Errors
    TAS_IPDestinationApp.Edit Invalid  ${AdministrationScenarios}

