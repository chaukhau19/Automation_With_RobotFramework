*** Settings ***
Library  SeleniumLibrary
Resource  ../../Common.robot
Resource  ../../../Data/InputData.robot

*** Variables ***
${SRTP_section}      xpath=//*[@class='collapsible-header active' and contains(text(),'Pcscf')]/following::div//a[@class='first-menu' and contains(text(),'Srtp')]
*** Keywords ***
Go to PCSCF tab
    Click Element        ${PCSCF_tab}
    Sleep       1s

Go to SRTP section in PCSCF tab

    Click Element        ${SRTP_section}
    Sleep       2s

    Wait Until Page Contains Element    ${Data_table}         20

Add SRTP
    [Arguments]     ${Index}  ${Encryption}	${Authentication}  ${Master_key}  ${Window_size}    ${Key_derivation}

    Click Element       ${Add_Button}
    Sleep       1s

    Run Keyword If  '${Index}' != '#BLANK'                           Input Text          ${Index_Field}              ${Index}

    Sleep   1s
    Add_Edit SRTP       ${Encryption}	${Authentication}  ${Master_key}  ${Window_size}    ${Key_derivation}

Edit SRTP
    [Arguments]     ${Index}  ${Encryption}  ${New_Encryption}	${Authentication}  ${Master_key}  ${Window_size}    ${Key_derivation}

    Click Edit Element With 2 Info      ${Index}   ${Encryption}

    Add_Edit SRTP       ${New_Encryption}	${Authentication}	 ${Master_key}  ${Window_size}    ${Key_derivation}

Add_Edit SRTP
    [Arguments]     ${Encryption}	${Authentication}  ${Master_key}  ${Window_size}   ${Key_derivation}

    Run Keyword If      '${Encryption}' != '#BLANK'                 Click Element       ${Encryption_Dropdown}
    Sleep       1s
    Run Keyword If      '${Encryption}' == 'AES_CM_128'                 Click Element       ${AES_CM_128}
    ...     ELSE IF     '${Encryption}' == 'Null'                       Click Element       ${Encryption_Null}
    ...     ELSE                                                        Click Element       ${AES_CM_128}
    Sleep       1s

    Run Keyword If  '${Authentication}' != '#BLANK'                 Click Element       ${Authentication_Dropdown}
    Sleep       1s
    Run Keyword If      '${Authentication}' == 'HMAC_SHA1_80'            Click Element       ${HMAC_SHA1_80}
    ...     ELSE IF     '${Authentication}' == 'HMAC_SHA1_32'	         Click Element       ${HMAC_SHA1_32}
    ...     ELSE IF     '${Authentication}' == 'Null'                    Click Element       ${Authentication_Null}
    ...     ELSE                                                         Click Element       ${HMAC_SHA1_80}
    Sleep       1s

    ${Check_Master_Key1} =  Run Keyword If      '${Master_key}' == 'TRUE'    run keyword and return status                  checkbox should not be selected    id=mki
    Run Keyword If       '${Master_key}' == 'TRUE' and '${Check_Master_Key1}' == 'True'                    Click Element    xpath=//label[@for='mki']

    ${Check_Master_Key2} =  Run Keyword If      '${Master_key}' == 'FALSE'   run keyword and return status                  checkbox should be selected    id=mki
    Run Keyword If      '${Master_key}' == 'FALSE' and '${Check_Master_Key2}' == 'True'                    Click Element    xpath=//label[@for='mki']

    Sleep       1s

    Run Keyword If  '${Window_size}' != '#BLANK'                    Input Text           ${Window_Size_Field}             ${Window_size}
    Run Keyword If  '${Key_derivation}' != '#BLANK'                 Input Text           ${Key_Derivation_Field}          ${Key_derivation}

    Click Element       ${Confirm_Add_Type_3}
    Sleep       3s

View SRTP
    [Arguments]     ${Index}  ${Encryption}	${Authentication}  ${Master_key}  ${Window_size}    ${Key_derivation}

    Click View Element With 2 Info          ${Index}    ${Encryption}
    Sleep       3s

    Verify Page Contains 2 Expected Elements    Index                                           ${Index}
    Verify Page Contains 2 Expected Elements    Encryption cipher                               ${Encryption}
    Verify Page Contains 2 Expected Elements    Authentication cipher                           ${Authentication}
    Verify Page Contains 2 Expected Elements    Master key identifier                           ${Master_key}
    Verify Page Contains 2 Expected Elements    Window size hint                                ${Window_size}
    Verify Page Contains 2 Expected Elements    Key derivation rate                             ${Key_derivation}
