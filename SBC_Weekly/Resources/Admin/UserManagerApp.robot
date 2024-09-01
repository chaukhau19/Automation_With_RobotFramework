*** Settings ***
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
Go to User Manager Page
    UserManagerPage.Navigate to User Manager Page

Add Valid User Manager
    [Arguments]  ${AdministrationScenarios}
    FOR  ${Info}  IN  @{AdministrationScenarios}
        TRY
            Navigate to Sign In Page
            Attempt to Login  ${Info}
            Go to User Manager Page
            Add Valid User Manager function  ${Info}
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
   Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR  ${Info}  IN  @{AdministrationScenarios}
        TRY
            IF    '${Info[19]}' != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
            Navigate to Sign In Page
            Attempt to Login  ${Info}
            Go to User Manager Page
            Edit Valid User Manager function  ${Info}
            IF    '${Info[19]}' != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[19]}

        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Edit User Manager without changing the password
    [Arguments]  ${AdministrationScenarios}
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR  ${Info}  IN  @{AdministrationScenarios}
        TRY
            IF    '${Info[19]}' != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
            Navigate to Sign In Page
            Attempt to Login  ${Info}
            Go to User Manager Page
            Edit Valid User Manager function without changing the password  ${Info}
            IF    '${Info[19]}' != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[19]}

        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Edit Invalid User Manager
    [Arguments]  ${AdministrationScenarios}
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR  ${Info}  IN  @{AdministrationScenarios}
        TRY
            IF    '${Info[19]}' != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
            Navigate to Sign In Page
            Attempt to Login  ${Info}
            Go to User Manager Page
            Edit Invalid User Manager function  ${Info}
            IF    '${Info[19]}' != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[19]}

        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

User Manager Sort
    [Arguments]  ${AdministrationScenarios}
    FOR  ${Info}  IN  @{AdministrationScenarios}
        TRY
            Navigate to Sign In Page
            Attempt to Login  ${Info}
            Go to User Manager Page
            Sort Role User Manager  ${Info}

        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

User Manager Filter
    [Arguments]  ${AdministrationScenarios}
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR  ${Info}  IN  @{AdministrationScenarios}
        TRY
            IF    '${Info[8]}' != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
            Navigate to Sign In Page
            Attempt to Login  ${Info}
            Go to User Manager Page
            Filter Role Manager  ${Info}

            IF    '${Info[8]}' != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[8]}
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

Add Invalid User Manager
    [Arguments]  ${AdministrationScenarios}
   Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR  ${Info}  IN  @{AdministrationScenarios}
        TRY
            IF    '${Info[17]}' != ''
                    ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
            Navigate to Sign In Page
            Attempt to Login  ${Info}
            Go to User Manager Page
            Add Invalid User Manager function   ${Info}

            IF    '${Info[17]}' != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[17]}

        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Add Invalid User Manager To First Login
    [Arguments]  ${AdministrationScenarios}
   Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR  ${Info}  IN  @{AdministrationScenarios}
        TRY
            IF    '${Info[17]}' != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
            Navigate to Sign In Page
            Attempt to Login  ${Info}
            Go to User Manager Page
            Add Invalid User Manager function to frist login  ${Info}

            IF    '${Info[17]}' != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[17]}

        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Sort Role User Manager
    [Arguments]  ${Info}
    Sort Element  UserName
    Page should not contain  Internal Server Error

New Role With View Permission Only
    [Arguments]  ${Credentials}
    PermissionPage.Create Role With View Permission Only  ${Credentials}

#################################################################################################################################
#                                                           ---FUNCTION---                                                      #
#################################################################################################################################


Add Valid User Manager function
    [Arguments]  ${Credentials}
    UserManagerPage.Create User Manager  ${Credentials}

    #Verify Messages
   # IF   '${Credentials[10]}' != 'Add to test login'    Click Next page   ${Credentials[4]}
   # Verify Page Contains 2 Expected Elements    ${Credentials[4]}   ${Credentials[9]}

   ${arg} =  Create List    ${Credentials[4]}   ${Credentials[9]}
    Run Keyword N Times And Stop If Success   Verify Page Contains 2 Expected Elements   ${arg}    Click Element   ${Next_page}   6
    Sleep   3s

    UserManagerPage.View Page   ${Credentials[4]}   ${Credentials[9]}   ${Credentials[10]}
    Common.Log out

    UserManagerPage.Login again with new user  ${Credentials}
    IF  '${Credentials[9]}' != 'graph user' and '${Credentials[9]}' != 'define not supervision'       ManageHostsApp.Go to Manager Hosts Page
    IF  '${Credentials[9]}' != 'graph user' and '${Credentials[9]}' != 'define not supervision'       Click Element        ${ADD_BUTTON}
    IF  '${Credentials[9]}' != 'graph user' and '${Credentials[9]}' != 'define not supervision'       Click Element        ${CANCEL_BUTTON}
    Common.Log out

