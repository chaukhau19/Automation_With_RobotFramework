*** Settings ***
Library  SeleniumLibrary
Resource  ../../Common.robot
Resource  ../../../Data/InputData.robot

*** Variables ***

*** Keywords ***
Go to PCSCF tab

    Click Element        ${PCSCF_tab}
    Sleep  1s

Go to ICSCF section in PCSCF tab

    Click Element        ${ICSCF_section}
    Sleep   1s
    Wait Until Page Contains Element    ${Data_table}         20

Go to ECSCF section in PCSCF tab

    Click Element        ${ECSCF_section}
    Sleep   1s
    Wait Until Page Contains Element    ${Data_table}         20
	
Add ICSCF
    [Arguments]     ${IP}   ${Port}	 ${Weight}	 ${Domain}  ${Priority}

    Click Element       ${Add_Button}
    Sleep  2s
    Run Keyword If  '${IP}' != '#BLANK'                                     input text                  ${IP_Field}              ${IP}
    Run Keyword If  '${Port}' != '#BLANK'                                   input text                  ${Port_Field}            ${Port}
    Add_Edit ICSCF       ${Weight}	 ${Domain}  ${Priority}

Edit ICSCF
    [Arguments]     ${IP}   ${Port}	 ${Weight}	 ${Domain}  ${Priority}

    Click Edit Element With 2 Info      ${IP}  ${Port}
    Sleep  2s
    Add_Edit ICSCF       ${Weight}	 ${Domain}  ${Priority}

Add_Edit ICSCF
    [Arguments]     ${Weight}	 ${Domain}  ${Priority}

    Run Keyword If  '${Weight}' != '#BLANK'                                 input text                  ${Weight_Field}          ${Weight}
    Run Keyword If  '${Domain}' != '#BLANK'                                 input text                  ${Domain_Field}          ${Domain}

    Run Keyword If  '${Priority}' != '#BLANK'                               input text                  ${Priority_cscf_Field}        ${Priority}

    Click Element       ${Confirm_Add}
    Sleep  3s

View PCSCF_ICSCF
    [Arguments]     ${IP}   ${Port}	 ${Weight}	 ${Domain}  ${Priority}

    Click View Element With 2 Info          ${IP}   ${Port}
    Sleep  3s

    Verify Page Contains 2 Expected Elements    IP                                                       ${IP}
    Verify Page Contains 2 Expected Elements    Port                                                     ${Port}
    Verify Page Contains 2 Expected Elements    Weight                                                   ${Weight}
    Run Keyword If  '${Domain}' != '#BLANK'  Verify Page Contains 2 Expected Elements    Domain                                                   ${Domain}
    Verify Page Contains 2 Expected Elements    Priority                                                 ${Priority}