*** Settings ***
Library  SeleniumLibrary
Resource  ../../Common.robot
Resource  ../../../Data/InputData.robot

*** Variables ***
${Bypass_section}       xpath=//*[@class='collapsible-header active' and contains(text(),'Ibcf')]/following::div//a[@class='first-menu' and contains(text(),'Bypass')]
*** Keywords ***
Go to IBCF tab
    Click Element        ${IBCF_tab}
    Sleep       1s

Go to Bypass section in IBCF tab
    Click Element        ${Bypass_section}
    Sleep   1s
    Wait Until Page Contains Element    ${Data_table}         20

Add IBCF_Bypass
    [Arguments]     ${Name}  ${Peer1}  ${less_more_peer}  ${Peer2}

    Click Element       ${Add_Button}
    Sleep       2s

    Run Keyword If  '${Name}' != '#BLANK'                              Input Text                   ${Name_Field}              ${Name}
    Add_Edit IBCF_Bypass   ${Peer1}  ${less_more_peer}  ${Peer2}

Edit IBCF_Bypass
    [Arguments]     ${Name}  ${Peer1}  ${less_more_peer}  ${Peer2}

    Click Edit Element With 1 Info      ${Name}
    Sleep       1s
    Add_Edit IBCF_Bypass   ${Peer1}  ${less_more_peer}  ${Peer2}

Add_Edit IBCF_Bypass
    [Arguments]     ${Peer1}  ${less_more_peer}  ${Peer2}

    Run Keyword If  '${Peer1}' != '#BLANK'                              Click Element               ${Peer1_Dropdown}
    Sleep       1s
    Run Keyword If      '${Peer1}' == '1'                                   Click Element               ${Peer1_1}
    Run Keyword If      '${Peer1}' == '2'                                   Click Element               ${Peer1_2}

    Run Keyword If      '${less_more_peer}' == 'add'                        Click Element               ${Add_Peer_Button}
    Run Keyword If      '${less_more_peer}' == 'remove'                     Click Element               ${Remove_Peer_Button}
    Sleep       1s
    Run Keyword If  '${Peer2}' != '#BLANK'                              Click Element               ${Peer2_Dropdown}
    Sleep       1s
    Run Keyword If      '${Peer2}' == '1'                                   Click Element               ${Peer2_1}
    Run Keyword If      '${Peer2}' == '2'                                   Click Element               ${Peer2_2}

    Sleep       1s
    Click Element    ${Confirm_Add_Type_Button} 
    Sleep       3s


View IBCF_Bypass
    [Arguments]     ${Name}

    Click View Element With 1 Info          ${Name}
    Sleep       3s

    Verify Page Contains 2 Expected Elements    Name                                                       ${Name}
