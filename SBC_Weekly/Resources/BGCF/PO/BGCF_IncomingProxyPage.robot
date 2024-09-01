*** Settings ***
Library  SeleniumLibrary
Resource  ../../Common.robot
*** Variables ***
################# General variables #################
${Proxy_Confirm_Add}    //button[contains(text(),'Submit')]
${Incoming_Proxy_section}         xpath=//*[@class='first-menu' and contains(text(),'Incoming Proxy')]
# ${Incomming_Proxy_section}         xpath=//*[@class='collapsible-body']//following-sibling::*[@href='/bgcf/4/proxy/index']

*** Keywords ***
Go to BGCF tab
    Click Element        ${BGCF_tab}
    Sleep       1s

Go to Incoming Proxy section in BGCF tab
    Click Element        ${Incoming_Proxy_section}
    Wait Until Page Contains Element    ${Data_table}         20

Add Incoming Proxy
    [Arguments]  ${IP}      ${Port}
    Click Element       ${Add_Button}
    Sleep  5s

    Run Keyword If  '${IP}' != '#BLANK'    Input Text       ${IP_Field}              ${IP}
    Sleep       1s

    Run Keyword If  '${Port}' != '#BLANK'    Input Text     ${Port_Field}            ${Port}
    Sleep       1s

    Click Element       ${Proxy_Confirm_Add}
    Sleep       3s



