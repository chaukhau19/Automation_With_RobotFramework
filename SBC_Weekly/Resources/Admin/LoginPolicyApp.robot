*** Settings ***
Resource  ./PO/LoginPolicyPage.robot
Resource  ./PO/UserManagerPage.robot
Resource  ../../Resources/Admin/LoginApp_SBC.robot
Resource  ./PO/PermissionPage.robot
Resource  ./PO/ManageHostsPage.robot
Resource  ../Common.robot
Resource  PermissionApp.robot
Resource  ProxyApp.robot
Resource   ../Admin/ManageHostsApp.robot
*** Variables ***

*** Keywords ***
Go to Login Policy Page
    LoginPolicyPage.Navigate to Login Policy Page

#edit number
Login Policy Edit Valid
    [Arguments]  ${AdministrationScenarios}
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR  ${Info}  IN  @{AdministrationScenarios}
        TRY
            IF    '${Info[10]}' != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
              Navigate to Sign In Page
              Attempt to Login  ${Info}
              Go to Login Policy Page
              Edit Valid Login Policy function  ${Info}
             IF    '${Info[10]}' != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[10]}

        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Login Policy Edit Invalid
    [Arguments]  ${AdministrationScenarios}
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR  ${Info}  IN  @{AdministrationScenarios}
        TRY
            IF    '${Info[12]}' != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
              Navigate to Sign In Page
              Attempt to Login  ${Info}
              Go to Login Policy Page
              Edit Invalid Login Policy function  ${Info}
             IF    '${Info[12]}' != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[12]}

        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Test Password Invalid
    [Arguments]  ${AdministrationScenarios}
    FOR  ${Info}  IN  @{AdministrationScenarios}
        TRY
              Navigate to Sign In Page
              Attempt to Login  ${Info}
              Go to Login Policy Page
              Edit Invalid Login Policy  ${Info}
              Common.Log out
              Login again with password error   ${Info}

        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


#################################################################################################################################
#                                                           ---FUNCTION---                                                      #
#################################################################################################################################

Edit Valid Login Policy function
    [Arguments]   ${Info}
    LoginPolicyPage.Edit Valid Login Policy  ${Info}
    Common.Log out
    LoginPolicyPage.Login again   ${Info}


Edit Invalid Login Policy function
    [Arguments]   ${Info}
    LoginPolicyPage.Edit Invalid Login Policy  ${Info}
    Page Should Contain  ${Info[9]}
    Page Should Contain  ${Info[10]}
    Common.Log out

