*** Settings ***
Library  SeleniumLibrary
Resource  ../../Common.robot




*** Variables ***
${PERMISSION_BUTTON}  xpath=//*[@class='first-menu' and contains(text(),'Permissions')]   #Permission button
##########EDIT_PAGE##########
${EDIT}  xpath=.//*[@id='content-container']/div[2]/form/table/tbody/tr[1]/th[3]/a/i
${SAVE_EDIT}  xpath=.//*[@class='btn waves-effect waves-light btn-large' and contains(text(), 'Save')]
${DELETE_R}  xpath=.//*[@class='btn waves-effect waves-light btn-large red darken-1' and contains(text(), 'Delete')]
${CANCEL_EDIT_PERMISSION}  xpath=.//*[@class='btn waves-effect waves-light btn-large grey lighten-2' and contains(text(),'Cancel')]

#########ADD_PAGE############
${NAME_ROLE}   id=name
${DESCRIPTION}   id=description

${TABLE}  xpath=//*[@id='content-container']/div[2]/form      #table
${NEW_ROLE_BUTTON}  xpath=//i[@class='material-icons add-i']   #New role button
# ${NEW_ROLE_BUTTON}  xpath=//a[contains(text(),'New Role')]   #New role button
${CANCEL_BUTTON}  xpath=.//*[@class='button-cancel' and contains(text(),'Cancel')]  #Cancel
${SAVE}  xpath=.//*[@id='content-container']/div[2]/form/button
${Check/Uncheck ALL}  xpath=.//span[@class='waves-effect waves-light btn btn-custom green darken-3']
${SUBMIT}  xpath=//button[@type='submit']   #Submit

${ADD_ROLE}  xpath=.//*[@id='content-container']/div[2]/form/table/tbody/tr[2]/td[3]/p/label
${EDIT_ROLE}  xpath=.//*[@id='content-container']/div[2]/form/table/tbody/tr[3]/td[3]/p/label
${LIST_PERMISSION}  xpath=.//*[@id='content-container']/div[2]/form/table/tbody/tr[4]/td[3]/p/label
${EDIT_PERMISSION}  xpath=.//*[@id='content-container']/div[2]/form/table/tbody/tr[5]/td[3]/p/label
${DELETE_ROLE}  xpath=.//*[@id='content-container']/div[2]/form/table/tbody/tr[6]/td[3]/p/label
${ACCESS_ADMIN_PAGE}  xpath=.//*[@id='content-container']/div[2]/form/table/tbody/tr[7]/td[3]/p/label

${ADD_ROLE_CHECKBOX}  xpath=//*[@id='content-container']/div[2]/form/table/tbody/tr[2]/td[3]/p/label
${EDIT_ROLE_CHECKBOX}  xpath=//*[@id='content-container']/div[2]/form/table/tbody/tr[3]/td[3]/p/label
${LIST_PERMISSION_CHECKBOX}  xpath=//*[@id='content-container']/div[2]/form/table/tbody/tr[4]/td[3]/p/label
${EDIT_PERMISSION_CHECKBOX}  xpath=//*[@id='content-container']/div[2]/form/table/tbody/tr[5]/td[3]/p/label
${DELETE_ROLE_CHECKBOX}  xpath=//*[@id='content-container']/div[2]/form/table/tbody/tr[6]/td[3]/p/label
${ACCESS_ADMIN_PAGE_CHECKBOX}  xpath=//*[@id='content-container']/div[2]/form/table/tbody/tr[7]/td[3]/p/label

${ADD_ROLE_CHECKBOX_check}  //*[@id='content-container']/div[2]/form/table/tbody/tr[2]/td[3]/p/label
${USER_MANAGER}  xpath=//*[@class='first-menu' and text()='Manage User']

#########PERMISSION_BUTTON############
${BGCF_ACCESS_CHECKBOX}  			xpath=//label[@for='bgcf']
${BGCF_PEER_ACCESS_CHECKBOX}  	    xpath=//label[@for='bgcf_Peer']
${BGCF_TPIP_ACCESS_CHECKBOX}  	    xpath=//input[@id='bgcf_tpip.list-access']
${BGCF_TPIP_ADD_CHECKBOX}  		    xpath=//input[@id='bgcf_tpip.list-add']
${BGCF_TPIP_VIEW_CHECKBOX}  		xpath=//input[@id='bgcf_tpip.list-view']
${BGCF_IBCF_ACCESS_CHECKBOX}  	    xpath=//input[@id='bgcf_ibcf.list-access']
${BGCF_IBCF_ADD_CHECKBOX}  		    xpath=//input[@id='bgcf_ibcf.list-add']
${BGCF_IBCF_VIEW_CHECKBOX}  		xpath=//input[@id='bgcf_ibcf.list-view']
${BGCF_IBCF_EDIT_CHECKBOX}  		xpath=//input[@id='bgcf_ibcf.list-edit']
${BGCF_IBCF_DELETE_CHECKBOX}  	    xpath=//input[@id='bgcf_ibcf.list-delete']

