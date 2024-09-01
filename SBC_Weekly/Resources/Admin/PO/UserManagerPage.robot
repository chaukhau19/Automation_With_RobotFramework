*** Settings ***
Library  SeleniumLibrary
Resource  ../../Common.robot
*** Variables ***

##################---ELEMENT---#####################
${USERNAME}  xpath=//*[@id='username']
${PASSWORD}  xpath=//*[@id='password']
${CONFIRM_PASSWORD}  xpath=//*[@id='confirm_password']
${ADMINISTRATION_LANGUAGE_SELECT}  xpath=//*[@id="content-container"]/div[2]/form/div/div[4]/div/div
${ADMINISTRATION_ROLE_SELECT} =  xpath=//*[@id='content-container']/div[2]/form/div/div[5]/div/div/input
${BACK_BUTTON_FROM_VIEW_PAGE}  xpath=//a[@class='waves-effect waves-light btn #3AB4D6 btn-custom grey']

##################---BUTTON---#####################

${USER_MANAGER}      xpath=//*[@class='first-menu' and text()='Manage User']
# ${USER_MANAGER}   xpath=//*[@class='first-menu' and text()='Manager User']
${SUBMIT_BUTTON}     xpath=//*[@class='button-control']

${CANCEL_BUTTON}     xpath=//*[@class='button-cancel']
${ADD_BUTTON}        xpath=//*[@id='data-table']/tbody/tr[1]/th[5]/a/i     #Add button

${VIEW_BUTTON}       xpath=//*[@href='/user/view_user?username=User4']
${DELETE_BUTTON}     xpath=//*[@onclick="delete_item('/user/confirm_user?username=User4')"]
${EDIT_BUTTON}       xpath=//*[@href='/user/edit_user?username=User4']
${DELETE}            xpath=//*[@id='modal-confirm-delete']/div[2]/a[1]
${CANCEL_FROM_DELETE}  //*[@id='modal-confirm-delete']/div[2]/a[2]

${Role_Check_Box}			                           xpath=//input[@class='select-dropdown']//following::input[@value='admin']
${Role_1}                                              xpath=//*[@class='select-dropdown']//following::div[1]//li[1]/div[1]/ul[1]/li[1]
${Role_2}                                              xpath=//*[@class='select-dropdown']//following::div[1]//li[1]/div[1]/ul[1]/li[2]
#${Role_dropdown}                                       xpath=//label[@for='role']/preceding::div[1]/input
${Role_dropdown}                                       xpath=//label[contains(text(),'Role')]//preceding-sibling::div//following::input[@class='select-dropdown']
${Role_Admin}                                          xpath=//label[contains(text(),'Role')]//preceding-sibling::div[@class='select-wrapper']/ul/li[contains(.,'admin')]
${Role_Graph}                                          xpath=//label[contains(text(),'Role')]//preceding-sibling::div[@class='select-wrapper']/ul/li[contains(.,'graph user')]
#${Role_Define_Have_Admin_Permission}                   xpath=//label[contains(text(),'Role')]//preceding-sibling::div[@class='select-wrapper']/ul/li[contains(.,'define admin')]
#${Role_Define_Not_Admin_Permission}                   xpath=//label[contains(text(),'Role')]//preceding-sibling::div[@class='select-wrapper']/ul/li[contains(.,'define not admin')]
${Role_Define_Not_Supervision_Permission}              xpath=//label[contains(text(),'Role')]//preceding-sibling::div[@class='select-wrapper']/ul/li[contains(.,'define not supervision')]
${Role_Not_Cluster_Info_Permission}                    xpath=//label[contains(text(),'Role')]//preceding-sibling::div[@class='select-wrapper']/ul/li[contains(.,'define not cluster info')]
${Role_Define_Not_IBCF_Permission}                     xpath=//label[contains(text(),'Role')]//preceding-sibling::div[@class='select-wrapper']/ul/li[contains(.,'define not IBCF')]
${Role_Define_Not_PCSCF_Permission}                     xpath=//label[contains(text(),'Role')]//preceding-sibling::div[@class='select-wrapper']/ul/li[contains(.,'define not PCSCF')]




