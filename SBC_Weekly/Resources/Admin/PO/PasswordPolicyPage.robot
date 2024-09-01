*** Settings ***
Library  SeleniumLibrary
Resource  ../../Common.robot
Resource  ../../Admin/UserManagerApp.robot
Resource  ../../Admin/UserPreferenceApp.robot
Resource  ../../Admin/LoginApp_SBC.robot
Resource  ../../Admin/PasswordPolicyApp.robot

*** Variables ***
${PASSWORD_POLICY}  xpath=//*[@class='first-menu' and contains(text(),'Password Policy')]   #Password Policy Section
##########EDIT_PAGE##########
${NUMBER_MINIMAL_PASSWORD}                    xpath=//*[@id='num_password']
${NUMBER_MINIMAL_DIGIT}                       xpath=//*[@id='num_digit']
${NUMBER_MINIMAL_UPPERCASE}                   xpath=//*[@id='num_uppercase']
${NUMBER_MINIMAL_LOWERCASE}                   xpath=//*[@id='num_lowercase']
${NUMBER_MINIMAL_SPECIAL_CHARACTER}           xpath=//*[@id='num_scharacters']
${PASSWORD_PERIODICITY}                       xpath=//*[@id='password_periodicity']
${LAST_PASSWORD_IS_FORBIDDEN}                 xpath=//*[@id='forbid_password']
${USERNAME}                                   xpath=//*[@id='username']
${PASSWORD}                                   xpath=//*[@id='password']
${CONFIRM_PASSWORD}                           xpath=//*[@id='confirm_password']
${SUBMIT_BUTTON}                              xpath=//*[@class='button-control']
${Role_dropdown}                                       xpath=//label[contains(text(),'Role')]//preceding-sibling::div//following::input[@class='select-dropdown']
${Role_Admin}                                          xpath=//label[contains(text(),'Role')]//preceding-sibling::div[@class='select-wrapper']/ul/li[contains(.,'admin')]
${Role_Graph}                                          xpath=//label[contains(text(),'Role')]//preceding-sibling::div[@class='select-wrapper']/ul/li[contains(.,'graph user')]
#${Role_Define_Have_Admin_Permission}                   xpath=//label[contains(text(),'Role')]//preceding-sibling::div[@class='select-wrapper']/ul/li[contains(.,'define admin')]
#${Role_Define_Not_Admin_Permission}                   xpath=//label[contains(text(),'Role')]//preceding-sibling::div[@class='select-wrapper']/ul/li[contains(.,'define not admin')]
${Role_Define_Not_Supervision_Permission}              xpath=//label[contains(text(),'Role')]//preceding-sibling::div[@class='select-wrapper']/ul/li[contains(.,'define not supervision')]
${Role_Not_Cluster_Info_Permission}                    xpath=//label[contains(text(),'Role')]//preceding-sibling::div[@class='select-wrapper']/ul/li[contains(.,'define not cluster info')]
${Role_Define_Not_IBCF_Permission}                     xpath=//label[contains(text(),'Role')]//preceding-sibling::div[@class='select-wrapper']/ul/li[contains(.,'define not IBCF')]
${Role_Define_Not_PCSCF_Permission}                     xpath=//label[contains(text(),'Role')]//preceding-sibling::div[@class='select-wrapper']/ul/li[contains(.,'define not PCSCF')]

${OLD_PASSWORD}                             id=old_password
${SAVE_PASSWORD_BUTTON}                     xpath=//button[contains(text(),'Save')]
${FIRST_LOGIN_PASSWORD}                     xpath=//input[@id='password']
${FIRST_LOGIN_CONFIRM_PASSWORD}             xpath=//input[@id='confirm_password']
${DELETE}
*** Keywords ***

Navigate to Password Policy Page
    Click Element  ${Admin_tab}
    Sleep       1s
    Click Element  ${PASSWORD_POLICY}
    Sleep       1s


########################### Password Policy #############################
############## 1 Modify password policy
Edit Password Policy For Each Role
    [Arguments]  ${Info}
    Click Edit Element With 2 Info   ${Info[4]}    ${Info[5]}
    Sleep       3s
    Page Should Contain  Update password policy  #Update password policy

    Wait Until Element Is Visible  xpath=//*[@id='content-container']/div[2]   #Update table
    Run Keyword If  '${Info[6]}' != '#BLANK'    Input Text       ${NUMBER_MINIMAL_PASSWORD}                ${Info[6]}
    Run Keyword If  '${Info[7]}' != '#BLANK'    Input Text       ${NUMBER_MINIMAL_DIGIT}                   ${Info[7]}
    Run Keyword If  '${Info[8]}' != '#BLANK'    Input Text       ${NUMBER_MINIMAL_UPPERCASE}               ${Info[8]}
    Run Keyword If  '${Info[9]}' != '#BLANK'    Input Text       ${NUMBER_MINIMAL_LOWERCASE}               ${Info[9]}
    Run Keyword If  '${Info[10]}' != '#BLANK'   Input Text       ${NUMBER_MINIMAL_SPECIAL_CHARACTER}       ${Info[10]}
    Run Keyword If  '${Info[11]}' != '#BLANK'   Input Text       ${PASSWORD_PERIODICITY}                   ${Info[11]}
    Run Keyword If  '${Info[12]}' != '#BLANK'   Input Text       ${LAST_PASSWORD_IS_FORBIDDEN}             ${Info[12]}
    Sleep       2s
    Click Element  ${SUBMIT_BUTTON}
    Sleep       3s