Add Invalid User Manager function
    [Arguments]  ${Credentials}
    UserManagerPage.Create User Manager  ${Credentials}
    IF  '${Credentials[10]}' != '#BLANK'           Page Should Contain Element     //input[@id='password']//following-sibling::span[text()="${Credentials[10]}"]
    IF  '${Credentials[11]}' != '#BLANK'           Page Should Contain Element     //input[@id='confirm_password']//following-sibling::span[text()="${Credentials[11]}"]
    Common.Log out

    UserManagerPage.Login again after modifying   ${Credentials[4]}     ${Credentials[5]}     ${Credentials[13]}    ${Credentials[14]} 
    IF  '${Credentials[12]}' != '#BLANK'      Verify Page Contains Error Message   ${Credentials[12]}

Add Invalid User Manager function to frist login
    [Arguments]  ${Credentials}
    UserManagerPage.Create User Manager  ${Credentials}

    #Verify Messages
    IF  '${Credentials[4]}' != '#BLANK'      Run Keywords      Click Element     ${Next_page}  AND  Click Element     ${Next_page}  AND  Click Element   ${Next_page}
    Verify Page Contains 2 Expected Elements    ${Credentials[4]}   ${Credentials[9]}
    Common.Log out

    UserManagerPage.Login again with new user  ${Credentials}
    IF  '${Credentials[10]}' != '#BLANK'           Page Should Contain Element     //input[@id='password']//following-sibling::span[text()="${Credentials[10]}"]
    IF  '${Credentials[11]}' != '#BLANK'           Page Should Contain Element     //input[@id='confirm_password']//following-sibling::span[text()="${Credentials[11]}"]
    Click Element        ${Log_Out_New_User}

    Run Keyword And Continue On Failure    Attempt to Login    ${Credentials}
    Run Keyword And Continue On Failure    Go to User Manager Page

    #Delete User Manager To First Login Invalid and click next page due to Add Valid user still having normal user
    IF  '${Credentials[4]}' != '#BLANK'      Run Keywords      Click Element     ${Next_page}  AND  Click Element     ${Next_page}  AND  Click Element   ${Next_page}
    UserManagerPage.Delete User   ${Credentials}

Edit Valid User Manager function
    [Arguments]   ${Credentials}
    UserManagerPage.Edit User Valid  ${Credentials[4]}   ${Credentials[5]}    ${Credentials[6]}   ${Credentials[7]}   ${Credentials[13]}   ${Credentials[14]}    ${Credentials[16]}
    Common.Log out

    UserManagerPage.Login again after modifying  ${Credentials[4]}  ${Credentials[5]}   ${Credentials[13]}   ${Credentials[14]}
    Run Keyword And Continue On Failure    Wait Until Page Does Not Contain Element    ${LOGIN_BUTTON}    10s

    IF  '${Credentials[7]}' != 'graph user' and '${Credentials[7]}' != 'define not supervision'             ManageHostsApp.Go to Manager Hosts Page
    IF  '${Credentials[7]}' != 'graph user' and '${Credentials[7]}' != 'define not supervision'             Click Element        ${ADD_BUTTON}
    IF  '${Credentials[7]}' != 'graph user' and '${Credentials[7]}' != 'define not supervision'             Click Element        ${CANCEL_BUTTON}
    Common.Log out

    #Login with admin user to view user
    IF  '${Credentials[4]}' == 'admin'      Input Text  ${USERNAME}    ${Credentials[4]}
    IF  '${Credentials[4]}' == 'admin'      Input Text  ${PASSWORD}    ${Credentials[5]}
    IF  '${Credentials[4]}' != 'admin'      Input Text   ${SIGN_IN_USERNAME}   admin
    IF  '${Credentials[4]}' != 'admin'      Input Text   ${SIGN_IN_PASSWORD}   Cirpackwebadmin1234#
    Click Button  ${LOGIN_BUTTON}
    Run Keyword And Continue On Failure    Wait Until Page Does Not Contain Element    ${LOGIN_BUTTON}    10s
    
    Run Keyword And Continue On Failure             Go to User Manager Page
    UserManagerPage.View Page   ${Credentials[4]}   ${Credentials[7]}  ${Credentials[8]}
    UserManagerPage.Back from Edit page  ${Credentials}
    Common.Log out