*** Keywords ***
Navigate to User Manager Page
    Click Element  ${Admin_tab}
    Sleep       1s
    Click Element  ${USER_MANAGER}
    Sleep       1s

Click Cancel button
    Click Element  ${CANCEL_BUTTON}
    Page Should Contain  Username
    Page Should Contain  Password
    #Page Should Contain  Language
    Page Should Contain  Role
    Sleep       3s

Go to Add page
    Click Element  ${ADD_BUTTON}     #Add button
    Page Should Contain  Admin
    Sleep       3s

Back from Edit page
    [Arguments]  ${Credentials}
    #Click Edit Element With 2 Info   ${Credentials[4]}    ${Credentials[16]}
   ${arg} =  Create List      ${Credentials[4]}    ${Credentials[16]}
    Run Keyword N Times And Stop If Success   Click Edit Element With 2 Info   ${arg}    Click Element   ${Next_page}   6
    Sleep       2s
    #Click Element  ${EDIT_BUTTON}
    Page Should Contain  Edit user  #Edit User Displayed
    Sleep       2s
    Click Element  ${CANCEL_BUTTON}

###############################################################--ADD_USER_MANAGER--############################################################
Create User Manager
    [Arguments]  ${Credentials}
    Click Element  ${ADD_BUTTON}
    Sleep       3s
    Page Should Contain  Admin
    #Enter Credentials
    Wait Until Element Is Visible  xpath=//*[@id='content-container']/div[2]   #Add table
    Common.TogglePassword 2
    Run Keyword If  '${Credentials[4]}' != '#BLANK'  Input Text  ${USERNAME}  ${Credentials[4]}
    Run Keyword If  """${Credentials[5]}""" != '#BLANK'  Input Text  ${PASSWORD}  ${Credentials[5]}
    Run Keyword If  """${Credentials[6]}""" != '#BLANK'  Input Text  ${CONFIRM_PASSWORD}  ${Credentials[6]}

    #26729  The normal user should not have the admin role in Manage User page
    Run Keyword If   '${Credentials[9]}' != '#BLANK'    Run Keywords             Click Element      ${Role_dropdown}   
    ...    AND     Sleep       2s    AND  Page Should Not Contain Element    ${Role_Admin}
    Sleep       1s
    Run Keyword If       '${Credentials[9]}' == 'graph user'                     Click Element      ${Role_Graph}      #${Role_Admin}
    ...         ELSE IF  '${Credentials[9]}' == 'define not supervision'         Click Element      ${Role_Define_Not_Supervision_Permission}
    ...         ELSE IF  '${Credentials[9]}' == 'define not cluster info'        Click Element      ${Role_Not_Cluster_Info_Permission}
    ...         ELSE IF  '${Credentials[9]}' == 'define not IBCF'                Click Element      ${Role_Define_Not_IBCF_Permission}
    ...         ELSE IF  '${Credentials[9]}' == 'define not PCSCF'                Click Element      ${Role_Define_Not_PCSCF_Permission}
    Sleep       2s
    #26668
    Common.TogglePassword 2
    Run Keyword If    '${Credentials[13]}' == 'unhide'      Common.Click Display Password For User Manager Page   1
    Run Keyword If    '${Credentials[14]}' == 'hide'        Common.Click Display Password For User Manager Page   2
    Sleep       1s
    Click Button  name=btn-submit
    Sleep  3.5s


