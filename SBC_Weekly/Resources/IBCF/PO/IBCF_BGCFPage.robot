*** Settings ***
Library  SeleniumLibrary
Resource  ../../Common.robot
Resource  ../../../Data/InputData.robot

*** Variables ***
############ General variables ##############

${Time_out}             20
${BGCF_section}              xpath=//a[@class='collapsible-header active'][contains(.,'Ibcf')]//following::a[2]
################# Add Page ##################
${IBCF_Confirm_Add}     xpath=//button[contains(text(),'Submit')]
${Data_table}           xpath=//table[@id='data-table']
${IBCF_Add_Table}       xpath=//*[@id="content-container"]/div[2]
${IBCF_Cancel_Add}      xpath=//a[@class='button-cancel']
${Warning_Line}         xpath=//*[@class="red-text text-darken-2"]
${IBCF_Weight_Field}    id=weight
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
################# Retry and Domain ###############
${Retry_True}           id=ibcf_bgcf_retry_true
${Retry_False}          id=ibcf_bgcf_retry_false
${Domain_Request}       id=ibcf_bgcf_extract_requri
${Domain_None}          id=ibcf_bgcf_extract_none
${Domain_Peer}          id=ibcf_bgcf_extract_peer_name
${Domain_To}            id=ibcf_bgcf_extract_to
${Domain_From}          id=ibcf_bgcf_extract_from
*** Keywords ***
Go to IBCF tab
    Click Element        ${IBCF_tab}
    Sleep       1s

Go to BGCF section in IBCF tab
    Click Element        ${BGCF_section}
    Sleep       4s
    Wait Until Page Contains Element    ${Data_table}         20

Add BGCF 
    [Arguments]  ${IP}      ${Port}     ${Weight}       ${Domain}   ${Priority}
    Click Element       ${Add_Button}
    Sleep       3s
    Add_BGCF_All  ${IP}      ${Port}     ${Weight}       ${Domain}
    Sleep       1s
    Run Keyword If  '${Priority}' != '#BLANK'    Input Text   ${Priority_Bgcf_Field}          ${Priority}
    Sleep       1s
    Click Element       ${IBCF_Confirm_Add}
    Sleep       3s


View BGCF
    [Arguments]    ${IP}      ${Port}     ${Weight}       ${Domain}
    Click View Element With 3 Info      ${IP}       ${Port}      ${Weight}
    Sleep       3s
    Verify Page Contains 2 Expected Elements    IP                              ${IP}
    Verify Page Contains 2 Expected Elements    Port                            ${Port}
    Verify Page Contains 2 Expected Elements    Weight                          ${Weight}
    Run Keyword If  '${Domain}' != '#BLANK'    Verify Page Contains 2 Expected Elements     Domain                          ${Domain}
    Click Element       ${IBCF_Cancel_View}
    Sleep       3s


Edit BGCF 
    [Arguments]    ${IP}     ${Port}    ${Weight}    ${Edit_Weight}     ${Edit_Domain}  ${Edit_Priority}
    Click Edit Element With 2 Info      ${IP}       ${Port}
    Sleep       3s
    Run Keyword If  '${Edit_Weight}' != '#BLANK'    Input Text   ${IBCF_Weight_Field}          ${Edit_Weight}
    Sleep       1s
    Run Keyword If  '${Edit_Domain}' != '#BLANK'    Input Text   ${Domain_Field}          ${Edit_Domain}
    Sleep       1s
    Run Keyword If  '${Edit_Priority}' != '#BLANK'    Input Text   ${Priority_Bgcf_Field}          ${Edit_Priority}
    Sleep       1s
    Click Element       ${IBCF_Confirm_Add}
    Sleep       3s
    Reload Page




Add_BGCF_All
    [Arguments]  ${IP}      ${Port}     ${Weight}       ${Domain}
    Run Keyword If  '${IP}' != '#BLANK'    Input Text   ${IP_Field}   ${IP}
    Sleep       1s
    Run Keyword If  '${Port}' != '#BLANK'    Input Text     ${Port_Field}    ${Port}
    Sleep       1s
    Run Keyword If  '${Weight}' != '#BLANK'    Input Text   ${IBCF_Weight_Field}          ${Weight}
    Sleep       1s
    Run Keyword If  '${Domain}' != '#BLANK'    Input Text   ${Domain_Field}          ${Domain}
    Sleep       1s



Retry Pref and Domain Origin
    [Arguments]    ${Value}
    Run Keyword If  '${Value}' == 'True'                         Click Element   ${Retry_True}
    Run Keyword If  '${Value}' == 'False'                        Click Element   ${Retry_False}
    Run Keyword If  '${Value}' == 'None'                         Click Element   ${Domain_None}
    Run Keyword If  '${Value}' == 'Request URI'                  Click Element   ${Domain_Request}
    Run Keyword If  '${Value}' == 'Peer Name'                    Click Element   ${Domain_Peer}
    Run Keyword If  '${Value}' == 'To'                           Click Element   ${Domain_To}
    Run Keyword If  '${Value}' == 'From'                         Click Element   ${Domain_From}



