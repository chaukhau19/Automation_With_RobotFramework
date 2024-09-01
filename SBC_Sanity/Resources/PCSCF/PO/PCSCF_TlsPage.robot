*** Settings ***
Library  SeleniumLibrary
Resource  ../../Common.robot
Resource  ../../../Data/InputData.robot

*** Variables ***
${TLS_section}      xpath=//*[@class='collapsible-header active' and contains(text(),'Pcscf')]/following::div//a[@class='first-menu' and contains(text(),'Tls')]
${Check_certificate_true}    		xpath=//label[@for='check']/preceding::div[1]//span[contains(.,'True')]
${Check_certificate_false}      	xpath=//label[@for='check']/preceding::div[1]//span[contains(.,'False')]
${Check_certificate_identity}       xpath=//label[@for='check']/preceding::div[1]//span[contains(.,'Identity')]
${Check_certificate_dropdown}       xpath=//label[@for='check']/preceding::div[1]/input


*** Keywords ***
Go to PCSCF tab
    Click Element        ${PCSCF_tab}
    Sleep  1s

Go to TLS section in PCSCF tab

    Click Element        ${TLS_section}
    Sleep   4s

    Wait Until Page Contains Element    ${Data_table}         20

Add TLS
    [Arguments]     ${Name}  ${Protocol_version}  ${Allow_cipher}  ${Allow_cipher_suite}  ${Allow_cipher_specific}    ${Verification}
    ...   ${Maximum_connection}  ${Certificate_depth}  ${Handshake_timer}  ${Renegotiation_timer}    ${Check_certificate}  ${CA}  ${Certificate}  ${Private_key}  ${Password}

    Click Element       ${Add_Button}
    Sleep  1s

    Run Keyword If  '${Name}' != '#BLANK'                                   input text          ${Name_Field}              ${Name}
    Sleep  1s
    Run Keyword If  '${Protocol_version}' != '#BLANK'                       Click Element       ${Protocol_Version_Dropdown}
    Sleep  1s
    Run Keyword If      '${Protocol_version}' == 'tls_v1.1'                     Click Element       ${TLS_V11}
    ...     ELSE IF     '${Protocol_version}' == 'tls_v1.2'                     Click Element       ${TLS_V12}
    ...     ELSE IF     '${Protocol_version}' == 'tls_v1'                       Click Element       ${TLS_V1}
    ...     ELSE IF     '${Protocol_version}' == 'ssl_v3'                       Click Element       ${SSL_V3}
    ...     ELSE IF     '${Protocol_version}' == 'ssl_v23'                      Click Element       ${SSL_V23}

    Sleep  1s

    Run Keyword If  '${Allow_cipher}' == 'Suite'                       Click Element       ${Allow_Cipher_Dropdown}
    Sleep  1s
    Run Keyword If      '${Allow_cipher_suite}' == 'NULL'                   Click Element       ${Allow_Cipher_Null}
    ...     ELSE IF     '${Allow_cipher_suite}' == 'aNULL'	                Click Element       ${Allow_Cipher_aNull}
    ...     ELSE IF     '${Allow_cipher_suite}' == 'ALL'                    Click Element       ${Allow_Cipher_ALL}
    ...     ELSE IF     '${Allow_cipher_suite}' == 'HIGH'                   Click Element       ${Allow_Cipher_HIGH}
    ...     ELSE IF     '${Allow_cipher_suite}' == 'LOW'                    Click Element       ${Allow_Cipher_LOW}
    ...     ELSE IF     '${Allow_cipher_suite}' == 'RSA'                    Click Element       ${Allow_Cipher_RSA}
    ...     ELSE IF     '${Allow_cipher_suite}' == 'kEDH'                   Click Element       ${Allow_Cipher_kEDH}
    ...     ELSE IF     '${Allow_cipher_suite}' == 'aRSA'                   Click Element       ${Allow_Cipher_aRSA}
    ...     ELSE IF     '${Allow_cipher_suite}' == 'aDSS'                   Click Element       ${Allow_Cipher_aDSS}
    ...     ELSE IF     '${Allow_cipher_suite}' == 'TLSv1'                  Click Element       ${Allow_Cipher_TLSv1}
    ...     ELSE IF     '${Allow_cipher_suite}' == 'SSLv3'                  Click Element       ${Allow_Cipher_SSLv3}
    ...     ELSE IF     '${Allow_cipher_suite}' == 'SSLv2'                  Click Element       ${Allow_Cipher_SSLv2}
    ...     ELSE IF     '${Allow_cipher_suite}' == 'DH'                     Click Element       ${Allow_Cipher_DH}
    ...     ELSE IF     '${Allow_cipher_suite}' == 'ADH'                    Click Element       ${Allow_Cipher_ADH}
    ...     ELSE IF     '${Allow_cipher_suite}' == 'AES'                    Click Element       ${Allow_Cipher_AES}
    ...     ELSE IF     '${Allow_cipher_suite}' == '3DES'                   Click Element       ${Allow_Cipher_3DES}
    ...     ELSE IF     '${Allow_cipher_suite}' == 'DES'                    Click Element       ${Allow_Cipher_DES}
    ...     ELSE IF     '${Allow_cipher_suite}' == 'MD5'                    Click Element       ${Allow_Cipher_MD5}
    ...     ELSE IF     '${Allow_cipher_suite}' == 'SHA1'                   Click Element       ${Allow_Cipher_SHA1}

    Sleep  1s

    Run Keyword If  '${Allow_cipher}' == 'Specific'                     Click Element       ${Allow_Cipher_Specific_Button}
    Sleep  1s
    Run Keyword If  '${Allow_cipher_specific}' != '#BLANK'              input text          ${Specific_Field}              ${Allow_cipher_specific}

    Run Keyword If  '${Verification}' != '#BLANK'                       Click Element       ${Verification_Dropdown}
    Sleep  1s
    Run Keyword If      '${Verification}' == 'none'                         Click Element       ${Verification_none}
    ...     ELSE IF     '${Verification}' == 'optional'	                    Click Element       ${Verification_optional}
    ...     ELSE IF     '${Verification}' == 'mandatory'                    Click Element       ${Verification_mandatory}
    Sleep  1s

    Run Keyword If  '${Maximum_connection}' != '#BLANK'                 input text             ${Max_Connection_Field}              ${Maximum_connection}
    Run Keyword If  '${Certificate_depth}' != '#BLANK'                  input text             ${Certificate_Field}                 ${Certificate_depth}
    Run Keyword If  '${Handshake_timer}' != '#BLANK'                    input text             ${Handshake_Field}                    ${Handshake_timer}
    Run Keyword If  '${Renegotiation_timer}' != '#BLANK'                input text             ${Renegotiation_Field}               ${Renegotiation_timer}

    #${Check_certificate1} =  Run Keyword If      '${Check_certificate}' == 'TRUE'    run keyword and return status                  checkbox should not be selected    id=check
    #Run Keyword If       '${Check_certificate}' == 'TRUE' and '${Check_certificate1}' == 'True'                    Click Element    xpath=//label[@for='check']

    #${Check_certificate2} =  Run Keyword If      '${Check_certificate}' == 'FALSE'   run keyword and return status                  checkbox should be selected    id=check
    #Run Keyword If      '${Check_certificate}' == 'FALSE' and '${Check_certificate2}' == 'True'                    Click Element    xpath=//label[@for='check']
    #Run Keyword If       '${Check_certificate}' == 'TRUE'
    #Sleep  1s
	
    Run Keyword If  '${Check_certificate}' != '#BLANK'                       Click Element       ${Check_certificate_dropdown}
    Sleep   1s
    Run Keyword If      '${Check_certificate}' == 'TRUE'                         Click Element       ${Check_certificate_true}
    ...     ELSE IF     '${Check_certificate}' == 'FALSE'	                     Click Element       ${Check_certificate_false}
    ...     ELSE IF     '${Check_certificate}' == 'IDENTITY'                     Click Element       ${Check_certificate_identity}
    #
    Add_Edit TLS  ${CA}  ${Certificate}  ${Private_key}  ${Password}

