*** Settings ***
Resource  ../../Resources/Admin/LoginApp_SBC.robot
Resource  ./PO/SCSCF_IBCFPage.robot
Resource  ../../Resources/Common.robot
Resource  ../DataManager.robot
Resource  ../../Data/InputData.robot


*** Keywords ***

Add Valid Cases
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    SCSCF_IBCFPage.Go to SCSCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[10]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               SCSCF_IBCFPage.Go to IBCF section in SCSCF tab
               Add ibcf function        ${Info}
 
             IF    """${Info[10]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[10]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Add Invalid Cases
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    SCSCF_IBCFPage.Go to SCSCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[11]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               SCSCF_IBCFPage.Go to IBCF section in SCSCF tab
               Verify error message IBCF invalid Add  ${Info}
 
             IF    """${Info[11]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[11]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Filter Cases
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    SCSCF_IBCFPage.Go to SCSCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[9]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               SCSCF_IBCFPage.Go to IBCF section in SCSCF tab
               Filter ibcf function     ${Info}
 
             IF    """${Info[9]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[9]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Filter Special Cases
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    SCSCF_IBCFPage.Go to SCSCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[10]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               SCSCF_IBCFPage.Go to IBCF section in SCSCF tab
               Filter special character ibcf function     ${Info}
 
             IF    """${Info[10]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[10]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

View Cases
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    SCSCF_IBCFPage.Go to SCSCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[12]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               Go to IBCF section in SCSCF tab
               View ibcf function     ${Info}
 
             IF    """${Info[12]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[12]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Sort Cases
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    SCSCF_IBCFPage.Go to SCSCF tab
    Go to IBCF section in SCSCF tab
    Sort Element  IP
    Sort Element  Domain
    Page Should Not Contain  Internal Server Error


Edit Valid Cases
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    SCSCF_IBCFPage.Go to SCSCF tab
    SCSCF_IBCFPage.Go to IBCF section in SCSCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[12]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
            Go to IBCF section in SCSCF tab
            Edit ibcf function       ${Info}
 
             IF    """${Info[12]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[12]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Edit Invalid Cases
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    SCSCF_IBCFPage.Go to SCSCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[12]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               SCSCF_IBCFPage.Go to IBCF section in SCSCF tab
               Verify error message IBCF invalid Edit  ${Info}
 
             IF    """${Info[12]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[12]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Delete Cases
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    SCSCF_IBCFPage.Go to SCSCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[11]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               SCSCF_IBCFPage.Go to IBCF section in SCSCF tab
               Delete ibcf function       ${Info}
 
             IF    """${Info[11]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[11]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

    
#################################################################################################################################
#                                                           ---FUNCTION---                                                      #
#################################################################################################################################

Add ibcf function
    [Arguments]  ${Info}
    SCSCF_IBCFPage.Add IBCF                      ${Info[4]}  ${Info[5]}  ${Info[6]}  ${Info[7]}  ${Info[8]}
    Common.Verify Page Contains 3 Expected Elements     ${Info[4]}  ${Info[5]}  ${Info[7]}

Filter ibcf function
    [Arguments]  ${Info}
    Common.Filter 3 value                ${Info[4]}  ${Info[5]}  ${Info[7]}

Filter special character ibcf function
    [Arguments]  ${Info}
    Common.Filter special character value                ${Info[4]}  ${Info[5]}  ${Info[6]}  ${Info[8]}

View ibcf function
    [Arguments]  ${Info}
    SCSCF_IBCFPage.View IBCF          ${Info[4]}  ${Info[5]}  ${Info[7]}


Edit ibcf function
    [Arguments]  ${Info}
    SCSCF_IBCFPage.Edit ibcf                   ${Info[4]}     ${Info[5]}   ${Info[7]}   ${Info[9]}     ${Info[10]}
    Verify Page Contains 3 Expected Elements     ${Info[4]}      ${Info[5]}     ${Info[7]}

Delete ibcf function
    [Arguments]  ${Info}
    Delete with 3 info                      ${Info[4]}      ${Info[5]}     ${Info[7]}
    Verify Page Not Contains 3 Expected Elements     ${Info[4]}      ${Info[5]}     ${Info[7]}


Verify error message IBCF invalid Add
    [Arguments]  ${Info}
    SCSCF_IBCFPage.Add ibcf                   ${Info[4]}  ${Info[5]}  ${Info[6]}    ${Info[7]}  ${Info[8]}
    Verify Page Contains Error Message       ${Info[9]}
    SCSCF_IBCFPage.Cancel invalid add

Verify error message IBCF invalid Edit
    [Arguments]  ${Info}
    SCSCF_IBCFPage.Edit ibcf                                  ${Info[4]}     ${Info[5]}   ${Info[7]}   ${Info[8]}     ${Info[9]}
    Verify Page Contains Error Message     ${Info[10]}
    SCSCF_IBCFPage.Cancel invalid add

