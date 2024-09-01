*** Settings ***
Documentation  All manipulation Session Backup section
Resource  ../../Resources/IBCF/IBCF_SessionBackupApp.robot
Resource  ../../Resources/DataManager.robot
Resource  ../../Data/InputData.robot
Resource  ../../Resources/Common.robot

Test Setup      Begin Web Test
Test Teardown   End Web Test


*** Tasks ***
		
Manipulate Session Backup
    [Documentation]     All IBCF Session BK section testing
    [Tags]  IBCF_SessionBackup  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${SessionBackup}  Action
    IBCF_SessionBackupApp.Session Backup Manipulate  ${AdministrationScenarios}