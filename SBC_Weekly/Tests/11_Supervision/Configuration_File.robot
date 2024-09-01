*** Settings ***
Resource  ../../Resources/Common.robot
Resource  ../../Resources/DataManager.robot
Resource  ../../Data/InputData.robot
Resource  ../../Resources/Supervision/Supervision_Configuration_FileApp.robot


#Test Setup  Common.Begin Web Test
Test Teardown  Common.End Web Test

*** Tasks ***
Reload Proxy 
    [Documentation]   Verify The Reload Configuration file function on the Cfg file page of Supervision
    [Tags]  Supervision  Supervision_ConfigFile     
    ${AdministrationScenarios} =  DataManager.Get Excel Data    ${Supervision_Configuration_File}    Reload_Configuration_File
    Supervision_Configuration_FileApp.Reload Proxy    ${AdministrationScenarios}

Upload Valid Configuration file
    [Documentation]   Verify The Upload Valid Configuration file function on the Cfg file page of Supervision
    [Tags]  Supervision  Supervision_ConfigFile        
    Create file with permission Omni
    Create file with permission Root
    ${AdministrationScenarios} =  DataManager.Get Excel Data    ${Supervision_Configuration_File}    Upload_Valid_Config_File
    Supervision_Configuration_FileApp.Upload Valid Configuration file    ${AdministrationScenarios}

Upload Invalid Configuration file
    [Documentation]   Verify The Upload Invalid Configuration file function on the Cfg file page of Supervision
    [Tags]  Supervision  Supervision_ConfigFile      
    ${AdministrationScenarios} =  DataManager.Get Excel Data    ${Supervision_Configuration_File}    Upload_Invalid_Config_File
    Supervision_Configuration_FileApp.Upload Invalid Configuration file    ${AdministrationScenarios}

Download and Upload Valid Configuration file
    [Documentation]   Verify The Upload Configuration file and then Download the file function on the Cfg file page of Supervision
    [Tags]  Supervision  Supervision_ConfigFile
    Create file with permission Omni
    Create file with permission Root      
    ${AdministrationScenarios} =  DataManager.Get Excel Data    ${Supervision_Configuration_File}    Upload_Download_Config_File
    #Supervision_Configuration_FileApp.Upload Configuration file and then Download the file    ${AdministrationScenarios}

    