############# 2 create normal user
Create User Manager
    [Arguments]  ${Info}
    Run Keyword If  '${Info[5]}' == 'Graph user' or '${Info[5]}' == 'Normal user'     UserManagerApp.Go to User Manager Page
    Run Keyword If  '${Info[5]}' == 'Graph user' or '${Info[5]}' == 'Normal user'     Add User for Password Policy     ${Info}
    #Run Keyword If  '${Info[5]}' == 'Admin user'                                       UserPreferenceApp.Go to User Preference Page
    #Run Keyword If  '${Info[5]}' == 'Admin user'                                       PasswordPolicyPage.Modify    ${Info}

    Run Keyword If  '${Info[5]}' == 'Graph user' or '${Info[5]}' == 'Normal user'     Common.Log out
    #Run Keyword If  '${Info[5]}' == 'Admin user'                                       PasswordPolicyPage.Login again with admin user   ${Info}

############# 3 login first of normal user
The first login
    [Arguments]  ${Info}
    Run Keyword If  '${Info[5]}' == 'Graph user' or '${Info[5]}' == 'Normal user'     PasswordPolicyPage.Login again with new user     ${Info}
    Run Keyword If  '${Info[5]}' == 'Graph user' or '${Info[5]}' == 'Normal user'     Common.Log out



############# 4 admin and user edit password on page Manager
Edit User Manager
    [Arguments]  ${Info}
    Run Keyword If  '${Info[5]}' == 'Graph user' or '${Info[5]}' == 'Normal user'      Attempt to Login   ${Info}
    Run Keyword And Continue On Failure                                                UserManagerApp.Go to User Manager Page
    Run Keyword And Continue On Failure                                                PasswordPolicyPage.Edit User for Password Policy By Admin User   ${Info}
    Run Keyword And Continue On Failure                                                Common.Log out

############# 5 admin and user login new password
Login again with user-edited on User Manager
    [Arguments]  ${Info}
    Run Keyword If  '${Info[13]}' != '#BLANK' and '${Info[19]}' != '#BLANK'             PasswordPolicyPage.Login again with all user edited user manager   ${Info}
#    Run Keyword If  '${Info[5]}' == 'Graph user' and '${Info[5]}' == 'Normal user'     PasswordPolicyPage.Login again with new user     ${Info}

############# 6 admin and user edit password on page Preference
Edit User Preference
    [Arguments]  ${Info}
    Run Keyword If  '${Info[22]}' != '#BLANK'           UserPreferenceApp.Go to User Preference Page
    Run Keyword If  '${Info[22]}' != '#BLANK'           PasswordPolicyPage.Modify    ${Info}
    Run Keyword If  '${Info[22]}' != '#BLANK'           Common.Log out

############# 7 admin and user login new password
Login again with user-edited on User Preference
    [Arguments]  ${Info}
    Run Keyword If  '${Info[22]}' != '#BLANK'      PasswordPolicyPage.Login again with all user edited user preference   ${Info}
    Run Keyword If  '${Info[22]}' != '#BLANK'      Common.Log out

################################################## Delete User ###############################################################
Delete User for Password Policy
    [Arguments]  ${Info}
    Click Delete Element With 2 Info    ${Info[6]}      ${Info[7]}
    Sleep       3s
    Page Should Contain  Warning : Do you want to remove
    Page Should Contain  Username
    Page Should Contain  Password
    Page Should Contain  Role
    Sleep       3s
    Click Element  ${DELETE}
    Sleep       3s
    Verify Page Not Contains 2 Expect Elements    ${Info[6]}      ${Info[7]}
    Sleep       2s

################################################################# function ########################################################################
Add User for Password Policy
    [Arguments]  ${Info}
    Click Element  ${ADD_BUTTON}
    Sleep       2s
    Page Should Contain  Add user
    #Enter Credentials
    Wait Until Element Is Visible  xpath=//*[@id='content-container']/div[2]   #Add table
    Run Keyword If  '${Info[13]}' != '#BLANK'  Input Text  ${USERNAME}  ${Info[13]}
    Run Keyword If  '${Info[14]}' != '#BLANK'  Input Text  ${PASSWORD}  ${Info[14]}
    Run Keyword If  '${Info[15]}' != '#BLANK'  Input Text  ${CONFIRM_PASSWORD}  ${Info[15]}

    Run Keyword If   '${Info[16]}' != '#BLANK'               Click Element      ${Role_dropdown}
    Sleep       3s
    Run Keyword If       '${Info[16]}' == 'graph user'                     Click Element      ${Role_Graph}      #${Role_Admin}
    ...         ELSE IF  '${Info[16]}' == 'define not supervision'         Click Element      ${Role_Define_Not_Supervision_Permission}
    ...         ELSE IF  '${Info[16]}' == 'define not cluster info'        Click Element      ${Role_Not_Cluster_Info_Permission}
    ...         ELSE IF  '${Info[16]}' == 'define not IBCF'                Click Element      ${Role_Define_Not_IBCF_Permission}
    ...         ELSE IF  '${Info[16]}' == 'define not PCSCF'                Click Element      ${Role_Define_Not_PCSCF_Permission}
    Sleep       2s
    Click Button    ${SUBMIT_BUTTON}
    Sleep       3s
    Page Should Not Contain    Add user
    #Verify Messages
    Verify Page Contains 2 Expected Elements    ${Info[13]}    ${Info[16]}


