*** Settings ***
Documentation  All manipulation Session Backup section
Resource  ../../Resources/PCSCF/PCSCF_SessionBackupApp.robot
Resource  ../../Resources/DataManager.robot
Resource  ../../Data/InputData.robot
Resource  ../../Resources/Common.robot

Test Setup      Begin Web Test
Test Teardown   End Web Test


*** Tasks ***
		
Manipulate Session Backup
    [Documentation]     All PCSCF Session BK section testing
    [Tags]  PCSCF_SessionBackup  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${SessionBackup}  Action
    PCSCF_SessionBackupApp.Session Backup Manipulate  ${AdministrationScenarios}