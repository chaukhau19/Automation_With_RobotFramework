*** Settings ***
Resource  ../../Resources/Admin/LoginApp_SBC.robot
Resource  ./PO/IBCF_BGCFPage.robot
Resource  ../Admin/PO/UserManagerPage.robot
Resource  ../Common.robot
Resource    ../Supervision/PO/Supervision_Configuration_FilePage.robot

*** Keywords ***


Add
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_BGCFPage.Go to IBCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[12]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               Go to BGCF section in IBCF tab
               Add BGCF function        ${Info}
 
             IF    """${Info[12]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[12]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Add Invalid 
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_BGCFPage.Go to IBCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[11]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               Go to BGCF section in IBCF tab
               Verify error message BGCF invalid case      ${Info}
 
             IF    """${Info[11]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[11]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


View
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_BGCFPage.Go to IBCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[15]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               Go to BGCF section in IBCF tab
               View BGCF function        ${Info}
 
             IF    """${Info[15]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[15]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Sort
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_BGCFPage.Go to IBCF tab
    Go to BGCF section in IBCF tab
    Sort Element     IP
    Page Should Not Contain  Internal Server Error


Filter
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_BGCFPage.Go to IBCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[15]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               Go to BGCF section in IBCF tab
               Filter BGCF function        ${Info}
 
             IF    """${Info[15]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[15]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Filter special characters
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_BGCFPage.Go to IBCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[10]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               Go to BGCF section in IBCF tab
               Filter special characters BGCF function        ${Info}
 
             IF    """${Info[10]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[10]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END



Edit Invalid 
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_BGCFPage.Go to IBCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[12]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               Go to BGCF section in IBCF tab
               Verify error message BGCF edit invalid case        ${Info}
 
             IF    """${Info[12]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[12]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Edit
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_BGCFPage.Go to IBCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[15]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               Go to BGCF section in IBCF tab
               Edit BGCF function       ${Info}
 
             IF    """${Info[15]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[15]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END




Delete
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_BGCFPage.Go to IBCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[14]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               Go to BGCF section in IBCF tab
               Delete BGCF function        ${Info}
 
             IF    """${Info[14]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[14]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Retry_Domain
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_BGCFPage.Go to IBCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[6]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               Go to BGCF section in IBCF tab
               Configure Retry Domain function        ${Info}
 
             IF    """${Info[6]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[6]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END








#################################################################################################################################
#                                                           ---FUNCTION---                                                      #
#################################################################################################################################

Add BGCF function 
    [Arguments]  ${Info}
    IBCF_BGCFPage.Add BGCF  ${Info[4]}  ${Info[5]}  ${Info[6]}    ${Info[7]}  ${Info[8]}
    Reload Page
    Verify Page Contains 3 Expected Elements     ${Info[4]}  ${Info[5]}  ${Info[6]}



Filter BGCF function
    [Arguments]  ${Info}
    Filter 3 value               ${Info[4]}  ${Info[5]}  ${Info[7]}


Filter special characters BGCF function
    [Arguments]  ${Info}
    Filter special character 3 value  ${Info[4]}  ${Info[5]}  ${Info[6]}   ${Info[7]}  ${Info[8]}

View BGCF function
    [Arguments]  ${Info}
    IBCF_BGCFPage.View BGCF         ${Info[4]}  ${Info[5]}  ${Info[6]}  ${Info[7]}


Edit BGCF function 
    [Arguments]  ${Info}
    IBCF_BGCFPage.Edit BGCF                 ${Info[4]}     ${Info[5]}   ${Info[6]}   ${Info[8]}     ${Info[9]}  ${Info[13]}
    Verify Page Contains 3 Expected Elements     ${Info[4]}      ${Info[5]}     ${Info[8]}

Delete BGCF function
    [Arguments]  ${Info}
    Delete with 3 info                      ${Info[4]}      ${Info[5]}     ${Info[6]}
    Verify Page Not Contains 3 Expected Elements     ${Info[4]}      ${Info[5]}     ${Info[6]}


Verify error message BGCF invalid case
    [Arguments]  ${Info}
    IBCF_BGCFPage.Add BGCF                                  ${Info[4]}  ${Info[5]}  ${Info[6]}    ${Info[7]}  ${Info[8]}
    Verify Page Contains Error Message     ${Info[9]}


Verify error message BGCF edit invalid case
    [Arguments]  ${Info}
    IBCF_BGCFPage.Edit BGCF                                ${Info[4]}  ${Info[5]}  ${Info[6]}    ${Info[7]}  ${Info[8]}  ${Info[9]}
    Verify Page Contains Error Message     ${Info[10]}

Configure Retry Domain function
    [Arguments]  ${Info}
    IBCF_BGCFPage.Retry Pref and Domain Origin   ${Info[4]}
    Reload Page






















