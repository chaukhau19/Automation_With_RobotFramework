*** Settings ***
Resource  ../../Resources/Admin/LoginApp_SBC.robot
Resource  ./PO/IBCF_TpipPage.robot
Resource  ../Admin/PO/UserManagerPage.robot
Resource  ../Common.robot

*** Keywords ***

Add
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_TpipPage.Go to IBCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[30]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               IBCF_TpipPage.Go to TPIP section in IBCF tab
               Add TPIP function      ${Info}
 
             IF    """${Info[30]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[30]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

View
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_TpipPage.Go to IBCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[10]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               IBCF_TpipPage.Go to TPIP section in IBCF tab
               View TPIP function      ${Info}
 
             IF    """${Info[10]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[10]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Filter
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_TpipPage.Go to IBCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[28]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               IBCF_TpipPage.Go to TPIP section in IBCF tab
               Filter TPIP function            ${Info}
               Filter TPIP special charaters   ${Info}
 
             IF    """${Info[28]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[28]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END



Sort
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_TpipPage.Go to IBCF tab
    Go to TPIP section in IBCF tab
    Sort Element  Name
    Sort Element  Type
    Page Should Not Contain  Internal Server Error

Edit
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_TpipPage.Go to IBCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[28]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
                    IBCF_TpipPage.Go to TPIP section in IBCF tab
                    Edit TPIP function      ${Info}
 
             IF    """${Info[28]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[28]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Add Invalid
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_TpipPage.Go to IBCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[26]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
            Go to TPIP section in IBCF tab
            Verify error message invalid case  ${Info}
 
             IF    """${Info[26]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[26]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END
    
#################################################################################################################################
#                                                           ---FUNCTION---                                                      #
#################################################################################################################################
Add TPIP function
    [Arguments]  ${Info}
    IBCF_TpipPage.Add TPIP    ${Info[4]}  ${Info[5]}  ${Info[6]}   ${Info[7]}  ${Info[8]}   ${Info[9]}   ${Info[10]}  ${Info[11]}      ${Info[12]}   ${Info[13]}
    ...           ${Info[14]}    ${Info[15]}  ${Info[16]}  ${Info[17]}   ${Info[18]}   ${Info[19]}  ${Info[20]}  ${Info[21]}   ${Info[22]}   ${Info[27]}   ${Info[28]}
    Reload Page
    # Run Keyword If      '${Info[5]}' =='Auto_TPIP5'         Click Element     ${Page_2}
    # Run Keyword If      '${Info[5]}' =='Auto_TPIP6'         Click Element     ${Page_2}
    # Verify Page Contains 3 Expected Elements     ${Info[5]}  ${Info[8]}       ${Info[4]}

    ${arg} =  Create List    ${Info[5]}   ${Info[8]}   ${Info[4]}
    Run Keyword N Times And Stop If Success   Verify Page Contains 3 Expected Elements    ${arg}    Click Element   ${Page_2}   3
    Sleep   3s

Edit TPIP function
    [Arguments]  ${Info}
    IBCF_TpipPage.Edit TPIP   ${Info[5]}  ${Info[8]}   ${Info[23]}   ${Info[24]}  ${Info[25]}
    Reload Page
    Verify Page Contains 2 Expected Elements     ${Info[5]}  ${Info[8]}

View TPIP function
    [Arguments]   ${Info}
    IBCF_TpipPage.View TPIP  ${Info[4]}  ${Info[5]}  ${Info[6]}  ${Info[8]}
    Back from View Page

Filter TPIP function
    [Arguments]  ${Info}
    Filter 4 value           ${Info[5]}  ${Info[6]}  ${Info[8]}  ${Info[4]}

Filter TPIP special charaters
    [Arguments]  ${Info}
    Filter special character 1 value  ${Info[26]}  ${Info[5]}  ${Info[6]}

Verify error message invalid case
    [Arguments]  ${Info}
    IBCF_TpipPage.Add TPIP        ${Info[4]}  ${Info[5]}  ${Info[6]}   ${Info[7]}  ${Info[8]}   ${Info[9]}   ${Info[10]}  ${Info[11]}      ${Info[10]}   ${Info[13]}
    ...           ${Info[14]}    ${Info[15]}  ${Info[16]}  ${Info[17]}   ${Info[18]}   ${Info[19]}  ${Info[20]}  ${Info[21]}   ${Info[22]}   ${Info[23]}   ${Info[24]}
    Verify Page Contains Error Message        ${Info[23]}

