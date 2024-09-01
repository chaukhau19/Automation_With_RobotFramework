*** Settings ***
Library  SeleniumLibrary
Resource  ../../Common.robot
Resource  ../../../Data/InputData.robot



*** Variables ***
################# General variables #################
${Name_Field}                id=name
${TPIP_IP_DropDown}          xpath=//input[@value='10.11.12.110']
${TPIP_IP_Primary}           xpath=//ul/li[2]/span[contains(text(),'10.11.12.112')]

${TPIP_Cancel_View}          xpath=//*[@id="content-container"]/div/div/a
# Optional params
${TPIP_Nat}                  xpath=//label[contains(text(),'NAT')]
${TPIP_Compact_DropDown}     xpath=//fieldset[@class='optional-info']/div[2]
${TPIP_Compact_Compact}      xpath=//ul/li/span[contains(text(),'compact')]
${TPIP_Confirm_Button}        id=submit_field
${TPIP_Cancel_Button}        xpath=//a[contains(text(),'Cancel']
#
${TPIP_section}              xpath=//*[@class='first-menu' and contains(text(),'Tpip')]
${Filter_By_Name}            xpath=//span[contains(text(),'Name')]
${Append_Domain_Button}      id=append_domain
*** Keywords ***
Go to BGCF tab
    Click Element        ${BGCF_tab}
    Sleep  1s
Go to TPIP section in BGCF tab
    Click Element        ${TPIP_section}
    Sleep   2s

    Wait Until Page Contains Element    ${Data_table}         10

Add TPIP
    [Arguments]     ${Name}    ${IP}      ${Port}     ${Nat}       ${SIP}       ${Domain1}  ${Add_Domain}   ${Domain2}   ${IP_Type}

    Click Element       ${Add_Button}
    Sleep  2s

    Run Keyword If  '${IP_Type}' == 'ETH'    run keywords    Click Element        ${IF_Name_Button}  AND    input text       ${IF_Name_Field}              ${IP}

    Run Keyword If  '${Name}' != '#BLANK'    input text       ${Name_Field}              ${Name}
    Sleep       1s

    Click Element        ${TPIP_IP_DropDown}
    Sleep       1s

    Click Element       ${TPIP_IP_Primary}
    Sleep       1s

    Run Keyword If  '${Port}' != '#BLANK'    input text     ${Port_Field}            ${Port}
    Sleep       1s

    Run Keyword If  '${Nat}' == 'TRUE'    Click Element   ${TPIP_Nat}
    Sleep       1s

    Run Keyword If  '${SIP}' == 'compact'    Click Element   ${TPIP_Compact_DropDown}
    Sleep       1s

    Run Keyword If  '${SIP}' == 'compact'    Click Element   ${TPIP_Compact_Compact}
    Sleep       1s

    Run Keyword If  '${Domain1}' != '#BLANK'    input text       ${Multi_Domain_Field}          ${Domain1}

    Run Keyword If   '${Add_Domain}' == 'add'    Click Element   ${Append_Domain_Button}
    Sleep       1s
    Run Keyword If  '${Domain2}' != '#BLANK'    input text       ${Multi_Domain_Field1}          ${Domain2}

    Click Element       ${TPIP_Confirm_Button}
    Sleep       3s

View TPIP
    [Arguments]    ${Name}    ${IP}      ${Port}     ${Nat}       ${Compact}       ${Domain}
    Click View Element With 3 Info    ${Name}     ${IP}     ${Port}
    Sleep  5s
    Run Keyword If      '${Name}' != '#BLANK'       page should contain    ${Name}
    Run Keyword If      '${IP}' != '#BLANK'         page should contain    ${IP}
    Run Keyword If      '${Port}' != '#BLANK'       page should contain    ${Port}
    Run Keyword If      '${Nat}' != '#BLANK'        page should contain    ${Nat}
    Run Keyword If      '${Compact}' != 'none'      page should contain    ${Compact}
    Run Keyword If      '${Domain}' != '#BLANK'     page should contain    ${Domain}

    Click Element       ${TPIP_Cancel_View}
    Sleep  5s
