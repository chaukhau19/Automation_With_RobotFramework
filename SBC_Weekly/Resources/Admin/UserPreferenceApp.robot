*** Settings ***
Resource  ./PO/UserPreferencePage.robot
Resource  ../../Resources/Admin/LoginApp_SBC.robot
Resource  ../Common.robot

*** Variables ***

*** Keywords ***
Go to User Preference Page
    UserPreferencePage.Navigate to User Preference

User Preference
    [Arguments]  ${AdministrationScenarios}
    FOR  ${Info}  IN  @{AdministrationScenarios}
        TRY
            Navigate to Sign In Page
            Attempt to Login  ${Info}
            Go to User Preference Page
            Modify Password  ${Info}

        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Modify Password
    [Arguments]  ${Credentials}
    UserPreferencePage.Modify  ${Credentials}
    Common.Log out
    UserPreferencePage.Login again with new password  ${Credentials}
    Common.Log out

###########################################---EXPECTED_MESSAGES---###########################################

Invalid User Preference
    [Arguments]  ${AdministrationScenarios}
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR  ${Info}  IN  @{AdministrationScenarios}
        TRY
            IF    '${Info[17]}' != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
            Navigate to Sign In Page
            Attempt to Login  ${Info}
            Go to User Preference Page
            Modify Password with error messages  ${Info}

            IF    '${Info[17]}' != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[17]}

        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Modify Password with error messages
    [Arguments]  ${Credentials}
    #UserPreferencePage.Login again with new password  ${Credentials}
    UserPreferencePage.Modify  ${Credentials}
    UserPreferencePage.Verify messages  ${Credentials}
    Common.Log out
    UserPreferencePage.Login again with new password  ${Credentials}
    #Password or confirm password is empty to check login with old password OK
    IF  '${Credentials[12]}' != 'Invalid username or password'      Common.Log out
    IF  '${Credentials[12]}' != 'Invalid username or password'      Attempt to Login     ${Credentials}
    IF  '${Credentials[12]}' != 'Invalid username or password'      Page should contain   ${Credentials[12]}
    #Password or confirm password is value to check login faile
    IF  '${Credentials[12]}' == 'Invalid username or password'      Verify Page Contains Error Message   ${Credentials[12]}
    IF  '${Credentials[12]}' != 'Invalid username or password'      Common.Log out
    # Password Edit Valid To Login Not Failed
    run keyword and continue on failure      Attempt to Login     ${Credentials}
    Common.Log out
    Title Should Be   Login Page