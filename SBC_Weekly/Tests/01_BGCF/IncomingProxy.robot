*** Settings ***
Documentation  All manipulation Incoming Proxy section
Resource  ../../Resources/BGCF/BGCF_IncomingProxyApp.robot
Resource  ../../Resources/DataManager.robot
Resource  ../../Data/InputData.robot
Resource  ../../Resources/Common.robot

#Test Setup      Begin Web Test
Test Teardown   End Web Test


*** Tasks ***
	
Add Incoming Proxy
    [Documentation]    Verify the functionality of 'Add Incoming Proxy' on the BGCF page
    [Tags]  BGCF  BGCF_IncomingProxy  
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${BGCF_IncomingProxy}  Add_Valid
    BGCF_IncomingProxyApp.Add Valid  ${AdministrationScenarios}

Add Invalid Incoming Proxy
    [Documentation]    Verify the functionality of 'Add Invalid Incoming Proxy' on the BGCF page
    [Tags]   BGCF   BGCF_IncomingProxy   
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${BGCF_IncomingProxy}  Add_Invalid
    BGCF_IncomingProxyApp.Add Invalid  ${AdministrationScenarios}

Filter Incoming Proxy
    [Documentation]    Verify the functionality of 'Filter Incoming Proxy' on the BGCF page
    [Tags]   BGCF   BGCF_IncomingProxy      
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${BGCF_IncomingProxy}  Filter
    BGCF_IncomingProxyApp.Filter IncomingProxy  ${AdministrationScenarios}

Delete Incoming Proxy
    [Documentation]    Verify the functionality of 'Delete Incoming Proxy' on the BGCF page
    [Tags]  BGCF   BGCF_IncomingProxy  
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${BGCF_IncomingProxy}  Delete
    BGCF_IncomingProxyApp.Delete  ${AdministrationScenarios}