Login again with new user
    [Arguments]  ${Credentials}
    Common.TogglePassword 1
    Run Keyword If  '${Credentials[4]}' != '#BLANK'  Input Text  ${USERNAME}  ${Credentials[4]}
    Run Keyword If  """${Credentials[5]}""" != '#BLANK'  Input Text  ${PASSWORD}  ${Credentials[5]}

    #26668
    Common.TogglePassword 1
    Run Keyword If    '${Credentials[13]}' == 'unhide'      Common.Click Display Password For Login Page   1
    Run Keyword If    '${Credentials[14]}' == 'hide'        Common.Click Display Password For Login Page   2
    Sleep       2s
    Click Element  ${LOGIN_BUTTON}
    Wait Until Page Does Not Contain Element     ${LOGIN_BUTTON}

    #26384 login to change password after creating an normal User
    Common.TogglePassword 2
    Run Keyword If  """${Credentials[7]}""" != '#BLANK'  Input Text  ${PASSWORD}  ${Credentials[7]}
    Run Keyword If  """${Credentials[8]}""" != '#BLANK'  Input Text  ${CONFIRM_PASSWORD}  ${Credentials[8]}

    #26668
    Common.TogglePassword 2
    Run Keyword If    '${Credentials[13]}' == 'unhide'      Common.Click Display Password For Update Password Page   1
    Run Keyword If    '${Credentials[14]}' == 'hide'        Common.Click Display Password For Update Password Page   2
    Sleep       2s
    Click Button  name=btn-submit
    Sleep       2s

Login again with user
    [Arguments]  ${Credentials}
    Run Keyword If  '${Credentials[4]}' != '#BLANK'  Input Text  ${USERNAME}  ${Credentials[9]}
    Run Keyword If  '${Credentials[5]}' != '#BLANK'  Input Text  ${PASSWORD}  ${Credentials[11]}
    Click Element  ${LOGIN_BUTTON}
    Sleep       3s

Login again after modifying
    [Arguments]  ${USERNAME_Info}   ${PASSWORD_Info}    ${Eye_Unhide}   ${Eye_hide}
    Common.TogglePassword 1
    Input Text  ${USERNAME}  ${USERNAME_Info}
    Input Text  ${PASSWORD}  ${PASSWORD_Info}

    #26668
    Common.TogglePassword 1
    Run Keyword If    '${Eye_Unhide}' == 'unhide'      Common.Click Display Password For Login Page   1
    Run Keyword If    '${Eye_hide}' == 'hide'          Common.Click Display Password For Login Page   2
    Sleep       1s
    Click Button  ${LOGIN_BUTTON}
    Sleep  0.5s



##############################################################--VIEW_USER_MANAGER--############################################################
View Page
    [Arguments]   ${User_Name}    ${Role}   ${Condition_Next_Page}
   # Run Keyword If       '${Condition_Next_Page}' != 'Add to test login'   Click Next page    ${User_Name}
   # Sleep       2s
   # Click View Element With 2 Info   ${User_Name}    ${Role}
   # Sleep   3s

   ${arg} =  Create List    ${User_Name}    ${Role}
    Run Keyword N Times And Stop If Success   Click View Element With 2 Info   ${arg}    Click Element   ${Next_page}   6
    Sleep   3s

    Page Should Contain  ${User_Name}
    Page Should Contain  ${Role}
    Page Should Contain  *
    Sleep       2s
    #Wait Until Element Is Visible  xpath=//option[contains(text(),'*')]
    Click Element  ${BACK_BUTTON_FROM_VIEW_PAGE} 
    Sleep       2s

##############################################################--EDIT_USER_MANAGER--############################################################
Edit User Valid
    [Arguments]   ${User_Name_Info}   ${Password_Info}   ${Confirm_Password_Info}   ${Old_Role}  ${Eye_Unhide}   ${Eye_hide}   ${New_Role}

   ${arg} =  Create List    ${User_Name_Info}     ${Old_Role}
    Run Keyword N Times And Stop If Success   Click Edit Element With 2 Info   ${arg}    Click Element   ${Next_page}   6
    Sleep   3s

    Page Should Contain  Edit user
    Edit Valid_Invalid User Manager    ${User_Name_Info}   ${Password_Info}   ${Confirm_Password_Info}   ${Old_Role}  ${Eye_Unhide}   ${Eye_hide}   ${New_Role}
    Wait Until Page Does Not Contain Element    ${SUBMIT_BUTTON}    10s

