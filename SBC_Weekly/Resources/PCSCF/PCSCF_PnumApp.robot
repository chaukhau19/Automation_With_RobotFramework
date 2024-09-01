*** Settings ***
Resource  ../../Resources/Admin/LoginApp_SBC.robot
Resource  ./PO/PCSCF_PnumPage.robot
Resource  ../Admin/PO/UserManagerPage.robot
Resource  ../Common.robot

*** Keywords ***

################################### UserToNetPCSCF #####################################
Add UserToNetPCSCF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PnumPage.Go to PCSCF tab
	PCSCF_PnumPage.Go to PNUM section in PCSCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
	FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[43]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END

               Go to UserToNet section in Pnum tab
               Add UserToNet function      ${Info}
 
             IF    """${Info[43]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[43]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

# Add Invalid UserToNetPCSCF
    # [Arguments]  ${Scenarios}
    # ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    # LoginApp_SBC.#Navigate to Sign In Page
    # LoginApp_SBC.Attempt to Single Login   ${Login_single}
    # PCSCF_PnumPage.Go to PCSCF tab
	# PCSCF_PnumPage.Go to PNUM section in PCSCF tab
    # Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
	# FOR    ${Info}  IN  @{Scenarios}
    #     TRY
    #           Go to UserToNet section in Pnum tab
    #            Add Invalid UserToNet function      ${Info}
 
    #     EXCEPT    AS    ${error}
    #         Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
    #     END
    # END

Edit UserToNetPCSCF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PnumPage.Go to PCSCF tab
	PCSCF_PnumPage.Go to PNUM section in PCSCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
	FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[44]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END

           Go to UserToNet section in Pnum tab
               Edit UserToNet function      ${Info}
 
             IF    """${Info[44]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[44]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Delete UserToNetPCSCF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PnumPage.Go to PCSCF tab
	PCSCF_PnumPage.Go to PNUM section in PCSCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
	FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[6]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END

               Go to UserToNet section in Pnum tab
               Delete UserToNet function      ${Info}
 
             IF    """${Info[6]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[6]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END



Sort UserToNetPCSCF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PnumPage.Go to PCSCF tab
    PCSCF_PnumPage.Go to PNUM section in PCSCF tab
    PCSCF_PnumPage.Go to UserToNet section in Pnum tab
    Sort Element  Index
    Page Should Not Contain  Internal Server Error

View UserToNetPCSCF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PnumPage.Go to PCSCF tab
	PCSCF_PnumPage.Go to PNUM section in PCSCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
	FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[44]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               Go to UserToNet section in Pnum tab
               View UserToNet function       ${Info}
 
             IF    """${Info[44]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[44]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Filter UserToNetPCSCF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PnumPage.Go to PCSCF tab
	PCSCF_PnumPage.Go to PNUM section in PCSCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
	FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[22]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
                Go to UserToNet section in Pnum tab
               Filter UserToNet function      ${Info}
 
             IF    """${Info[22]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[22]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Filter Special Character UserToNetPCSCF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PnumPage.Go to PCSCF tab
	PCSCF_PnumPage.Go to PNUM section in PCSCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[11]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               Go to UserToNet section in Pnum tab
               Filter Special Charaters UserToNet function      ${Info}
 
             IF    """${Info[11]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[11]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END




################################ NetToUserPCSCF #####################################
Add NetToUserPCSCF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PnumPage.Go to PCSCF tab
	PCSCF_PnumPage.Go to PNUM section in PCSCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
	FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[43]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               Go to NetToUser section in Pnum tab
               Add UserToNet function      ${Info}
 
             IF    """${Info[43]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[43]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Sort NetToUserPCSCF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PnumPage.Go to PCSCF tab
    PCSCF_PnumPage.Go to PNUM section in PCSCF tab
    PCSCF_PnumPage.Go to NetToUser section in Pnum tab
    Sort Element  Index

View NetToUserPCSCF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PnumPage.Go to PCSCF tab
	PCSCF_PnumPage.Go to PNUM section in PCSCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
	FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[44]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               Go to NetToUser section in Pnum tab
               View UserToNet function       ${Info}
 
             IF    """${Info[44]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[44]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Filter NetToUserPCSCF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PnumPage.Go to PCSCF tab
	PCSCF_PnumPage.Go to PNUM section in PCSCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
	FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[44]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               Go to NetToUser section in Pnum tab
               Filter UserToNet function      ${Info}
 
             IF    """${Info[44]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[44]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Filter Special Character NetToUserPCSCF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PnumPage.Go to PCSCF tab
	PCSCF_PnumPage.Go to PNUM section in PCSCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[11]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               Go to NetToUser section in Pnum tab
               Filter Special Charaters UserToNet function      ${Info}
 
             IF    """${Info[11]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[11]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Edit NetToUserPCSCF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PnumPage.Go to PCSCF tab
	PCSCF_PnumPage.Go to PNUM section in PCSCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
	FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[44]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               Go to NetToUser section in Pnum tab
               Edit UserToNet function      ${Info}
 
             IF    """${Info[44]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[44]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Delete NetToUserPCSCF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PnumPage.Go to PCSCF tab
	PCSCF_PnumPage.Go to PNUM section in PCSCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
	FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[6]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               Go to NetToUser section in Pnum tab
               Delete UserToNet function      ${Info}
 
             IF    """${Info[6]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[6]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Add ExtensionPCSCF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PnumPage.Go to PCSCF tab
	PCSCF_PnumPage.Go to PNUM section in PCSCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
	FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[12]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               Go to Extension section in Pnum tab
               Add Extension function      ${Info}
 
             IF    """${Info[12]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[12]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END



Sort ExtensionPCSCF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PnumPage.Go to PCSCF tab
    PCSCF_PnumPage.Go to PNUM section in PCSCF tab
    PCSCF_PnumPage.Go to Extension section in Pnum tab
    Sort Element  Index

Filter ExtensionPCSCF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PnumPage.Go to PCSCF tab
	PCSCF_PnumPage.Go to PNUM section in PCSCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
	FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[11]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               Go to Extension section in Pnum tab
               Filter Extension function      ${Info}
 
             IF    """${Info[11]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[11]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Filter Special Character ExtensionPCSCF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PnumPage.Go to PCSCF tab
	PCSCF_PnumPage.Go to PNUM section in PCSCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[9]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               Go to Extension section in Pnum tab
               Filter Special Charaters Extension function      ${Info}
 
             IF    """${Info[9]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[9]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Edit ExtensionPCSCF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PnumPage.Go to PCSCF tab
	PCSCF_PnumPage.Go to PNUM section in PCSCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
	FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[11]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
	           Go to Extension section in Pnum tab
               Edit Extension function      ${Info}
 
             IF    """${Info[11]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[11]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Delete ExtensionPCSCF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PnumPage.Go to PCSCF tab
	PCSCF_PnumPage.Go to PNUM section in PCSCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
	FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[6]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               Go to Extension section in Pnum tab
               Delete Extension function      ${Info}
 
             IF    """${Info[6]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[6]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Add Local_areaPCSCF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PnumPage.Go to PCSCF tab
	PCSCF_PnumPage.Go to PNUM section in PCSCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
	FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[10]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               Go to Local_area section in Pnum tab
               Add Local_area function      ${Info}
 
             IF    """${Info[10]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[10]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Sort Local_areaPCSCF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PnumPage.Go to PCSCF tab
    PCSCF_PnumPage.Go to PNUM section in PCSCF tab
    PCSCF_PnumPage.Go to Local_area section in Pnum tab
    Sort Element  Local area prefix

Filter Local_areaPCSCF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PnumPage.Go to PCSCF tab
	PCSCF_PnumPage.Go to PNUM section in PCSCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
	FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[10]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
                Go to Local_area section in Pnum tab
               Filter Local_area function      ${Info}
 
             IF    """${Info[10]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[10]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Filter Special Character Local_areaPCSCF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PnumPage.Go to PCSCF tab
	PCSCF_PnumPage.Go to PNUM section in PCSCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[9]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               Go to Local_area section in Pnum tab
               Filter Special Charaters Local_area function      ${Info}
 
             IF    """${Info[9]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[9]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Edit Local_areaPCSCF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PnumPage.Go to PCSCF tab
	PCSCF_PnumPage.Go to PNUM section in PCSCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
	FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[10]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
                Go to Local_area section in Pnum tab
               Edit Local_area function      ${Info}
 
             IF    """${Info[10]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[10]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Delete Local_areaPCSCF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PnumPage.Go to PCSCF tab
	PCSCF_PnumPage.Go to PNUM section in PCSCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
	FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[8]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
              Go to Local_area section in Pnum tab
               Delete Local_area function      ${Info}
               Delete all Local_area function      ${Info}
 
             IF    """${Info[8]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[8]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


#################################################################################################################################
#                                                           ---FUNCTION---                                                      #
#################################################################################################################################


Add UserToNet function
    [Arguments]  ${Info}
    PCSCF_PnumPage.Add UserToNet  ${Info[4]}  ${Info[5]}   ${Info[6]}    ${Info[7]}    ${Info[8]}  ${Info[9]}   ${Info[10]}   ${Info[11]}     ${Info[12]}   ${Info[13]}   ${Info[14]}
    ...  ${Info[15]}  ${Info[16]}   ${Info[17]}    ${Info[18]}    ${Info[19]}  ${Info[20]}   ${Info[21]}   ${Info[22]}     ${Info[23]}   ${Info[24]}   ${Info[25]}
    ...  ${Info[26]}  ${Info[27]}   ${Info[28]}    ${Info[29]}    ${Info[30]}  ${Info[31]}   ${Info[32]}   ${Info[33]}     ${Info[34]}   ${Info[35]}   ${Info[36]}
    ...  ${Info[37]}  ${Info[38]}   ${Info[39]}    ${Info[40]}    ${Info[41]}
    Reload Page
    Verify Page Contains 2 Expected Elements     ${Info[4]}  ${Info[17]}

Add Invalid UserToNet function
    [Arguments]  ${Info}
    PCSCF_PnumPage.Add UserToNet  ${Info[4]}  ${Info[5]}   ${Info[6]}    ${Info[7]}    ${Info[8]}  ${Info[9]}   ${Info[10]}   ${Info[11]}     ${Info[12]}   ${Info[13]}   ${Info[14]}
    ...  ${Info[15]}  ${Info[16]}   ${Info[17]}    ${Info[18]}    ${Info[19]}  ${Info[20]}   ${Info[21]}   ${Info[22]}     ${Info[23]}   ${Info[24]}   ${Info[25]}
    ...  ${Info[26]}  ${Info[27]}   ${Info[28]}    ${Info[29]}    ${Info[30]}  ${Info[31]}   ${Info[32]}   ${Info[33]}     ${Info[34]}   ${Info[35]}   ${Info[36]}
    ...  ${Info[37]}  ${Info[38]}   ${Info[39]}    ${Info[40]}    ${Info[41]}
    Reload Page
    Verify Page Not Contains 2 Expected Elements     ${Info[4]}  ${Info[17]}

Verify errors in UserToNet rules function
    [Arguments]  ${Info}
    PCSCF_PnumPage.Add UserToNet  ${Info[4]}  ${Info[5]}   ${Info[6]}    ${Info[7]}    ${Info[8]}  ${Info[9]}   ${Info[10]}   ${Info[11]}     ${Info[12]}   ${Info[13]}   ${Info[14]}
        ...  ${Info[15]}  ${Info[16]}   ${Info[17]}    ${Info[18]}    ${Info[19]}  ${Info[20]}   ${Info[21]}   ${Info[22]}     ${Info[23]}   ${Info[24]}   ${Info[25]}
    ...  ${Info[26]}  ${Info[27]}   ${Info[28]}    ${Info[29]}    ${Info[30]}  ${Info[31]}   ${Info[32]}   ${Info[33]}     ${Info[34]}   ${Info[35]}   ${Info[36]}
    ...  ${Info[37]}  ${Info[38]}   ${Info[39]}    ${Info[40]}    ${Info[41]}
    Reload Page
    Verify Page Contains Error Message  ${Info[15]}

Edit UserToNet function
    [Arguments]  ${Info}
    PCSCF_PnumPage.Edit UserToNet  ${Info[4]}  ${Info[5]}   ${Info[6]}    ${Info[7]}    ${Info[8]}  ${Info[9]}   ${Info[10]}   ${Info[11]}     ${Info[12]}   ${Info[13]}   ${Info[14]}
    ...  ${Info[15]}  ${Info[16]}   ${Info[17]}    ${Info[18]}    ${Info[19]}  ${Info[20]}   ${Info[21]}   ${Info[22]}     ${Info[23]}   ${Info[24]}   ${Info[25]}
    ...  ${Info[26]}  ${Info[27]}   ${Info[28]}    ${Info[29]}    ${Info[30]}  ${Info[31]}   ${Info[32]}   ${Info[33]}     ${Info[34]}   ${Info[35]}   ${Info[36]}
    ...  ${Info[37]}  ${Info[38]}   ${Info[39]}    ${Info[40]}    ${Info[41]}  ${Info[42]}
    Reload Page
    Verify Page Contains 2 Expected Elements     ${Info[4]}  ${Info[7]}

Verify errors in edit UserToNet rules function
    [Arguments]  ${Info}
    PCSCF_PnumPage.Edit UserToNet  ${Info[4]}  ${Info[5]}   ${Info[6]}    ${Info[7]}    ${Info[8]}  ${Info[9]}   ${Info[10]}   ${Info[11]}     ${Info[12]}   ${Info[13]}   ${Info[14]}
    ...  ${Info[15]}  ${Info[16]}   ${Info[17]}    ${Info[18]}    ${Info[19]}  ${Info[20]}   ${Info[21]}   ${Info[22]}     ${Info[23]}   ${Info[24]}   ${Info[25]}
    ...  ${Info[26]}  ${Info[27]}   ${Info[28]}    ${Info[29]}    ${Info[30]}  ${Info[31]}   ${Info[32]}   ${Info[33]}     ${Info[34]}   ${Info[35]}   ${Info[36]}
    ...  ${Info[37]}  ${Info[38]}   ${Info[39]}    ${Info[40]}    ${Info[41]}  ${Info[42]}
    Verify Page Contains Error Message  ${Info[16]}

Delete UserToNet function
    [Arguments]   ${Info}
    Delete with 1 info  ${Info[4]}
    Verify Page Not Contains 1 Expect Elements  ${Info[4]}

View UserToNet function
    [Arguments]   ${Info}
    PCSCF_PnumPage.View UserToNet  ${Info[4]}  ${Info[5]}   ${Info[6]}    ${Info[7]}    ${Info[8]}  ${Info[9]}   ${Info[10]}   ${Info[11]}     ${Info[12]}   ${Info[13]}   ${Info[14]}
    ...    ${Info[17]}    ${Info[18]}    ${Info[19]}  ${Info[20]}   ${Info[21]}
    Back from View Page

Filter UserToNet function
    [Arguments]  ${Info}
    Filter 4 value           ${Info[4]}  ${Info[5]}  ${Info[18]}  ${Info[20]}

Filter Special Charaters UserToNet function
    [Arguments]  ${Info}
    Filter special character 4 value           ${Info[4]}  ${Info[5]}  ${Info[6]}   ${Info[7]}  ${Info[8]}  ${Info[9]}

Add Extension function
    [Arguments]   ${Info}
    PCSCF_PnumPage.Add Extension  ${Info[4]}  ${Info[5]}   ${Info[6]}    ${Info[7]}    ${Info[8]}  ${Info[9]}   ${Info[10]}
    Reload Page
    Verify Page Contains 1 Expected Elements     ${Info[5]}

Filter Extension function
    [Arguments]  ${Info}
    Filter 1 value           ${Info[4]}

Filter Special Charaters Extension function
    [Arguments]  ${Info}
    Filter special character 2 value           ${Info[4]}  ${Info[5]}  ${Info[6]}   ${Info[7]}

Edit Extension function
    [Arguments]   ${Info}
    PCSCF_PnumPage.Edit Extension  ${Info[4]}  ${Info[5]}   ${Info[6]}    ${Info[7]}    ${Info[8]}  ${Info[9]}
    Reload Page
    Verify Page Contains 1 Expected Elements     ${Info[4]}

Delete Extension function
    [Arguments]   ${Info}
    Delete with 1 info  ${Info[4]}
    Verify Page Not Contains 1 Expect Elements  ${Info[4]}

Add Local_area function
    [Arguments]   ${Info}
    PCSCF_PnumPage.Add Local_area  ${Info[4]}  ${Info[5]}
    Reload Page
    Verify Page Contains 2 Expected Elements LocalArea    ${Info[6]}   ${Info[5]}

Filter Local_area function
    [Arguments]  ${Info}
    Filter 2 value local area           ${Info[7]}  ${Info[8]}  ${Info[4]}   ${Info[5]}

Filter Special Charaters Local_area function
    [Arguments]  ${Info}
    Filter special character 2 value           ${Info[4]}  ${Info[5]}  ${Info[6]}   ${Info[7]}

Edit Local_area function
    [Arguments]   ${Info}
    PCSCF_PnumPage.Edit Local_area  ${Info[4]}  ${Info[5]}  ${Info[6]}
    Reload Page
    Verify Page Contains 2 Expected Elements LocalArea    ${Info[4]}   ${Info[6]}

Delete Local_area function
    [Arguments]   ${Info}
    Delete with 1 info Local_area   ${Info[4]}   
    Reload Page
    Verify Page Not Contains 2 Expect Elements  ${Info[4]}     ${Info[5]}

Delete all Local_area function
    [Arguments]   ${Info}
    Click Element       ${Delete_All_Button}
    Sleep  5s
    Click Element       ${Confirm_Del}
    Reload Page
    Verify Page Not Contains 1 Expect Elements  ${Info[5]}
    Verify Page Not Contains 1 Expect Elements  ${Info[6]}