${ADMIN_PERMISSION_ACCESS_CHECKBOX}  	    xpath=//input[@id='permissions.list-access']
${ADMIN_PERMISSION_ADD_CHECKBOX}  		    xpath=//input[@id='permissions.list-add']
${ADMIN_PERMISSION_VIEW_CHECKBOX}  			xpath=//input[@id='permissions.list-view']
${ADMIN_PERMISSION_EDIT_CHECKBOX}  			xpath=//input[@id='permissions.list-edit']
${ADMIN_PERMISSION_DELETE_CHECKBOX}  	    xpath=//input[@id='permissions.list-delete']

${ADMIN_MANAGE_HOSTS_ACCESS_CHECKBOX}  	    	xpath=//input[@id='manage_hosts.list-access']
${ADMIN_MANAGE_HOSTS_ADD_CHECKBOX}  		    xpath=//input[@id='manage_hosts.list-add']
${ADMIN_MANAGE_HOSTS_VIEW_CHECKBOX}  			xpath=//input[@id='manage_hosts.list-view']
${ADMIN_MANAGE_HOSTS_EDIT_CHECKBOX}  			xpath=//input[@id='manage_hosts.list-edit']
${ADMIN_MANAGE_HOSTS_DELETE_CHECKBOX}  	    	xpath=//input[@id='manage_hosts.list-delete']
#xpath=//label[@for='manage_hosts.list-view']
${ADMIN_ACCESS_CHECKBOX}  	    	                xpath=//label[@for='Admin']
${ADMIN_ACCESS_CHECKBOX_PROXY}                      xpath=//label[@for='conf_proxy.list-access']
${ADMIN_ACCESS_CHECKBOX_USER_PREFERENCE}            xpath=//label[@for='user.user_preference-access']
${ADMIN_ACCESS_CHECKBOX_MANAGE_USER}                xpath=//label[@for='user.list-access']
${ADMIN_ACCESS_CHECKBOX_PERMISSIONS}                xpath=//label[@for='permissions.list-access']
${ADMIN_ACCESS_CHECKBOX_PASSWORD_POLICY}            xpath=//label[@for='password_policy.list-access']
${SUPERVISION_ACCESS_CHECKBOX}  	    	        xpath=//label[@for='supervision']
${CLUSTER_INFO_ACCESS_CHECKBOX}  	    	        xpath=//label[@for='cluster_infor']
${IBCF_ACCESS_CHECKBOX}  	    	                xpath=//label[@for='ibcf']
${PCSCF_ACCESS_CHECKBOX}  	    	                xpath=//label[@for='pcscf']
${ADMIN_MANAGE_HOSTS_ACCESS_CHECKBOX1}  	    	xpath=//label[@for='manage_hosts.list-access']
${ADMIN_MANAGE_HOSTS_VIEW_CHECKBOX1}  			    xpath=//label[@for='manage_hosts.list-view']
*** Keywords ***

Navigate to Permission Page
    Click Element  ${Admin_tab}
    Sleep       1s
    Click Element  ${PERMISSION_BUTTON}
    Sleep       1s

