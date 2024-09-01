*** Settings ***
Library  SeleniumLibrary
Library         String
Resource  ../../../Data/InputData.robot
Resource  ../../../Resources/DataManager.robot
Resource  ../../Common.robot
Resource  ../PO/UserManagerPage.robot
*** Variables ***
${SIGN_IN_USERNAME} =  name=username
${SIGN_IN_PASSWORD} =  id=password

#${Log_Out_New_User} =    xpath=//a[@href="/user/logout"]
#${Log_Out_New_User} =     xpayh=//i[@class="Large material-icons"]
${Log_Out_New_User} =     xpath=//div[@id="root"]/div/nav/div/span/a/i
${SUPERVISION} =      xpath=//*[@class='collapsible-header' and contains(text(),'Supervision')]
${STATICTIS} =    	  xpath=//a[contains(text(),'Statistic')]
${GRAPHICS} =         xpath=//a[contains(text(),'Graphics')]
${REPORT} =           xpath=//a[contains(text(),'Report')]
${Local_host}              xpath=//span[text()='LocalHost']
${LocalHost_dropdown}      xpath=/html/body/div[1]/section/header/nav/div/span[1]/div/input
*** Keywords ***


Navigate To
    go to  ${BASE_URL}
    Sleep       1s
    Set Window Size  2000  1150
    Maximize Browser Window



Enter Credentials
    [Arguments]  ${Credentials}
    Run Keyword If  '${Credentials[0]}' != '#BLANK'   Input Text   ${SIGN_IN_USERNAME}   ${Credentials[0]}
    Run Keyword If  '${Credentials[1]}' != '#BLANK'   Input Text   ${SIGN_IN_PASSWORD}   ${Credentials[1]}
    Sleep       3s

Enter Credentials With Number of max successsive tries failed is 3
    [Arguments]  ${Credentials}

    Run Keyword If  '${Credentials[0]}' != '#BLANK'   Input Text     ${SIGN_IN_USERNAME}   ${Credentials[0]}
    Run Keyword If  '${Credentials[4]}' != '#BLANK'   Input Text     ${SIGN_IN_PASSWORD}   ${Credentials[4]}
    Run Keyword If  '${Credentials[4]}' != '#BLANK'   Click Button   ${LOGIN_BUTTON} 
    Sleep       2s
    Run Keyword If  '${Credentials[4]}' != '#BLANK'            Page Should Contain     ${Credentials[12]}
    Click Element When Visible                                ${LOGOUT_BUTTON}

    Run Keyword If  '${Credentials[1]}' != '#BLANK'   Input Text     ${SIGN_IN_USERNAME}   ${Credentials[1]}
    Run Keyword If  '${Credentials[5]}' != '#BLANK'   Input Text     ${SIGN_IN_PASSWORD}   ${Credentials[5]}
    Run Keyword If  '${Credentials[5]}' != '#BLANK'   Click Button   ${LOGIN_BUTTON} 
    Sleep       2s
    Run Keyword If  '${Credentials[5]}' != '#BLANK'            Page Should Contain     ${Credentials[13]}
    Click Element When Visible                                ${LOGOUT_BUTTON}

    Run Keyword If  '${Credentials[2]}' != '#BLANK'   Input Text     ${SIGN_IN_USERNAME}   ${Credentials[2]}
    Run Keyword If  '${Credentials[6]}' != '#BLANK'   Input Text     ${SIGN_IN_PASSWORD}   ${Credentials[6]}
    Run Keyword If  '${Credentials[6]}' != '#BLANK'   Click Button   ${LOGIN_BUTTON} 
    Sleep       2s
    Run Keyword If  '${Credentials[6]}' != '#BLANK'             Page Should Contain     ${Credentials[14]}
    Click Element When Visible                                 ${LOGOUT_BUTTON}

    Run Keyword If  '${Credentials[3]}' != '#BLANK'   Input Text     ${SIGN_IN_USERNAME}   ${Credentials[3]}
    Run Keyword If  '${Credentials[7]}' != '#BLANK'   Input Text     ${SIGN_IN_PASSWORD}   ${Credentials[7]}
    Run Keyword If  '${Credentials[7]}' != '#BLANK'   Click Button   ${LOGIN_BUTTON} 
    Sleep       2s
    Run Keyword If  '${Credentials[7]}' != '#BLANK'             Page Should Contain     ${Credentials[15]}
    Click Element When Visible                                 ${LOGOUT_BUTTON}

    #Reset Password for user after login enter credentials with number of max successsive tries failed is 2
    Run Keyword If  '${Credentials[18]}' == 'Reset'                Edit User For Login Page   ${Credentials}

    #Remove User and create User, then login again
    Run Keyword If  '${Credentials[18]}' == 'Remove'               Remove User For Login Page   ${Credentials}

    #Wait for 3 minutes Blocking
    Run Keyword If  '${Credentials[16]}' != 'Blank' and '${Credentials[18]}' == 'Blocking'      Run Keywords   Sleep   180s    AND
    ...   Run Keyword If  '${Credentials[0]}' != '#BLANK'   Input Text   ${SIGN_IN_USERNAME}     ${Credentials[0]}   AND
    ...   Run Keyword If  '${Credentials[8]}' != '#BLANK'   Input Text   ${SIGN_IN_PASSWORD}     ${Credentials[8]}   AND
    ...   Click Button     ${LOGIN_BUTTON}    AND     Sleep       2s    AND   Page Should Contain     ${Credentials[16]}

    Run Keyword If  '${Credentials[18]}' == 'Period180s'      Run Keywords     Sleep   180s    AND   Wait to log in   ${Credentials}

