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

##################---BUTTON---@#####################

${USER_MANAGER}  xpath=//*[@class='first-menu' and text()='Manage User']
${USER_MANAGER_64}  xpath=//*[@class='first-menu' and text()='Manager User']
${SUBMIT_BUTTON}  xpath=//*[@class='button-control']
${LOGOUT_BUTTON}    xpath=//*[@id='container']/header/nav/div/span/a/i
${CANCEL_BUTTON}  xpath=//*[@class='button-cancel']
${ADD_BUTTON}  xpath=//*[@id='data-table']/tbody/tr[1]/th[5]/a/i     #Add button
${LOGIN_BUTTON} =  name=btnLogin
${VIEW_BUTTON}  xpath=//*[@href='/user/view_user?username=User4']
${DELETE_BUTTON}  xpath=//*[@onclick="delete_item('/user/confirm_user?username=User4')"]
${EDIT_BUTTON}  xpath=//*[@href='/user/edit_user?username=User4']
${DELETE}  xpath=//*[@id='modal-confirm-delete']/div[2]/a[1]
${CANCEL_FROM_DELETE}  //*[@id='modal-confirm-delete']/div[2]/a[2]

${Role_Check_Box}			xpath=//input[@class='select-dropdown']//following::input[@value='admin']
${Role_1}                   xpath=//*[@class='select-dropdown']//following::div[1]//li[1]/div[1]/ul[1]/li[1]
${Role_2}                   xpath=//*[@class='select-dropdown']//following::div[1]//li[1]/div[1]/ul[1]/li[2]

*** Keywords ***
Navigate to User Manager Page
    Click Element  ${Admin_tab}
    Sleep  1s
    Click Element  ${USER_MANAGER}
    Sleep  1s
Log out
    Click Element  ${LOGOUT_BUTTON}
    Sleep  5s
    Title Should Be  Login Page

Navigate to User Manager Page 64
    Click Element  ${Admin_tab}
    Sleep  1s
    Click Element  ${USER_MANAGER_64}
    Sleep  1s
Log out 64
    Click Element  ${LOGOUT_BUTTON}
    Sleep  5s
    Title Should Be  Login Page

Click Cancel button
    Click Element  ${CANCEL_BUTTON}
    Page Should Contain  Username
    Page Should Contain  Password
    #Page Should Contain  Language
    Page Should Contain  Role
    Sleep  3s

###############################################################--ADD_USER_MANAGER############################################################
Create User Manager
    [Arguments]  ${Credentials}
    Click Element  ${ADD_BUTTON}
    Sleep  3s
    Page Should Contain  Admin
    #Enter Credentials
    Wait Until Element Is Visible  xpath=//*[@id='content-container']/div[2]   #Add table
    Run Keyword If  '${Credentials[4]}' != '#BLANK'  Input Text  ${USERNAME}  ${Credentials[4]}
    Run Keyword If  '${Credentials[5]}' != '#BLANK'  Input Text  ${PASSWORD}  ${Credentials[5]}
    Run Keyword If  '${Credentials[6]}' != '#BLANK'  Input Text  ${CONFIRM_PASSWORD}  ${Credentials[6]}
    #Select Language
    #Click Element   ${ADMINISTRATION_LANGUAGE_SELECT}
    #Sleep  3s
    #Select From List By Value  id=lang  ${Credentials[7]}

#Select Role

#Click Element   ${ADMINISTRATION_ROLE_SELECT}
#Sleep  3s
#Select From List By Value  id=role  ${Credentials[8]}
#Sleep  5s


    Click Button  name=btn-submit
    Sleep  5s
    #Verify Messages
    Page Should Contain  ${Credentials[9]}
    Page Should Contain  ${Credentials[10]}

