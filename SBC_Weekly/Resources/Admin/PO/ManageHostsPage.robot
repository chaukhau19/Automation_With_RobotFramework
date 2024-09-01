*** Settings ***
Library  SeleniumLibrary
Resource  ../../Common.robot
*** Variables ***

##################---ELEMENT---#####################
${IP}  xpath=//input[@id='ip']
${Port}  xpath=//input[@id='port']
${Description}  xpath=//input[@id='description']

##################---BUTTON---@#####################

${USER_MANAGER}  xpath=//*[@class='first-menu' and text()='Manage User']
${SUBMIT_BUTTON}  xpath=//button[contains(text(),'Submit')]

${CANCEL_BUTTON}  xpath=//*[@class='button-cancel']
${ADD_BUTTON}  xpath=//*[@id='data-table']/tbody/tr[1]/th[5]/a/i     #Add button

${VIEW_BUTTON}  xpath=//tbody/tr[3]/td[5]/a[3]/i[1]
${DELETE_BUTTON}  xpath=//tbody/tr[3]/td[5]/a[5]/i[1]
${EDIT_BUTTON}  xpath=//tbody/tr[3]/td[5]/a[4]
${DELETE}  xpath=//*[@id='modal-confirm-delete']/div[2]/a[1]
${CANCEL_FROM_DELETE}  //*[@id='modal-confirm-delete']/div[2]/a[2]
${Manage_Hosts}  xpath=//a[contains(text(),'Manage Hosts')]

*** Keywords ***
Navigate to Manage Hosts Page
    Click Element  ${Admin_tab}
    Sleep       2s
    Click Element  ${Manage_Hosts}
    Sleep       2s

Click Cancel button
    Click Element  ${CANCEL_BUTTON}
    Page Should Contain  Username
    Page Should Contain  Password
    #Page Should Contain  Language
    Page Should Contain  Role
    Sleep       3s

###############################################################--ADD_USER_MANAGER############################################################
Create Hosts
    [Arguments]  ${Credentials}
    Click Element  ${ADD_BUTTON}
    Sleep  4s
    Page Should Contain  LocalHost
    #Enter Credentials
    Run Keyword If  '${Credentials[4]}' != '#BLANK'  Input Text  ${IP}  ${Credentials[4]}
    Run Keyword If  '${Credentials[5]}' != '#BLANK'  Input Text  ${Port}  ${Credentials[5]}
    Run Keyword If  '${Credentials[6]}' != '#BLANK'  Input Text  ${Description}  ${Credentials[6]}


    Click Button  //button[contains(text(),'Submit')]
    Sleep  5s
    #Verify Messages
    Page Should Contain  ${Credentials[4]}
    Page Should Contain  ${Credentials[5]}

Change Hosts
    [Arguments]  ${Credentials}
    Click Element    //td[contains(.,"Web235")]//following-sibling::td/a[@data-tooltip="Edit"]
    #Click Element  //*[@id="data-table"]/tbody/tr[3]/td[5]/a[5]
    #Click Element  (//td[@class='last']/a[@data-tooltip='Edit']//following::i[text()='edit'])[2]
    Sleep  4s
    #Enter Credentials
    Run Keyword If  '${Credentials[7]}' != '#BLANK'  Input Text  ${Port}  ${Credentials[7]}
    Run Keyword If  '${Credentials[8]}' != '#BLANK'  Input Text  ${Description}  ${Credentials[8]}

    Click Button  //button[contains(text(),'Submit')]
    Sleep  5s
    #Verify Messages
    Page Should Contain  ${Credentials[7]}
    Page Should Contain  ${Credentials[8]}


##############################################################--VIEW_USER_MANAGER--############################################################
View Hosts
    [Arguments]  ${Credentials}
    #Click Element   //td[contains(.,"Web122")]//following-sibling::td/a[@data-tooltip="View"]
    Click Element   //td[contains(.,"Web235edited")]//following-sibling::td/a[@data-tooltip="View"]
    #Click Element  //*[@id="data-table"]/tbody/tr[3]/td[5]/a[4]
    Page Should Contain  ${Credentials[4]}
    Page Should Contain  ${Credentials[5]}
    Page Should Contain  ${Credentials[8]}
    Sleep       3s
    #Wait Until Element Is Visible  xpath=//option[contains(text(),'*')]
Remove Hosts
    [Arguments]  ${Credentials}

    #Click Element  //*[@id="data-table"]/tbody/tr[3]/td[5]/a[6]
    Click Element   //td[contains(.,"Web235")]//following-sibling::td/a[@data-tooltip="Delete"]
    Sleep       3s
    Page Should Contain  Warning : Do you want to remove
    Page Should Contain  ${Credentials[4]}
    Click Element  ${DELETE}
    Sleep       3s
    Page Should Not Contain  ${Credentials[4]}
    Sleep       3s