Wait to log in
    [Arguments]  ${Credentials}
    Run Keyword If  '${Credentials[0]}' != '#BLANK'   Input Text   ${SIGN_IN_USERNAME}   ${Credentials[0]}
    Run Keyword If  '${Credentials[4]}' != '#BLANK'   Input Text   ${SIGN_IN_PASSWORD}   ${Credentials[4]}
    Run Keyword If  '${Credentials[4]}' != '#BLANK'                Click Button   ${LOGIN_BUTTON} 
    Sleep       2s
    Run Keyword If  '${Credentials[4]}' != '#BLANK'                Page Should Contain     ${Credentials[12]}
    Click Element When Visible                                ${LOGOUT_BUTTON}

    Run Keyword If  '${Credentials[0]}' != '#BLANK'   Input Text   ${SIGN_IN_USERNAME}   ${Credentials[0]}
    Run Keyword If  '${Credentials[4]}' != '#BLANK'   Input Text   ${SIGN_IN_PASSWORD}   ${Credentials[4]}
    Run Keyword If  '${Credentials[4]}' != '#BLANK'                Click Button   ${LOGIN_BUTTON} 
    Sleep       2s
    Run Keyword If  '${Credentials[4]}' != '#BLANK'                Page Should Contain     ${Credentials[13]}
    Click Element When Visible                                ${LOGOUT_BUTTON}

    Run Keyword If  '${Credentials[0]}' != '#BLANK'   Input Text   ${SIGN_IN_USERNAME}   ${Credentials[0]}
    Run Keyword If  '${Credentials[8]}' != '#BLANK'   Input Text   ${SIGN_IN_PASSWORD}   ${Credentials[8]}
    Run Keyword If  '${Credentials[8]}' != '#BLANK'                Click Button   ${LOGIN_BUTTON} 
    Sleep       2s
    Run Keyword If  '${Credentials[8]}' != '#BLANK'                Page Should Contain     ${Credentials[14]}
    Click Element When Visible                                 ${LOGOUT_BUTTON}