Edit Valid User Manager function without changing the password
    [Arguments]   ${Credentials}
    UserManagerPage.Edit User Valid  ${Credentials[4]}   ${Credentials[5]}    ${Credentials[6]}   ${Credentials[7]}   ${Credentials[13]}   ${Credentials[14]}    ${Credentials[16]}
    Common.Log out

    UserManagerPage.Login again after modifying  ${Credentials[4]}  ${Credentials[15]}  ${Credentials[13]}   ${Credentials[14]}
    Wait Until Page Does Not Contain Element     ${LOGIN_BUTTON}    10s

    IF  '${Credentials[7]}' != 'graph user' and '${Credentials[7]}' != 'define not supervision'             ManageHostsApp.Go to Manager Hosts Page
    IF  '${Credentials[7]}' != 'graph user' and '${Credentials[7]}' != 'define not supervision'             Click Element        ${ADD_BUTTON}
    IF  '${Credentials[7]}' != 'graph user' and '${Credentials[7]}' != 'define not supervision'             Click Element        ${CANCEL_BUTTON}
    Common.Log out
  
    #Login with admin user to view user
    IF  '${Credentials[4]}' == 'admin'      Input Text  ${USERNAME}    ${Credentials[4]}
    IF  '${Credentials[4]}' == 'admin'      Input Text  ${PASSWORD}    Cirpackwebadmin1234#
    IF  '${Credentials[4]}' != 'admin'      Input Text   ${SIGN_IN_USERNAME}   admin
    IF  '${Credentials[4]}' != 'admin'      Input Text   ${SIGN_IN_PASSWORD}   Cirpackwebadmin1234#
  
    Click Button  ${LOGIN_BUTTON}
    Wait Until Page Does Not Contain Element     ${LOGIN_BUTTON}    10s
   
    Run Keyword And Continue On Failure             Go to User Manager Page
    UserManagerPage.View Page   ${Credentials[4]}   ${Credentials[16]}  ${Credentials[8]}
    UserManagerPage.Back from Edit page  ${Credentials}
    Common.Log out

Edit Invalid User Manager function
    [Arguments]   ${Credentials}
    UserManagerPage.Edit User Invalid  ${Credentials[4]}    ${Credentials[5]}    ${Credentials[6]}     ${Credentials[7]} 
    ...  ${Credentials[13]}    ${Credentials[14]}   ${Credentials[16]}      
   
    IF  '${Credentials[8]}' != '#BLANK'           Page Should Contain Element     //input[@id='password']//following-sibling::span[text()="${Credentials[8]}"]
    IF  '${Credentials[9]}' != '#BLANK'           Page Should Contain Element     //input[@id='confirm_password']//following-sibling::span[text()="${Credentials[9]}"]
    Common.Log out

    UserManagerPage.Login again after modifying  ${Credentials[4]}  ${Credentials[5]}   ${Credentials[13]}   ${Credentials[14]}

    IF  '${Credentials[10]}' != '#BLANK'      Verify Page Contains Error Message   ${Credentials[10]}
    #Login Normal User to Login Not Failed ( Three Time) ---> One time successful to login continue
    IF  '${Credentials[11]}' != '#BLANK'      Input Text  ${USERNAME}  ${Credentials[4]}
    IF  '${Credentials[11]}' != '#BLANK'      Input Text  ${PASSWORD}  ${Credentials[11]}
    IF  '${Credentials[11]}' != '#BLANK'      LoginPage.Click Submit
    #Check Welcome user for all user
    IF  '${Credentials[11]}' != '#BLANK'        Page Should Contain Element   //span[@class="user-info"][contains(text(), "${Credentials[3]}")]


View User Manager function
    [Arguments]  ${Credentials}
    UserManagerPage.View Page  ${Credentials[4]}   ${Credentials[5]}   ${Credentials[6]}

Delete User Manager function
    [Arguments]  ${Credentials}
    Run Keyword And Continue On Failure       UserManagerPage.Back from Delete page  ${Credentials}
    UserManagerPage.Delete User  ${Credentials}
    Common.Log out

IMP_19315 function
    [Arguments]  ${AdministrationScenarios}
    FOR  ${Info}  IN  @{AdministrationScenarios}
        TRY
        # \  Run Keyword And Continue On Failure  Common.Log out
           #Navigate to Sign In Page
           Attempt to Login  ${Info}
        #\  Run Keyword And Continue On Failure  Go to User Manager Page
        #\  Run Keyword And Continue On Failure  Add User Manager function  ${Info}
        #\  Run Keyword And Continue On Failure  Common.Log out
        #\  Run Keyword And Continue On Failure  Attempt to Login  ${Info}

        #   Go to Permission Page
        #   New Role With View Permission Only  ${Info}
           Go to User Manager Page
           UserManagerPage.Edit User Valid   ${Info[4]}   ${Info[5]}    ${Info[6]}   ${Info[7]}   ${Info[13]}   ${Info[14]}    ${Info[16]}

           Common.Log out
           UserManagerPage.Login again with user  ${Info}
           ProxyApp.Change to a RemoteHost  ${Info[15]}
           Change to LocalHost  ${Info[15]} 
           
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END