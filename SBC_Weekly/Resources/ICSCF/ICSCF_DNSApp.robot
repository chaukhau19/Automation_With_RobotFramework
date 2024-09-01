*** Settings ***
Resource  ../../Resources/Admin/LoginApp_SBC.robot
Resource  ./PO/ICSCF_DNSPage.robot
Resource  ../Admin/PO/UserManagerPage.robot
Resource  ../Common.robot

*** Keywords ***

Edit
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    Go to ICSCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[18]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               Go to DNS section in ICSCF tab
               Go to Configuration section in DNS tab
               Go to Configuration section in Configuration tab
               Edit DNS function        ${Info}
 
             IF    """${Info[18]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[18]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Edit DNS function
    [Arguments]  ${Info}
    ICSCF_DNSPage.Edit DNS   ${Info[4]}  ${Info[5]}  ${Info[6]}  ${Info[7]}  ${Info[8]}  ${Info[9]}  ${Info[10]}  ${Info[11]}
    ...   ${Info[12]}  ${Info[13]}  ${Info[14]}  ${Info[15]}  ${Info[16]}
    Verify Page Contains 2 Expected Elements DNS  Key Out  ${Info[4]}
    Verify Page Contains 2 Expected Elements DNS  Key In  ${Info[5]}
    Verify Page Contains 2 Expected Elements DNS  Time Wait For DNS  ${Info[6]}
    Verify Page Contains 2 Expected Elements DNS  Use DNS For Via FQDN  ${Info[7]}
    Verify Page Contains 2 Expected Elements DNS  Use Caching  ${Info[8]}
    Verify Page Contains 2 Expected Elements DNS  Caching Time  ${Info[9]}
    Verify Page Contains 2 Expected Elements DNS  Blacklisting  ${Info[10]}
    Verify Page Contains 2 Expected Elements DNS  Refuse Call  ${Info[12]}
    Verify Page Contains 2 Expected Elements DNS  Reason Code  ${Info[13]}
    Verify Page Contains 2 Expected Elements DNS  Blacklist Time  ${Info[11]}
    Verify Page Contains 2 Expected Elements DNS  SNMP  ${Info[15]}
    Verify Page Contains 2 Expected Elements DNS  SRV Only  ${Info[16]}

Add Valid Cases
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    ICSCF_DNSPage.Go to ICSCF tab
    Go to DNS section in ICSCF tab
    Go to Configuration section in DNS tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[11]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               Go to Resolver section in Configuration tab
               Add resolver function        ${Info}
                 ICSCF_DNSPage.View resolver          ${Info[4]}  ${Info[5]}  ${Info[6]}  ${Info[7]}  ${Info[8]}  ${Info[9]}

             IF    """${Info[11]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[11]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Add Invalid Cases
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    ICSCF_DNSPage.Go to ICSCF tab
    Go to DNS section in ICSCF tab
    Go to Configuration section in DNS tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[12]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               Go to Resolver section in Configuration tab
               Verify error message resolver invalid add  ${Info}
 
             IF    """${Info[12]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[12]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Filter Cases
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    ICSCF_DNSPage.Go to ICSCF tab
    Go to DNS section in ICSCF tab
    Go to Configuration section in DNS tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[9]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               Go to Resolver section in Configuration tab
               Filter resolver function     ${Info}
 
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
    ICSCF_DNSPage.Go to ICSCF tab
    Go to DNS section in ICSCF tab
    Go to Configuration section in DNS tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[11]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               Go to Resolver section in Configuration tab
               Filter special character resolver function     ${Info}
 
             IF    """${Info[11]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[11]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

View Cases
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    ICSCF_DNSPage.Go to ICSCF tab
    Go to DNS section in ICSCF tab
    Go to Configuration section in DNS tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[13]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               Go to Resolver section in Configuration tab
               View resolver function     ${Info}
 
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
    ICSCF_DNSPage.Go to ICSCF tab
    Go to DNS section in ICSCF tab
    Go to Configuration section in DNS tab
    Go to Resolver section in Configuration tab
    Sort Element  FQDN
    Sort Element  IP
    Sort Element  Port
    Sort Element  Protocol
    Page Should Not Contain  Internal Server Error


Edit Valid Cases
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    ICSCF_DNSPage.Go to ICSCF tab
    ICSCF_DNSPage.Go to DNS section in ICSCF tab
    Go to Configuration section in DNS tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[13]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               Go to Resolver section in Configuration tab
               Edit resolver function       ${Info}
 
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
    ICSCF_DNSPage.Go to ICSCF tab
    Go to DNS section in ICSCF tab
    Go to Configuration section in DNS tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[12]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               Go to Resolver section in Configuration tab
               Verify error message resolver invalid edit  ${Info}
 
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
    ICSCF_DNSPage.Go to ICSCF tab
    Go to DNS section in ICSCF tab
    Go to Configuration section in DNS tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[9]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               Go to Resolver section in Configuration tab
               Delete resolver function       ${Info}
 
             IF    """${Info[9]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[9]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


#################################################################################################################################
#                                                           ---FUNCTION---                                                      #
#################################################################################################################################

Add resolver function
    [Arguments]  ${Info}
    ICSCF_DNSPage.Add resolver                      ${Info[4]}  ${Info[5]}  ${Info[6]}  ${Info[7]}  ${Info[8]}  ${Info[9]}
    Common.Verify Page Contains 4 Expected Elements     ${Info[4]}  ${Info[5]}  ${Info[6]}   ${Info[7]}

Filter resolver function
    [Arguments]  ${Info}
    Common.Filter 4 value                ${Info[4]}  ${Info[5]}   ${Info[6]}  ${Info[7]}

Filter special character resolver function
    [Arguments]  ${Info}
    Common.Filter special character 4 value           ${Info[4]}  ${Info[5]}  ${Info[6]}  ${Info[7]}  ${Info[8]}  ${Info[9]}

View resolver function
    [Arguments]  ${Info}
    ICSCF_DNSPage.View resolver          ${Info[4]}  ${Info[5]}  ${Info[6]}  ${Info[7]}  ${Info[8]}  ${Info[9]}


Edit resolver function
    [Arguments]  ${Info}
    ICSCF_DNSPage.Edit resolver                   ${Info[4]}     ${Info[5]}   ${Info[6]}  ${Info[7]}   ${Info[10]}     ${Info[11]}
    Verify Page Contains 4 Expected Elements     ${Info[4]}     ${Info[5]}   ${Info[6]}  ${Info[7]}

Delete resolver function
    [Arguments]  ${Info}
    Delete with 3 info                      ${Info[4]}      ${Info[5]}   ${Info[6]}
    Verify Page Not Contains 3 Expected Elements     ${Info[4]}      ${Info[5]}   ${Info[6]}


Verify error message resolver invalid add
    [Arguments]  ${Info}
    ICSCF_DNSPage.Add resolver                   ${Info[4]}  ${Info[5]}  ${Info[6]}    ${Info[7]}  ${Info[8]}  ${Info[9]}
    Verify Page Contains Error Message       ${Info[10]}
    ICSCF_DNSPage.Cancel invalid add

Verify error message resolver invalid edit
    [Arguments]  ${Info}
    ICSCF_DNSPage.Edit resolver                   ${Info[4]}     ${Info[5]}  ${Info[6]}   ${Info[7]}   ${Info[8]}     ${Info[9]}
    Verify Page Contains Error Message     ${Info[10]}
    ICSCF_DNSPage.Cancel invalid add