Create Role
    [Arguments]  ${Credentials}
    Click Element  ${NEW_ROLE_BUTTON}
    Run Keyword If  '${Credentials[4]}' != '#BLANK'  Input Text  ${NAME_ROLE}  ${Credentials[4]}
    Run Keyword If  '${Credentials[5]}' != '#BLANK'  Input Text  ${DESCRIPTION}  ${Credentials[5]}
    Sleep       2s
    Click Element  ${Check/Uncheck ALL}
    Sleep       3s
    #Scroll Element Into View     ${ADMIN_ACCESS_CHECKBOX}
    #Click Element   ${ADMIN_ACCESS_CHECKBOX}
    Run Keyword If  '${Credentials[4]}' == 'define not supervision'         Run Keywords    Set Focus To Element    ${SUPERVISION_ACCESS_CHECKBOX}
    ...   AND     Click Element    ${SUPERVISION_ACCESS_CHECKBOX}
    ...   AND   Set Focus To Element   ${ADMIN_ACCESS_CHECKBOX}   
    ...   AND   Click Element   ${ADMIN_ACCESS_CHECKBOX}    
    ...   AND    Sleep       2s      AND    Click Element  ${SUBMIT}

    Run Keyword If  '${Credentials[4]}' == 'define not cluster info'        Run Keywords    Scroll Element Into View     ${CLUSTER_INFO_ACCESS_CHECKBOX}    AND     Click Element   ${CLUSTER_INFO_ACCESS_CHECKBOX}
    ...   AND   Scroll Element Into View   ${ADMIN_ACCESS_CHECKBOX_MANAGE_USER}             AND   Click Element    ${ADMIN_ACCESS_CHECKBOX_MANAGE_USER}
    ...   AND   Scroll Element Into View   ${ADMIN_ACCESS_CHECKBOX_PERMISSIONS}             AND   Click Element    ${ADMIN_ACCESS_CHECKBOX_PERMISSIONS}
    ...   AND   Scroll Element Into View   ${ADMIN_ACCESS_CHECKBOX_PASSWORD_POLICY}         AND   Click Element    ${ADMIN_ACCESS_CHECKBOX_PASSWORD_POLICY}       
     ...   AND    Sleep       2s      AND    Click Element  ${SUBMIT}

    Run Keyword If  '${Credentials[4]}' == 'define not PCSCF'        Run Keywords    Scroll Element Into View     ${PCSCF_ACCESS_CHECKBOX}    AND     Click Element   ${PCSCF_ACCESS_CHECKBOX}
    ...   AND   Scroll Element Into View   ${ADMIN_ACCESS_CHECKBOX_MANAGE_USER}             AND   Click Element    ${ADMIN_ACCESS_CHECKBOX_MANAGE_USER}
    ...   AND   Scroll Element Into View   ${ADMIN_ACCESS_CHECKBOX_PERMISSIONS}             AND   Click Element    ${ADMIN_ACCESS_CHECKBOX_PERMISSIONS}
    ...   AND   Scroll Element Into View   ${ADMIN_ACCESS_CHECKBOX_PASSWORD_POLICY}         AND   Click Element    ${ADMIN_ACCESS_CHECKBOX_PASSWORD_POLICY}       
     ...   AND    Sleep       2s      AND    Click Element  ${SUBMIT}
      
    Run Keyword If  '${Credentials[4]}' == 'define not IBCF'               Run Keywords   Scroll Element Into View      ${IBCF_ACCESS_CHECKBOX}              AND   Click Element   ${IBCF_ACCESS_CHECKBOX}
    ...   AND   Scroll Element Into View   ${ADMIN_ACCESS_CHECKBOX_MANAGE_USER}             AND   Click Element    ${ADMIN_ACCESS_CHECKBOX_MANAGE_USER}
    ...   AND   Scroll Element Into View   ${ADMIN_ACCESS_CHECKBOX_PERMISSIONS}             AND   Click Element    ${ADMIN_ACCESS_CHECKBOX_PERMISSIONS}
    ...   AND   Scroll Element Into View   ${ADMIN_ACCESS_CHECKBOX_PASSWORD_POLICY}         AND   Click Element    ${ADMIN_ACCESS_CHECKBOX_PASSWORD_POLICY}
    ...   AND    Sleep       2s      AND    Click Element  ${SUBMIT}
   # Click Element  ${SUBMIT}
    # Sleep       2s


Create Role With View Permission Only
    [Arguments]  ${Credentials}
    Click Element  ${NEW_ROLE_BUTTON}
    Run Keyword If  '${Credentials[4]}' != '#BLANK'  Input Text  ${NAME_ROLE}  ${Credentials[7]}
    Run Keyword If  '${Credentials[5]}' != '#BLANK'  Input Text  ${DESCRIPTION}  ${Credentials[8]}
    Sleep       1s
    Click Element  ${ADMIN_ACCESS_CHECKBOX}
    Sleep       1s
    Click Element  ${ADMIN_MANAGE_HOSTS_ACCESS_CHECKBOX1}
    Sleep       1s
    Click Element  ${ADMIN_MANAGE_HOSTS_VIEW_CHECKBOX1}
    Sleep       1s
    Click Element  ${SUBMIT}
    #Sleep       1s
    #Click Element  ${USER_MANAGER}

