*** Settings ***
Resource  ./PO/PermissionPage.robot
Resource  ../../Resources/Admin/LoginApp_SBC.robot
Resource  ../Common.robot

*** Variables ***
# ${Edit_permission_button}     //tbody/tr[1]/th[3]/a[1]/i[1]
# ${Delete_permission_button}   //a[contains(text(),'Delete')]
*** Keywords ***

Go to Permission Page
    PermissionPage.Navigate to Permission Page

Permission Add
    [Arguments]  ${AdministrationScenarios}
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR  ${Info}  IN  @{AdministrationScenarios}
        TRY
            IF    '${Info[10]}' != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
                    Navigate to Sign In Page
                    Attempt to Login  ${Info}
                    Go to Permission Page
                    New Role Valid  ${Info}

            IF    '${Info[10]}' != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[10]}

        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Permission Add Invalid
    [Arguments]  ${AdministrationScenarios}
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR  ${Info}  IN  @{AdministrationScenarios}
        TRY
            IF    '${Info[11]}' != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
                    Navigate to Sign In Page
                    Attempt to Login  ${Info}
                    Go to Permission Page
                    New Role Invalid  ${Info}
                    
            IF    '${Info[11]}' != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[11]}

        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Permission Edit
    [Arguments]  ${AdministrationScenarios}
   Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR  ${Info}  IN  @{AdministrationScenarios}
        TRY
            IF    '${Info[9]}' != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
                    Navigate to Sign In Page
                    Attempt to Login  ${Info}
                    Go to Permission Page
                    Edit Role  ${Info}

            IF    '${Info[9]}' != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[9]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Permission View
    [Arguments]  ${AdministrationScenarios}
   Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR  ${Info}  IN  @{AdministrationScenarios}
        TRY
            IF    '${Info[10]}' != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
                    Navigate to Sign In Page
                    Attempt to Login  ${Info}
                    Go to Permission Page
                    View Role  ${Info}

            IF    '${Info[10]}' != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[10]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Permission Delete
    [Arguments]  ${AdministrationScenarios}
   Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR  ${Info}  IN  @{AdministrationScenarios}
        TRY
           IF    '${Info[10]}' != ''
                 ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
           END
                    Navigate to Sign In Page
                    Attempt to Login  ${Info}
                    Go to Permission Page
                    Delete Role  ${Info}

           IF    '${Info[10]}' != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[10]}

        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Permission Sort
    [Arguments]  ${AdministrationScenarios}
    FOR  ${Info}  IN  @{AdministrationScenarios}
        TRY
                    Navigate to Sign In Page
                    Attempt to Login  ${Info}
                    Go to Permission Page
                    Sort Role Permission  ${Info}

        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Permission Filter
    [Arguments]  ${AdministrationScenarios}
   Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR  ${Info}  IN  @{AdministrationScenarios}
        TRY
            IF    '${Info[8]}' != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
                    Navigate to Sign In Page
                    Attempt to Login  ${Info}
                    Go to Permission Page
                    Filter Role  ${Info}

            IF    '${Info[8]}' != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[8]}

        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

TR_19270_Tc1 function
    [Arguments]  ${AdministrationScenarios}
    FOR  ${Info}  IN  @{AdministrationScenarios}
        TRY
           Navigate to Sign In Page
           Attempt to Login  ${Info}
           Go to Permission Page
           New Role without BGCF Peer permission  ${Info}
           Go to Permission Page
           Delete Role  ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

TR_19270_Tc2 function
    [Arguments]  ${AdministrationScenarios}
    FOR  ${Info}  IN  @{AdministrationScenarios}
        TRY
           Navigate to Sign In Page
           Attempt to Login  ${Info}
           Go to Permission Page
           New Role without BGCF permission  ${Info}
           Go to Permission Page
           Delete Role  ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END



################################################################################################################################################
New Role Valid
    [Arguments]  ${Credentials}
    PermissionPage.Create Role  ${Credentials}
    #PermissionPage.Modify Role  ${Credentials}
    #PermissionPage.Back to previous page  ${Credentials}
    #PermissionPage.Remove Role  ${Credentials}

New Role Invalid
    [Arguments]  ${Credentials}
    PermissionPage.Create Role  ${Credentials}
    Run Keyword If  '${Credentials[8]}' != '#BLANK'   Verify Page Contains Error Message     ${Credentials[8]}
    
New Role without BGCF Peer permission
    [Arguments]  ${Credentials}
    PermissionPage.Create Role without BGCF Peer permission  ${Credentials}
    #PermissionPage.Modify Role  ${Credentials}
    #PermissionPage.Back to previous page  ${Credentials}
    #PermissionPage.Remove Role  ${Credentials}

New Role without BGCF permission
    [Arguments]  ${Credentials}
    PermissionPage.Create Role without BGCF permission  ${Credentials}
    #PermissionPage.Modify Role  ${Credentials}
    #PermissionPage.Back to previous page  ${Credentials}
    #PermissionPage.Remove Role  ${Credentials}

Edit Role
    [Arguments]   ${Info}
    PermissionPage.Modify Role   ${Info[4]}  ${Info[5]}   ${Info[6]}

View Role
    [Arguments]  ${Info}
    PermissionPage.View Role funcion   ${Info[6]}

Delete Role
    [Arguments]  ${Info}
    Delete with 1 info  ${Info[4]}
    Verify Page Not Contains 1 Expect Elements  ${Info[4]}

Sort Role Permission
    [Arguments]  ${Info}
    Sort Element  Name
    Page should not contain  Internal Server Error

Filter Role
    [Arguments]  ${Info}
    Filter 2 value           ${Info[5]}   ${Info[4]}


