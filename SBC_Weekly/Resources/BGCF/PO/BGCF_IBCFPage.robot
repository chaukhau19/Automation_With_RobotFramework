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
${Domain_Field}         id=domain
${IBCF_section}         xpath=//*[@class='first-menu' and contains(text(),'Ibcf')]
# ${IBCF_section}         xpath=//*[@class='collapsible-body']//following-sibling::*[@href='/bgcf/4/ibcf/index']

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
Go to BGCF tab
    Click Element        ${BGCF_tab}
    Sleep       1s

Go to IBCF section in BGCF tab
    Click Element        ${IBCF_section}
    Wait Until Page Contains Element    ${Data_table}         20

Click Add Button
    Click Element       ${Add_Button}
    Sleep  5s


#RFF16918 in 6.5
Add IBCF 
    [Arguments]  ${IP}      ${Port}     ${Weight}       ${Domain}   ${Priority}
    Click Element       ${Add_Button}
    Sleep  5s

    Add_IBCF_All  ${IP}      ${Port}     ${Weight}       ${Domain}
    Sleep       1s
    Run Keyword If  '${IP}' != '#BLANK'    Input Text   ${Priority_Field}   ${Priority}

    Click Element       ${IBCF_Confirm_Add}
    Sleep       3s
    Reload Page

Add_IBCF_All
    [Arguments]  ${IP}      ${Port}     ${Weight}       ${Domain}

    Run Keyword If  '${IP}' != '#BLANK'    Input Text   ${IP_Field}   ${IP}
    Sleep       1s

    Run Keyword If  '${Port}' != '#BLANK'    Input Text     ${Port_Field}    ${Port}
    Sleep       1s

    Run Keyword If  '${Weight}' != '#BLANK'    Input Text   ${IBCF_Weight_Field}          ${Weight}
    Sleep       1s

    Run Keyword If  '${Domain}' != '#BLANK'    Input Text   ${Domain_Field}          ${Domain}


View IBCF 
    [Arguments]    ${IP}       ${Port}      ${Weight}   ${Domain}  ${Priority}
    Common.Click View Element With 3 Info      ${IP}       ${Port}      ${Domain}
    Sleep  5s
    Verify Page Contains 2 Expected Elements  IP            ${IP}
    Verify Page Contains 2 Expected Elements  Port          ${Port}
    Verify Page Contains 2 Expected Elements  Weight        ${Weight}
    Verify Page Contains 2 Expected Elements  Domain        ${Domain}
    
    Run Keyword If  '${Priority}' != '#BLANK'   Verify Page Contains 2 Expected Elements  Priority      ${Priority}
    Click Element       ${IBCF_Cancel_View}
    Sleep  5s


Edit IBCF 
    [Arguments]    ${IP}     ${Port}    ${Domain}     ${Edit_Weight}      ${Edit_Domain}   ${Edit_Priority}
    Common.Click Edit Element With 3 Info      ${IP}       ${Port}      ${Domain}
    Sleep  5s
    Run Keyword If  '${Edit_Weight}' != '#BLANK'    Input Text   ${IBCF_Weight_Field}          ${Edit_Weight}
    Sleep       1.5s

    Run Keyword If  '${Edit_Domain}' != '#BLANK'    Input Text   ${Domain_Field}          ${Edit_Domain}
    Sleep       1.5s
    Run Keyword If  '${Edit_Domain}' != '#BLANK'    Input Text   ${Priority_Field}          ${Edit_Priority}
    Click Element       ${IBCF_Confirm_Add}
    Sleep       3s
    

Cancel invalid add
    Click Element  ${IBCF_Cancel_Add}
