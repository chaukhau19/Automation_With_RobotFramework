*** Settings ***
Library  SeleniumLibrary
Resource  ../../Common.robot
Resource  ../../../Data/InputData.robot

*** Variables ***
############ General variables ##############
${PeerGroup_tab}                            xpath=//*[@class='first-menu' and text()='Peer Group']
${Name_Field}                               id=name
${AddPeer}                                  xpath=//button[@value='add-more-peer']
${RemovePeer}                               xpath=//button[@class='remove-button-control']
${Peer1_Dropdown_list}                       xpath=//label[@for='peer-0-peer']//preceding::div[1]/input
${peer1_tas}                                 xpath=//label[@for='peer-0-peer']//preceding::span[text()='tas']
${peer1_scscf2}                              xpath=//label[@for='peer-0-peer']//preceding::span[text()='scscf2']
${peer1_icscf}                               xpath=//label[@for='peer-0-peer']//preceding::span[text()='icscf']
${Peer2_Dropdown_list}                       xpath=//label[@for='peer-1-peer']//preceding::div[1]/input
${peer2_tas}                                 xpath=//label[@for='peer-1-peer']//preceding::div[1]//span[text()='tas']
${peer2_scscf2}                              xpath=//label[@for='peer-1-peer']//preceding::div[1]//span[text()='scscf2']
${peer2_icscf}                               xpath=//label[@for='peer-1-peer']//preceding::div[1]//span[text()='icscf']
${Priority1_Field}                           id=peer-0-priority
${Priority2_Field}                           id=peer-1-priority
*** Keywords ***
Go to HSS tab
    Click Element        ${HSS_tab}
    Sleep  1s

Go to Peer Group tab
    Click Element        ${PeerGroup_tab}
    Sleep  1s

Add Peer Group
    [Arguments]  ${Name}   ${AddPeer1}   ${Peer1}   ${Priority1}  ${AddPeer2}   ${Peer2}   ${Priority2}
    Click Element       ${Add_Button}
    Sleep       3s
    Run Keyword If  '${Name}' != '#BLANK'       input text   ${Name_Field}      ${Name}
    Attach Peers  ${Name}   ${AddPeer1}   ${Peer1}   ${Priority1}  ${AddPeer2}   ${Peer2}   ${Priority2}

Attach Peers
    [Arguments]  ${Name}   ${AddPeer1}   ${Peer1}   ${Priority1}  ${AddPeer2}   ${Peer2}   ${Priority2}

    Run Keyword If      '${AddPeer1}' == 'Add'         Click Element   ${Add_peer}
    ...     ELSE IF     '${AddPeer1}' == 'Remove'      Click Element   ${Remove_peer}

    Run Keyword If  '${Peer1}' != '#BLANK'          Click Element   ${Peer1_Dropdown_list}
    Sleep  2s
    Run Keyword If      '${Peer1}' == 'tas'         Click Element   ${peer1_tas}
    ...     ELSE IF     '${Peer1}' == 'scscf2'      Click Element   ${peer1_scscf2}
    ...     ELSE IF     '${Peer1}' == 'icscf'       Click Element   ${peer1_icscf}
    Sleep       2s

    Run Keyword If  '${Priority1}' != '#BLANK'       input text   ${Priority1_Field}      ${Priority1}

    Run Keyword If      '${AddPeer2}' == 'Add'         Click Element   ${Add_peer}
    ...     ELSE IF     '${AddPeer2}' == 'Remove'      Click Element   ${Remove_peer}

    Run Keyword If  '${Peer2}' != '#BLANK'    Click Element   ${Peer2_Dropdown_list}
    Sleep  2s
    Run Keyword If      '${Peer2}' == 'tas'         Click Element   ${peer2_tas}
    ...     ELSE IF     '${Peer2}' == 'scscf2'      Click Element   ${peer2_scscf2}
    ...     ELSE IF     '${Peer2}' == 'icscf'       Click Element   ${peer2_icscf}
    Sleep       2s

    Run Keyword If  '${Priority2}' != '#BLANK'       input text   ${Priority2_Field}      ${Priority2}

    Click Element       ${Confirm_Add_DNS}
    Sleep       3s

Detach Peer
    [Arguments]  ${Name}   ${Peer1}  ${Priority1}

    Click Detach Element with 2 Info  ${Name}   ${Peer1}
    Sleep       7s
    Click Element       ${Cancel_Del}
    Sleep  3s
    Click Detach Element With 2 Info    ${Name}   ${Peer1}
    Sleep       7s
    Click Element       ${Confirm_Del}
    Sleep  3s

Attach Peer Page
    [Arguments]  ${Name}   ${AddPeer1}   ${Peer1}   ${Priority1}  ${AddPeer2}   ${Peer2}   ${Priority2}
    Click Edit Element With 1 Info   ${Name}
    Attach Peers   ${Name}   ${AddPeer1}   ${Peer1}   ${Priority1}  ${AddPeer2}   ${Peer2}   ${Priority2}