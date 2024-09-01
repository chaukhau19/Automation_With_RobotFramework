*** Settings ***
Resource  ../../Resources/Admin/LoginApp_SBC.robot
Resource  ./PO/PCSCF_TlsPage.robot
Resource  ../Admin/PO/UserManagerPage.robot
Resource  ../Common.robot

*** Keywords ***

Add TLSPCSCF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_TlsPage.Go to PCSCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[24]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               Go to TLS section in PCSCF tab
               Add TLS function      ${Info}
                PCSCF_TlsPage.View TLS  ${Info[4]}  ${Info[5]}   ${Info[6]}   ${Info[7]}  ${Info[8]}   ${Info[9]}   ${Info[14]}
                Back from View Page

             IF    """${Info[24]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[24]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Edit TLSPCSCF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_TlsPage.Go to PCSCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[24]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               Go to TLS section in PCSCF tab
               Edit TLS function      ${Info}
 
             IF    """${Info[24]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[24]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Delete TLSPCSCF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_TlsPage.Go to PCSCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[24]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               Go to TLS section in PCSCF tab
               Delete TLS function      ${Info}
 
             IF    """${Info[24]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[24]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END



Sort TLSPCSCF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_TlsPage.Go to PCSCF tab
    PCSCF_TlsPage.Go to TLS section in PCSCF tab
    Sort Element  Name
    Page Should Not Contain  Internal Server Error

View TLSPCSCF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_TlsPage.Go to PCSCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[24]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               Go to TLS section in PCSCF tab
               View TLS function      ${Info}
 
             IF    """${Info[24]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[24]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Filter TLSPCSCF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_TlsPage.Go to PCSCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[7]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               Go to TLS section in PCSCF tab
               Filter TLS function      ${Info}
 
             IF    """${Info[7]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[7]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Filter Special Character TLSPCSCF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_TlsPage.Go to PCSCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[11]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               Go to TLS section in PCSCF tab
               Filter Special Charaters TLS function      ${Info}
 
             IF    """${Info[11]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[11]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END



#################################################################################################################################
#                                                           ---FUNCTION---                                                      #
#################################################################################################################################

Add TLS function
    [Arguments]  ${Info}
    PCSCF_TlsPage.Add TLS  ${Info[4]}  ${Info[5]}   ${Info[6]}    ${Info[7]}    ${Info[8]}  ${Info[9]}  ${Info[10]}   ${Info[11]}     ${Info[12]}   ${Info[13]}   ${Info[14]} 
    ...  ${Info[15]}  ${Info[16]}   ${Info[17]}   ${Info[18]}
    Reload Page
    Verify Page Contains 2 Expected Elements     ${Info[4]}  ${Info[5]}

Verify errors in TLS rules function
    [Arguments]  ${Info}
    PCSCF_TlsPage.Add TLS  ${Info[4]}  ${Info[5]}   ${Info[6]}    ${Info[7]}    ${Info[8]}  ${Info[9]}   ${Info[10]}   ${Info[11]}     ${Info[12]}   ${Info[13]}   ${Info[14]}
        ...  ${Info[15]}  ${Info[16]}   ${Info[17]}   ${Info[18]}
    Reload Page
    Verify Page Contains Error Message  ${Info[15]}

Edit TLS function
    [Arguments]  ${Info}
    PCSCF_TlsPage.Edit TLS  ${Info[4]}  ${Info[5]}  ${Info[19]}   ${Info[20]}    ${Info[21]}    ${Info[22]}
    Reload Page
    Verify Page Contains 2 Expected Elements     ${Info[4]}  ${Info[5]}

Verify errors in edit TLS rules function
    [Arguments]  ${Info}
    PCSCF_TlsPage.Edit TLS  ${Info[4]}  ${Info[5]}   ${Info[6]}    ${Info[7]}    ${Info[8]}  ${Info[9]} 
    #...    ${Info[10]}   ${Info[11]}     ${Info[12]}   ${Info[13]}   ${Info[14]}  ${Info[15]}
    Verify Page Contains Error Message  ${Info[16]}

Delete TLS function
    [Arguments]  ${Info}
    Delete with 2 info  ${Info[4]}  ${Info[5]}
    Verify Page Not Contains 2 Expect Elements  ${Info[4]}  ${Info[5]}

View TLS function
    [Arguments]  ${Info}
    PCSCF_TlsPage.View TLS  ${Info[4]}  ${Info[5]}   ${Info[6]}   ${Info[7]}  ${Info[8]}   ${Info[9]}   ${Info[14]}
    Back from View Page

Filter TLS function
    [Arguments]  ${Info}
    Filter 2 value           ${Info[4]}  ${Info[5]}

Filter Special Charaters TLS function
    [Arguments]  ${Info}
    Filter special character 4 value           ${Info[4]}  ${Info[5]}  ${Info[6]}   ${Info[7]}  ${Info[8]}  ${Info[9]}

