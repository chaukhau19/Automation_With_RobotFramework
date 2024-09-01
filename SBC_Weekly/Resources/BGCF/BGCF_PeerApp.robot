*** Settings ***
Library     SeleniumLibrary
Resource  ../../Resources/Admin/LoginApp_SBC.robot
Resource  ./PO/BGCF_PeerPage.robot
Resource  ../Admin/PO/UserManagerPage.robot
Resource  ../../Resources/Common.robot

*** Keywords ***

################## Peer ###################

Add Peer
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    BGCF_PeerPage.Go to Peer in BGCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[57]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END        
                    Go to Peer section in BGCF PEER tab
                    Add PeerBGCF function    ${Info}

            IF    """${Info[57]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[57]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Add with multi domains
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    BGCF_PeerPage.Go to Peer in BGCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[9]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               Go to Peer section in BGCF PEER tab
               Add PeerBGCF with multi domains      ${Info}

            IF    """${Info[9]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[9]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Add Invalid Peer
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    BGCF_PeerPage.Go to Peer in BGCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[11]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
                    Go to Peer section in BGCF PEER tab
                    Verify error message PeerBGCF invalid case  ${Info}

             IF    """${Info[11]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[11]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

View Peer
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    BGCF_PeerPage.Go to Peer in BGCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[49]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
                    Go to Peer section in BGCF PEER tab
                    View PeerBGCF function      ${Info}

             IF    """${Info[49]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[49]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Sort Peer
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    Go to Peer in BGCF tab
    Go to Peer section in BGCF PEER tab
    Sort Element     Name
    Sort Element     Domain
    Page Should Not Contain  Internal Server Error

Filter Peer
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    BGCF_PeerPage.Go to Peer in BGCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[49]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               Go to Peer section in BGCF PEER tab
               Filter PeerBGCF function      ${Info}

             IF    """${Info[49]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[49]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Edit Peer
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    BGCF_PeerPage.Go to Peer in BGCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[57]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
                   Go to Peer section in BGCF PEER tab
                   Edit PeerBGCF function    ${Info}

            IF    """${Info[57]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[57]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Edit Invalid Peer
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    BGCF_PeerPage.Go to Peer in BGCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[11]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
                   Go to Peer section in BGCF PEER tab
                   Verify error message edit PeerBGCF invalid case  ${Info}
                   
            IF    """${Info[11]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[11]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Delete Peer
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    BGCF_PeerPage.Go to Peer in BGCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[49]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
                   Go to Peer section in BGCF PEER tab
                   Delete PeerBGCF function      ${Info}
            IF    """${Info[49]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[49]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


############################  Peer Configuration  ########################

Peer Configuration
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    Go to Peer in BGCF tab
    Go to Peer configuration section in BGCF tab
    BGCF_PeerPage.Check Trusted

############################  Trusted  ###################################

Add Trusted
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    BGCF_PeerPage.Go to Peer in BGCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[10]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
                    Go to Trusted section in BGCF tab
                    Add Trusted Function      ${Info}

            IF    """${Info[10]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[10]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Add Trusted Invalid Cases
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    BGCF_PeerPage.Go to Peer in BGCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[8]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
                    Go to Trusted section in BGCF tab
                    Verify error message trusted invalid cases     ${Info}

            IF    """${Info[8]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[8]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Filter Trusted
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    BGCF_PeerPage.Go to Peer in BGCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[10]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
                    Go to Trusted section in BGCF tab
                    Filter Trusted Function      ${Info}
 
             IF    """${Info[10]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[10]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Delete Trusted
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    BGCF_PeerPage.Go to Peer in BGCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[10]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
                    Go to Trusted section in BGCF tab
                    Delete Trusted Function      ${Info}
        
             IF    """${Info[10]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[10]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END               
############################  Not Trusted  ###############################
 


Add Not Trusted
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    BGCF_PeerPage.Go to Peer in BGCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[10]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               Go to Not Trusted section in BGCF tab
               Add Trusted Function      ${Info}
 
             IF    """${Info[10]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[10]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Filter Not Trusted
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    BGCF_PeerPage.Go to Peer in BGCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[10]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               Go to Not Trusted section in BGCF tab
               Filter Trusted Function      ${Info}
 
             IF    """${Info[10]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[10]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Add Not Trusted Invalid Cases
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    BGCF_PeerPage.Go to Peer in BGCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[8]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               Go to Not Trusted section in BGCF tab
               Verify error message trusted invalid cases     ${Info}
 
             IF    """${Info[8]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[8]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Delete Not Trusted
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    BGCF_PeerPage.Go to Peer in BGCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[10]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               Go to Not Trusted section in BGCF tab
               Delete Trusted Function      ${Info}
               
             IF    """${Info[10]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[10]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END



#################################################################################################################################
#                                                           ---FUNCTION---                                                      #
#################################################################################################################################
Add Trusted Function
    [Arguments]  ${Info}
    BGCF_PeerPage.Add Trusted Peer              ${Info[4]}  ${Info[5]}
    Reload Page
    Verify Page Contains 2 Expected Elements    ${Info[4]}  ${Info[5]}

Delete Trusted Function
    [Arguments]  ${Info}
    Delete with 1 info      ${Info[4]}
    Reload Page
    Verify Page Not Contains 2 Expect Elements  ${Info[4]}  ${Info[5]}

Filter Trusted Function
    [Arguments]  ${Info}
    Common.Filter 2 value  ${Info[4]}  ${Info[5]}
    Common.Filter special character 1 value  ${Info[6]}  ${Info[7]}  ${Info[8]}

Add PeerBGCF function 
    [Arguments]  ${Info}
    BGCF_PeerPage.Add PeerBGCF  ${Info[4]}  ${Info[5]}  ${Info[6]}    ${Info[7]}    ${Info[8]}  ${Info[9]}   ${Info[10]}
    ...   ${Info[11]}  ${Info[12]}    ${Info[13]}    ${Info[14]}   ${Info[15]}  ${Info[16]}    ${Info[17]}   ${Info[18]}
    ...   ${Info[19]}  ${Info[20]}    ${Info[21]}    ${Info[22]}  ${Info[46]}  ${Info[48]}    ${Info[49]}  ${Info[52]}
    ...   ${Info[53]}
    Reload Page
    Verify Page Contains 2 Expected Elements     ${Info[4]}  ${Info[5]}

View PeerBGCF function
    [Arguments]    ${Info}
    BGCF_PeerPage.View PeerBGCF     ${Info[4]}  ${Info[5]}  ${Info[12]}  ${Info[13]}    ${Info[14]}  ${Info[15]}   ${Info[17]}  ${Info[16]}  ${Info[18]}
    Back from View Page

Filter PeerBGCF function
    [Arguments]  ${Info}
    Filter 2 value            ${Info[4]}  ${Info[5]}


Edit PeerBGCF function 
    [Arguments]  ${Info}
    BGCF_PeerPage.Edit PeerBGCF   ${Info[4]}  ${Info[5]}   ${Info[23]}    ${Info[24]}    ${Info[25]}   ${Info[26]}    ${Info[27]}
    ...    ${Info[28]}  ${Info[29]}  ${Info[30]}   ${Info[31]}  ${Info[32]}    ${Info[33]}    ${Info[34]}   ${Info[35]}
    ...  ${Info[36]}    ${Info[37]}   ${Info[38]}   ${Info[39]}  ${Info[40]}   ${Info[41]}   ${Info[42]}  ${Info[43]}  ${Info[44]}  ${Info[45]}  ${Info[47]}
    ...  ${Info[50]}    ${Info[51]}   ${Info[54]}   ${Info[55]}
    Reload Page
    Verify Page Contains 2 Expected Elements with 3 domains     ${Info[4]}  ${Info[23]}  ${Info[24]}  ${Info[25]}

Add PeerBGCF with multi domains 
    [Arguments]  ${Info}
    BGCF_PeerPage.Add PeerBGCF multi domains  ${Info[4]}  ${Info[5]}  ${Info[6]}    ${Info[7]}
    Reload Page
    Verify Page Contains 2 Expected Elements with 3 domains     ${Info[4]}  ${Info[5]}   ${Info[6]}    ${Info[7]}

Verify error message PeerBGCF invalid case
    [Arguments]  ${Info}
    BGCF_PeerPage.Add Invalid PeerBGCF  ${Info[4]}  ${Info[5]}   ${Info[6]}  ${Info[8]}   ${Info[9]}
    Verify Page Contains Error Message        ${Info[7]}



Verify error message edit PeerBGCF invalid case
    [Arguments]  ${Info}
    BGCF_PeerPage.Edit Invalid PeerBGCF  ${Info[4]}  ${Info[5]}   ${Info[6]}  ${Info[8]}   ${Info[9]}
    Verify Page Contains Error Message        ${Info[7]}

Delete PeerBGCF function
    [Arguments]  ${Info}
    Delete with 1 info      ${Info[4]}
    Reload Page
    Verify Page Not Contains 2 Expect Elements  ${Info[4]}  ${Info[5]}

Delete PeerBGCF with multi domains
    [Arguments]  ${Info}
    Delete with 1 info      ${Info[4]}
    Reload Page
    Verify Page Not Contains 2 Expect Elements  ${Info[4]}  ${Info[5]}

Verify error message trusted invalid cases
    [Arguments]  ${Info}
    BGCF_PeerPage.Add Trusted Peer      ${Info[4]}  ${Info[5]}
    Verify Page Contains Error Message      ${Info[6]}
