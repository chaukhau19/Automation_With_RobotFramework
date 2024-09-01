*** Settings ***
Library  SeleniumLibrary
Resource  ../../Common.robot
Resource  ../../../Data/InputData.robot

*** Variables ***
############ General variables ##############
${Trusted_tab}                  xpath=//*[@class='collapsible-header first-menu' and contains(text(),'Trusted')]
${Trusted_section}              xpath=//*[@class='collapsible-header first-menu active' and contains(text(),'Trusted')]//following::a[1]
${Not_Trusted_section}          xpath=//*[@class='sub-menu' and contains(text(),'Not Trusted')]

*** Keywords ***
Go to SCSCF tab
    Click Element        ${SCSCF_tab}
    Sleep  1s

Go to Trusted section in SCSCF tab
    Click Element        ${Trusted_tab}
    Sleep   3s

Go to Trusted section in Trusted tab
    Click Element        ${Trusted_section}
    Sleep   3s

Go to Not Trusted section in Trusted tab
    Click Element        ${Not_Trusted_section}
    Sleep   3s

Add Trusted Peer
    [Arguments]     ${IP}   ${Port}
    Click Element       ${Add_Button}
    Sleep  3s
    Run Keyword If  '${IP}' != '#BLANK'    input text       ${IP_Field}              ${IP}
    Sleep       1s
    Run Keyword If  '${Port}' != '#BLANK'    input text      ${Port_Field}          ${Port}

    Click Element       ${Confirm_Add_MatRul}
    Sleep       3s