Edit User For Login Page
    [Arguments]  ${Credentials}
    Run Keyword If  '${Credentials[18]}' == 'Reset' and '${Credentials[15]}' == 'Number of maximum successive tries exceeded! Try again 3 minutes.' and '${Credentials[20]}' == '#BLANK'     
    ...    Sleep   180s
    Run Keyword If  '${Credentials[21]}' == 'admin' and '${Credentials[22]}' == 'Login with old password while blocked'     Sleep   180s
    Input Text   ${SIGN_IN_USERNAME}   ${Credentials[3]}
    Input Text   ${SIGN_IN_PASSWORD}   ${Credentials[7]}
    Click Button   ${LOGIN_BUTTON} 
    Sleep       2s

    #Run Keyword If  '${Credentials[19]}' == 'Statistic' or '${Credentials[19]}' == 'Normal User'     LoginPage.Log out
    Run Keyword If  '${Credentials[19]}' == 'Statistic' or '${Credentials[19]}' == 'Normal User'      Click Element When Visible         ${LOGOUT_BUTTON}
    Run Keyword If  '${Credentials[19]}' == 'Statistic' or '${Credentials[19]}' == 'Normal User'      Input Text   ${SIGN_IN_USERNAME}   admin
    Run Keyword If  '${Credentials[19]}' == 'Statistic' or '${Credentials[19]}' == 'Normal User'      Input Text   ${SIGN_IN_PASSWORD}   Cirpackwebadmin1234#
    Run Keyword If  '${Credentials[19]}' == 'Statistic' or '${Credentials[19]}' == 'Normal User'      Click Button   ${LOGIN_BUTTON} 
    Sleep       2s

#Attempt to Admin
    Click Element  ${Admin_tab}
    Sleep       1s
    Click Element  ${USER_MANAGER}
    Sleep       1s
    #Click Next page     ${Credentials[21]}
    #Run Keyword If  '${Credentials[21]}' == 'User9'      Click Element     ${Previous_page}
    #Sleep       3s
    # Click Edit Element With 2 Info   ${Credentials[3]}    ${Credentials[11]}
    # Sleep       3s
    
    ${arg} =  Create List   ${Credentials[3]}    ${Credentials[11]}
    Run Keyword N Times And Stop If Success  Click Edit Element With 2 Info    ${arg}    Click Element   ${Next_page}   6
    Sleep   3s

    Page Should Contain  Edit user  #Edit User
#Modify Credentials
    Wait Until Element Is Visible  xpath=//*[@id='content-container']/div[2]   #Add table
    Run Keyword If  '${Credentials[9]}' != '#BLANK'    Input Text      ${PASSWORD}          ${Credentials[9]}
    Run Keyword If  '${Credentials[10]}' != '#BLANK'   Input Text      ${CONFIRM_PASSWORD}  ${Credentials[10]}
    Run Keyword If  '${Credentials[11]}' != '#BLANK'   Click Element   ${Role_dropdown}
    Sleep       3s
    Run Keyword If       '${Credentials[11]}' == 'admin'                          Click Element      ${Role_Admin}
    ...         ELSE IF  '${Credentials[11]}' == 'graph user'                     Click Element      ${Role_Graph}
    ...         ELSE IF  '${Credentials[11]}' == 'define not supervision'         Click Element      ${Role_Define_Not_Supervision_Permission}
    ...         ELSE IF  '${Credentials[11]}' == 'define not cluster info'        Click Element      ${Role_Not_Cluster_Info_Permission}
    ...         ELSE IF  '${Credentials[11]}' == 'define not IBCF'                Click Element      ${Role_Define_Not_IBCF_Permission}
    ...         ELSE IF  '${Credentials[11]}' == 'define not PCSCF'                Click Element      ${Role_Define_Not_PCSCF_Permission}  

    Sleep       2s
    Click Element  ${SUBMIT_BUTTON}
    Sleep       2s
    Common.Log out
    Input Text  ${USERNAME}  ${Credentials[3]}
    Input Text  ${PASSWORD}  ${Credentials[9]}
    Click Button  ${LOGIN_BUTTON}
    Sleep       2s
    Page Should Contain     ${Credentials[16]}
    Sleep       2s
    Run Keyword If  '${Credentials[16]}' != 'Number of maximum successive tries exceeded! Try again 2 minutes.'      Common.Log out

