*** Settings ***
Resource  ./PO/PasswordPolicyPage.robot
Resource  ./PO/UserManagerPage.robot
Resource  ../../Resources/Admin/LoginApp_SBC.robot
Resource  ../../Resources/Admin/UserManagerApp.robot
Resource  ../../Resources/Admin/UserPreferenceApp.robot
Resource  ../Common.robot

*** Variables ***

*** Keywords ***
Go to Password Policy Page
    PasswordPolicyPage.Navigate to Password Policy Page

############################# Password Policy #########################################
Password Policy Edit
    [Arguments]  ${AdministrationScenarios}
    FOR  ${Info}  IN  @{AdministrationScenarios}
        TRY
                Navigate to Sign In Page
                Attempt to Login  ${Info}
                Go to Password Policy Page
                Edit Valid Password Policy function  ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Delete User Manager
    [Arguments]  ${AdministrationScenarios}
    FOR  ${Info}  IN  @{AdministrationScenarios}
        TRY
                Navigate to Sign In Page
                Attempt to Login  ${Info}
                Go to User Manager Page
                PasswordPolicyPage.Delete User for Password Policy   ${Info}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END
    
View Password Policy
    [Arguments]  ${AdministrationScenarios}
    FOR  ${Info}  IN  @{AdministrationScenarios}
        TRY
              Navigate to Sign In Page
              Attempt to Login  ${Info}
              Go to Password Policy Page
              View Password Policy function  ${Info}

        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END



Filter Password Policy
    [Arguments]  ${AdministrationScenarios}
    FOR  ${Info}  IN  @{AdministrationScenarios}
        TRY
          Navigate to Sign In Page
          Attempt to Login  ${Info}
          Go to Password Policy Page
          Filter Password Policy function  ${Info}

        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Edit Valid User First Login
    [Arguments]  ${AdministrationScenarios}
    FOR  ${Info}  IN  @{AdministrationScenarios}
        TRY

              Navigate to Sign In Page
              Attempt to Login  ${Info}
              Go to User Manager Page
              Edit Valid User First Login function  ${Info}

        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


#################################################################################################################################
#                                                           ---FUNCTION---                                                      #
#################################################################################################################################

Edit Valid Password Policy function
    [Arguments]   ${Info}
    run keyword and continue on failure       PasswordPolicyPage.Edit Password Policy For Each Role   ${Info}
    PasswordPolicyPage.Create User Manager     ${Info}
    PasswordPolicyPage.The first login         ${Info}
    PasswordPolicyPage.Edit User Manager       ${Info}
    PasswordPolicyPage.Login again with user-edited on User Manager        ${Info}
    PasswordPolicyPage.Edit User Preference    ${Info}
    PasswordPolicyPage.Login again with user-edited on User Preference     ${Info}


View Password Policy function
    [Arguments]   ${Credentials}
    PasswordPolicyPage.View Password     ${Credentials}
    Click Element   //a[normalize-space(text()) = 'Back']
    Sleep       2s
#    Common.Log out

Filter Password Policy function
     [Arguments]  ${Info}
     Filter 1 value          ${Info[4]}

Edit Valid Manager User function
    [Arguments]   ${Info}
    PasswordPolicyPage.Edit Manager User For Role  ${Info}


Edit Valid User First Login function
    [Arguments]   ${Info}
    PasswordPolicyPage.Create the user and user first login set a new password  ${Info}



