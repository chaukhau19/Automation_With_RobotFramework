*** Settings ***
Library  SeleniumLibrary
Resource  ../../Common.robot
Resource  ../../../Data/InputData.robot

*** Variables ***
############ General variables ##############
${Realm_tab}                                 xpath=//*[@class='first-menu' and text()='Realm']
${Name_Field}                               id=name
${PeerGroup_Dropdown_list}                  xpath=//label[contains(text(),'Peer Group')]//preceding::div[1]/input
${PeerGroup_1}                              xpath=//label[contains(text(),'Peer Group')]//preceding::span[text()='group1']
${PeerGroup_2}                              xpath=//label[contains(text(),'Peer Group')]//preceding::span[text()='group2']
${PeerGroup_3}                              xpath=//label[contains(text(),'Peer Group')]//preceding::span[text()='group4']
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

Go to Realm tab
    Click Element        ${Realm_tab}
    Sleep  1s

Add Realm
    [Arguments]  ${Name}    ${Domain}      ${PeerGroup}     ${App}
    Click Element       ${Add_Button}
    Sleep       3s
    Run Keyword If  '${Name}' != '#BLANK'       input text   ${Name_Field}      ${Name}
    Run Keyword If  '${Domain}' != '#BLANK'       input text   ${Domain_Field}      ${Domain}

    Run Keyword If  '${PeerGroup}' != '#BLANK'    Click Element   ${PeerGroup_Dropdown_list}
    Sleep  1s
    Run Keyword If      '${PeerGroup}' == 'group1'    Click Element   ${PeerGroup_1}
    ...   ELSE IF      '${PeerGroup}' == 'group2'    Click Element   ${PeerGroup_2}
    ...   ELSE IF      '${PeerGroup}' == 'group3'    Click Element   ${PeerGroup_3}


    Sleep  1s
    Run Keyword If  '${App}' != '#BLANK'    Click Element   ${App_Dropdown_list}
    Sleep  1s
    Run Keyword If      '${App}' == 'cx'    Click Element   ${App_cx}
    ...  ELSE IF        '${App}' == 'sh'    Click Element   ${App_sh}
    ...  ELSE IF        '${App}' == 'e2'    Click Element   ${App_e2}
    ...  ELSE IF        '${App}' == 'e4'    Click Element   ${App_e4}
    ...  ELSE IF        '${App}' == 'a2'    Click Element   ${App_a2}
    Sleep  1s
    Click Element       ${Confirm_Add_MatRul}
    Sleep       3s

View Realm
    [Arguments]     ${Name}   ${Domain}  ${PeerGroup}   ${App}

    Click View Element With 1 Info     ${Name}
    Sleep       3s

    Verify Page Contains 2 Expected Elements    Name                                    ${Name}
    Verify Page Contains 2 Expected Elements    Domain                                  ${Domain}
    Verify Page Contains 2 Expected Elements    Peer Group                              ${PeerGroup}
    Verify Page Contains 2 Expected Elements    Supported Applications                  ${App}
    Click Element       ${Cancel_View}
    Sleep       3s