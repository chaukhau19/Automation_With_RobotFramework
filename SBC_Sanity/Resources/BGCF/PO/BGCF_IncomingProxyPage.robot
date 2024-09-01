*** Settings ***
Library  SeleniumLibrary
Resource  ../../Common.robot
*** Variables ***
################# General variables #################
${Proxy_Confirm_Add}    //button[contains(text(),'Submit')]
${Proxy_section}         xpath=//*[@class='first-menu' and contains(text(),'Incoming Proxy')]


*** Keywords ***

Go to BGCF tab
    Click Element        ${BGCF_tab}
    Sleep  1s

Go to Incoming Proxy section in BGCF tab

    Click Element        ${Proxy_section}
    Sleep   4s

    Wait Until Page Contains Element    ${Data_table}         20

    Sleep            3s

Add Incoming Proxy
    [Arguments]  ${IP}      ${Port}
    Click Element       ${Add_Button}
    Sleep  5s

    Run Keyword If  '${IP}' != '#BLANK'    input text       ${IP_Field}              ${IP}
    Sleep       1s

    Run Keyword If  '${Port}' != '#BLANK'    input text     ${Port_Field}            ${Port}
    Sleep       1s

    Click Element       ${Proxy_Confirm_Add}
    Sleep       3s



