*** Settings ***
Library  SeleniumLibrary
Resource  ../../Common.robot

*** Variables ***
${SAVE_LANGUAGE_BUTTON}  xpath=//*[@id='content-container']/div[2]/div[1]/form/fieldset/button
${SAVE_PASSWORD_BUTTON}  xpath=//button[contains(text(),'Save')]
${OLD_PASSWORD}  id=old_password
${PASSWORD}  id=password
${CONFIRM_PASSWORD}  id=confirm_password
${USER_PREFERENCE}  xpath=//*[@class='first-menu' and text()='User Preference']
${LANGUAGE_SELECT}  xpath=//fieldset[contains(.,'Language')]//following::div[1]/input
${English}          xpath=//fieldset[contains(.,'Language')]//following::ul/li[1]
${French}           xpath=//fieldset[contains(.,'Language')]//following::ul/li[2]
${USERNAME}  xpath=//*[@id='username']
${LOGIN_BUTTON}  name=btnLogin
*** Keywords ***

Navigate to User Preference
    Click Element  ${Admin_tab}
    Sleep  1s
    Click Element  ${USER_PREFERENCE}
    Sleep  1s

Modify
    [Arguments]  ${Credentials}

    #Mouse Down  ${LANGUAGE_SELECT}
    #Sleep  2s
    #Run Keyword If  '${Credentials[4]}' == 'en'       Click Element   ${English}
    #...   ELSE IF   '${Credentials[4]}' == 'fr'       Click Element   ${French}
    #Run Keyword If  '${Credentials[4]}' == 'en'       Click Element   ${English}
    #...   ELSE IF   '${Credentials[4]}' == 'fr'       Click Element   ${French}
    #Sleep  2s
    #Click Element  ${SAVE_LANGUAGE_BUTTON}
    #Modify Password
    Run Keyword If  '${Credentials[5]}' != '#BLANK'  Input Text  ${OLD_PASSWORD}  ${Credentials[5]}
    Run Keyword If  '${Credentials[6]}' != '#BLANK'  Input Text  ${PASSWORD}  ${Credentials[6]}
    Run Keyword If  '${Credentials[7]}' != '#BLANK'  Input Text  ${CONFIRM_PASSWORD}  ${Credentials[7]}
    Sleep  3s
    Click Element  ${SAVE_PASSWORD_BUTTON}
Verify mesaages
    [Arguments]  ${Credentials}
    Page Should Contain  ${Credentials[8]}
    Page Should Contain  ${Credentials[9]}
    Page Should Contain  ${Credentials[10]}
Login again with new password
    [Arguments]  ${Credentials}
    Run Keyword If  '${Credentials[0]}' != '#BLANK'  Input Text  ${USERNAME}  ${Credentials[0]}
    Run Keyword If  '${Credentials[6]}' != '#BLANK'  Input Text  ${PASSWORD}  ${Credentials[6]}
   # Run Keyword If  '${Credentials[7]}' != '#BLANK'  Input Text  ${CONFIRM_PASSWORD}  ${Credentials[7]}
    Click Button  ${LOGIN_BUTTON}
    Sleep  3s