Create Role without BGCF Peer permission
    [Arguments]  ${Credentials}
    Click Element  ${NEW_ROLE_BUTTON}
    Run Keyword If  '${Credentials[4]}' != '#BLANK'  Input Text  ${NAME_ROLE}  ${Credentials[4]}
    Run Keyword If  '${Credentials[5]}' != '#BLANK'  Input Text  ${DESCRIPTION}  ${Credentials[5]}
    Sleep       1s
    Click Element  ${Check/Uncheck ALL}
    Sleep       1s
    Scroll Element Into View    ${BGCF_PEER_ACCESS_CHECKBOX}
    Sleep       1s
    Click Element  ${BGCF_PEER_ACCESS_CHECKBOX}
    Sleep       1s
    Click Element  ${SUBMIT}
    Sleep       3s
    Page Should Contain  ${Credentials[4]}

    Click Edit Element With 1 Info      ${Credentials[4]}
    Sleep       1s
    Scroll Element Into View    ${BGCF_PEER_ACCESS_CHECKBOX}
    Sleep       1s
    Checkbox Should Be Selected     ${BGCF_TPIP_ACCESS_CHECKBOX}
    Checkbox Should Be Selected     ${BGCF_TPIP_ADD_CHECKBOX}
    Checkbox Should Be Selected     ${BGCF_TPIP_VIEW_CHECKBOX}
    Checkbox Should Be Selected     ${BGCF_IBCF_ACCESS_CHECKBOX}
    Checkbox Should Be Selected     ${BGCF_IBCF_ADD_CHECKBOX}
    Checkbox Should Be Selected     ${BGCF_IBCF_VIEW_CHECKBOX}
    Checkbox Should Be Selected     ${BGCF_IBCF_EDIT_CHECKBOX}
    Checkbox Should Be Selected     ${BGCF_IBCF_DELETE_CHECKBOX}
    #Click Element  ${PERMISSION_BUTTON}
   # Sleep       1s

Create Role without BGCF permission
    [Arguments]  ${Credentials}
    Click Element  ${NEW_ROLE_BUTTON}
    Run Keyword If  '${Credentials[4]}' != '#BLANK'  Input Text  ${NAME_ROLE}  ${Credentials[4]}
    Run Keyword If  '${Credentials[5]}' != '#BLANK'  Input Text  ${DESCRIPTION}  ${Credentials[5]}
    Sleep       1s
    Click Element  ${Check/Uncheck ALL}
    Sleep       1s
    Scroll Element Into View    ${BGCF_ACCESS_CHECKBOX}
    Sleep       1s
    Click Element  ${BGCF_ACCESS_CHECKBOX}
    Sleep       1s
    Click Element  ${SUBMIT}
    Sleep       3s
    Page Should Contain  ${Credentials[4]}

    Click Edit Element With 1 Info      ${Credentials[4]}
    Sleep       1s
    Scroll Element Into View    ${BGCF_ACCESS_CHECKBOX}
    Sleep       1s
    Click Element  ${BGCF_ACCESS_CHECKBOX}
    Sleep       1s
    Checkbox Should Be Selected     ${ADMIN_PERMISSION_ACCESS_CHECKBOX}
    Checkbox Should Be Selected     ${ADMIN_PERMISSION_ADD_CHECKBOX}  	
    Checkbox Should Be Selected     ${ADMIN_PERMISSION_VIEW_CHECKBOX}  
    Checkbox Should Be Selected     ${ADMIN_PERMISSION_EDIT_CHECKBOX}  
    Checkbox Should Be Selected     ${ADMIN_PERMISSION_DELETE_CHECKBOX}
    Checkbox Should Be Selected     ${ADMIN_MANAGE_HOSTS_ACCESS_CHECKBOX} 
    Checkbox Should Be Selected     ${ADMIN_MANAGE_HOSTS_ADD_CHECKBOX}  	
    Checkbox Should Be Selected     ${ADMIN_MANAGE_HOSTS_VIEW_CHECKBOX}  
    Checkbox Should Be Selected     ${ADMIN_MANAGE_HOSTS_EDIT_CHECKBOX}  
    Checkbox Should Be Selected    	${ADMIN_MANAGE_HOSTS_DELETE_CHECKBOX}
    #Click Element  ${PERMISSION_BUTTON}
    #Sleep       1s



Modify Role
    [Arguments]  ${Decription}  ${New_Decription}   ${Name}
    Click Edit Element With 1 Info      ${Name}
    Run Keyword If  '${Decription}' != '#BLANK'  Input Text  ${DESCRIPTION}  ${New_Decription}
    Click Element  ${Check/Uncheck ALL}
    Sleep       1s
    Click Element  ${SUBMIT}
    Sleep       3s
    Page Should Contain  ${New_Decription}

View Role funcion
    [Arguments]  ${Name}
    Click View Element With 1 Info          ${Name}
    Sleep       3s
    Page Should Contain   Permissions


Back to previous page
    [Arguments]  ${Credentials}
    Click Element  ${EDIT}
    Click Element  ${CANCEL_EDIT_PERMISSION}
    Page Should Contain  ${Credentials[6]}