Login again with new user
    [Arguments]  ${Info}
    #login the first time
    Run Keyword If  '${Info[5]}' == 'Graph user' or '${Info[5]}' == 'Normal user'   Input Text  ${USERNAME}  ${Info[13]}
    Run Keyword If  '${Info[5]}' == 'Graph user' or '${Info[5]}' == 'Normal user'   Input Text  ${PASSWORD}  ${Info[14]}
    Click Element  ${LOGIN_BUTTON}
    Sleep       1s
    Page Should Not Contain   CIRPACK Web Admin
    #changed password the first time
    #26384 login to change password after creating an normal User
    Page Should Contain     please set a new password
    Run Keyword If  '${Info[17]}' != '#BLANK'  Input Text  ${PASSWORD}  ${Info[17]}
    Run Keyword If  '${Info[18]}' != '#BLANK'  Input Text  ${CONFIRM_PASSWORD}  ${Info[18]}
    Click Button  name=btn-submit
    Sleep       2s
    Page Should Not Contain     please set a new password
    Page Should Contain     ${Info[25]}


Edit User for Password Policy By Admin User
    [Arguments]  ${Info}
#    Run Keyword If       '${Info[27]}' == 'Next page'    PasswordPolicyPage.Click Next page   ${Info[13]}
    Run Keyword If       '${Info[27]}' != '#BLANK'    PasswordPolicyPage.Click Next page for PW   ${Info[27]}
    Sleep       2s
    Click Edit Element With 2 Info   ${Info[13]}    ${Info[16]}
    Sleep       2s
    Page Should Contain  Edit user  #Edit User
#Modify Credentials
    Wait Until Element Is Visible  xpath=//*[@id='content-container']/div[2]   #Add table
    Run Keyword If  '${Info[19]}' != '#BLANK'  Input Text  ${PASSWORD}  ${Info[19]}
    Run Keyword If  '${Info[20]}' != '#BLANK'  Input Text  ${CONFIRM_PASSWORD}  ${Info[20]}

    Run Keyword If  '${Info[21]}' != '#BLANK'                 Click Element      ${Role_dropdown}
    Sleep       2s
    Run Keyword If       '${Info[21]}' == 'admin'                          Click Element      ${Role_Admin}      #${Role_Admin}
    ...         ELSE IF  '${Info[21]}' == 'graph user'                     Click Element      ${Role_Graph}
    ...         ELSE IF  '${Info[21]}' == 'define not supervision'         Click Element      ${Role_Define_Not_Supervision_Permission}
    ...         ELSE IF  '${Info[21]}' == 'define not cluster info'        Click Element      ${Role_Not_Cluster_Info_Permission}
    ...         ELSE IF  '${Info[21]}' == 'define not IBCF'                Click Element      ${Role_Define_Not_IBCF_Permission}
    ...         ELSE IF  '${Info[21]}' == 'define not PCSCF'                Click Element      ${Role_Define_Not_PCSCF_Permission}
    Sleep       3s
    Click Element    ${SUBMIT_BUTTON}
    Sleep  1.5s
    Page Should Not Contain   Edit user


Login again with all user edited user manager
    [Arguments]  ${Info}
    run keyword unless  '${Info[13]}' == '#BLANK'  Input Text  ${USERNAME}  ${Info[13]}
    run keyword unless  '${Info[19]}' == '#BLANK'  Input Text  ${PASSWORD}  ${Info[19]}
    Click Element  ${LOGIN_BUTTON}
    Sleep   2.5s
    Page Should Contain        ${Info[25]}
    Page Should Not Contain     CIRPACK Web Admin


Modify
    [Arguments]  ${Info}
    Page Should Contain     User Preference
    run keyword unless  '${Info[22]}' == '#BLANK'  Input Text  ${OLD_PASSWORD}  ${Info[22]}
    run keyword unless  '${Info[23]}' == '#BLANK'  Input Text  ${PASSWORD}      ${Info[23]}
    run keyword unless  '${Info[24]}' == '#BLANK'  Input Text  ${CONFIRM_PASSWORD}  ${Info[24]}
    Sleep       2s
    Click Element  ${SAVE_PASSWORD_BUTTON}
    Sleep       1s

Login again with all user edited user preference
    [Arguments]  ${Info}
    run keyword unless  '${Info[13]}' == '#BLANK'  Input Text  ${USERNAME}  ${Info[13]}
    run keyword unless  '${Info[23]}' == '#BLANK'  Input Text  ${PASSWORD}  ${Info[23]}
    Click Element  ${LOGIN_BUTTON}
    Sleep   2.5s
    Page Should Contain        ${Info[25]}
    Page Should Not Contain     CIRPACK Web Admin

############################################################################################################################################################################
############################################################################################################################################################################
############################################################################################################################################################################



# Add User for Password Policy By Admin User
#     [Arguments]  ${Info}
#     Click Element  ${ADD_BUTTON}
#     Sleep       3s
#     Page Should Contain  Admin user
#     #Enter Credentials
#     Wait Until Element Is Visible  xpath=//*[@id='content-container']/div[2]   #Add table
#     Run Keyword If  '${Info[13]}' != '#BLANK'  Input Text  ${USERNAME}  ${Info[13]}
#     Run Keyword If  '${Info[14]}' != '#BLANK'  Input Text  ${PASSWORD}  ${Info[14]}
#     Run Keyword If  '${Info[15]}' != '#BLANK'  Input Text  ${CONFIRM_PASSWORD}  ${Info[15]}

