*** Settings ***
Resource  ../../Resources/Common.robot
Resource  ../../Resources/DataManager.robot
Resource  ../../Data/InputData.robot
Resource  ../../Resources/Cluster_Inf/Cluster_InfApp.robot


#Test Setup  Common.Begin Web Test
Test Teardown  Common.End Web Test

*** Tasks ***
View Cluster Information
    [Documentation]   Verify The View Cluster function on the Cluster Info page of Supervision
    [Tags]   Cluster_Information     
    [Timeout]    90m
    Remote Cluster_Lab
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Cluster_Inf}   Cluster_Inf
    Cluster_InfApp.View Cluster   ${AdministrationScenarios}


View Cluster Information Remote SSH Lab Cluster
    [Documentation]   Verify The View Cluster Information Remote SSH Lab Cluster function on the Cluster Info page of Supervision
    [Tags]  Cluster_Information    
    [Timeout]    30m
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Cluster_Inf}   Cluster_Inf_Remote
    Cluster_InfApp.View Cluster Remote   ${AdministrationScenarios}
