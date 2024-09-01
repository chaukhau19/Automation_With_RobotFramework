*** Settings ***
Resource  ../Admin/LoginApp_SBC.robot
Resource  ./PO/Media_ProxyPage.robot
Resource  ../Admin/PO/UserManagerPage.robot
Resource  ../Common.robot

*** Variables ***

*** Keywords ***

################################  Forwarder #############################################
Add Forwarder
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    Media_ProxyPage.Go to Media Proxy tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[7]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               Go to Forwarder section in Media Proxy tab
               Add forwarder function      ${Info}
 
             IF    """${Info[7]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[7]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Delete Forwarder
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    Media_ProxyPage.Go to Media Proxy tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[7]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               Go to Forwarder section in Media Proxy tab
               Delete function      ${Info}
 
             IF    """${Info[7]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[7]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Sort Forwarder
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
	Media_ProxyPage.Go to Media Proxy tab
    Media_ProxyPage.Go to Forwarder section in Media Proxy tab
    Sort Element  Name
    Page Should Not Contain  Internal Server Error

Filter Forwarder
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
	Media_ProxyPage.Go to Media Proxy tab
    Media_ProxyPage.Go to Forwarder section in Media Proxy tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[7]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               Filter Forwarder function      ${Info}
 
             IF    """${Info[7]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[7]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Filter Special Character Forwarder
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
	Media_ProxyPage.Go to Media Proxy tab
    Media_ProxyPage.Go to Forwarder section in Media Proxy tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[9]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               Filter Special Charaters Forwarder function      ${Info}
 
             IF    """${Info[9]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[9]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END



####################################### ICMP Check ##########################################
Add ICMP Check
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    Media_ProxyPage.Go to Media Proxy tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[13]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               Go to ICMP section in Media Proxy tab
               Add icmp function      ${Info}
 
             IF    """${Info[13]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[13]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Delete ICMP Check
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    Media_ProxyPage.Go to Media Proxy tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[13]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               Go to ICMP section in Media Proxy tab
               Delete function      ${Info}
 
             IF    """${Info[13]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[13]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Sort ICMP
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
	Media_ProxyPage.Go to Media Proxy tab
    Media_ProxyPage.Go to ICMP section in Media Proxy tab
    Sort Element  Name

Filter ICMP
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
	Media_ProxyPage.Go to Media Proxy tab
    Media_ProxyPage.Go to ICMP section in Media Proxy tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[7]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               Filter ICMP function      ${Info}
 
             IF    """${Info[7]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[7]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Filter Special Character ICMP
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
	Media_ProxyPage.Go to Media Proxy tab
    Media_ProxyPage.Go to Forwarder section in Media Proxy tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[9]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               Filter Special Charaters ICMP function      ${Info}
 
             IF    """${Info[9]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[9]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


############################################ VNIC #########################################################

Add Valid VNIC 
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    Media_ProxyPage.Go to Media Proxy tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[18]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
                    Go to VNIC section in Media Proxy tab
                    Add Valid VNIC function       ${Info}
                    View VNIC function     ${Info}

            IF    """${Info[18]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[18]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Add Invalid VNIC 
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    Media_ProxyPage.Go to Media Proxy tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[19]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               Go to VNIC section in Media Proxy tab
               Add Invalid VNIC function       ${Info}

           IF    """${Info[19]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[19]}

        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

View Valid VNIC 
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    Media_ProxyPage.Go to Media Proxy tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[18]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               Go to VNIC section in Media Proxy tab
               View VNIC function Have Next Page      ${Info}

            IF    """${Info[18]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[18]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END



Edit Valid VNIC 
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    Media_ProxyPage.Go to Media Proxy tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[18]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END        
               Go to VNIC section in Media Proxy tab
               Edit Valid VNIC function       ${Info}
               View VNIC function  ${Info}

            IF    """${Info[18]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[18]}

        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Edit Invalid VNIC 
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    Media_ProxyPage.Go to Media Proxy tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[19]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END   
               Go to VNIC section in Media Proxy tab
               Edit Invalid VNIC function      ${Info}

            IF    """${Info[19]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[19]}

        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Delete VNIC 
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    Media_ProxyPage.Go to Media Proxy tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY

            IF    """${Info[18]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END   
               Go to VNIC section in Media Proxy tab
               Delete VNIC function       ${Info}
               
            IF    """${Info[18]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[18]}

        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Sort VNIC 
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
	Media_ProxyPage.Go to Media Proxy tab
    Media_ProxyPage.Go to VNIC section in Media Proxy tab
    Sort Element  Name

Filter VNIC 
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
	Media_ProxyPage.Go to Media Proxy tab
    Media_ProxyPage.Go to VNIC section in Media Proxy tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY

            IF    """${Info[18]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END        
               Filter VNIC function      ${Info}

            IF    """${Info[18]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[18]}

        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Filter Special Character VNIC 
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
	Media_ProxyPage.Go to Media Proxy tab
    Media_ProxyPage.Go to Forwarder section in Media Proxy tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[9]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               Filter Special Charaters VNIC function      ${Info}
 
             IF    """${Info[9]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[9]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


#################################################################################################################################
#                                                           ---FUNCTION---                                                      #
#################################################################################################################################


######## forwarder #########

Add forwarder function
    [Arguments]  ${Info}
    Media_ProxyPage.Add MPForwarder    ${Info[4]}     ${Info[5]}
    Reload Page
    Verify Page Contains 2 Expected Elements     ${Info[4]}   ${Info[5]}

Delete function
    [Arguments]  ${Info}
    Delete with 1 info  ${Info[4]}
    Verify Page Not Contains 1 Expect Elements  ${Info[4]}

Filter Forwarder function
    [Arguments]  ${Info}
    Click Element       ${Forwarder_section}
    Sleep   1s
    Filter 2 value           ${Info[4]}  ${Info[5]}

Filter Special Charaters Forwarder function
    [Arguments]  ${Info}
    Click Element       ${Forwarder_section}
    Sleep   1s
    Filter special character 2 value           ${Info[4]}  ${Info[5]}  ${Info[6]}   ${Info[7]}


######## icmp #########
Add icmp function
    [Arguments]  ${Info}
    Media_ProxyPage.Add ICMP    ${Info[4]}  ${Info[5]}  ${Info[6]}  ${Info[7]}  ${Info[8]}   ${Info[9]}  ${Info[10]}   ${Info[11]}
    Reload Page
    Verify Page Contains 2 Expected Elements     ${Info[4]}   ${Info[5]}

Filter ICMP function
    [Arguments]  ${Info}
    Click Element       ${ICMP_section}
    Sleep   1s
    Filter 2 value           ${Info[4]}  ${Info[5]}

Filter Special Charaters ICMP function
    [Arguments]  ${Info}
    Click Element       ${ICMP_section}
    Sleep   1s
    Filter special character 2 value           ${Info[4]}  ${Info[5]}  ${Info[6]}   ${Info[7]}

###### VNIC #########
Add Valid VNIC function 
    [Arguments]  ${Info}
    Media_ProxyPage.Add MPVNIC     ${Info[4]}  ${Info[5]}  ${Info[6]}  ${Info[7]}  ${Info[8]}   ${Info[9]}  ${Info[10]}   ${Info[11]}  ${Info[12]}  ${Info[15]}
    Run Keyword If      '${Info[14]}' == 'blocked'     Run Keywords       Click Edit Element With 1 Info     ${Info[13]}   AND  Sleep   3s
    ...        AND   Click Element   //button[@value="Block"]   AND    Sleep   10s
    Reload Page
    Verify Page Contains 4 Expected Elements    ${Info[13]}  ${Info[5]}   ${Info[4]}  ${Info[14]}

Add Invalid VNIC function 
    [Arguments]  ${Info}
    Media_ProxyPage.Add MPVNIC    ${Info[4]}  ${Info[5]}  ${Info[6]}  ${Info[7]}  ${Info[8]}   ${Info[9]}  ${Info[10]}   ${Info[11]}  ${Info[12]}  ${Info[15]}
    Verify Page Contains Error Message     ${Info[16]}
    Run Keyword If  '${Info[16]}' != '#BLANK'    Run Keywords       Click Element       ${Close_Notify_Not_Available}
    ...    AND    Click Element        ${VNIC_section}


Edit Valid VNIC function 
    [Arguments]  ${Info}
    Media_ProxyPage.Edit MPVNIC    ${Info[9]}  ${Info[10]}   ${Info[11]}  ${Info[12]}  ${Info[13]}
    Reload Page
    Verify Page Contains 4 Expected Elements    ${Info[13]}  ${Info[5]}   ${Info[4]}  ${Info[14]}

Edit Invalid VNIC function 
    [Arguments]  ${Info}
    Media_ProxyPage.Edit MPVNIC    ${Info[9]}  ${Info[10]}   ${Info[11]}  ${Info[12]}  ${Info[13]}
    Verify Page Contains Error Message     ${Info[16]}
    Run Keyword If  '${Info[16]}' != '#BLANK'    Run Keywords       Click Element       ${Close_Notify_Not_Available}
    ...    AND    Click Element        ${VNIC_section}

Delete VNIC function 
    [Arguments]  ${Info}
    Delete with 1 info for Media  ${Info[13]}
    Verify Page Not Contains 4 Expect Elements   ${Info[13]}   ${Info[5]}   ${Info[4]}  ${Info[14]}

Filter VNIC function 
    [Arguments]  ${Info}
    Click Element       ${VNIC_section}
    Sleep   1s
    Filter 3 value           ${Info[5]}_${Info[6]}  ${Info[5]}  ${Info[4]}  

Filter Special Charaters VNIC function 
    [Arguments]  ${Info}
    Click Element       ${VNIC_section}
    Sleep   1s
    Filter special character 2 value           ${Info[4]}  ${Info[5]}  ${Info[6]}   ${Info[7]}


View VNIC function 
    [Arguments]  ${Info}
    Media_ProxyPage.View MPVNIC    ${Info[4]}  ${Info[5]}  ${Info[6]}  ${Info[7]}  ${Info[8]}  ${Info[9]}   ${Info[10]}  ${Info[11]}  ${Info[12]}  ${Info[13]}
    Back from View Page

View VNIC function Have Next Page 
    [Arguments]  ${Info}
    Media_ProxyPage.View MPVNIC Have Next Page    ${Info[4]}  ${Info[5]}  ${Info[6]}  ${Info[7]}  ${Info[8]}  ${Info[9]}   ${Info[10]}  ${Info[11]}  ${Info[12]}  ${Info[13]}
    Back from View Page