*** Settings ***
Library  SeleniumLibrary
Resource  ../../Common.robot
Resource  ../../../Data/InputData.robot


*** Variables ***
############ General variables ##############

${Time_out}             20
################# Add Page ##################
${IBCF_Confirm_Add}     xpath=//button[@name='btn-submit']
${Data_table}           xpath=//table[@id='data-table']
${IBCF_Add_Table}       xpath=//*[@id="content-container"]/div[2]
${IBCF_Cancel_Add}      xpath=//a[@class='button-cancel']
${Warning_Line}         xpath=//*[@class="red-text text-darken-2"]
${IBCF_Weight_Field}    id=weight
${Domain_Field}    id=domain
${IBCF_section}         xpath=//a[@class='collapsible-header active'][contains(.,'Ecscf')]//following::a[1]

################# Filter Page ###############
################# View Page #################
${IBCF_Edit_in_View}    xpath=//*[@id="content-container"]/div/div/a
${IBCF_Cancel_View}     xpath=//*[@id="content-container"]/div/div/a[2]
################# Edit Page #################
${IBCF_Edit_Button}     xpath=//*[@id="data-table"]/tbody/tr[2]/td[4]/a[2]/i
${IBCF_Confirm_Edit}    xpath=//*[@id="content-container"]/div[2]/form/div/div[4]/button
${IBCF_Cancel_Edit}     xpath=//a[@class='button-cancel']
################# Delete Page ###############


*** Keywords ***
Go to ECSCF tab
    Click Element        ${ECSCF_tab}
    Sleep       1s
Go to IBCF section in ECSCF tab
    Click Element        ${IBCF_section}
    Sleep       4s

    Wait Until Page Contains Element    ${Data_table}         20

Click Add Button
    Click Element       ${Add_Button}
    Sleep       3s

Add IBCF
    [Arguments]  ${IP}      ${Port}     ${Weight}       ${Priority}
    Click Element       ${Add_Button}
    Sleep       3s

    Run Keyword If  '${IP}' != '#BLANK'    Input Text   ${IP_Field}   ${IP}
    Sleep       1s

    Run Keyword If  '${Port}' != '#BLANK'    Input Text     ${Port_Field}    ${Port}
    Sleep       1s

    Run Keyword If  '${Weight}' != '#BLANK'    Input Text   ${IBCF_Weight_Field}          ${Weight}
    Sleep       1s

    Run Keyword If  '${Priority}' != '#BLANK'    Input Text   ${Priority_Field}          ${Priority}
    Sleep       1s
    Click Element       ${Confirm_Add_Type_3}
    Sleep       5s
    Reload Page


View IBCF
    [Arguments]    ${IP}       ${Port}      ${Weight}   ${Priority}
    Common.Click View Element With 2 Info      ${IP}       ${Port}
    Sleep       3s
    Verify Page Contains 2 Expected Elements    IP                              ${IP}
    Verify Page Contains 2 Expected Elements    Port                            ${Port}
    Verify Page Contains 2 Expected Elements    Weight                          ${Weight}
    Run Keyword If  '${Priority}' != '#BLANK'    Verify Page Contains 2 Expected Elements     Priority                          ${Priority}

    Click Element       ${IBCF_Cancel_View}
    Sleep       3s

Edit IBCF
    [Arguments]    ${IP}     ${Port}   ${Edit_Weight}      ${Edit_Priority}
    Common.Click Edit Element With 2 Info      ${IP}       ${Port}
    Sleep       3s

    Run Keyword If  '${Edit_Weight}' != '#BLANK'    Input Text   ${IBCF_Weight_Field}          ${Edit_Weight}
    Sleep       1s

    Run Keyword If  '${Edit_Priority}' != '#BLANK'    Input Text   ${Priority_Field}          ${Edit_Priority}
    Sleep       1s
    Click Element       ${Confirm_Add_Type_3}
    Sleep       5s
    Reload Page

Cancel invalid add
    Click Element  ${IBCF_Cancel_Add}
