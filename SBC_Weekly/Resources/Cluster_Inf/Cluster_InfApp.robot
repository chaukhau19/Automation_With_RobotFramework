*** Settings ***
Resource  ./PO/Cluster_InfPage.robot
Resource  ../../Resources/Admin/LoginApp_SBC.robot
Resource  ../Common.robot

*** Keywords ***

Go to CLuster Information Page
    CLuster_InfPage.Navigate to Cluster Information Page

View Cluster
    [Arguments]  ${AdministrationScenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR  ${Info}  IN  @{AdministrationScenarios}
        TRY
           View Cluster Information function   ${Info}

        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

View Cluster Remote
    [Arguments]  ${AdministrationScenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    FOR  ${Info}  IN  @{AdministrationScenarios}
        TRY
        ${Cluster_Info} =   Cluster_InfPage.Get Log Cluster      ${HOST_CLUSTER}   ${Info}
        Verify Cluster Info   ${Cluster_Info}   ${Info}
        Run Keyword If  '${Info[1]}' == 'Inactive_Node1_Node2'     Run Keywords      Common.Open SSH Connection To Remote Server   ${HOST_CLUSTER}   ${USER_SIPP}    ${PASS_SIPP}
       ...   AND     Run Keyword And Continue On Failure      Cluster lab Node1 Active and Node2 Inactive
#           Run Keyword If  '${Info[0]}' != ''  should contain  ${Cluster_Info}  ${Info[0]}
#           Run Keyword If  '${Info[1]}' != ''  should contain  ${Cluster_Info}  ${Info[1]}

        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


#################################################################################################################################
#                                                           ---FUNCTION---                                                      #
#################################################################################################################################

View Cluster Information function
    [Arguments]   ${Credentials}
    Run Keyword If  '${Credentials[17]}' == '#Blank'     Run Keyword And Continue On Failure      Cluster_InfPage.Get Log Cluster For Web Cirpack   ${HOST_CIRPACK}    ${Credentials}
    Run Keyword If  '${Credentials[17]}' != '#Blank'     Run Keyword And Continue On Failure      Cluster_InfPage.Get Log Cluster For Web Cluster   ${HOST_CLUSTER}    ${Credentials}
    Run Keyword If  '${Credentials[17]}' == 'Remote host'  Run Keywords  Click Element  //input[@class='select-dropdown']  AND  Sleep       3s  AND  Click Element   ${Remote_host}  AND  Sleep  5s
    Run Keyword And Continue On Failure   Go to Cluster Information Page

    Run Keyword If  '${Credentials[16]}' == 'System Info'   Run Keywords   Click Element  ${System_Inf}   AND  Sleep  40s    AND   Run Keyword And Continue On Failure   Cluster_InfPage.View Cluster  ${Credentials}
    Run Keyword If  '${Credentials[16]}' == 'Network Info'  Run Keywords   Click Element  ${Network_Inf}  AND  Sleep  40s    AND   Run Keyword And Continue On Failure   Cluster_InfPage.View Cluster  ${Credentials}

    Run Keyword If  '${Credentials[16]}' == 'Node 1 Info' and '${Credentials[18]}' == '#Blank'    Run Keywords   Click Element  ${Node1_Inf}    AND  Sleep  20s  AND  Run Keyword And Continue On Failure   Cluster_InfPage.View Cluster  ${Credentials}
    Run Keyword If  '${Credentials[16]}' == 'Node 1 Info' and '${Credentials[18]}' != '#Blank'    Run Keywords   Click Element  ${Node1_Inf}    AND  Sleep  20s  AND  Page Should Contain    ${Credentials[18]}
    Run Keyword If  '${Credentials[16]}' == 'Node 2 Info' and '${Credentials[18]}' == '#Blank'    Run Keywords   Click Element  ${Node2_Inf}    AND  Sleep  20s  AND  Run Keyword And Continue On Failure   Cluster_InfPage.View Cluster  ${Credentials}
    Run Keyword If  '${Credentials[16]}' == 'Node 2 Info' and '${Credentials[18]}' != '#Blank'    Run Keywords   Click Element  ${Node2_Inf}    AND  Sleep  20s  AND  Page Should Contain    ${Credentials[18]}

    Run Keyword If  '${Credentials[16]}' == 'Node 2 Info' and '${Credentials[19]}' == 'Inactive_Node1_No_Node2'   
    ...    Run Keywords      Common.Open SSH Connection To Remote Server   ${HOST_CIRPACK}   ${USER_SIPP}    ${PASS_SIPP}
    ...   AND     Run Keyword And Continue On Failure      Cirpack Web Node1 Active and No Node2

    Run Keyword If  '${Credentials[17]}' == 'Remote host'  Run Keywords  Click Element  //input[@class='select-dropdown']  AND  Sleep       2s   AND  Click Element   ${Local_host}  AND  Sleep       2s

    Run Keyword If  '${Credentials[16]}' == 'Node 2 Info' and '${Credentials[19]}' == 'Inactive_Node1_Node2'      
    ...    Run Keywords      Common.Open SSH Connection To Remote Server   ${HOST_CLUSTER}   ${USER_SIPP}    ${PASS_SIPP}
    ...   AND     Run Keyword And Continue On Failure      Cluster lab Node1 Active and Node2 Inactive


Verify Cluster Info
    [Arguments]  ${Cluster_Info}   ${Info_Verify}
    FOR  ${i}  IN RANGE  2  17
        TRY
        Log  ${Info_Verify[${i}]}
        Log  ${Cluster_Info}
        Run Keyword If  '${Info_Verify[${i}]}' != '#Blank'   should contain   ${Cluster_Info}    ${Info_Verify[${i}]}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END