#     Run Keyword If   '${Info[16]}' != '#BLANK'               Click Element      ${Role_dropdown}
#     Sleep       3s
#     Run Keyword If       '${Info[16]}' == 'graph user'                     Click Element      ${Role_Graph}      #${Role_Admin}
#     ...         ELSE IF  '${Info[16]}' == 'define not supervision'         Click Element      ${Role_Define_Not_Supervision_Permission}
#     ...         ELSE IF  '${Info[16]}' == 'define not cluster info'        Click Element      ${Role_Not_Cluster_Info_Permission}
#     ...         ELSE IF  '${Info[16]}' == 'define not IBCF'                Click Element      ${Role_Define_Not_IBCF_Permission}

#     Sleep       3s
#     Click Button    ${SUBMIT_BUTTON}
#     Sleep  5s
#     #Verify Messages
#     Verify Page Contains 2 Expected Elements    ${Info[13]}    ${Info[16]}






Login again with new user edited user preference
    [Arguments]  ${Info}
    Run Keyword If  '${Info[13]}' != '#BLANK'  Input Text  ${USERNAME}  ${Info[13]}
    Run Keyword If  '${Info[23]}' != '#BLANK'  Input Text  ${PASSWORD}  ${Info[23]}
    Click Element  ${LOGIN_BUTTON}

    Page Should Contain        ${Info[25]}



Click Next page for PW
    [Arguments]   ${Info}
    Run Keyword If  '${Info[27]}' == 'Next page 1'       Click Element     ${Next_page}
    Run Keyword If  '${Info[27]}' == 'Next page 2'       Run Keywords      Click Element     ${Next_page}  AND  Click Element     ${Next_page}
    Run Keyword If  '${Info[27]}' == 'Next page 3'       Run Keywords      Click Element     ${Next_page}  AND  Click Element     ${Next_page}  AND  Click Element     ${Next_page}
    Run Keyword If  '${Info[27]}' == 'Next page 4'       Run Keywords      Click Element     ${Next_page}  AND  Click Element     ${Next_page}  AND  Click Element     ${Next_page}
    ...     AND  Click Element     ${Next_page}
    Run Keyword If  '${Info[27]}' == 'Next page 5'       Run Keywords      Click Element     ${Next_page}  AND  Click Element     ${Next_page}  AND  Click Element     ${Next_page}
    ...     AND  Click Element     ${Next_page}  AND  Click Element     ${Next_page}
    Run Keyword If  '${Info[27]}' == 'Next page 6'       Run Keywords      Click Element     ${Next_page}  AND  Click Element     ${Next_page}  AND  Click Element     ${Next_page}
    ...     AND  Click Element     ${Next_page}  AND  Click Element     ${Next_page}  AND  Click Element     ${Next_page}
    Run Keyword If  '${Info[27]}' == 'Next page 7'       Run Keywords      Click Element     ${Next_page}  AND  Click Element     ${Next_page}  AND  Click Element     ${Next_page}
    ...     AND  Click Element     ${Next_page}  AND  Click Element     ${Next_page}  AND  Click Element     ${Next_page}  AND  Click Element     ${Next_page}
    Run Keyword If  '${Info[27]}' == 'Next page 8'       Run Keywords      Click Element     ${Next_page}  AND  Click Element     ${Next_page}  AND  Click Element     ${Next_page}
    ...     AND  Click Element     ${Next_page}  AND  Click Element     ${Next_page}  AND  Click Element     ${Next_page}  AND  Click Element     ${Next_page}
    ...     AND  Click Element     ${Next_page}



########################################################################    Password Policy    ########################################################################




Verify messages
    [Arguments]  ${Credentials}
    Run Keyword If  '${Credentials[20]}' != '#BLANK'         Page Should Contain  ${Credentials[20]}
    Run Keyword If  """${Credentials[13]}""" != '#BLANK'     Page Should Contain Element    //input[@id='num_password']//following-sibling::span         ${Credentials[13]}
    Run Keyword If  """${Credentials[14]}""" != '#BLANK'     Page Should Contain Element    //input[@id='num_digit']//following-sibling::span             ${Credentials[14]}
    Run Keyword If  """${Credentials[15]}""" != '#BLANK'     Page Should Contain Element    //input[@id='num_uppercase']//following-sibling::span          ${Credentials[15]}
    Run Keyword If  """${Credentials[16]}""" != '#BLANK'     Page Should Contain Element    //input[@id='num_lowercase']//following-sibling::span           ${Credentials[16]}
    Run Keyword If  """${Credentials[17]}""" != '#BLANK'     Page Should Contain Element    //input[@id='num_scharacters']//following-sibling::span          ${Credentials[17]}
    Run Keyword If  """${Credentials[18]}""" != '#BLANK'     Page Should Contain Element    //input[@id='password_periodicity']//following-sibling::span      ${Credentials[18]}
    Run Keyword If  """${Credentials[19]}""" != '#BLANK'     Page Should Contain Element    //input[@id='forbid_password']//following-sibling::span             ${Credentials[19]}

Edit Manager User For Role
    [Arguments]  ${Info}
    Click Edit Element With 2 Info   ${Info[13]}    ${Info[4]}
    Sleep       3s
    Page Should Contain  Edit user
    Run Keyword If  '${Info[14]}' != '#BLANK'    Input Text       ${PASSWORD}                ${Info[14]}
    Run Keyword If  '${Info[15]}' != '#BLANK'    Input Text       ${CONFIRM_PASSWORD}                   ${Info[15]}

    Run Keyword If   '${Info[16]}' != '#BLANK'               Click Element      ${Role_dropdown}
    Sleep       2s
    Run Keyword If       '${Info[16]}' == 'graph user'                     Click Element      ${Role_Graph}      #${Role_Admin}
    ...         ELSE IF  '${Info[16]}' == 'define not supervision'         Click Element      ${Role_Define_Not_Supervision_Permission}
    ...         ELSE IF  '${Info[16]}' == 'define not cluster info'        Click Element      ${Role_Not_Cluster_Info_Permission}
    ...         ELSE IF  '${Info[16]}' == 'define not IBCF'                Click Element      ${Role_Define_Not_IBCF_Permission}
    ...         ELSE IF  '${Info[16]}' == 'define not PCSCF'                Click Element      ${Role_Define_Not_PCSCF_Permission}
    Sleep  4s
    Click Button  name=btn-submit
    Sleep       2s
    Page Should Contain  ${Info[13]}
    Page Should Contain  ${Info[4]}


