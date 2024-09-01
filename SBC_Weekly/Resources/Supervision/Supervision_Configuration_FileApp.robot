*** Settings ***
Resource  ./PO/Supervision_Configuration_FilePage.robot
Resource  ../../Resources/Admin/LoginApp_SBC.robot
Resource  ../Common.robot

*** Keywords ***

Go to Configuration file section in Supervision Page
    Supervision_Configuration_FilePage.Navigate to Configuration file section in Supervision Page

Reload Proxy 
    [Arguments]  ${AdministrationScenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    Go to Configuration file section in Supervision Page
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR  ${Info}  IN  @{AdministrationScenarios}
        TRY
                    Reload configuration File function  ${Info}
                    ${Log_Reload} =   Supervision_Configuration_FilePage.Get Log Reload      ${HOST_CIRPACK}   ${Info}
                    Verify Log Reload   ${Log_Reload}   ${Info[5]}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Verify Log Reload
    [Arguments]  ${Log_Reload}   ${Info_Verify}
       Log  ${Info_Verify}
       Log  ${Log_Reload}
       Run Keyword If  '${Info_Verify}' != '#Blank'   should contain   ${Log_Reload}    ${Info_Verify}



Upload Valid Configuration file
    [Arguments]  ${AdministrationScenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    Go to Configuration file section in Supervision Page
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    
    FOR  ${Info}  IN  @{AdministrationScenarios}
        TRY
               Upload Valid configuration File function  ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Upload Invalid Configuration file
    [Arguments]  ${AdministrationScenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    Go to Configuration file section in Supervision Page
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR  ${Info}  IN  @{AdministrationScenarios}
        TRY
                    Upload Invalid configuration File function  ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Upload Configuration file and then Download the file
    [Arguments]  ${AdministrationScenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    Go to Configuration file section in Supervision Page
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR  ${Info}  IN  @{AdministrationScenarios}
        TRY
            Upload Configuration file and then Download the file function  ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END



#################################################################################################################################
#                                                           ---FUNCTION---                                                      #
#################################################################################################################################


Reload configuration File function
    [Arguments]   ${Info}
    Run Keyword And Continue On Failure     Supervision_Configuration_FilePage.Reload configuration    ${Info[4]}


Upload Valid configuration File function
    [Arguments]   ${Info}
    Run Keyword And Continue On Failure     Supervision_Configuration_FilePage.Upload Valid Configuration    ${Info[4]}  ${Info[5]}  ${Info[6]}  ${Info[7]}
    Verify Page Contains Content Of Configuration File     ${Info[5]}    ${Info[8]}
    Select Again the Dropdown To Confirm It Is Correct     ${Info[4]}
    Verify Page Contains Content Of Configuration File     ${Info[5]}    ${Info[8]}
    #Verify Page Not Contains Content Of Configuration File    ${Info[4]}   ${Info[5]}   ${Info[7]}

Upload Invalid configuration File function
    [Arguments]   ${Info}
    Run Keyword And Continue On Failure     Supervision_Configuration_FilePage.Upload Invalid Configuration    ${Info[4]}  ${Info[5]}  ${Info[6]}  ${Info[7]}
    #Verify Page Contains Content Of Configuration File     ${Info[5]}    ${Info[7]}
    Verify Page Not Contains Content Of Configuration File    ${Info[4]}   ${Info[5]}  ${Info[6]}   ${Info[8]}
    Select Again the Dropdown To Confirm It Is Correct     ${Info[4]}
    Verify Page Contains Error Message   ${Info[9]}

Upload Configuration file and then Download the file function
    [Arguments]   ${Info}
    Run Keyword And Continue On Failure     Supervision_Configuration_FilePage.Upload and Download Configuration    ${Info[4]}  ${Info[5]}  ${Info[6]}  ${Info[7]}
    Verify Download Successfully    ${Info[4]}  ${Info[5]}  ${Info[6]}  ${Info[8]}