*** Settings ***
Documentation  All manipulation Session Backup section
Resource  ../../Resources/IBCF/IBCF_SessionBackupApp.robot
Resource  ../../Resources/DataManager.robot
Resource  ../../Data/InputData.robot
Resource  ../../Resources/Common.robot

#Test Setup      Begin Web Test
Test Teardown   End Web Test


*** Tasks ***

Manipulate Session Backup
    [Documentation]    Verify the functionality of 'Manipulate Session Backup' on the IBCF page
    [Tags]  IBCF    IBCF_SessionBackup      
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${SessionBackup}  Action
    IBCF_SessionBackupApp.Session Backup Manipulate  ${AdministrationScenarios}