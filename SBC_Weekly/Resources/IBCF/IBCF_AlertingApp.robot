*** Settings ***
Resource  ../../Resources/Admin/LoginApp_SBC.robot
Resource  ./PO/IBCF_AlertingPage.robot
Resource  ../Admin/PO/UserManagerPage.robot
Resource  ../Common.robot
Resource  ../../Resources/Admin/ProxyApp.robot

*** Keywords ***

Add AlertingIBCF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_AlertingPage.Go to IBCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[16]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               Go to Alerting section in IBCF tab
               Add Alerting function      ${Info}
               IBCF_AlertingPage.View Alerting  ${Info[4]}  ${Info[5]}   ${Info[6]}   ${Info[7]}  ${Info[8]}   ${Info[9]}  ${Info[10]}
               Back from View Page
               
             IF    """${Info[16]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[16]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Edit AlertingIBCF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_AlertingPage.Go to IBCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[16]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               Go to Alerting section in IBCF tab
               Edit Alerting function      ${Info}
 
             IF    """${Info[16]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[16]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Delete AlertingIBCF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_AlertingPage.Go to IBCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[16]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               Go to Alerting section in IBCF tab
               Delete Alerting function      ${Info}
 
             IF    """${Info[16]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[16]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Sort AlertingIBCF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_AlertingPage.Go to IBCF tab
    IBCF_AlertingPage.Go to Alerting section in IBCF tab
    Sort Element  Object
    Sort Element  Event
    Page Should Not Contain  Internal Server Error

View AlertingIBCF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_AlertingPage.Go to IBCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[16]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               Go to Alerting section in IBCF tab
               View Alerting function      ${Info}
 
             IF    """${Info[16]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[16]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END



Filter AlertingIBCF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_AlertingPage.Go to IBCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[16]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               Go to Alerting section in IBCF tab
               Filter Alerting function      ${Info}
 
             IF    """${Info[16]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[16]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END



Filter Special Character AlertingIBCF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_AlertingPage.Go to IBCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[10]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               Go to Alerting section in IBCF tab
               Filter Special Charaters Alerting function      ${Info}
 
             IF    """${Info[10]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[10]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


#################################################################################################################################
#                                                           ---FUNCTION---                                                      #
#################################################################################################################################
Add Alerting function
    [Arguments]  ${Info}
    IBCF_AlertingPage.Add Alerting  ${Info[4]}  ${Info[5]}   ${Info[6]}    ${Info[7]}    ${Info[8]}  ${Info[9]}  ${Info[10]}
    Reload Page
    Verify Page Contains 2 Expected Elements     ${Info[4]}  ${Info[6]}

Verify errors in Alerting rules function
    [Arguments]  ${Info}
    IBCF_AlertingPage.Add Alerting  ${Info[4]}  ${Info[5]}   ${Info[6]}    ${Info[7]}    ${Info[8]}  ${Info[9]}   ${Info[10]}   
    #...    ${Info[11]}     ${Info[12]}   ${Info[13]}   ${Info[14]}
    Reload Page
    Verify Page Contains Error Message  ${Info[15]}

Edit Alerting function
    [Arguments]  ${Info}
    IBCF_AlertingPage.Edit Alerting  ${Info[4]}  ${Info[5]}  ${Info[6]}   ${Info[11]}    ${Info[12]}    ${Info[13]}  ${Info[14]}
    Reload Page
    Verify Page Contains 2 Expected Elements     ${Info[4]}  ${Info[11]}

Verify errors in edit Alerting rules function
    [Arguments]  ${Info}
    IBCF_AlertingPage.Edit Alerting  ${Info[4]}  ${Info[5]}   ${Info[6]}    ${Info[7]}    ${Info[8]}  ${Info[9]}   ${Info[10]}  
   # ...    ${Info[11]}     ${Info[12]}   ${Info[13]}   ${Info[14]}  ${Info[15]}
    Verify Page Contains Error Message  ${Info[16]}

Delete Alerting function
    [Arguments]  ${Info}
    Delete with 3 info  ${Info[4]}  ${Info[6]}  ${Info[11]}
    Verify Page Not Contains 1 Expect Elements  ${Info[6]}

View Alerting function
    [Arguments]  ${Info}
    IBCF_AlertingPage.View Alerting  ${Info[4]}  ${Info[5]}   ${Info[6]}   ${Info[7]}  ${Info[8]}   ${Info[9]}  ${Info[10]}
    Back from View Page



Filter Alerting function
    [Arguments]  ${Info}
    Filter 1 value           ${Info[4]}


Filter Special Charaters Alerting function
    [Arguments]  ${Info}
    Filter special character 3 value           ${Info[4]}  ${Info[5]}  ${Info[6]}   ${Info[7]}  ${Info[8]}