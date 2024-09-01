*** Settings ***
Resource  ./PO/UserPreferencePage.robot
Resource  ../../Resources/Admin/LoginApp_SBC.robot
Resource  ../Common.robot

*** Variables ***


*** Keywords ***
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




Go to User Preference Page
    UserPreferencePage.Navigate to User Preference

Modify Password
    [Arguments]  ${Credentials}
    UserPreferencePage.Modify  ${Credentials}
    UserManagerPage.Log out
    UserPreferencePage.Login again with new password  ${Credentials}
    UserManagerPage.Log out

###########################################---EXPECTED_MESSAGES---###########################################

Invalid User Preference
    [Arguments]  ${AdministrationScenarios}
    FOR  ${Info}  IN  @{AdministrationScenarios}
        TRY
           Navigate to Sign In Page
           Attempt to Login  ${Info}
           Go to User Preference Page
           Modify Password with messages  ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Modify Password with messages
    [Arguments]  ${Credentials}
  #  UserPreferencePage.Login again with new password  ${Credentials}
    UserPreferencePage.Modify  ${Credentials}
    UserPreferencePage.Verify mesaages  ${Credentials}
    UserManagerPage.Log out