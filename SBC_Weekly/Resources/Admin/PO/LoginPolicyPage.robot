*** Settings ***
Library  SeleniumLibrary
Resource  ../../Common.robot
Resource  ../../Admin/UserManagerApp.robot
Resource  ../../Admin/UserPreferenceApp.robot
Resource  ../../Admin/LoginApp_SBC.robot
Resource  ../../Admin/LoginPolicyApp.robot
*** Variables ***
${LOGIN_POLICY}                              xpath=//*[@class='collapsible-header active']//following::a[text()='Login Policy']
${The_number_of_maximum_tries}               xpath=//*[@id="max_tries"]
${Blocking_period_time}                      xpath=//*[@id="blocking_time"]
#${value_of_The_number_of_maximum_tries_field}          xpath=//input[@id='max_tries' and @value="${Info[6]}"]
#${value_of_Blocking_period_time_field}                 xpath=//input[@id='blocking_time' and @value="${Info[7]}"]


*** Keywords ***
Navigate to Login Policy Page
    Click Element  ${Admin_tab}
    Sleep       1s
    Click Element  ${LOGIN_POLICY}
    Sleep       1s



######################################### Valid #########################################
Edit Valid Login Policy
    [Arguments]  ${Info}
    Page Should Contain  Login Policy
    Run Keyword If  '${Info[6]}' != '#BLANK'    Input Text       ${The_number_of_maximum_tries}            ${Info[6]}
    Run Keyword If  '${Info[7]}' != '#BLANK'    Input Text       ${Blocking_period_time}                   ${Info[7]}
    Click Button  name=btn-submit
    Sleep       1s
    Page Should Contain Element     //input[@id='max_tries' and @value="${Info[6]}"]
    Page Should Contain Element     //input[@id='blocking_time' and @value="${Info[7]}"]

Login again
    [Arguments]  ${Credentials}
    Run Keyword If    '${credentials[6]}' == '1'    Login Once  ${Credentials}
    Run Keyword If    '${credentials[6]}' == '2'    Login Multiple Times      ${Credentials}
    Run Keyword If    '${credentials[6]}' == '3'    Login Multiple Times      ${Credentials}
    Run Keyword If    '${credentials[6]}' == '4'    Login Multiple Times      ${Credentials}
    Run Keyword If    '${credentials[6]}' == '5'    Login Multiple Times      ${Credentials}

Login Once
    [Arguments]  ${Credentials}    
    Common.TogglePassword 1
    Run Keyword If  '${Credentials[0]}' != '#BLANK'  Input Text    ${USERNAME}  ${Credentials[0]}
    Run Keyword If  '${Credentials[1]}' != '#BLANK'  Input Text    ${PASSWORD}  ${Credentials[1]}
   #26668
    Common.TogglePassword 1
    Run Keyword If  '${Credentials[8]}' == 'unhide'      Common.Click Display Password For Login Page   1
    Run Keyword If  '${Credentials[8]}' == 'hide'        Common.Click Display Password For Login Page   2
    Sleep       1s
    Click Button    ${LOGIN_BUTTON}
    Sleep       1s
    Click Element   ${LOGOUT_BUTTON}
    Sleep       1s

Login Multiple Times
    [Arguments]    ${Credentials}
     Run Keyword If    '${credentials[6]}' != '1'   run keyword      Repeat Keyword    ${credentials[6]}    Login Once    ${Credentials}
     Sleep       1s

######################################### Invalid #########################################
Edit Invalid Login Policy
    [Arguments]  ${Info}
    Page Should Contain  Login Policy
    Run Keyword If  '${Info[6]}' != '#BLANK'    Input Text       ${The_number_of_maximum_tries}            ${Info[6]}
    Run Keyword If  '${Info[7]}' != '#BLANK'    Input Text       ${Blocking_period_time}                   ${Info[7]}
    Sleep       1s
    Click Button  name=btn-submit
    Sleep       1s




######################################### password error #########################################    
Login again with password error
    [Arguments]  ${Info}
    Run Keyword If    '${Info[6]}' == '1'    Login Once Error      ${Info}
    Run Keyword If    '${Info[6]}' != '1'    Login Multiple Times Error      ${Info}

Login Once Error
    [Arguments]  ${Info}    
    Common.TogglePassword 1
    Run Keyword If  '${Info[4]}' != '#BLANK'  Input Text    ${USERNAME}  ${Info[4]}
    Run Keyword If  '${Info[5]}' != '#BLANK'  Input Text    ${PASSWORD}  ${Info[5]}
   #26668
    Common.TogglePassword 1
    Run Keyword If  '${Info[8]}' == 'unhide'      Common.Click Display Password For Login Page   1
    Run Keyword If  '${Info[8]}' == 'hide'        Common.Click Display Password For Login Page   2
    Sleep       1s
    Click Button    ${LOGIN_BUTTON}

Login Multiple Times Error
    [Arguments]    ${Credentials}
     Run Keyword If    '${credentials[6]}' == '1'    Run Keywords    Login Once Error    ${Credentials}   AND     verify page contains error message   ${credentials[9]}
     Sleep       1s
     Run Keyword If    '${credentials[6]}' == '2'    Run Keywords    Login Once Error    ${Credentials}   AND     verify page contains error message   ${credentials[9]}
      ...   AND   Login Once Error    ${Credentials}   AND     verify page contains error message   ${credentials[10]}
     Sleep       1s
     Run Keyword If    '${credentials[6]}' == '3'    Run Keywords    Login Once Error    ${Credentials}   AND     verify page contains error message   ${credentials[9]}
      ...   AND   Login Once Error    ${Credentials}   AND     verify page contains error message   ${credentials[10]}
      ...   AND   Login Once Error    ${Credentials}   AND     verify page contains error message   ${credentials[11]}
     Sleep       1s
     Run Keyword If    '${credentials[6]}' == '4'    Run Keywords    Login Once Error    ${Credentials}   AND     verify page contains error message   ${credentials[9]}
      ...   AND   Login Once Error    ${Credentials}   AND     verify page contains error message   ${credentials[10]}
      ...   AND   Login Once Error    ${Credentials}   AND     verify page contains error message   ${credentials[11]}
      ...   AND   Login Once Error    ${Credentials}   AND     verify page contains error message   ${credentials[12]}
     Sleep       1s
     Run Keyword If    '${credentials[6]}' == '3' and '${credentials[7]}' == '1'   Run Keywords   Sleep   60s     AND     Attempt to Login  ${Credentials}