Edit User Invalid
    [Arguments]   ${User_Name_Info}   ${Password_Info}   ${Confirm_Password_Info}   ${Old_Role}    ${Eye_Unhide}   ${Eye_hide}   ${New_Role}

    ${arg} =  Create List    ${User_Name_Info}     ${Old_Role}
    Run Keyword N Times And Stop If Success   Click Edit Element With 2 Info   ${arg}    Click Element   ${Next_page}   6
    Sleep   3s

    Page Should Contain  Edit user
    Edit Valid_Invalid User Manager    ${User_Name_Info}   ${Password_Info}   ${Confirm_Password_Info}   ${Old_Role}   ${Eye_Unhide}   ${Eye_hide}   ${New_Role}
    Wait Until Page Contains Element   ${SUBMIT_BUTTON}    10s

Edit Valid_Invalid User Manager
    [Arguments]   ${User_Name_Info}   ${Password_Info}   ${Confirm_Password_Info}   ${Old_Role}  ${Eye_Unhide}   ${Eye_hide}   ${New_Role}
    #Modify Credentials
    Wait Until Element Is Visible  xpath=//*[@id='content-container']/div[2]   #Add table
    Common.TogglePassword 2
    Run Keyword If  """${Password_Info}""" != '#BLANK'          Input Text  ${PASSWORD}           ${Password_Info}
    Run Keyword If  """${Confirm_Password_Info}""" != '#BLANK'  Input Text  ${CONFIRM_PASSWORD}   ${Confirm_Password_Info}
    Run Keyword If  '${New_Role}' != '#BLANK'                   Click Element                     ${Role_dropdown}
    Sleep       3s
    #26729  The normal user should not have the admin role in Manage User page
    Run Keyword If  '${New_Role}' != 'admin'                Page Should Not Contain Element       ${Role_Admin}
    Run Keyword If  '${New_Role}' == 'admin'                Page Should Contain Element           ${Role_Admin}
    Sleep       1s
    Run Keyword If       '${New_Role}' == 'admin'                          Click Element      ${Role_Admin}
    ...         ELSE IF  '${New_Role}' == 'graph user'                     Click Element      ${Role_Graph}
    ...         ELSE IF  '${New_Role}' == 'define not supervision'         Click Element      ${Role_Define_Not_Supervision_Permission}
    ...         ELSE IF  '${New_Role}' == 'define not cluster info'        Click Element      ${Role_Not_Cluster_Info_Permission}
    ...         ELSE IF  '${New_Role}' == 'define not IBCF'                Click Element      ${Role_Define_Not_IBCF_Permission}
    ...         ELSE IF  '${New_Role}' == 'define not PCSCF'                Click Element      ${Role_Define_Not_PCSCF_Permission}
    Sleep       2s
    #26668
    Common.TogglePassword 2
    Run Keyword If    '${Eye_Unhide}' == 'unhide'      Common.Click Display Password For User Manager Page   1
    Run Keyword If    '${Eye_hide}' == 'hide'          Common.Click Display Password For User Manager Page   2
    Sleep       2s

    Click Element  ${SUBMIT_BUTTON}




##############################################################--Filter Role Manager--##############################################################

Filter Role Manager  
    [Arguments]  ${Info}
    Filter 2 value User Manager           ${Info[4]}   ${Info[5]}


##############################################################--DELETE_USER_MANAGER--############################################################
Delete User
    [Arguments]  ${Credentials}

    Click Delete Element With 2 Info       ${Credentials[4]}     ${Credentials[9]}
    Sleep       3s
    Page Should Contain  Warning : Do you want to remove
    Page Should Contain  ${Credentials[4]}
    Page Should Contain  ${Credentials[9]}
    Page Should Contain  Username
    Page Should Contain  Password
   # Page Should Contain  Language
    Page Should Contain  Role
    Sleep       3s
    Click Element  ${DELETE}
    Sleep  4s
    Verify Page Not Contains 2 Expect Elements    ${Credentials[4]}  ${Credentials[9]}
    Sleep       3s

