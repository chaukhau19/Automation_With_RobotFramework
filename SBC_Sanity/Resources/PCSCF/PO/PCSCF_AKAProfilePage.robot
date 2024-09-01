*** Settings ***
Library  SeleniumLibrary
Resource  ../../Common.robot
Resource  ../../../Data/InputData.robot

*** Variables ***
${AKA_section}                          xpath=//*[@class='collapsible-header active']//following::a[contains(text(),'AKA Profile')]
${Index_AKA_Field}                      id=id
${Protected_Server_Port_Field}          id=port_ps
${First_Protected_Client_Port_Field}    id=port_pc_first
${Last_Protected_Client_Port_Field}     id=port_pc_last
${Integrity_Algorithm_Dropdown}         xpath=//label[contains(text(),'Integrity Algorithm')]//preceding::div[1]/input
${Integrity_Algorithm_Sha_Field}        xpath=//*[@id="content-container"]//following::span[contains(.,'hmac-sha-1-96')]
${Integrity_Algorithm_Md5_Field}        xpath=//*[@id="content-container"]//following::span[contains(.,'hmac-md5-96')]

*** Keywords ***
Go to PCSCF tab
    Click Element        ${PCSCF_tab}
    Sleep  1s

Go to AKA Profile section in PCSCF tab
    Click Element        ${AKA_section}
    Sleep   1s
    Wait Until Page Contains Element    ${Data_table}         20

Add AKAProfile
    [Arguments]     ${Index}  ${Protected_Server_Port}	${First_Protected_Client_Port}	  ${Last_Protected_Client_Port}
    ...    ${Integrity_Algorithm}  ${Integrity_Algorithm_sha}    ${Integrity_Algorithm_md5}

    Click Element       ${Add_Button}
    Sleep  2s

    Run Keyword If  '${Index}' != '#BLANK'                              input text                  ${Index_AKA_Field}              ${Index}

    Add_Edit AKA Profile      ${Protected_Server_Port}	${First_Protected_Client_Port}	  ${Last_Protected_Client_Port}
    ...    ${Integrity_Algorithm}  ${Integrity_Algorithm_sha}    ${Integrity_Algorithm_md5}

Edit AKAProfile
    [Arguments]     ${Index}  ${Protected_Server_Port}	${New_Protected_Server_Port}  ${First_Protected_Client_Port}	  ${Last_Protected_Client_Port}
    ...    ${Integrity_Algorithm}  ${Integrity_Algorithm_sha}    ${Integrity_Algorithm_md5}

    Click Edit Element With 2 Info      ${Index}  ${Protected_Server_Port}
    Sleep  1s
    Add_Edit AKA Profile     ${New_Protected_Server_Port}	${First_Protected_Client_Port}	  ${Last_Protected_Client_Port}
    ...    ${Integrity_Algorithm}  ${Integrity_Algorithm_sha}    ${Integrity_Algorithm_md5}


Add_Edit AKA Profile
     [Arguments]    ${Protected_Server_Port}	${First_Protected_Client_Port}	  ${Last_Protected_Client_Port}
    ...    ${Integrity_Algorithm}  ${Integrity_Algorithm_sha}    ${Integrity_Algorithm_md5}
    #DTMF options
#    Run Keyword If  '${Protected_Server_Port}' != '#BLANK'                 input text                  ${Protected_Server_Port_Field}              ${Protected_Server_Port}
#    Sleep   1s

    Run Keyword If  '${First_Protected_Client_Port}' != '#BLANK'           input text                  ${First_Protected_Client_Port_Field}              ${First_Protected_Client_Port}
    Sleep   1s

    Run Keyword If  '${Last_Protected_Client_Port}' != '#BLANK'            input text                  ${Last_Protected_Client_Port_Field}              ${Last_Protected_Client_Port}
    Sleep   1s


    Run Keyword If  '${Integrity_Algorithm}' != '#BLANK'                          Click Element             ${Integrity_Algorithm_Dropdown}
    Sleep   1s
    Run Keyword If      '${Integrity_Algorithm_sha}' == 'hmac-sha-1-96'               Click Element             ${Integrity_Algorithm_Sha_Field}
    Run Keyword If      '${Integrity_Algorithm_md5}' == 'hmac-md5-96'                 Click Element             ${Integrity_Algorithm_Md5_Field}
    Sleep   1s


    Click Element    ${Confirm_Add}
    Sleep  3s

View AKAProfile
    [Arguments]     ${Index}  ${Protected_Server_Port}	${First_Protected_Client_Port}	  ${Last_Protected_Client_Port}

    Click View Element With 2 Info          ${Index}  ${Protected_Server_Port}
    Sleep  3s

    Verify Page Contains 2 Expected Elements    Index                                                       ${Index}
#    Verify Page Contains 2 Expected Elements    Protected Server Port                                       ${Protected_Server_Port}
    Verify Page Contains 2 Expected Elements    First Protected Client Port                                 ${First_Protected_Client_Port}
    Verify Page Contains 2 Expected Elements    Last Protected Client Port                                  ${Last_Protected_Client_Port}

