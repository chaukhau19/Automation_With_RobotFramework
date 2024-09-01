*** Settings ***
Library  SeleniumLibrary
Resource  ../../Common.robot
Resource  ../../../Data/InputData.robot

*** Variables ***
############ General variables ##############
${Peer_tab}                                 xpath=//*[@class='first-menu' and text()='Peer']
${Name_Field}                               id=name
${TPIP_Dropdown_list}                       xpath=//label[contains(text(),'TPIP')]//preceding::div[1]/input
${TPIP_principal}                           xpath=//label[contains(text(),'TPIP')]//preceding::span[text()='tpip_principal']
${App_Dropdown_list}                        xpath=//label[contains(text(),'Supported Application')]//preceding::div[1]/input
${App_cx}                                   xpath=//label[contains(text(),'Supported Application')]//preceding::span[text()='cx']
${App_sh}                                   xpath=//label[contains(text(),'Supported Application')]//preceding::span[text()='sh']
${App_e2}                                   xpath=//label[contains(text(),'Supported Application')]//preceding::span[text()='e2']
${App_a2}                                   xpath=//label[contains(text(),'Supported Application')]//preceding::span[text()='a2']
${App_e4}                                   xpath=//label[contains(text(),'Supported Application')]//preceding::span[text()='e4']
*** Keywords ***
Go to HSS tab
    Click Element        ${HSS_tab}
    Sleep  1s

Go to Peer tab
    Click Element        ${Peer_tab}
    Sleep  1s

Add Peer
    [Arguments]  ${Name}    ${TPIP}      ${Domain}     ${App}  ${IP}  ${Port}
    Click Element       ${Add_Button}
    Sleep       3s
    Run Keyword If  '${Name}' != '#BLANK'       input text   ${Name_Field}      ${Name}
    Run Keyword If  '${TPIP}' != '#BLANK'    Click Element   ${TPIP_Dropdown_list}
    Sleep  1s
    Run Keyword If      '${TPIP}' == 'tpip_principal'    Click Element   ${TPIP_principal}

    Run Keyword If  '${Domain}' != '#BLANK'       input text   ${FQDN_Field}      ${Domain}
    Sleep  1s
    Run Keyword If  '${App}' != '#BLANK'    Click Element   ${App_Dropdown_list}
    Sleep  1s
    Run Keyword If      '${App}' == 'cx'    Click Element   ${App_cx}
    ...  ELSE IF        '${App}' == 'sh'    Click Element   ${App_sh}
    ...  ELSE IF        '${App}' == 'e2'    Click Element   ${App_e2}
    ...  ELSE IF        '${App}' == 'a2'    Click Element   ${App_a2}
    ...  ELSE IF        '${App}' == 'e4'    Click Element   ${App_e4}

    Run Keyword If  '${IP}' != '#BLANK'       input text   ${IP_Field}      ${IP}

    Run Keyword If  '${Port}' != '#BLANK'       input text   ${Port_Field}      ${Port}

    Click Element       ${Confirm_Add_MatRul}
    Sleep       3s

View Peer
    [Arguments]     ${Name}    ${TPIP}      ${Domain}     ${App}  ${IP}  ${Port}

    Click View Element With 1 Info     ${Name}
    Sleep       3s

    Verify Page Contains 2 Expected Elements    Name                                    ${Name}
    Verify Page Contains 2 Expected Elements    TPIP                                    ${TPIP}
    Verify Page Contains 2 Expected Elements    Domain                                  ${Domain}
    Verify Page Contains 2 Expected Elements    Supported Applications                  ${App}
    Verify Page Contains 2 Expected Elements    Port                                    ${Port}
    Click Element       ${Cancel_View}
    Sleep       3s