Get Current Page Admin
   [Arguments]     ${Info}
    ${is_Require_Update_PW} =    Run Keyword And Return Status    Page Should Contain    Update Password
   Run Keyword If    ${is_Require_Update_PW}        PasswordPolicyPage.Update password     ${Info}
   ...     ELSE      run keyword   PasswordPolicyPage.Navigate to Password Policy Page

Update password
    [Arguments]  ${Info}
    Page Should Contain     Update Password
    Run Keyword If  '${Info[13]}' != '#BLANK'      Input Text        ${FIRST_LOGIN_PASSWORD}                        ${Info[13]}
    Run Keyword If  '${Info[14]}' != '#BLANK'      Input Text        ${FIRST_LOGIN_CONFIRM_PASSWORD}                ${Info[14]}
    Sleep       2s
    Click Element          ${SUBMIT_BUTTON}
    Page Should Contain    ${Info[15]}
    Common.Log out



Change Password
    [Arguments]  ${Info}
    Page Should Contain     Update Password
    Run Keyword If  '${Info[13]}' != '#BLANK'      Input Text        ${FIRST_LOGIN_PASSWORD}                        ${Info[13]}
    Run Keyword If  '${Info[14]}' != '#BLANK'      Input Text        ${FIRST_LOGIN_CONFIRM_PASSWORD}                ${Info[14]}
    Sleep       2s
    Click Element          ${SUBMIT_BUTTON}
    # Verify password change success
    Run Keyword And Continue On Failure      Page Should Contain    ${Info[15]}
    # Verify login with new password
    LoginApp_SBC.Attempt to Login  ${Info}
    # Verify successful login after password change
    Run Keyword And Continue On Failure      Page Should Contain    ${Info[15]}
    Common.Log out

Create the user and user first login set a new password
    [Arguments]  ${Info}
#     add on Manager User page
    Run Keyword If  '${Info[5]}' != 'Admin user'                    Add User for Password Policy By Admin User   ${Info}
#Login again with user and password vừa
    Run Keyword If  '${Info[5]}' != 'Admin user'                    PasswordPolicyPage.Login again with the admin user on Preference   ${Info}
    #Change password first login
    Run Keyword If  '${Info[10]}' != '#BLANK'    run keyword    Input Text       ${FIRST_LOGIN_PASSWORD}                        ${Info[10]}
    Run Keyword If  '${Info[11]}' != '#BLANK'    run keyword    Input Text       ${FIRST_LOGIN_CONFIRM_PASSWORD}                ${Info[11]}

    Page Should Contain Element       //*[@id='togglePassword']
    Page Should Contain Element       //*[@id='toggleConfirmPassword']
     ${textbox_value2}=    Get Text    ${PASSWORD}
     ${textbox_value3}=    Get Text    ${CONFIRM_PASSWORD}
    Run Keyword If    '${Info[13]}' == '1'    PasswordPolicyPage.Click Display Password User Manager and Update Password    1
     Run Keyword If    '${textbox_value2}' == '${Info[10]}'    Should Be Equal    ${textbox_value2}    ${Info[10]}
     Run Keyword If    '${textbox_value3}' == '${Info[11]}'    Should Be Equal    ${textbox_value3}    ${Info[11]}
    ...    ELSE IF    '${Info[13]}' == '2'    PasswordPolicyPage.Click Display Password User Manager and Update Password    2
     Run Keyword If    '${textbox_value2}' == '${Info[10]}'    Should Not Be Equal    ${textbox_value2}    ${Info[10]}
     Run Keyword If    '${textbox_value3}' == '${Info[11]}'    Should Not Be Equal    ${textbox_value3}    ${Info[11]}
    ...    ELSE IF    '${Info[13]}' == '3'    PasswordPolicyPage.Click Display Password User Manager and Update Password    3
     Run Keyword If    '${textbox_value2}' == '${Info[10]}'    Should Be Equal    ${textbox_value2}    ${Info[10]}
     Run Keyword If    '${textbox_value3}' == '${Info[11]}'    Should Be Equal    ${textbox_value3}    ${Info[11]}

    Sleep       2s
    Click Element  ${SUBMIT_BUTTON}
    Page Should Contain        ${Info[24]}
    Common.Log out

#Update password
#    [Arguments]  ${Info}
#    Page Should Contain     Update Password
#    Run Keyword If  '${Info[5]}' != '#BLANK'      Input Text        ${FIRST_LOGIN_PASSWORD}                        ${Info[6]}
#    Run Keyword If  '${Info[5]}' != '#BLANK'      Input Text        ${FIRST_LOGIN_CONFIRM_PASSWORD}                ${Info[7]}
#    Sleep       2s
#    Click Element          ${SUBMIT_BUTTON}
#    Page Should Contain    ${Info[8]}
#    PasswordPolicyPage.Log out

