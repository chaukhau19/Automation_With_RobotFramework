*** Settings ***
Resource  ../../Resources/Common.robot
Resource  ../../Resources/DataManager.robot
Resource  ../../Data/InputData.robot


Resource  ../../Resources/Admin/HomeApp.robot


Test Setup  Common.Begin Web Test
Test Teardown  Common.End Web Test


*** Tasks ***
Search Function
    [Tags]  HomePage    HomePage_Search   
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Admin}  Search_Valid
    HomeApp.Search Valid  ${AdministrationScenarios}       
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Admin}  Search_Invalid
    HomeApp.Search Invalid  ${AdministrationScenarios}    

Change Language Function
    [Tags]  HomePage    HomePage_ChangeLanguage  
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Admin}  Change_Language
    HomeApp.Change Language   ${AdministrationScenarios}  

Change Deliver Function
    [Tags]  HomePage    HomePage_ChangeDeliver 
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Admin}  Change_Deliver
    HomeApp.Change Deliver  ${AdministrationScenarios}  

