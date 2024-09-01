*** Settings ***
Resource  ../../Resources/Admin/LoginApp_SBC.robot
Resource  ./PO/PCSCF_TpipPage.robot
Resource  ../Admin/PO/UserManagerPage.robot
Resource  ../Common.robot

*** Variables ***
################# General variables #################
${Next_page}              	xpath=//a[contains(text(),'»')]

*** Keywords ***

Add
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_TpipPage.Go to PCSCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[30]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               PCSCF_TpipPage.Go to TPIP section in PCSCF tab
               Add TPIP function      ${Info}
 
             IF    """${Info[30]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[30]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Add Invalid Protected
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_TpipPage.Go to PCSCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[31]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               PCSCF_TpipPage.Go to TPIP section in PCSCF tab
               Add Invalid Protected TPIP function      ${Info}
 
             IF    """${Info[31]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[31]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

View
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_TpipPage.Go to PCSCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[29]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               PCSCF_TpipPage.Go to TPIP section in PCSCF tab
               View TPIP function      ${Info}
 
             IF    """${Info[29]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[29]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Filter
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_TpipPage.Go to PCSCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[29]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               PCSCF_TpipPage.Go to TPIP section in PCSCF tab
               Filter TPIP function            ${Info}
 
             IF    """${Info[29]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[29]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Filter Special Character TPIP
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_TpipPage.Go to PCSCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[11]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               PCSCF_TpipPage.Go to TPIP section in PCSCF tab
               Filter special charaters TPIP function   ${Info}
 
             IF    """${Info[11]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[11]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Sort
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_TpipPage.Go to PCSCF tab
    Go to TPIP section in PCSCF tab
    Sort Element  Name
    Sort Element  Type
    Page Should Not Contain  Internal Server Error

Edit
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_TpipPage.Go to PCSCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[29]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               PCSCF_TpipPage.Go to TPIP section in PCSCF tab
               Edit TPIP function      ${Info}
 
             IF    """${Info[29]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[29]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

# Invalid Case
#     [Arguments]  ${Scenarios}
#     Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
#     FOR    ${Info}  IN  @{Scenarios}
#         TRY
#             #Navigate to Sign In Page
#             Attempt to Login   ${Info}
#             Go to TPIP section in PCSCF tab
#             Verify error message invalid case  ${Info}
 
#         EXCEPT    AS    ${error}
#             Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
#         END
#     END


#################################################################################################################################
#                                                           ---FUNCTION---                                                      #
#################################################################################################################################

Add TPIP function
    [Arguments]  ${Info}
    PCSCF_TpipPage.Add TPIP    ${Info[4]}     ${Info[5]}       ${Info[6]}    ${Info[7]}   ${Info[8]}      ${Info[9]}      ${Info[10]}
    ...          ${Info[11]}   ${Info[12]}    ${Info[13]}      ${Info[14]}   ${Info[15]}  ${Info[16]}     ${Info[17]}     ${Info[18]}
    ...          ${Info[19]}   ${Info[20]}    ${Info[21]}      ${Info[22]}    ${Info[23]}  ${Info[28]}
    Reload Page
    # Run Keyword If  '${Info[5]}' == 'auto_home_eth'      Click Element     ${Next_page}
    # Run Keyword If  '${Info[5]}' == 'auto_extern_eth'      Click Element     ${Next_page}
    # Run Keyword If  '${Info[5]}' == 'auto_atcf_eth'      Click Element     ${Next_page}
    # Verify Page Contains 2 Expected Elements     ${Info[5]}   ${Info[8]}
     ${arg} =  Create List   ${Info[5]}   ${Info[8]}
    Run Keyword N Times And Stop If Success   Verify Page Contains 2 Expected Elements    ${arg}    Click Element   ${Next_page}   6
    Sleep       2s

Add Invalid Protected TPIP function
    [Arguments]  ${Info}
    PCSCF_TpipPage.Add TPIP    ${Info[4]}     ${Info[5]}       ${Info[6]}    ${Info[7]}   ${Info[8]}      ${Info[9]}      ${Info[10]}
    ...          ${Info[11]}   ${Info[12]}    ${Info[13]}      ${Info[14]}   ${Info[15]}  ${Info[16]}     ${Info[17]}     ${Info[18]}
    ...          ${Info[19]}   ${Info[20]}    ${Info[21]}      ${Info[22]}    ${Info[23]}   ${Info[28]}
    Verify Page Contains Error Message       ${Info[29]}
    Click Close Error Panel


Edit TPIP function
    [Arguments]  ${Info}
    PCSCF_TpipPage.Edit TPIP   ${Info[4]}   ${Info[5]}  ${Info[8]}   ${Info[24]}   ${Info[25]}   ${Info[26]}    ${Info[27]}
    Reload Page
    # Run Keyword If  '${Info[5]}' == 'auto_extern_eth'      Click Element     ${Next_page}
    # Verify Page Contains 2 Expected Elements     ${Info[5]}  ${Info[8]}
     ${arg} =  Create List   ${Info[5]}   ${Info[8]}
    Run Keyword N Times And Stop If Success   Verify Page Contains 2 Expected Elements    ${arg}    Click Element   ${Next_page}   6
    Sleep       2s

Verify error message invalid case
    [Arguments]  ${Info}
    PCSCF_TpipPage.Add TPIP        ${Info[4]}  ${Info[5]}  ${Info[6]}    ${Info[7]}  ${Info[8]}      ${Info[9]}   ${Info[10]}    ${Info[11]}    
    ...    ${Info[12]}    ${Info[13]}      ${Info[14]}   ${Info[15]}  ${Info[16]}     ${Info[17]}     ${Info[18]}
    ...          ${Info[19]}   ${Info[20]}    ${Info[21]}      ${Info[22]}    ${Info[23]}   ${Info[28]}
    Verify Page Contains Error Message        ${Info[13]}
    Common.Log out

View TPIP function
    [Arguments]   ${Info}
    # Run Keyword If  '${Info[5]}' == 'auto_home_eth'      Click Element     ${Next_page}
    # Run Keyword If  '${Info[5]}' == 'auto_extern_eth'      Click Element     ${Next_page}
    # Run Keyword If  '${Info[5]}' == 'auto_atcf_eth'      Click Element     ${Next_page}

    PCSCF_TpipPage.View TPIP  ${Info[4]}  ${Info[5]}  ${Info[6]}  ${Info[8]}
    Back from View Page

Filter TPIP function
    [Arguments]  ${Info}
    Filter 4 value           ${Info[5]}  ${Info[6]}  ${Info[8]}  ${Info[4]}

Filter special charaters TPIP function
    [Arguments]  ${Info}
    Filter special character 4 value  ${Info[4]}  ${Info[5]}  ${Info[6]}  ${Info[7]}  ${Info[8]}  ${Info[9]}