Edit the password on User Preference page
    [Arguments]  ${Info}
    #Edit admin password on User Preference page
    Run Keyword If  '${Info[4]}' == 'Admin user' and '${Info[11]}' == '10'                                     PasswordPolicyPage.Modify Preference 1   ${Info}
    ...   ELSE IF   '${Info[4]}' == 'Admin user' and '${Info[11]}' == '20'                                     PasswordPolicyPage.Modify Preference 2   ${Info}
    #Login again with user and password vừa add on Manager User page
    Run Keyword If  '${Info[4]}' == 'Graph user' and '${Info[4]}' == 'Normal user'                       Common.Log out
    Run Keyword If  '${Info[4]}' == 'Graph user' and '${Info[4]}' == 'Normal user'                       LoginApp_SBC.Attempt to Login  ${Info}
    #Edit user password on User Preference page
    Run Keyword If  '${Info[4]}' == 'Graph user' and '${Info[4]}' == 'Normal user'                       UserPreferenceApp.Go to User Preference Page

    Run Keyword If  '${Info[4]}' == 'Graph user' and '${Info[11]}' == '0'                                PasswordPolicyPage.Modify Preference 1   ${Info}
    Run Keyword If  '${Info[4]}' == 'Graph user' and '${Info[11]}' == '5'                                PasswordPolicyPage.Modify Preference 2   ${Info}
    Run Keyword If  '${Info[4]}' == 'Normal user' and '${Info[11]}' == '0'                               PasswordPolicyPage.Modify Preference 1   ${Info}
    Run Keyword If  '${Info[4]}' == 'Normal user' and '${Info[11]}' == '5'                               PasswordPolicyPage.Modify Preference 2   ${Info}

Edit the password on User Manager page
    [Arguments]  ${Info}
#    Run Keyword If  '${Info[4]}' != '#BLANK'                                       PasswordPolicyPage.Login again with new user edited user preference   ${Info}
    Run Keyword If  '${Info[4]}' != '#BLANK'                                       UserManagerApp.Go to User Manager Page
    Run Keyword If  '${Info[4]}' != '#BLANK'                                       PasswordPolicyPage.Edit User    ${Info}
    Page Should Contain           ${Info[11]}

Delete the user on User Manager page
    [Arguments]  ${Info}
    Run Keyword If  '${Info[4]}' == 'Admin user'
    ...  run keyword        PasswordPolicyPage.Login again with the admin user of Manager User page   ${Info}
    Run Keyword If  '${Info[4]}' == 'Graph user' or '${Info[4]}' == 'Normal user'        Common.Log out
    Run Keyword If  '${Info[4]}' == 'Graph user' or '${Info[4]}' == 'Normal user'
    ...  Run Keywords       PasswordPolicyPage.Login again with the user of Manager User page   ${Info}
    ...  AND                Go to User Manager Page
    ...  AND                PasswordPolicyPage.Delete User   ${Info}
    Common.Log out


Add User for Password Policy By Admin User
    [Arguments]  ${Info}
    Click Element  ${ADD_BUTTON}
    Sleep       2s
    Page Should Contain  Admin user
    #Enter Credentials
    Wait Until Element Is Visible  xpath=//*[@id='content-container']/div[2]   #Add table
    Run Keyword If  '${Info[6]}' != '#BLANK'  Input Text         ${USERNAME}          ${Info[6]}
    Run Keyword If  '${Info[7]}' != '#BLANK'  Input Text         ${PASSWORD}          ${Info[7]}
    Run Keyword If  '${Info[8]}' != '#BLANK'  Input Text         ${CONFIRM_PASSWORD}  ${Info[8]}

    Run Keyword If   '${Info[9]}' != '#BLANK'               Click Element      ${Role_dropdown}
    Sleep       2s
    Run Keyword If       '${Info[9]}' == 'graph user'                     Click Element      ${Role_Graph}      #${Role_Admin}
    ...         ELSE IF  '${Info[9]}' == 'define not supervision'         Click Element      ${Role_Define_Not_Supervision_Permission}
    ...         ELSE IF  '${Info[9]}' == 'define not cluster info'        Click Element      ${Role_Not_Cluster_Info_Permission}
    ...         ELSE IF  '${Info[9]}' == 'define not IBCF'                Click Element      ${Role_Define_Not_IBCF_Permission}
    ...         ELSE IF  '${Info[9]}' == 'define not PCSCF'                Click Element      ${Role_Define_Not_PCSCF_Permission}
    Sleep       3s
    Page Should Contain Element       //*[@id='togglePassword']
    Page Should Contain Element       //*[@id='toggleConfirmPassword']
    IF    '${Info[13]}' == '1'    Click Display Password User Manager and Update Password    1
    Page Should Contain   ${Info[7]}
    Page Should Contain   ${Info[8]}
    IF    '${Info[13]}' == '2'    Click Display Password User Manager and Update Password    2
    Page Should Not Contain    ${Info[7]}
    Page Should Not Contain    ${Info[8]}
    IF    '${Info[13]}' == '3'    Click Display Password User Manager and Update Password    3
    Page Should Contain   ${Info[7]}
    Page Should Contain   ${Info[8]}
    Click Button   name=btn-submit
    Sleep  2.5s
    #Verify Messages
    Verify Page Contains 2 Expected Elements    ${Info[6]}    ${Info[9]}


Click Display Password User Manager and Update Password
    [Arguments]  ${click_count}
   # Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR  ${Info}  IN RANGE  @{click_count}
        TRY
            Click Element    //*[@id='togglePassword']
            Click Element    //*[@id='toggleConfirmPassword']
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END