Remove User For Login Page
    [Arguments]  ${Credentials}

    Input Text   ${SIGN_IN_USERNAME}   ${Credentials[3]}
    Input Text   ${SIGN_IN_PASSWORD}   ${Credentials[7]}
    Click Button   ${LOGIN_BUTTON} 
    Sleep       1s

    Click Element  ${Admin_tab}
    Sleep       1s
    Click Element  ${USER_MANAGER}
    Sleep       1s
    #Click Next page     ${Credentials[21]}
    #Run Keyword If  '${Credentials[18]}' == 'Remove'      Run Keywords      Click Element     ${Next_page}  AND  Click Element     ${Next_page}  AND  Click Element   ${Next_page}
    #Sleep       3s

    #Run Keyword If  '${Credentials[20]}' == 'Page 1' and '${Credentials[21]}' == 'User1'    Run Keywords     Click Element     ${Previous_page}
    #...     AND   Click Element     ${Previous_page}    AND   Click Element     ${Previous_page}

    #Run Keyword If  '${Credentials[20]}' == 'Page 1' and '${Credentials[21]}' == 'User9'    Run Keywords     Click Element     ${Previous_page}
    #...     AND   Click Element     ${Previous_page}    AND   Click Element     ${Previous_page}

    #Run Keyword If  '${Credentials[20]}' == 'Page 2' and '${Credentials[21]}' == 'User17'    Run Keywords     Click Element     ${Previous_page}
    #...     AND   Click Element     ${Previous_page}

    #Run Keyword If  '${Credentials[20]}' == 'Page 3' and '${Credentials[21]}' == 'User25'                     Click Element     ${Previous_page}

    #Delete User
    Click Delete Element With 2 Info    ${Credentials[0]}      ${Credentials[11]}
    Sleep       3s
    Page Should Contain  Warning : Do you want to remove
    Page Should Contain  ${Credentials[0]}
    Page Should Contain  ${Credentials[11]}
    Page Should Contain  Username
    Page Should Contain  Password
    Page Should Contain  Role
    Sleep  5s
    Click Element  ${DELETE}
    Sleep       3s
    Verify Page Not Contains 2 Expect Elements    ${Credentials[0]}  ${Credentials[11]}
    Sleep       3s

    Run Keyword If  '${Credentials[16]}' != '#BLANK' and '${Credentials[21]}' != '#BLANK'    Create User again    ${Credentials}
    #Log out Admin
    Common.Log out

    #Login again with new user
    Run Keyword If  '${Credentials[0]}' != '#BLANK'  Input Text  ${USERNAME}  ${Credentials[0]}
    Run Keyword If  '${Credentials[9]}' != '#BLANK'  Input Text  ${PASSWORD}  ${Credentials[9]}
    Click Element    ${LOGIN_BUTTON}

    #Verify Messages
    #Run Keyword If  '${Credentials[18]}' == 'Remove'      Run Keywords      Click Element     ${Next_page}  AND  Click Element     ${Next_page}  AND  Click Element   ${Next_page}
    Sleep       2s
    Run Keyword If  '${Credentials[20]}' != 'Login Page'   Run Keywords         Page Should Contain   ${Credentials[16]}    AND   Click Element      ${Log_Out_New_User}
    Run Keyword If  '${Credentials[20]}' == 'Login Page'   Run Keywords         Page Should Contain   ${Credentials[13]}    AND   Page Should Contain   ${Credentials[20]}

Create User again
    [Arguments]  ${Credentials}
    Click Element  ${ADD_BUTTON}
    Sleep       3s
    Page Should Contain  Admin
    #Enter Credentials
    Wait Until Element Is Visible  xpath=//*[@id='content-container']/div[2]   #Add table
    Run Keyword If  '${Credentials[0]}' != '#BLANK'  Input Text  ${USERNAME}  ${Credentials[0]}
    Run Keyword If  '${Credentials[9]}' != '#BLANK'  Input Text  ${PASSWORD}  ${Credentials[9]}
    Run Keyword If  '${Credentials[10]}' != '#BLANK'  Input Text  ${CONFIRM_PASSWORD}  ${Credentials[10]}

    Run Keyword If   '${Credentials[11]}' != '#BLANK'               Click Element      ${Role_dropdown}
    Sleep       3s
    Run Keyword If       '${Credentials[11]}' == 'graph user'                     Click Element      ${Role_Graph}      #${Role_Admin}
    ...         ELSE IF  '${Credentials[11]}' == 'define not supervision'         Click Element      ${Role_Define_Not_Supervision_Permission}
    ...         ELSE IF  '${Credentials[11]}' == 'define not cluster info'        Click Element      ${Role_Not_Cluster_Info_Permission}
    ...         ELSE IF  '${Credentials[11]}' == 'define not IBCF'                Click Element      ${Role_Define_Not_IBCF_Permission}
    ...         ELSE IF  '${Credentials[11]}' == 'define not PCSCF'                Click Element      ${Role_Define_Not_PCSCF_Permission}
        
    Sleep       3s
    Click Button  name=btn-submit
    Sleep  5s

    Verify Page Contains 2 Expected Elements    ${Credentials[0]}   ${Credentials[11]}

    #26384 login to change password after creating an normal User, Add Valid User confirmed Password should # it
    #Run Keyword If  '${Credentials[9]}' != '#BLANK'  Input Text  ${PASSWORD}  ${Credentials[9]}
    #Run Keyword If  '${Credentials[10]}' != '#BLANK'  Input Text  ${CONFIRM_PASSWORD}  ${Credentials[10]}
    #Click Button  name=btn-submit
    #Sleep       2s