Edit TLS
    [Arguments]     ${Name}  ${Protocol_version}  ${CA}  ${Certificate}  ${Private_key}  ${Password}

    Click Edit Element With 2 Info      ${Name}  ${Protocol_version}

    Add_Edit TLS       ${CA}  ${Certificate}  ${Private_key}  ${Password}

Add_Edit TLS
    [Arguments]  ${CA}  ${Certificate}  ${Private_key}  ${Password}
    Run Keyword If  '${CA}' != '#BLANK'                                 choose file       ${CA_Browser}     ${CA_File_Path}
    #Run Keyword If  '${CA}' != '#BLANK'                                 choose file       id=cafile     D:\\Cirpack\\Automation\\SVN\\WEB_SBC_RF\\Data\\PCSCF\\CA.txt
    Sleep  1s
    Run Keyword If  '${Certificate}' != '#BLANK'                        choose file       ${Certificate_Browser}    ${Certificate_File_Path}
    Sleep  1s
    Run Keyword If  '${Private_key}' != '#BLANK'                        choose file       ${Private_Browser}        ${Private_File_Path}
    Sleep  1s
    Run Keyword If  '${Password}' != '#BLANK'                           input text        ${Password_Field}             ${Password}

    Click Element       ${Confirm_Add_HAP}
    Sleep       3s

View TLS
    [Arguments]     ${Name}  ${Protocol_version}  ${Allow_cipher}  ${Allow_cipher_suite}  ${Allow_cipher_specific}  ${Verification}  ${Check_certificate}

    Click View Element With 2 Info          ${Name}  ${Protocol_version}
    Sleep  3s

    Verify Page Contains 2 Expected Elements                                                     Name                                           ${Name}
    Verify Page Contains 2 Expected Elements                                                     Protocol version                               ${Protocol_version}
    Run Keyword If  '${Allow_cipher}' == 'Suite'     Verify Page Contains 2 Expected Elements    Allowed cipher                                 ${Allow_cipher_suite}
    Run Keyword If  '${Allow_cipher}' == 'Specific'  Verify Page Contains 2 Expected Elements    Allowed cipher                                 ${Allow_cipher_specific}
    Verify Page Contains 2 Expected Elements                                                     Verification mode                              ${Verification}
    Verify Page Contains 2 Expected Elements                                                     Check certificate                              ${Check_certificate}