Login again with the admin user on Preference
    [Arguments]  ${Info}
    Common.Log out
    run keyword unless  '${Info[6]}' == '#BLANK'  Input Text  ${USERNAME}  ${Info[6]}
    run keyword unless  '${Info[11]}' == '#BLANK'  Input Text  ${PASSWORD}  ${Info[11]}
    Page Should Contain Element       //*[@id='togglePassword']
    IF    '${Info[13]}' == '1'    Click Display Password Login Page Of Policy    1
    Page Should Contain   ${Info[11]}
    IF    '${Info[13]}' == '2'    Click Display Password Login Page Of Policy    2
    Page Should Not Contain    ${Info[11]}
    IF    '${Info[13]}' == '3'    Click Display Password Login Page Of Policy    3
    Page Should Contain   ${Info[11]}
    Click Element  ${LOGIN_BUTTON}

Click Display Password Login Page Of Policy
    [Arguments]  ${click_count}
   # Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR  ${Info}  IN RANGE  @{click_count}
        TRY
              Click Element    //*[@id='togglePassword']
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Login again with the user on Preference
    [Arguments]  ${Info}
    run keyword unless  '${Info[13]}' == '#BLANK'  Input Text  ${USERNAME}  ${Info[13]}
    run keyword unless  '${Info[17]}' == '#BLANK'  Input Text  ${PASSWORD}  ${Info[17]}
    Click Element  ${LOGIN_BUTTON}
    #26384 login to change password after creating an normal User
    Run Keyword If  '${Info[16]}' != '#BLANK'  Input Text  ${PASSWORD}  ${Info[16]}
    Run Keyword If  '${Info[17]}' != '#BLANK'  Input Text  ${CONFIRM_PASSWORD}  ${Info[17]}
    Click Button  name=btn-submit
    Sleep       2s

Login again with the admin user of Manager User page
    [Arguments]  ${Info}
    Run Keyword If  '${Info[0]}' != '#BLANK'  Input Text  ${USERNAME}   ${Info[0]}
    Run Keyword If  '${Info[1]}' != '#BLANK'  Input Text  ${PASSWORD}   ${Info[1]}
    Click Element  ${LOGIN_BUTTON}

Login again with the user of Manager User page
    [Arguments]  ${Info}
    Run Keyword If  '${Info[0]}' != '#BLANK'  Input Text  ${USERNAME}   ${Info[0]}
    Run Keyword If  '${Info[1]}' != '#BLANK'  Input Text  ${PASSWORD}   ${Info[1]}
    Click Element  ${LOGIN_BUTTON}
    #26384 login to change password after creating an normal User
    Run Keyword If  '${Info[16]}' != '#BLANK'  Input Text  ${PASSWORD}  ${Info[16]}
    Run Keyword If  '${Info[17]}' != '#BLANK'  Input Text  ${CONFIRM_PASSWORD}  ${Info[17]}
    Click Button  name=btn-submit
    Sleep       2s



Modify Preference 1
    [Arguments]  ${Info}
    run keyword unless  '${Info[5]}' == '#BLANK'  Input Text   ${OLD_PASSWORD}       ${Info[5]}
    run keyword unless  '${Info[6]}' == '#BLANK'  Input Text   ${PASSWORD}           ${Info[6]}
    run keyword unless  '${Info[7]}' == '#BLANK'  Input Text   ${CONFIRM_PASSWORD}   ${Info[7]}
    Sleep       3s
    Click Element  ${SAVE_PASSWORD_BUTTON}

Modify Preference 2
    [Arguments]  ${Info}
    run keyword unless  '${Info[8]}' == '#BLANK'  Input Text   ${OLD_PASSWORD}       ${Info[8]}
    run keyword unless  '${Info[9]}' == '#BLANK'  Input Text   ${PASSWORD}           ${Info[9]}
    run keyword unless  '${Info[10]}' == '#BLANK'  Input Text   ${CONFIRM_PASSWORD}   ${Info[10]}
    Sleep       3s
    Click Element  ${SAVE_PASSWORD_BUTTON}

Modify Manager 1
    [Arguments]  ${Info}
    run keyword unless  '${Info[5]}' == '#BLANK'  Input Text   ${PASSWORD}           ${Info[6]}
    run keyword unless  '${Info[6]}' == '#BLANK'  Input Text   ${CONFIRM_PASSWORD}   ${Info[7]}
    Sleep       3s
    Click Element  ${SAVE_PASSWORD_BUTTON}

Modify Manager 2
    [Arguments]  ${Info}
    run keyword unless  '${Info[7]}' == '#BLANK'  Input Text   ${PASSWORD}           ${Info[9]}
    run keyword unless  '${Info[8]}' == '#BLANK'  Input Text   ${CONFIRM_PASSWORD}   ${Info[10]}
    Sleep       3s
    Click Element  ${SAVE_PASSWORD_BUTTON}

Edit User
    [Arguments]  ${Info}
#    Click Next page   ${Credentials[4]}
#    Sleep       3s
    Click Edit Element With 2 Info   ${Info[0]}   ${Info[12]}
    Sleep       3s
    Page Should Contain  Edit user  #Edit User
