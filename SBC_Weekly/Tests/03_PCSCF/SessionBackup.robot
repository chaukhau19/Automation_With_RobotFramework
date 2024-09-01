*** Settings ***
Documentation  All manipulation Session Backup section
Resource  ../../Resources/PCSCF/PCSCF_SessionBackupApp.robot
Resource  ../../Resources/DataManager.robot
Resource  ../../Data/InputData.robot
Resource  ../../Resources/Common.robot

#Test Setup      Begin Web Test
Test Teardown   End Web Test


*** Tasks ***

Manipulate Session Backup
    [Documentation]    Verify the functionality of 'Manipulate Session Backup' on the PCSCF page
    [Tags]  PCSCF    PCSCF_SessionBackup       
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${SessionBackup}  Action
    PCSCF_SessionBackupApp.Session Backup Manipulate  ${AdministrationScenarios}