Click Delete Button User
    [Arguments]   ${First}
    Click Element        xpath=//*[@onclick="delete_item('/user/confirm_user?username=${First}')"]

Back from Delete page
    [Arguments]   ${Credentials}
    #Click Element  ${DELETE_BUTTON}
    Click Delete Element With 2 Info       ${Credentials[4]}     ${Credentials[9]}
    Sleep       3s
    Click Element  ${CANCEL_FROM_DELETE}
    Sleep       1s
##############################################################--Next Page--############################################################

Click Next page
    [Arguments]   ${User_Name}
    Run Keyword If  '${User_Name}' == 'User9'      Click Element      ${Next_page}
    Run Keyword If  '${User_Name}' == 'User10'      Click Element     ${Next_page}
    Run Keyword If  '${User_Name}' == 'User11'      Click Element     ${Next_page}
    Run Keyword If  '${User_Name}' == 'User12'      Click Element     ${Next_page}
    Run Keyword If  '${User_Name}' == 'User13'      Click Element     ${Next_page}
    Run Keyword If  '${User_Name}' == 'User14'      Click Element     ${Next_page}
    Run Keyword If  '${User_Name}' == 'User15'      Click Element     ${Next_page}
    Run Keyword If  '${User_Name}' == 'User16'      Click Element     ${Next_page}
    Run Keyword If  '${User_Name}' == 'User17'      Click Element     ${Next_page}
    Run Keyword If  '${User_Name}' == 'User18'      Click Element     ${Next_page}
    Run Keyword If  '${User_Name}' == 'User19'      Run Keywords      Click Element     ${Next_page}  AND  Click Element     ${Next_page}
    Run Keyword If  '${User_Name}' == 'User20'      Run Keywords      Click Element     ${Next_page}  AND  Click Element     ${Next_page}
    Run Keyword If  '${User_Name}' == 'User21'      Run Keywords      Click Element     ${Next_page}  AND  Click Element     ${Next_page}
    Run Keyword If  '${User_Name}' == 'User22'      Run Keywords      Click Element     ${Next_page}  AND  Click Element     ${Next_page}
    Run Keyword If  '${User_Name}' == 'User23'      Run Keywords      Click Element     ${Next_page}  AND  Click Element     ${Next_page}
    Run Keyword If  '${User_Name}' == 'User24'      Run Keywords      Click Element     ${Next_page}  AND  Click Element     ${Next_page}
    Run Keyword If  '${User_Name}' == 'User25'      Run Keywords      Click Element     ${Next_page}  AND  Click Element     ${Next_page}
    Run Keyword If  '${User_Name}' == 'User26'      Run Keywords      Click Element     ${Next_page}  AND  Click Element     ${Next_page}
    Run Keyword If  '${User_Name}' == 'User27'      Run Keywords      Click Element     ${Next_page}  AND  Click Element     ${Next_page}
    Run Keyword If  '${User_Name}' == 'User28'      Run Keywords      Click Element     ${Next_page}  AND  Click Element     ${Next_page}
    Run Keyword If  '${User_Name}' == 'User29'      Run Keywords      Click Element     ${Next_page}  AND  Click Element     ${Next_page}  AND  Click Element   ${Next_page}
    Run Keyword If  '${User_Name}' == 'User30'      Run Keywords      Click Element     ${Next_page}  AND  Click Element     ${Next_page}  AND  Click Element     ${Next_page}
    Run Keyword If  '${User_Name}' == 'User31'      Run Keywords      Click Element     ${Next_page}  AND  Click Element     ${Next_page}  AND  Click Element     ${Next_page}
    Run Keyword If  '${User_Name}' == 'User32'      Run Keywords      Click Element     ${Next_page}  AND  Click Element     ${Next_page}  AND  Click Element     ${Next_page}