#Modify Credentials
    Wait Until Element Is Visible  xpath=//*[@id='content-container']/div[2]   #Add table
    Run Keyword If  '${Info[4]}' == 'Admin user' and '${Info[11]}' == '10'           PasswordPolicyPage.Modify Manager 1   ${Info}
    Run Keyword If  '${Info[4]}' == 'Admin user' and '${Info[11]}' == '20'           PasswordPolicyPage.Modify Manager 2   ${Info}
    Run Keyword If  '${Info[4]}' == 'Graph user' and '${Info[11]}' == '0'            PasswordPolicyPage.Modify Manager 1   ${Info}
    Run Keyword If  '${Info[4]}' == 'Graph user' and '${Info[11]}' == '5'            PasswordPolicyPage.Modify Manager 2   ${Info}
    Run Keyword If  '${Info[4]}' == 'Normal user' and '${Info[11]}' == '0'           PasswordPolicyPage.Modify Manager 1   ${Info}
    Run Keyword If  '${Info[4]}' == 'Normal user' and '${Info[11]}' == '5'           PasswordPolicyPage.Modify Manager 2   ${Info}

    Run Keyword If  '${Info[9]}' != '#BLANK'                     Click Element      ${Role_dropdown}
    Sleep       2s
    Run Keyword If       '${Info[9]}' == 'graph user'                     Click Element      ${Role_Graph}      #${Role_Admin}
    ...         ELSE IF  '${Info[9]}' == 'define not supervision'         Click Element      ${Role_Define_Not_Supervision_Permission}
    ...         ELSE IF  '${Info[9]}' == 'define not cluster info'        Click Element      ${Role_Not_Cluster_Info_Permission}
    ...         ELSE IF  '${Info[9]}' == 'define not IBCF'                Click Element      ${Role_Define_Not_IBCF_Permission}
    ...         ELSE IF  '${Info[9]}' == 'define not PCSCF'                Click Element      ${Role_Define_Not_PCSCF_Permission}
    Sleep       3s
    Click Element  ${SUBMIT_BUTTON}
    Sleep       3s

Delete User
    [Arguments]  ${Info}
    Click Delete Element With 2 Info    ${Info[0]}      ${Info[8]}
    Sleep       3s
    Page Should Contain  Warning : Do you want to remove
    Page Should Contain  ${Info[13]}
    Page Should Contain  ${Info[16]}
    Page Should Contain  Username
    Page Should Contain  Password
   # Page Should Contain  Language
    Page Should Contain  Role
    Sleep  5s
    Click Element  ${DELETE}
    Sleep       3s
    Verify Page Not Contains 2 Expect Elements    ${Info[0]}      ${Info[8]}
    Sleep       3s

Click Cancel button
    Click Element  ${CANCEL_BUTTON}
    Page Should Contain  Username
    Page Should Contain  Password
    #Page Should Contain  Language
    Page Should Contain  Role
    Sleep       3s

View Password
    [Arguments]  ${Credentials}
    Click View Element With 2 Info          ${Credentials[4]}       ${Credentials[5]}
    Page Should Contain Element   //table[@id='mandatory-items']//following::td[normalize-space(text()) = '${Credentials[4]}']
    Page Should Contain Element   //table[@id='mandatory-items']//following::td[normalize-space(text()) = '${Credentials[5]}']
    Page Should Contain Element   //table[@id='mandatory-items']//following::td[normalize-space(text()) = '${Credentials[6]}']
    Page Should Contain Element   //table[@id='mandatory-items']//following::td[normalize-space(text()) = '${Credentials[7]}']
    Page Should Contain Element   //table[@id='mandatory-items']//following::td[normalize-space(text()) = '${Credentials[8]}']
    Page Should Contain Element   //table[@id='mandatory-items']//following::td[normalize-space(text()) = '${Credentials[9]}']
    Page Should Contain Element   //table[@id='mandatory-items']//following::td[normalize-space(text()) = '${Credentials[10]}']
    Page Should Contain Element   //table[@id='mandatory-items']//following::td[normalize-space(text()) = '${Credentials[11]}']
    Page Should Contain Element   //table[@id='mandatory-items']//following::td[normalize-space(text()) = '${Credentials[12]}']
    Page Should Contain Element   //table[@id='mandatory-items']//following::td[normalize-space(text()) = '${Credentials[13]}']
    Sleep       2s









PasswordPolicyPage.Login again with admin user for User Manager Page
    [Arguments]  ${Info}
    Run Keyword If  '${Info[13]}' != '#BLANK'  Input Text  ${USERNAME}  ${Info[13]}
    Run Keyword If  '${Info[20]}' != '#BLANK'  Input Text  ${PASSWORD}  ${Info[20]}
    Click Element  ${LOGIN_BUTTON}

    Page Should Contain        ${Info[25]}

Login again with admin user for User Preference Page
    [Arguments]  ${Info}
    Run Keyword If  '${Info[13]}' != '#BLANK'  Input Text  ${USERNAME}  ${Info[13]}
    Run Keyword If  '${Info[23]}' != '#BLANK'  Input Text  ${PASSWORD}  ${Info[23]}
    Click Element  ${LOGIN_BUTTON}

    Page Should Contain        ${Info[25]}

# Delete User
#     [Arguments]  ${Info}
#     Click Delete Element With 2 Info    ${Info[13]}      ${Info[16]}
#     Sleep       3s
#     Page Should Contain  Warning : Do you want to remove
#     Page Should Contain  ${Info[12]}
#     Page Should Contain  ${Info[15]}
#     Page Should Contain  Username
#     Page Should Contain  Password
#    # Page Should Contain  Language
#     Page Should Contain  Role
#     Sleep  5s
#     Click Element  ${DELETE}
#     Sleep       3s
#     Verify Page Not Contains 2 Expect Elements    ${Info[13]}      ${Info[16]}
#     Sleep       3s