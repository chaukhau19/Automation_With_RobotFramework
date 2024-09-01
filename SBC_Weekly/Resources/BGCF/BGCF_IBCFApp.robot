*** Settings ***
Library     SeleniumLibrary
Resource  ../../Resources/Admin/LoginApp_SBC.robot
Resource  ./PO/BGCF_IBCFPage.robot
Resource  ../../Resources/Common.robot
Resource  ../DataManager.robot
Resource  ../../Data/InputData.robot


*** Keywords ***

Add Valid Cases 
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    BGCF_IBCFPage.Go to BGCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[10]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               BGCF_IBCFPage.Go to IBCF section in BGCF tab
               Add IBCF function        ${Info}
               
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
    BGCF_IBCFPage.Go to BGCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[11]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               BGCF_IBCFPage.Go to IBCF section in BGCF tab
               Verify error message IBCF invalid Add   ${Info}

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
    BGCF_IBCFPage.Go to BGCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[11]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               BGCF_IBCFPage.Go to IBCF section in BGCF tab
               Filter IBCF function      ${Info[4]}  ${Info[5]}  ${Info[7]}

            IF    """${Info[11]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[11]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Filter Special Cases 
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    BGCF_IBCFPage.Go to BGCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[12]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               BGCF_IBCFPage.Go to IBCF section in BGCF tab
               Filter special character IBCF function    ${Info[4]}  ${Info[5]}  ${Info[6]}  ${Info[7]}

            IF    """${Info[12]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[12]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

View Cases 
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    BGCF_IBCFPage.Go to BGCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[13]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               Go to IBCF section in BGCF tab
               View IBCF function      ${Info}

            IF    """${Info[13]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[13]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Sort Cases 
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    BGCF_IBCFPage.Go to BGCF tab
    Go to IBCF section in BGCF tab
    Sort Element  IP
    Sort Element  Port
    #Sort Element  Domain
    Page Should Not Contain  Internal Server Error

Edit Valid Cases 
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    BGCF_IBCFPage.Go to BGCF tab
    BGCF_IBCFPage.Go to IBCF section in BGCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[13]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
            Go to IBCF section in BGCF tab
            Edit ibcf function        ${Info}

            IF    """${Info[13]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[13]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Edit Invalid Cases 
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    BGCF_IBCFPage.Go to BGCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[13]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               BGCF_IBCFPage.Go to IBCF section in BGCF tab
               Verify error message IBCF invalid Edit   ${Info}

            IF    """${Info[13]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[13]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Delete Cases 
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    BGCF_IBCFPage.Go to BGCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[11]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               BGCF_IBCFPage.Go to IBCF section in BGCF tab
               Delete IBCF function       ${Info}
               
            IF    """${Info[11]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[11]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

#################################################################################################################################
#                                                           ---FUNCTION---                                                      #
#################################################################################################################################

Add IBCF function 
    [Arguments]  ${Info}
    BGCF_IBCFPage.Add IBCF                                   ${Info[4]}  ${Info[5]}  ${Info[6]}  ${Info[7]}  ${Info[8]}
    Common.Verify Page Contains 3 Expected Elements     ${Info[4]}  ${Info[5]}  ${Info[7]}

Filter IBCF function 
    [Arguments]  ${Info[4]}  ${Info[5]}  ${Info[6]}
    Common.Filter 3 value                ${Info[4]}  ${Info[5]}  ${Info[6]}

Filter special character IBCF function 
    [Arguments]  ${Info[4]}  ${Info[5]}  ${Info[6]}  ${Info[7]}
    Common.Filter special character value                ${Info[4]}  ${Info[5]}  ${Info[6]}  ${Info[7]}

View IBCF function 
    [Arguments]  ${Info}
    BGCF_IBCFPage.View IBCF          ${Info[4]}  ${Info[5]}  ${Info[6]}  ${Info[7]}  ${Info[10]}

Edit IBCF function 
    [Arguments]  ${Info}
    BGCF_IBCFPage.Edit IBCF                    ${Info[4]}     ${Info[5]}   ${Info[7]}   ${Info[8]}   ${Info[9]}  ${Info[11]}
    Verify Page Contains 3 Expected Elements     ${Info[4]}      ${Info[5]}     ${Info[9]}

Delete IBCF function 
    [Arguments]  ${Info}
    Delete with 3 info                      ${Info[4]}      ${Info[5]}     ${Info[7]}
    Verify Page Not Contains 3 Expected Elements     ${Info[4]}      ${Info[5]}     ${Info[7]}


Verify error message IBCF invalid Add 
    [Arguments]  ${Info}
    BGCF_IBCFPage.Add IBCF                    ${Info[4]}  ${Info[5]}  ${Info[6]}  ${Info[7]}  ${Info[9]}
    Verify Page Contains Error Message       ${Info[8]}
    BGCF_IBCFPage.Cancel invalid add

Verify error message IBCF invalid Edit 
    [Arguments]  ${Info}
    BGCF_IBCFPage.Edit IBCF                          ${Info[4]}     ${Info[5]}   ${Info[7]}   ${Info[8]}     ${Info[9]}  ${Info[10]}
    Verify Page Contains Error Message     ${Info[11]}
    BGCF_IBCFPage.Cancel invalid add