Click Element When Visible
    [Arguments]    ${locator}
    ${Element State} =    Run Keyword And Return Status    Element Should Be Visible    ${locator}
    Run Keyword If    '${Element State}' == 'True'    Click Element    ${locator}

Enter Single Credentials
    [Arguments]  ${Credentials}
    Run Keyword If  '${Credentials[0][0]}' != '#BLANK'   Input Text   ${SIGN_IN_USERNAME}  ${Credentials[0][0]}
    Run Keyword If  '${Credentials[0][1]}' != '#BLANK'   Input Text   ${SIGN_IN_PASSWORD}  ${Credentials[0][1]}
    Sleep       1s

Click Submit
    Click Button  ${LOGIN_BUTTON}
    Sleep  2.5s


Verify Expected Message
    [Arguments]  ${ExpectedMessage}
    Title Should be  ${ExpectedMessage[12]}
    Page Should Contain  ${ExpectedMessage[13]}

Clear Input Fields
    Clear Element Text  ${SIGN_IN_USERNAME}
    Clear Element Text  ${SIGN_IN_PASSWORD}

Verify default statictis user
    [Arguments]  ${Credentials}
    Click Element        ${SUPERVISION}
    Sleep  0.5s
    Click Element        ${STATICTIS}
    Sleep  0.5s
    Click Element        ${GRAPHICS}
    Sleep       1s
    Page Should Contain Button  //button[contains(text(),'Proxy')]
    #
    Click Element        ${SUPERVISION}
    Sleep  0.5s
    Click Element        ${STATICTIS}
    Sleep  0.5s
    Click Element        ${REPORT}
    Sleep       1s
    Page Should Contain  Date
    # Change to remote host
    Click Element   ${LocalHost_dropdown}
    Sleep       2s
    Click Element   xpath=//span[contains(text(),'${Credentials[4]}')]
    Sleep       2s
    #
    Click Element        ${SUPERVISION}
    Sleep  0.5s
    Click Element        ${STATICTIS}
    Sleep  0.5s
    Click Element        ${GRAPHICS}
    Sleep       1s
    Page Should Contain Button  //button[contains(text(),'Proxy')]
    #
    Click Element        ${SUPERVISION}
    Sleep  0.5s
    Click Element        ${STATICTIS}
    Sleep  0.5s
    Click Element        ${REPORT}
    Sleep       1s
   Page Should Contain  Date
   # Back to localhost
    Click Element   xpath=//input[@value='${Credentials[4]}']
    Sleep       2s
    Click Element   ${LocalHost}
    Sleep       2s




Edit user by rice
    [Arguments]  ${Credentials}
    Click Edit Element With 2 Info   ${Credentials[4]}    ${Credentials[7]}
    Sleep  0.5s
    Page Should Contain  Edit user  #Edit User
    Wait Until Element Is Visible  xpath=//*[@id='content-container']/div[2]   #Add table
    Run Keyword If  """${Credentials[5]}""" != '#BLANK'  Input Text  ${PASSWORD}  ${Credentials[5]}
    Run Keyword If  """${Credentials[6]}""" != '#BLANK'  Input Text  ${CONFIRM_PASSWORD}  ${Credentials[6]}
    Sleep  0.5s
    Click Element  ${SUBMIT_BUTTON}
    Sleep  0.5s
