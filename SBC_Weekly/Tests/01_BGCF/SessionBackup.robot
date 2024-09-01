*** Settings ***
Documentation  All manipulation Session Backup section
Resource  ../../Resources/BGCF/BGCF_SessionBackupApp.robot
Resource  ../../Resources/DataManager.robot
Resource  ../../Data/InputData.robot
Resource  ../../Resources/Common.robot

#Test Setup      Begin Web Test
Test Teardown   End Web Test


*** Tasks ***
	
Manipulate Session Backup
    [Documentation]    Verify the functionality of 'Manipulate Session Backup' on the BGCF page
    [Tags]  BGCF    BGCF_SessionBackup   
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${SessionBackup}  Action
    BGCF_SessionBackupApp.Session Backup Manipulate  ${AdministrationScenarios}