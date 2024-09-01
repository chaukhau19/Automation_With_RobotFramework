*** Settings ***
Resource  ./PO/UserManagerPage.robot
Resource  ../../Resources/Admin/LoginApp_SBC.robot
Resource  ./PO/PermissionPage.robot
Resource  ./ManageHostsApp.robot
Resource  ../Common.robot
Resource  PermissionApp.robot
Resource  ProxyApp.robot
*** Variables ***

*** Keywords ***
User Manager
    [Arguments]  ${AdministrationScenarios}
    FOR  ${Info}  IN  @{AdministrationScenarios}
        TRY
           Navigate to Sign In Page
           Attempt to Login  ${Info}
           Go to User Manager Page
           Add User Manager  ${Info}
           View User Manager  ${Info}
           Edit User Manager  ${Info}
           Attempt to Login  ${Info}
           Go to User Manager Page
           Delete User Manager  ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Add User Manager
    [Arguments]  ${AdministrationScenarios}
    FOR  ${Info}  IN  @{AdministrationScenarios}
        TRY
           Navigate to Sign In Page
           Attempt to Login  ${Info}
           Go to User Manager Page
           Add User Manager function  ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


View User Manager
    [Arguments]  ${AdministrationScenarios}
    FOR  ${Info}  IN  @{AdministrationScenarios}
        TRY
           Navigate to Sign In Page
           Attempt to Login  ${Info}
           Go to User Manager Page
           View User Manager function  ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Edit User Manager
    [Arguments]  ${AdministrationScenarios}
    FOR  ${Info}  IN  @{AdministrationScenarios}
        TRY
           Navigate to Sign In Page
           Attempt to Login  ${Info}
           Go to User Manager Page
           Edit User Manager function  ${Info}
 
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
           Delete User Manager function  ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


User Manager 64
    [Arguments]  ${AdministrationScenarios}
    FOR  ${Info}  IN  @{AdministrationScenarios}
        TRY
           Navigate to Sign In Page
           Attempt to Login  ${Info}
           Go to User Manager Page 64
           Add User Manager 64  ${Info}
           View User Manager 64  ${Info}
           Edit User Manager 64  ${Info}
           Attempt to Login  ${Info}
           Go to User Manager Page 64
           Delete User Manager 64  ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Go to User Manager Page
    UserManagerPage.Navigate to User Manager Page

Go to User Manager Page 64
    UserManagerPage.Navigate to User Manager Page 64

Add User Manager function
    [Arguments]  ${Credentials}
    UserManagerPage.Create User Manager  ${Credentials}
    UserManagerPage.Log out
    UserManagerPage.Login again with new user  ${Credentials}
    UserManagerPage.Navigate to User Manager Page
    UserManagerPage.Go to Add page
    UserManagerPage.Click Cancel button
    #UserManagerPage.Log out

Edit User Manager function
    [Arguments]   ${Credentials}
    UserManagerPage.Edit User  ${Credentials}
    UserManagerPage.Log out
    UserManagerPage.Login again after modifying  ${Credentials}
   #UserManagerPage.Navigate to User Manager Page
    UserManagerPage.Back from Edit page
    UserManagerPage.Log out

View User Manager function
    [Arguments]  ${Credentials}
    UserManagerPage.View Page  ${Credentials}

Delete User Manager function
    [Arguments]  ${Credentials}
    UserManagerPage.Back from Delete page
    UserManagerPage.Delete User  ${Credentials}
    UserManagerPage.Log out

Add User Manager 64
    [Arguments]  ${Credentials}
    UserManagerPage.Create User Manager  ${Credentials}
    UserManagerPage.Log out
    UserManagerPage.Login again with new user  ${Credentials}
    UserManagerPage.Navigate to User Manager Page 64
    UserManagerPage.Go to Add page
    UserManagerPage.Click Cancel button
    #UserManagerPage.Log out

Edit User Manager 64
    [Arguments]   ${Credentials}
    UserManagerPage.Edit User  ${Credentials}
    UserManagerPage.Log out
    UserManagerPage.Login again after modifying  ${Credentials}
    UserManagerPage.Navigate to User Manager Page 64
    UserManagerPage.Back from Edit page
    UserManagerPage.Log out

View User Manager 64
    [Arguments]  ${Credentials}
    UserManagerPage.View Page  ${Credentials}

Delete User Manager 64
    [Arguments]  ${Credentials}
    UserManagerPage.Back from Delete page
    UserManagerPage.Delete User  ${Credentials}
    UserManagerPage.Log out

IMP_19315 function
    [Arguments]  ${AdministrationScenarios}
    FOR  ${Info}  IN  @{AdministrationScenarios}
        TRY
    #\  run keyword and continue on failure  UserManagerPage.Log out
           Navigate to Sign In Page
           Attempt to Login  ${Info}
    #\  run keyword and continue on failure  Go to User Manager Page
    #\  run keyword and continue on failure  Add User Manager function  ${Info}
    #\  run keyword and continue on failure  UserManagerPage.Log out
    #\  run keyword and continue on failure  Attempt to Login  ${Info}
           Go to Permission Page
           New Role With View Permission Only  ${Info}
           Go to User Manager Page
           UserManagerPage.Edit User  ${Info}
           UserManagerPage.Log out
           UserManagerPage.Login again with user  ${Info}
           ProxyApp.Change to a Host  ${Info[15]}
           Change to LocalHost  ${Info[15]}

###########################################---EXPECTED_MESSAGES---###########################################
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Invalid Add User Manager 64
    [Arguments]  ${AdministrationScenarios}
    FOR  ${Info}  IN  @{AdministrationScenarios}
        TRY
           Navigate to Sign In Page
           Attempt to Login  ${Info}
           Go to User Manager Page 64
           Create User Manager  ${Info}
           ManageHostsPage.Log out
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Invalid Add User Manager
    [Arguments]  ${AdministrationScenarios}
    FOR  ${Info}  IN  @{AdministrationScenarios}
        TRY
           Navigate to Sign In Page
           Attempt to Login  ${Info}
           Go to User Manager Page
           Create User Manager  ${Info}
           UserManagerPage.Log out
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


New Role With View Permission Only
    [Arguments]  ${Credentials}
    PermissionPage.Create Role With View Permission Only  ${Credentials}