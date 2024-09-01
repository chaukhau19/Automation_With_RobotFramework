*** Settings ***
Resource  ./PO/ManageHostsPage.robot
Resource  ../../Resources/Admin/LoginApp_SBC.robot
Resource  ../../Resources/Admin/UserManagerApp.robot
Resource  ../Common.robot
*** Variables ***

*** Keywords ***

Go to Manager Hosts Page
    ManageHostsPage.Navigate to Manage Hosts Page

Add Hosts
    [Arguments]  ${AdministrationScenarios}
    FOR  ${Info}  IN  @{AdministrationScenarios}
        TRY
           Navigate to Sign In Page
           Attempt to Login  ${Info}
           Go to Manager Hosts Page
           Add Manage Hosts function  ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Add Hosts With User
    [Arguments]  ${AdministrationScenarios}
    FOR  ${Info}  IN  @{AdministrationScenarios}
        TRY
           Navigate to Sign In Page
           UserManagerPage.Login again with user  ${Info}
           Go to Manager Hosts Page
           Add Manage Hosts function  ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Edit Hosts
    [Arguments]  ${AdministrationScenarios}
    FOR  ${Info}  IN  @{AdministrationScenarios}
        TRY
           Navigate to Sign In Page
           Attempt to Login  ${Info}
           Go to Manager Hosts Page
           Edit Manage Hosts function  ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


View Hosts
    [Arguments]  ${AdministrationScenarios}
    FOR  ${Info}  IN  @{AdministrationScenarios}
        TRY
           Navigate to Sign In Page
           Attempt to Login  ${Info}
           Go to Manager Hosts Page
           View Manage Hosts function  ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Delete Hosts
    [Arguments]  ${AdministrationScenarios}
    FOR  ${Info}  IN  @{AdministrationScenarios}
        TRY
           Navigate to Sign In Page
           Attempt to Login  ${Info}
           Go to Manager Hosts Page
           Delete Manage Hosts function  ${Info}


###########################################---Function---###########################################
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Add Manage Hosts function
    [Arguments]   ${Credentials}
    ManageHostsPage.Create Hosts  ${Credentials}
    ManageHostsPage.Log out

Edit Manage Hosts function
    [Arguments]   ${Credentials}
    ManageHostsPage.Change Hosts  ${Credentials}
    ManageHostsPage.Log out

View Manage Hosts function
    [Arguments]   ${Credentials}
    ManageHostsPage.View Hosts  ${Credentials}
    ManageHostsPage.Log out

Delete Manage Hosts function
    [Arguments]   ${Credentials}
    ManageHostsPage.Remove Hosts  ${Credentials}
    ManageHostsPage.Log out

