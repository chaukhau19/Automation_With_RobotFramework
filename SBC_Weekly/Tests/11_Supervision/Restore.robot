*** Settings ***
Resource  ../../Resources/Common.robot
Resource  ../../Resources/DataManager.robot
Resource  ../../Data/InputData.robot
Resource  ../../Resources/Supervision/Supervision_RestoreApp.robot


#Test Setup  Common.Begin Web Test
Test Teardown  Common.End Web Test

*** Tasks ***
Restore Valid Configuration file
    [Documentation]   Verify The Restore Valid Configuration file function on the Restore page of Supervision
    [Tags]   Supervision    Supervision_Restore    
    ${AdministrationScenarios} =  DataManager.Get Excel Data    ${Supervision_Restore}   Restore_Valid
    Supervision_RestoreApp.Restore Valid Configuration file   ${AdministrationScenarios}

Restore Invalid Configuration file
    [Documentation]   Verify The Restore Invalid Configuration file function on the Restore page of Supervision
    [Tags]   Supervision    Supervision_Restore   
    ${AdministrationScenarios} =  DataManager.Get Excel Data    ${Supervision_Restore}   Restore_Invalid
    Supervision_RestoreApp.Restore Invalid Configuration file   ${AdministrationScenarios}