Login again with new user
    [Arguments]  ${Credentials}
    Run Keyword If  '${Credentials[4]}' != '#BLANK'  Input Text  ${USERNAME}  ${Credentials[4]}
    Run Keyword If  '${Credentials[5]}' != '#BLANK'  Input Text  ${PASSWORD}  ${Credentials[5]}
    Click Element  ${LOGIN_BUTTON}
    Sleep  3s

Login again with user
    [Arguments]  ${Credentials}
    Run Keyword If  '${Credentials[4]}' != '#BLANK'  Input Text  ${USERNAME}  ${Credentials[9]}
    Run Keyword If  '${Credentials[5]}' != '#BLANK'  Input Text  ${PASSWORD}  ${Credentials[11]}
    Click Element  ${LOGIN_BUTTON}
    Sleep  3s


Go to Add page
    Click Element  ${ADD_BUTTON}     #Add button
    Page Should Contain  Admin
    Sleep  3s

##############################################################--VIEW_USER_MANAGER--############################################################
View Page
    [Arguments]  ${Credentials}
    Click Element  ${VIEW_BUTTON}
    Page Should Contain  ${Credentials[4]}
    Page Should Contain  ${Credentials[8]}
    Page Should Contain  *
    Sleep  3s
    #Wait Until Element Is Visible  xpath=//option[contains(text(),'*')]
    Click Element  ${BACK_BUTTON_FROM_VIEW_PAGE}
##############################################################--EDIT_USER_MANAGER--############################################################
Edit User
    [Arguments]  ${Credentials}
    Click Element  ${EDIT_BUTTON}
    Sleep  3s
    Page Should Contain  Edit user  #Edit User
#Modify Credentials
    Wait Until Element Is Visible  xpath=//*[@id='content-container']/div[2]   #Add table
    Run Keyword If  '${Credentials[12]}' != '#BLANK'  Input Text  ${PASSWORD}  ${Credentials[12]}
    Run Keyword If  '${Credentials[13]}' != '#BLANK'  Input Text  ${CONFIRM_PASSWORD}  ${Credentials[13]}
    Run Keyword If  '${Credentials[14]}' != '#BLANK'  Click Element  //input[@class='select-dropdown']//following::input[@value='${Credentials[16]}']
    Sleep  2s
    Run Keyword If  '${Credentials[14]}' != '#BLANK'  Click Element  //span[normalize-space()='${Credentials[14]}']
    Sleep  2s
    Click Element  ${SUBMIT_BUTTON}
    Sleep  3s

Login again after modifying
    [Arguments]  ${Credentials}

    Input Text  ${USERNAME}  ${Credentials[9]}
    Input Text  ${PASSWORD}  ${Credentials[15]}
    Click Button  ${LOGIN_BUTTON}
    Sleep  3s
    Click Element  ${Admin_tab}
    Sleep  1s
    Click Element  ${USER_MANAGER}
    Sleep  1s
    Click Element  ${VIEW_BUTTON}
    Run Keyword If  '${Credentials[14]}' != '#BLANK'    Page Should Contain  ${Credentials[14]}

Back from Edit page
    Click Element  ${EDIT_BUTTON}
    Page Should Contain  Edit user  #Edit User
    Sleep  3s
    Click Element  ${CANCEL_BUTTON}

##############################################################--DELETE_USER_MANAGER--############################################################
Delete User
    [Arguments]  ${Credentials}

    Click Element  ${DELETE_BUTTON}
    Page Should Contain  Warning : Do you want to remove
    Page Should Contain  ${Credentials[4]}
    Page Should Contain  ${Credentials[8]}
    Page Should Contain  Username
    Page Should Contain  Password
   # Page Should Contain  Language
    Page Should Contain  Role
    Sleep  5s
    Click Element  ${DELETE}
    Sleep  3s
    Page Should Not Contain  ${Credentials[4]}
    Sleep  3s

Back from Delete page
    Click Element  ${DELETE_BUTTON}
    Sleep  5s
    Click Element  ${CANCEL_FROM_DELETE}
    Sleep  1s
##############################################################--LOGIN_ADMIN--############################################################



