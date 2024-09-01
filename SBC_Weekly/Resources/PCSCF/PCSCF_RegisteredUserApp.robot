*** Settings ***
Library  SeleniumLibrary
Resource  ../../Resources/Admin/LoginApp_SBC.robot
Resource  ./PO/PCSCF_RegisteredUserPage.robot
Resource  ../../Resources/Common.robot

*** Keywords ***

View Registered User
    [Arguments]  ${Scenarios}
    Register By SIPP    ${PCSCF_IP_PORT}   ${XML_DEREGISTER}   ${CSV_FILE_A}    ${SIPP_PORT_A}
    Register By SIPP    ${PCSCF_IP_PORT}   ${XML_REGISTER}   ${CSV_FILE_A}    ${SIPP_PORT_A}
   ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_RegisteredUserPage.Go to PCSCF tab
    PCSCF_RegisteredUserPage.Go to Registered User section in PCSCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[17]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
                    PCSCF_RegisteredUserPage.View Registered User function     ${Info[4]}  ${Info[5]}  ${Info[6]}  ${Info[7]}  ${Info[8]}  ${Info[9]}  ${Info[10]}  
                    ...  ${Info[11]}  ${Info[12]}  ${Info[13]}  ${Info[14]}  ${Info[15]}
 
             IF    """${Info[17]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[17]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END



Filter Registered User
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_RegisteredUserPage.Go to PCSCF tab
    PCSCF_RegisteredUserPage.Go to Registered User section in PCSCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[17]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
                   PCSCF_RegisteredUserPage.Filter Registered User function    ${Info[4]}
     
             IF    """${Info[17]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[17]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Filter Special Character Registered User function
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_RegisteredUserPage.Go to PCSCF tab
    PCSCF_RegisteredUserPage.Go to Registered User section in PCSCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[17]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
                   PCSCF_RegisteredUserPage.Filter Special Character Registered User function    ${Info[4]}
 
             IF    """${Info[17]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[17]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Delete Registered User
    [Arguments]  ${Scenarios}
    Register By SIPP    ${PCSCF_IP_PORT}   ${XML_REGISTER}   ${CSV_FILE_A}    ${SIPP_PORT_A}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_RegisteredUserPage.Go to PCSCF tab
	PCSCF_RegisteredUserPage.Go to Registered User section in PCSCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
	FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[17]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
                   Delete Registered User function      ${Info}
 
             IF    """${Info[17]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[17]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Delete Registered User function
    [Arguments]   ${Info}
    Delete with 1 info  ${Info[4]}
    Verify Page Not Contains 1 Expect Elements  ${Info[4]}

