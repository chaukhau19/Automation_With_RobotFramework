*** Settings ***
Library  SeleniumLibrary
Resource  ../../Common.robot
Resource  ../../../Data/InputData.robot

*** Variables ***
############ General variables ##############
${IPDestination_tab}        xpath=//*[@class='first-menu' and contains(text(),'IP Destination')]
${IPName_Field}             id=ipname
${Protocol_Dropdown_list}    xpath=//label[contains(text(),'Protocol')]//preceding::div[1]/input
${Protocol_UDP}              xpath=//label[contains(text(),'Protocol')]//preceding::span[contains(.,'UDP')]
${Protocol_TCP}              xpath=//label[contains(text(),'Protocol')]//preceding::span[contains(.,'TCP')]

*** Keywords ***
Go to TAS tab
    Click Element        ${TAS_tab}
    Sleep       1s

Go to IP Destination tab
    Click Element        ${IPDestination_tab}
    Sleep       1s

Add IPDestination
    [Arguments]  ${IP_Name}    ${IP}      ${Port}     ${Protocol}
    Click Element       ${Add_Button}
    Sleep       3s
    Run Keyword If  '${IP_Name}' != '#BLANK'    Input Text   ${IPName_Field}   ${IP_Name}

    Run Keyword If  '${IP}' != '#BLANK'    Input Text   ${IP_Field}   ${IP}


    Run Keyword If  '${Port}' != '#BLANK'    Input Text     ${Port_Field}    ${Port}


    Run Keyword If  '${Protocol}' != '#BLANK'    Click Element   ${Protocol_Dropdown_list}
    Sleep       1s

    Run Keyword If      '${Protocol}' == 'UDP'    Click Element   ${Protocol_UDP}
    ...     ELSE IF     '${Protocol}' == 'TCP'    Click Element   ${Protocol_TCP}
    Sleep       1s

    Click Element       ${Confirm_Add_Type_3}
    Sleep       3s

Edit IPDestination
    [Arguments]    ${IP_Name}    ${IP}      ${Port}     ${Protocol}   ${Edit_IP}  ${Edit_Port}  ${Edit_Protocol}
    Click Edit Element With 2 Info      ${IP_Name}    ${IP}
    Sleep       3s

    Run Keyword If  '${Edit_IP}' != '#BLANK'    Input Text      ${IP_Field}          ${Edit_IP}
    Sleep       1s

    Run Keyword If  '${Edit_Port}' != '#BLANK'    Input Text    ${Port_Field}        ${Edit_Port}
    Sleep       1s
    Click Element       ${Confirm_Add_Type_3}
    Sleep       3s
    Reload Page

View IPDestination
    [Arguments]     ${IP_Name}    ${IP}      ${Port}     ${Protocol}
    Click View Element With 2 Info      ${IP_Name}    ${IP}
    Sleep       3s

    Verify Page Contains 2 Expected Elements    IP Name                              ${IP_Name}
    Verify Page Contains 2 Expected Elements    IP                                   ${IP}
    Verify Page Contains 2 Expected Elements    Port                                 ${Port}
    Verify Page Contains 2 Expected Elements    Protocol                             ${Protocol}
    Click Element       ${Cancel_View}
    Sleep       3s