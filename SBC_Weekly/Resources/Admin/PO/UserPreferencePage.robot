*** Settings ***
Library  SeleniumLibrary
Resource  ../../Common.robot

*** Variables ***
${SAVE_LANGUAGE_BUTTON}  xpath=//*[@id='content-container']/div[2]/div[1]/form/fieldset/button
${SAVE_PASSWORD_BUTTON}  xpath=//button[contains(text(),'Save')]
${OLD_PASSWORD}  id=old_password
${PASSWORD}  id=password
${CONFIRM_PASSWORD}  id=confirm_password
${USER_PREFERENCE}      xpath=//*[@class='first-menu' and text()='User Preference']
${LANGUAGE_SELECT}      xpath=//fieldset[contains(.,'Language')]//following::div[1]/input
${English}              xpath=//fieldset[contains(.,'Language')]//following::ul/li[1]
${French}               xpath=//fieldset[contains(.,'Language')]//following::ul/li[2]
${USERNAME}             xpath=//*[@id='username']

*** Keywords ***

Navigate to User Preference
    Click Element  ${Admin_tab}
    Sleep       1s
    Click Element  ${USER_PREFERENCE}
    Sleep       1s

Modify
    [Arguments]  ${Credentials}
    Common.TogglePassword 3
    Run Keyword If  """${Credentials[5]}""" != '#BLANK'  Input Text  ${OLD_PASSWORD}  ${Credentials[5]}
    Run Keyword If  """${Credentials[6]}""" != '#BLANK'  Input Text  ${PASSWORD}  ${Credentials[6]}
    Run Keyword If  """${Credentials[7]}""" != '#BLANK'  Input Text  ${CONFIRM_PASSWORD}  ${Credentials[7]}
    Sleep       2s

    #26668
    Common.TogglePassword 3
    Run Keyword If    '${Credentials[13]}' == 'unhide'      Common.Click Display Password For User Preference Page   1
    Run Keyword If    '${Credentials[14]}' == 'hide'        Common.Click Display Password For User Preference Page   2
    Sleep       2s

    ${arg} =  Create List   ${SAVE_PASSWORD_BUTTON}
    Run Keyword N Times And Stop If Success   Click Element   ${arg}     Click Element   ${arg}   3
    Sleep   1s
    #Click Element  ${SAVE_PASSWORD_BUTTON}
   # Sleep  2.5s

Verify messages
    [Arguments]  ${Credentials}
    Run Keyword If  '${Credentials[9]}' != '#BLANK'     Page Should Contain  ${Credentials[8]}
    #Page Should Contain  ${Credentials[9]}
    #Page Should Contain  ${Credentials[10]}

    Run Keyword If  '${Credentials[9]}' != '#BLANK'           Page Should Contain Element     //input[@id='old_password']//following-sibling::span[text()="${Credentials[9]}"]
    Run Keyword If  '${Credentials[10]}' != '#BLANK'           Page Should Contain Element     //input[@id='password']//following-sibling::span[text()="${Credentials[10]}"]
    Run Keyword If  '${Credentials[11]}' != '#BLANK'           Page Should Contain Element     //input[@id='confirm_password']//following-sibling::span[text()="${Credentials[11]}"]
    # It always pass because xpaths always pass
    #Run Keyword If  """${Credentials[9]}""" != '#BLANK'     Page Should Contain Element    //input[@id='old_password']//following-sibling::span         ${Credentials[9]}
    #Run Keyword If  """${Credentials[10]}""" != '#BLANK'    Page Should Contain Element    //input[@id='password']//following-sibling::span             ${Credentials[10]}
    #Run Keyword If  """${Credentials[11]}""" != '#BLANK'    Page Should Contain Element    //input[@id='confirm_password']//following-sibling::span     ${Credentials[11]}

Login again with new password
    [Arguments]  ${Credentials}
    Run Keyword If  '${Credentials[0]}' != '#BLANK'  Input Text  ${USERNAME}  ${Credentials[0]}
    Run Keyword If  """${Credentials[6]}""" != '#BLANK'  Input Text  ${PASSWORD}  ${Credentials[6]}
    Run Keyword If  """${Credentials[6]}""" == '#BLANK'  Input Text  ${PASSWORD}  ${Credentials[1]}

    #26668
    Common.TogglePassword 1
    Run Keyword If    '${Credentials[13]}' == 'unhide'      Common.Click Display Password For Login Page   1
    Run Keyword If    '${Credentials[14]}' == 'hide'        Common.Click Display Password For Login Page   2
    Sleep       3s
    
    Click Button  ${LOGIN_BUTTON}
    Sleep       2s

    
