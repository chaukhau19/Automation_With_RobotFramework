*** Settings ***
Library  SeleniumLibrary
Resource  ./PO/LoginPage.robot
Resource  ../DataManager.robot
Resource  ../../Data/InputData.robot

*** Keywords ***
Import data from extenal file
   ${LoginScenarios} =  DataManager.Get CSV Data  ${CREDENTIALS_FROM_CSV}

Login with some Credentials
    [Arguments]  ${LoginScenarios}
    FOR  ${Info}  IN  @{LoginScenarios}
       run keyword and continue on failure  Navigate to Sign In Page
       run keyword and continue on failure  Attempt to Login  ${Info}
       run keyword and continue on failure  Verify Login Page Message  ${Info}
    END


Login with statictis user
    [Arguments]  ${LoginScenarios}
    FOR  ${Info}  IN  @{LoginScenarios}
       run keyword and continue on failure  Navigate to Sign In Page
       run keyword and continue on failure  Attempt to Login  ${Info}
       run keyword and continue on failure  Verify statictis user  ${Info}
    END



Navigate to Sign In Page
    LoginPage.Navigate To

Attempt to Login
    [Arguments]  ${Credentials}
    LoginPage.Enter Credentials  ${Credentials}
    LoginPage.Click Submit
    Sleep  2s

Attempt to Single Login
    [Arguments]  ${Credentials}
    LoginPage.Enter Single Credentials  ${Credentials}
    LoginPage.Click Submit
    Sleep  2s

Verify Login Page Message
    [Arguments]  ${ExpectedMessage}
    LoginPage.Verify Expected Message  ${ExpectedMessage}

Verify statictis user
    [Arguments]  ${Credentials}
    LoginPage.Verify default statictis user  ${Credentials}
