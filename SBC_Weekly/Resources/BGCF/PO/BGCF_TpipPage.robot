*** Settings ***
Library  SeleniumLibrary
Resource  ../../Common.robot
Resource  ../../../Data/InputData.robot



*** Variables ***
################# General variables #################
${Name_Field}                id=name
# ${TPIP_IP_DropDown}          xpath=(//div[text()[normalize-space() = 'IP:']]//following::input[@class='select-dropdown'])[1]
# ${TPIP_IP_DropDown_127}          xpath=//input[@value='${ifcfg-lo}']
# ${TPIP_IP_DropDown_eth0}          xpath=//input[@value='${eth0}']

# ${TPIP_IP_Primary}           xpath=//ul/li[2]/span[contains(text(),'${HOST_SBC}')]
${TPIP_IP_Primary}           xpath=//span[text()='${HOST_SBC}']
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
    Sleep       1s
Go to TPIP section in BGCF tab
    Click Element        ${TPIP_section}
    Sleep       2s

    Wait Until Page Contains Element    ${Data_table}         10

Add TPIP
    [Arguments]     ${Name}    ${IP}      ${Port}     ${Nat}       ${SIP}       ${Domain1}  ${Add_Domain}   ${Domain2}   ${IP_Type}

    Click Element       ${Add_Button}
    Sleep       2s

    Run Keyword If  '${IP_Type}' == 'ETH'    Run Keywords    Click Element        ${IF_Name_Button}  AND    Input Text       ${IF_Name_Field}              ${IP}

    Run Keyword If  '${Name}' != '#BLANK'    Input Text       ${Name_Field}              ${Name}
    Sleep       1s

    # Run Keyword If  '${IP}' == '${HOST_SBC}'    Click Element        ${TPIP_IP_DropDown}
    # Sleep       1s

    Run Keyword If    '${TPIP_IP_DROPDOWN}' == '${eth0}' and '${IP}' == '${HOST_SBC}'      Click Element        ${TPIP_IP_DropDown_eth0} 
    ...    ELSE IF    '${TPIP_IP_DROPDOWN}' == '${ifcfg-lo}' and '${IP}' == '${HOST_SBC}'      Click Element        ${TPIP_IP_DropDown_127}
    Sleep       1s                

    
    Run Keyword If  '${IP}' == '${HOST_SBC}'    Click Element       ${TPIP_IP_Primary}
    Sleep       1s

    Run Keyword If  '${Port}' != '#BLANK'    Input Text     ${Port_Field}            ${Port}
    Sleep       1s

    Run Keyword If  '${Nat}' == 'TRUE'    Click Element   ${TPIP_Nat}
    Sleep       1s

    Run Keyword If  '${SIP}' == 'compact'    Click Element   ${TPIP_Compact_DropDown}
    Sleep       1s

    Run Keyword If  '${SIP}' == 'compact'    Click Element   ${TPIP_Compact_Compact}
    Sleep       1s

    Run Keyword If  '${Domain1}' != '#BLANK'    Input Text       ${Multi_Domain_Field}          ${Domain1}

    Run Keyword If   '${Add_Domain}' == 'add'    Click Element   ${Append_Domain_Button}
    Sleep       1s
    Run Keyword If  '${Domain2}' != '#BLANK'    Input Text       ${Multi_Domain_Field1}          ${Domain2}

    Click Element       ${TPIP_Confirm_Button}
    Sleep       3s

View TPIP
    [Arguments]    ${Name}    ${IP}      ${Port}     ${Nat}       ${Compact}       ${Domain}
    Click View Element With 3 Info    ${Name}     ${IP}     ${Port}
    Sleep  5s
    Run Keyword If      '${Name}' != '#BLANK'       Page Should Contain    ${Name}
    Run Keyword If      '${IP}' != '#BLANK'         Page Should Contain    ${IP}
    Run Keyword If      '${Port}' != '#BLANK'       Page Should Contain    ${Port}
    Run Keyword If      '${Nat}' != '#BLANK'        Page Should Contain    ${Nat}
    Run Keyword If      '${Compact}' != 'none'      Page Should Contain    ${Compact}
    Run Keyword If      '${Domain}' != '#BLANK'     Page Should Contain    ${Domain}

    Click Element       ${TPIP_Cancel_View}
    Sleep  5s
