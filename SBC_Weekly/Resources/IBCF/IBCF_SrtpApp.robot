*** Settings ***
Resource  ../../Resources/Admin/LoginApp_SBC.robot
Resource  ./PO/IBCF_SrtpPage.robot
Resource  ../Admin/PO/UserManagerPage.robot
Resource  ../Common.robot

*** Keywords ***

Add SRTPIBCF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_SrtpPage.Go to IBCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[16]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               Go to SRTP section in IBCF tab
               Add SRTP function      ${Info}
 
             IF    """${Info[16]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[16]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Edit SRTPIBCF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_SrtpPage.Go to IBCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[16]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               Go to SRTP section in IBCF tab
               Edit SRTP function      ${Info}
 
             IF    """${Info[16]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[16]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Delete SRTPIBCF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_SrtpPage.Go to IBCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[16]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               Go to SRTP section in IBCF tab
               Delete SRTP function      ${Info}
 
             IF    """${Info[16]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[16]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END



Sort SRTPIBCF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_SrtpPage.Go to IBCF tab
    IBCF_SrtpPage.Go to SRTP section in IBCF tab
    Sort Element  Index
    Page Should Not Contain  Internal Server Error


View SRTPIBCF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_SrtpPage.Go to IBCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[16]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               Go to SRTP section in IBCF tab
               View SRTP function      ${Info}
 
             IF    """${Info[16]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[16]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Filter SRTPIBCF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_SrtpPage.Go to IBCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[16]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               Go to SRTP section in IBCF tab
               Filter SRTP function      ${Info}
 
             IF    """${Info[16]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[16]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Filter Special Character SRTPIBCF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_SrtpPage.Go to IBCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[10]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
                Go to SRTP section in IBCF tab
               Filter Special Charaters SRTP function      ${Info}
 
             IF    """${Info[10]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[10]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END




#################################################################################################################################
#                                                           ---FUNCTION---                                                      #
#################################################################################################################################
Add SRTP function
    [Arguments]  ${Info}
    IBCF_SrtpPage.Add SRTP  ${Info[4]}  ${Info[5]}   ${Info[6]}    ${Info[7]}    ${Info[8]}  ${Info[9]}
    Reload Page
    Verify Page Contains 2 Expected Elements     ${Info[4]}  ${Info[5]}

Verify errors in SRTP rules function
    [Arguments]  ${Info}
    IBCF_SrtpPage.Add SRTP  ${Info[4]}  ${Info[5]}   ${Info[6]}    ${Info[7]}    ${Info[8]}  ${Info[9]}
  #  ...    ${Info[10]}   ${Info[11]}     ${Info[12]}   ${Info[13]}   ${Info[14]}
    Reload Page
    Verify Page Contains Error Message  ${Info[15]}

Edit SRTP function
    [Arguments]  ${Info}
    IBCF_SrtpPage.Edit SRTP  ${Info[4]}  ${Info[5]}  ${Info[10]}   ${Info[11]}    ${Info[12]}    ${Info[13]}  ${Info[14]}
    Reload Page
    Verify Page Contains 2 Expected Elements     ${Info[4]}  ${Info[10]}

Verify errors in edit SRTP rules function
    [Arguments]  ${Info}
    IBCF_SrtpPage.Edit SRTP  ${Info[4]}  ${Info[5]}   ${Info[6]}    ${Info[7]}    ${Info[8]}  ${Info[9]}   ${Info[10]}   
    #...    ${Info[11]}     ${Info[12]}   ${Info[13]}   ${Info[14]}  ${Info[15]}
    Verify Page Contains Error Message  ${Info[16]}

Delete SRTP function
    [Arguments]  ${Info}
    Delete with 2 info  ${Info[4]}  ${Info[5]}
    Verify Page Not Contains 2 Expect Elements  ${Info[4]}  ${Info[5]}

View SRTP function
    [Arguments]  ${Info}
    IBCF_SrtpPage.View SRTP  ${Info[4]}  ${Info[5]}   ${Info[6]}   ${Info[7]}  ${Info[8]}   ${Info[9]}
    Back from View Page

Filter SRTP function
    [Arguments]  ${Info}
    Filter 3 value           ${Info[4]}  ${Info[5]}  ${Info[6]}

Filter Special Charaters SRTP function
    [Arguments]  ${Info}
    Filter special character 3 value           ${Info[4]}  ${Info[5]}  ${Info[6]}   ${Info[7]}  ${Info[8]}
