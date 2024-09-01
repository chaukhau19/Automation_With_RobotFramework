*** Settings ***
Library  SeleniumLibrary
Resource  ../../Common.robot

*** Variables ***
${Drop_SessionBackup}       id=drop_session_backup
${Clean_SessionBackup}      id=clean_session_backup
${Reset_SessionBackup}      id=reset_on_standby
${SessionBackup_section}    xpath=//*[@class='collapsible-header active' and contains(text(),'Pcscf')]/following::div//a[@class='first-menu' and contains(text(),'Session Backup')]
${Result_OK}                xpath=//label[contains(text(),'OK')]

*** Keywords ***

Go to PCSCF tab
    Click Element        ${PCSCF_tab}
    Sleep  1s

Go to Session Backup section in PCSCF tab

    Click Element        ${SessionBackup_section}