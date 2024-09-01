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
${IBCF_section}         xpath=//a[@class='collapsible-header active'][contains(.,'Scscf')]//following::a[@class='first-menu'][contains(text(),'Ibcf')]

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
Go to SCSCF tab
    Click Element        ${SCSCF_tab}
    Sleep  1s
Go to IBCF section in SCSCF tab
    Click Element        ${IBCF_section}
    Sleep   4s

    Wait Until Page Contains Element    ${Data_table}         20

Click Add Button
    Click Element       ${Add_Button}
    Sleep  3s

Add IBCF
    [Arguments]  ${IP}      ${Port}   ${Weight}     ${Domain}   ${Priority}
    Click Element       ${Add_Button}
    Sleep  3s

    Run Keyword If  '${IP}' != '#BLANK'    input text   ${IP_Field}   ${IP}
    Sleep       1s

    Run Keyword If  '${Port}' != '#BLANK'    input text     ${Port_Field}    ${Port}
    Sleep       1s

    Run Keyword If  '${Domain}' != '#BLANK'    input text   ${Domain_Field}          ${Domain}
    Sleep       1s

    Run Keyword If  '${Weight}' != '#BLANK'    input text   ${IBCF_Weight_Field}          ${Weight}
    Sleep       1s

    Run Keyword If  '${Priority}' != '#BLANK'    input text     ${Priority_Field}    ${Priority}

    Click Element       ${Confirm_Add_MatRul}
    Sleep       3s
    reload page


View IBCF
    [Arguments]    ${IP}       ${Port}   ${Domain}
    Common.Click View Element With 3 Info      ${IP}       ${Port}      ${Domain}
    Sleep  3s
    Common.Verify Page Contains 3 Expected Info   ${IP}  ${Port}  ${Domain}
    Click Element       ${IBCF_Cancel_View}
    Sleep  3s

Edit IBCF
    [Arguments]    ${IP}     ${Port}    ${Domain}     ${Edit_Weight}      ${Edit_Piority}
    Common.Click Edit Element With 3 Info      ${IP}       ${Port}      ${Domain}
    Sleep  3s
    Run Keyword If  '${Edit_Weight}' != '#BLANK'    input text   ${IBCF_Weight_Field}          ${Edit_Weight}
    Sleep       1s

    Run Keyword If  '${Edit_Piority}' != '#BLANK'    input text   ${Priority_Field}          ${Edit_Piority}
    Sleep       1s
    Click Element       ${Confirm_Add_MatRul}
    Sleep       3s
    reload page

Cancel invalid add
    Click Element  ${IBCF_Cancel_Add}
