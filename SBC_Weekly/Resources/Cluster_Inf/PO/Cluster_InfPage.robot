*** Settings ***
Library  SeleniumLibrary
Resource  ../../Common.robot

*** Variables ***

##################---ELEMENT---#####################
${IP}  xpath=//input[@id='ip']
${Port}  xpath=//input[@id='port']
${Description}  xpath=//input[@id='description']

##################---BUTTON---@#####################


${SUBMIT_BUTTON}  xpath=//button[contains(text(),'Submit')]

${CANCEL_BUTTON}  xpath=//*[@class='button-cancel']
${ADD_BUTTON}  xpath=//*[@id='data-table']/tbody/tr[1]/th[5]/a/i     #Add button

${VIEW_BUTTON}  xpath=//tbody/tr[3]/td[5]/a[3]/i[1]
${DELETE_BUTTON}  xpath=//tbody/tr[3]/td[5]/a[5]/i[1]
${EDIT_BUTTON}  xpath=//tbody/tr[3]/td[5]/a[4]
${DELETE}  xpath=//*[@id='modal-confirm-delete']/div[2]/a[1]
${CANCEL_FROM_DELETE}  //*[@id='modal-confirm-delete']/div[2]/a[2]
${System_Inf}  xpath=//a[contains(text(),'System Inf')]
${Network_Inf}  xpath=//a[contains(text(),'Network Inf')]
${Node1_Inf}  xpath=//a[contains(text(),'Node 1 Inf')]
${Node2_Inf}  xpath=//a[contains(text(),'Node 2 Inf')]
#${Remote_host}  xpath=//span[text()='Cluster lab']
${Remote_host}  xpath=//span[text()='RemoteHost:192.168.33.123']
${Remote_host1}  xpath=//span[text()='Web122edited']
${Local_host}   xpath=//span[text()='LocalHost']

*** Keywords ***
Navigate to Cluster Information Page
    Click Element  ${Cluster_Inf_tab}
    Sleep       1s

View Cluster
    [Arguments]  ${Credentials}
    Page Should Contain  ${Credentials[4]}
    Page Should Contain  ${Credentials[5]}
    Page Should Contain  ${Credentials[6]}
    Page Should Contain  ${Credentials[7]}
    Page Should Contain  ${Credentials[8]}
    Page Should Contain  ${Credentials[9]}
    Page Should Contain  ${Credentials[10]}
    Page Should Contain  ${Credentials[11]}
    Page Should Contain  ${Credentials[12]}
    Page Should Contain  ${Credentials[13]}
    Run Keyword If  '${Credentials[16]}' != 'Network Info'     Page Should Contain  ${Credentials[14]}
    Run Keyword If  '${Credentials[16]}' != 'Network Info'     Page Should Contain  ${Credentials[15]}
    Run Keyword If  '${Credentials[16]}' == 'System Info'   Page Should Contain Element   //span[contains(text(),'Installed (Running)')]
    Run Keyword If  '${Credentials[16]}' == 'Network Info'   Run Keywords   Page Should Contain Element   ${Credentials[14]}   AND   Page Should Contain Element   ${Credentials[15]}
    ...   AND   Page Should Contain Element  //span[contains(text(),'NTP Clock synchronised:')]   AND   Page Should Contain Element   //span[contains(text(),'reachable')]
    Sleep       3s

Get Log Cluster
    [Arguments]   ${HOST}  ${Credentials}
    Common.Open SSH Connection To Remote Server  ${HOST}   ${USER_SIPP}    ${PASS_SIPP}

    Run Keyword If  '${Credentials[1]}' == 'Active_Node1_Standby_Node2'       Run Keyword And Continue On Failure     Cluster lab Node1 Active and Node2 Standby
    Run Keyword If  '${Credentials[1]}' == 'Active_Node2_Standby_Node1'       Run Keyword And Continue On Failure     Cluster lab Node1 Standby and Node2 Active
    Run Keyword If  '${Credentials[1]}' == 'InactiveNode2'                    Run Keyword And Continue On Failure     Cluster lab Node1 Active and Node2 Inactive
    Run Keyword If  '${Credentials[1]}' == 'InactiveNode1'                    Run Keyword And Continue On Failure     Cluster lab Node1 Inactive and Node2 Active
    Run Keyword If  '${Credentials[1]}' == 'Inactive_Node1_Node2'             Run Keyword And Continue On Failure     Cluster lab Node1 Inactive and Node2 Inactive

    ${output}=  Execute Command     su -l root -c "cpk_cluster_info"
    #Execute Command     Sleep   30s
    Sleep    30s
    Log     ${output}
    Close All Connections
    RETURN  ${output}

Get Log Cluster For Web Cluster
    [Arguments]   ${HOST}  ${Credentials}
    Common.Open SSH Connection To Remote Server  ${HOST}   ${USER_SIPP}    ${PASS_SIPP}

    Run Keyword If  '${Credentials[19]}' == 'Active_Node1_Standby_Node2'       Run Keyword And Continue On Failure     Cluster lab Node1 Active and Node2 Standby
    Run Keyword If  '${Credentials[19]}' == 'Active_Node2_Standby_Node1'       Run Keyword And Continue On Failure     Cluster lab Node1 Standby and Node2 Active
    Run Keyword If  '${Credentials[19]}' == 'InactiveNode2'                    Run Keyword And Continue On Failure     Cluster lab Node1 Active and Node2 Inactive
    Run Keyword If  '${Credentials[19]}' == 'InactiveNode1'                    Run Keyword And Continue On Failure     Cluster lab Node1 Inactive and Node2 Active
    Run Keyword If  '${Credentials[19]}' == 'Inactive_Node1_Node2'             Run Keyword And Continue On Failure     Cluster lab Node1 Inactive and Node2 Inactive

    ${output}=  Execute Command     su -l root -c "cpk_cluster_info"
    #Execute Command     Sleep   30s
    Sleep    30s
    Log     ${output}
    Close All Connections

Get Log Cluster For Web Cirpack
    [Arguments]   ${HOST}  ${Credentials}
    Common.Open SSH Connection To Remote Server  ${HOST}   ${USER_SIPP}    ${PASS_SIPP}

    Run Keyword If  '${Credentials[19]}' == 'Active_Node1_No_Node2'            Run Keyword And Continue On Failure     Cirpack Web Node1 Active and No Node2
    Run Keyword If  '${Credentials[19]}' == 'Inactive_Node1_No_Node2'          Run Keyword And Continue On Failure     Cirpack Web Node1 Inactive and No Node2

    ${output}=  Execute Command     su -l root -c "cpk_cluster_info"
    #Execute Command    Sleep   30s
    Log     ${output}
    Close All Connections