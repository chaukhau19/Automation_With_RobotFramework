*** Settings ***
Library  SeleniumLibrary
Resource  ../../Common.robot
Resource  ../../../Data/InputData.robot

*** Variables ***
############ General variables ##############

${Time_out}             20
${BGCF_section}              xpath=//a[@class='collapsible-header active'][contains(.,'Ecscf')]//following::a[2]
################# Add Page ##################
${IBCF_Confirm_Add}     xpath=//button[contains(text(),'Submit')]
${Data_table}           xpath=//table[@id='data-table']
${IBCF_Add_Table}       xpath=//*[@id="content-container"]/div[2]
${IBCF_Cancel_Add}      xpath=//a[@class='button-cancel']
${Warning_Line}         xpath=//*[@class="red-text text-darken-2"]
${ECSCF_Weight_Field}    id=weight
${Domain_Field}         id=domain
${Priority_Bgcf_Field}  id=priority
################# Filter Page ###############
################# View Page #################
${IBCF_Edit_in_View}    xpath=//*[@id="content-container"]/div/div/a
${IBCF_Cancel_View}     xpath=//*[@id="content-container"]/div/div/a[2]
################# Edit Page #################
${IBCF_Edit_Button}     xpath=//*[@id="data-table"]/tbody/tr[2]/td[4]/a[2]/i
${IBCF_Confirm_Edit}    xpath=//*[@id="content-container"]/div[2]/form/div/div[4]/button
${IBCF_Cancel_Edit}     xpath=//a[@class='button-cancel']

*** Keywords ***
Go to ECSCF tab
    Click Element        ${ECSCF_tab}
    Sleep  1s

Go to BGCF section in ECSCF tab
    Click Element        ${BGCF_section}
    Sleep   4s

    Wait Until Page Contains Element    ${Data_table}         20

Add BGCF
    [Arguments]  ${IP}      ${Port}     ${Weight}       ${Priority}
    Click Element       ${Add_Button}
    Sleep       3s

    Add_BGCF_All  ${IP}      ${Port}     ${Weight}       ${Priority}

    Click Element       ${IBCF_Confirm_Add}
    Sleep       5s


Add_BGCF_All
    [Arguments]  ${IP}      ${Port}     ${Weight}       ${Priority}

    Run Keyword If  '${IP}' != '#BLANK'    input text   ${IP_Field}   ${IP}
    Sleep       1s

    Run Keyword If  '${Port}' != '#BLANK'    input text     ${Port_Field}    ${Port}
    Sleep       1s

    Run Keyword If  '${Weight}' != '#BLANK'    input text   ${ECSCF_Weight_Field}          ${Weight}
    Sleep       1s

    Run Keyword If  '${Priority}' != '#BLANK'    input text   ${Priority_Field}          ${Priority}
    Sleep       1s


Edit BGCF
    [Arguments]    ${IP}     ${Port}    ${Weight}    ${Edit_Weight}     ${Edit_Priority}
    Click Edit Element With 2 Info      ${IP}       ${Port}
    Sleep       3s


    Run Keyword If  '${Edit_Weight}' != '#BLANK'    input text   ${ECSCF_Weight_Field}          ${Edit_Weight}
    Sleep       1s

    Run Keyword If  '${Edit_Priority}' != '#BLANK'    input text   ${Priority_Field}          ${Edit_Priority}
    Sleep       1s
    Click Element       ${IBCF_Confirm_Add}
    Sleep       5s
    reload page

View BGCF
    [Arguments]    ${IP}      ${Port}     ${Weight}       ${Priority}
    Click View Element With 2 Info      ${IP}       ${Port}
    Sleep       3s

    Verify Page Contains 2 Expected Elements    IP                              ${IP}
    Verify Page Contains 2 Expected Elements    Port                            ${Port}
    Verify Page Contains 2 Expected Elements    Weight                          ${Weight}
    Run Keyword If  '${Priority}' != '#BLANK'    Verify Page Contains 2 Expected Elements     Priority                          ${Priority}

    Click Element       ${IBCF_Cancel_View}
    Sleep       3s
