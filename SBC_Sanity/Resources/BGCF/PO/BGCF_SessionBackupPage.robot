*** Settings ***
Library  SeleniumLibrary
Resource  ../../Common.robot

*** Variables ***
${Drop_SessionBackup}       id=drop_session_backup
${Clean_SessionBackup}      id=clean_session_backup
${Reset_SessionBackup}      id=reset_on_standby
${SessionBackup_section}    xpath=//*[@class='first-menu' and contains(text(),'Session Backup')]
${Result_OK}                xpath=//label[contains(text(),'OK')]

*** Keywords ***

Go to BGCF tab
    Click Element        ${BGCF_tab}
    Sleep  1s
Go to Session Backup section in BGCF tab
    Click Element        ${SessionBackup_section}




