*** Settings ***
Resource  ./PO/PermissionPage.robot
Resource  ../../Resources/Admin/LoginApp_SBC.robot
Resource  ../Common.robot

*** Variables ***
${Edit_permission_64_button}     //tbody/tr[1]/th[3]/a[1]/i[1]
${Delete_permission_64_button}   //a[contains(text(),'Delete')]
*** Keywords ***
Permission Add 64
    [Arguments]  ${AdministrationScenarios}
    FOR  ${Info}  IN  @{AdministrationScenarios}
        TRY
           Navigate to Sign In Page
           Attempt to Login  ${Info}
           Go to Permission Page
           New Role 64  ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Permission Add
    [Arguments]  ${AdministrationScenarios}
    FOR  ${Info}  IN  @{AdministrationScenarios}
        TRY
           Navigate to Sign In Page
           Attempt to Login  ${Info}
           Go to Permission Page
           New Role  ${Info}
 
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


Permission Edit 64
    [Arguments]  ${AdministrationScenarios}
    FOR  ${Info}  IN  @{AdministrationScenarios}
        TRY
           Navigate to Sign In Page
           Attempt to Login  ${Info}
           Go to Permission Page
           Edit Role 64  ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Permission Edit
    [Arguments]  ${AdministrationScenarios}
    FOR  ${Info}  IN  @{AdministrationScenarios}
        TRY
           Navigate to Sign In Page
           Attempt to Login  ${Info}
           Go to Permission Page
           Edit Role  ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Permission View
    [Arguments]  ${AdministrationScenarios}
    FOR  ${Info}  IN  @{AdministrationScenarios}
        TRY
           Navigate to Sign In Page
           Attempt to Login  ${Info}
           Go to Permission Page
           View Role  ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Permission Delete 64
    [Arguments]  ${AdministrationScenarios}
    FOR  ${Info}  IN  @{AdministrationScenarios}
        TRY
           Navigate to Sign In Page
           Attempt to Login  ${Info}
           Go to Permission Page
           Delete Role 64  ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Permission Delete
    [Arguments]  ${AdministrationScenarios}
    FOR  ${Info}  IN  @{AdministrationScenarios}
        TRY
           Navigate to Sign In Page
           Attempt to Login  ${Info}
           Go to Permission Page
           Delete Role  ${Info}
 
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
           Sort Role  ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Permission Filter
    [Arguments]  ${AdministrationScenarios}
    FOR  ${Info}  IN  @{AdministrationScenarios}
        TRY
           Navigate to Sign In Page
           Attempt to Login  ${Info}
           Go to Permission Page
           Filter Role  ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END




Go to Permission Page
    PermissionPage.Navigate to Permission Page

New Role 64
    [Arguments]  ${Credentials}
    PermissionPage.Create Role 64  ${Credentials}
    #PermissionPage.Modify Role  ${Credentials}
    #PermissionPage.Back to previous page  ${Credentials}
    #PermissionPage.Remove Role  ${Credentials}

New Role
    [Arguments]  ${Credentials}
    PermissionPage.Create Role  ${Credentials}
    #PermissionPage.Modify Role  ${Credentials}
    #PermissionPage.Back to previous page  ${Credentials}
    #PermissionPage.Remove Role  ${Credentials}

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


Edit Role 64
    [Arguments]   ${Info}
    PermissionPage.Modify Role 64   ${Info[4]}  ${Info[5]}   ${Info[6]}

Edit Role
    [Arguments]   ${Info}
    PermissionPage.Modify Role   ${Info[4]}  ${Info[5]}   ${Info[6]}

View Role
    [Arguments]  ${Info}
    PermissionPage.View Role funcion   ${Info[6]}

Delete Role 64
    [Arguments]  ${Info}
    Click Element  ${Edit_permission_64_button}
    Click Element  ${Delete_permission_64_button}
    Verify Page Not Contains 1 Expect Elements  ${Info[4]}

Delete Role
    [Arguments]  ${Info}
    Delete with 1 info  ${Info[4]}
    Verify Page Not Contains 1 Expect Elements  ${Info[4]}

Sort Role
    [Arguments]  ${Info}
    Sort Element  Name
    Page should not contain  Internal Server Error

Filter Role
    [Arguments]  ${Info}
    Filter 2 value           ${Info[5]}   ${Info[4]}

