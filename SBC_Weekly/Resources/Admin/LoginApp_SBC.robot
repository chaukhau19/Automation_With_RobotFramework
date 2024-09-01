*** Settings ***
Library  SeleniumLibrary
Resource  ./PO/LoginPage.robot
Resource  ../DataManager.robot
Resource  ../../Data/InputData.robot
Resource  ./UserManagerApp.robot

*** Keywords ***
Import data from extenal file
   ${LoginScenarios} =  DataManager.Get CSV Data  ${CREDENTIALS_FROM_CSV}

Login with some Credentials
    [Arguments]  ${LoginScenarios}
    FOR  ${Info}  IN  @{LoginScenarios}
        TRY
                    Navigate to Sign In Page
                    Attempt to Login with Period  ${Info}
                    Run Keyword If  '${Info[17]}' == '#BLANK'  Verify Login Page Message  ${Info}

        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Login with statictis user
    [Arguments]  ${LoginScenarios}
    FOR  ${Info}  IN  @{LoginScenarios}
        TRY
           Navigate to Sign In Page
           Attempt to Login  ${Info}
           Verify statictis user  ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END



Navigate to Sign In Page
    LoginPage.Navigate To

Attempt to Login with Period
    [Arguments]  ${Credentials}
    Run Keyword If  '${Credentials[17]}' == '#BLANK'       Enter Credentials   ${Credentials}
    Run Keyword If  '${Credentials[17]}' == 'No'           Enter Credentials With Number of max successsive tries failed is 3    ${Credentials}
    Run Keyword If  '${Credentials[17]}' == '#BLANK'       LoginPage.Click Submit
    Sleep       2s

Attempt to Login
    [Arguments]  ${Credentials}
    LoginPage.Enter Credentials  ${Credentials}
    LoginPage.Click Submit

Attempt to Single Login
    [Arguments]  ${Credentials}
    LoginPage.Enter Single Credentials  ${Credentials}
    LoginPage.Click Submit
    
Verify Login Page Message
    [Arguments]  ${ExpectedMessage}
    LoginPage.Verify Expected Message  ${ExpectedMessage}

Verify statictis user
    [Arguments]  ${Credentials}
    LoginPage.Verify default statictis user  ${Credentials}



Changed_by_rice_internal
    [Arguments]  ${AdministrationScenarios}
    FOR  ${Info}  IN  @{AdministrationScenarios}
        TRY
                # Run Keyword And Continue On Failure  #Navigate to Sign In Page
                Run Keyword And Continue On Failure  Attempt to Login  ${Info}
                Run Keyword And Continue On Failure  Go to User Manager Page
                Run Keyword And Continue On Failure  LoginPage.Edit user by rice   ${Info}

        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

