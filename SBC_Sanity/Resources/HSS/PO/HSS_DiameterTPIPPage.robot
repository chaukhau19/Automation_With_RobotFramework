*** Settings ***
Library  SeleniumLibrary
Resource  ../../Common.robot
Resource  ../../../Data/InputData.robot

*** Variables ***
############ General variables ##############
${DiameterTPIP_tab}                xpath=//*[@class='first-menu' and text()='Diameter TPIP']
${IPName_Field}                         id=ipname
${Transport_Dropdown_list}                   xpath=//label[contains(text(),'Transport Protocol')]//preceding::div[1]/input
${Transport_sctp}                           xpath=//label[contains(text(),'Transport Protocol')]//preceding::span[text()='SCTP']
${Transport_tcp}                            xpath=//label[contains(text(),'Transport Protocol')]//preceding::span[text()='TCP']
${Security_Dropdown_list}                   xpath=//label[contains(text(),'Security Mechanism')]//preceding::div[1]/input
${Security_tls}                             xpath=//label[contains(text(),'Security Mechanism')]//preceding::span[text()='TLS']
${Security_none}                            xpath=//label[contains(text(),'Security Mechanism')]//preceding::span[text()='None']
*** Keywords ***
Go to HSS tab
    Click Element        ${HSS_tab}
    Sleep  1s

Go to Diameter TPIP tab
    Click Element        ${DiameterTPIP_tab}
    Sleep  1s

Add DiameterTPIP
    [Arguments]  ${Name}    ${IP}      ${Port}     ${Transport}  ${Security}
    Click Element       ${Add_Button}
    Sleep       3s
    Run Keyword If  '${Name}' != '#BLANK'       input text   ${Name_Field}      ${Name}
    Run Keyword If  '${IP}' != '#BLANK'         input text   ${IP_Field}        ${IP}
    Run Keyword If  '${Port}' != '#BLANK'       input text   ${Port_Field}      ${Port}

    Run Keyword If  '${Transport}' != '#BLANK'    Click Element   ${Transport_Dropdown_list}
    Sleep  2s
    Run Keyword If      '${Transport}' == 'sctp'    Click Element   ${Transport_sctp}
    ...     ELSE IF     '${Transport}' == 'tcp'     Click Element   ${Transport_tcp}
    Sleep       2s

    Run Keyword If  '${Security}' != '#BLANK'    Click Element   ${Security_Dropdown_list}
    Sleep  2s
    Run Keyword If      '${Security}' == 'tls'      Click Element       ${Security_tls}
    ...     ELSE IF     '${Security}' == 'None'     Click Element       ${Security_none}
    Sleep       2s

    Click Element       ${Confirm_Add_MatRul}
    Sleep       3s

View DiameterTPIP
    [Arguments]     ${Name}    ${IP}      ${Port}     ${Transport}  ${Security}

    Click View Element With 2 Info     ${Name}    ${IP}
    Sleep       3s

    Verify Page Contains 2 Expected Elements    Name                                ${Name}
    Verify Page Contains 2 Expected Elements    IP                                  ${IP}
    Verify Page Contains 2 Expected Elements    Port                                ${Port}
    Verify Page Contains 2 Expected Elements    Transport Protocol                  ${Transport}
    Verify Page Contains 2 Expected Elements    Security Mechanism                  ${Security}
    Click Element       ${Cancel_View}
    Sleep       3s