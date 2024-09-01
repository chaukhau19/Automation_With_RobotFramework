*** Settings ***
Library  SeleniumLibrary
Resource  ../../Resources/Admin/LoginApp_SBC.robot
Resource  ./PO/PCSCF_PeerPage.robot
Resource  ../Admin/PO/UserManagerPage.robot
Resource  ../Common.robot

*** Keywords ***

############################ MatchingRules #################################
Add MatchingRules
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
     Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[27]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               Add Matching function      ${Info}
 
              IF    """${Info[27]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[27]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Edit MatchingRules
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[27]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               Edit Matching function      ${Info}
 
             IF    """${Info[27]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[27]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Delete MatchingRules
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[28]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               Delete Matching function      ${Info}
 
             IF    """${Info[28]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[28]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

# Add Invalid MatchingRules
#     [Arguments]  ${Scenarios}
#     ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
#     #LoginApp_SBC.#Navigate to Sign In Page
#     LoginApp_SBC.Attempt to Single Login   ${Login_single}
#     PCSCF_PeerPage.Go to Peer section in PCSCF tab
#     FOR    ${Info}  IN  @{Scenarios}
#         TRY
#                Verify errors in matching rules function      ${Info}
 
#         EXCEPT    AS    ${error}
#             Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
#         END
#     END

# Edit Invalid MatchingRules
#     [Arguments]  ${Scenarios}
#     ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
#     #LoginApp_SBC.#Navigate to Sign In Page
#     LoginApp_SBC.Attempt to Single Login   ${Login_single}
#     PCSCF_PeerPage.Go to Peer section in PCSCF tab
#     FOR    ${Info}  IN  @{Scenarios}
#         TRY
#                Verify errors in edit matching rules function      ${Info}

#         EXCEPT    AS    ${error}
#             Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
#         END
#     END



Sort MatchingRules
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    Click Element       ${MatchingRule}
    Sleep   1s
    Sort Element  Matching rule name
    Sort Element  Header name

View MatchingRules
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[27]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               View Matching rules function      ${Info}
 
             IF    """${Info[27]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[27]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Filter MatchingRules
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[27]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               Filter Matching rules function      ${Info}
 
             IF    """${Info[27]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[27]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Filter Special Character MatchingRules
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[9]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               Filter Special Charaters Matching rules function      ${Info}
 
             IF    """${Info[9]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[9]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END






###################################### ManiRules ###################################################
Add ManiRules
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[42]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               Add Manipulation Rules function      ${Info}
 
             IF    """${Info[42]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[42]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Edit ManiRules
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[42]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               Edit Manipulation Rules function      ${Info}
 
             IF    """${Info[42]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[42]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Delete ManiRules
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[42]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               Delete Manipulation Rules function      ${Info}
 
             IF    """${Info[42]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[42]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Sort ManiRules
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    Click Element       ${ManiRule}
    Sleep   1s
    Sort Element  Manipulation rule name
    Sort Element  Header name
    Page Should Not Contain  Internal Server Error

View ManiRules
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[42]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               View Manipulation rules function      ${Info}
 
             IF    """${Info[42]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[42]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Filter ManiRules
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[42]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               Filter Manipulation rules function      ${Info}
 
             IF    """${Info[42]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[42]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Filter Special Character ManiRules
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[11]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               Filter Special Charaters Manipulation rules function      ${Info}
 
             IF    """${Info[11]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[11]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END




##################################### HeaderAuthProfiles ############################################
Add Valid HeaderAuthProfiles
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[15]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               Add Valid Header Authorization Profiles function      ${Info}
               Add And Then View Header Authorization Profiles function           ${Info}
 
             IF    """${Info[15]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[15]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Add Invalid HeaderAuthProfiles
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[18]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               Add Invalid Header Authorization Profiles function      ${Info}
 
             IF    """${Info[18]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[18]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Delete HeaderAuthProfiles
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[14]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
            Delete Header Authorization Profiles function      ${Info}
 
             IF    """${Info[14]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[14]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Sort HeaderAuthProfiles
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    Click Element       ${HAP_Field}
    Sleep   1s
    Sort Element  Name
    Sort Element  Policy
    Sort Element  Method type

View HeaderAuthProfiles
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[14]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               View Header Authorization Profiles function      ${Info}
 
             IF    """${Info[14]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[14]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Filter HeaderAuthProfiles
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[8]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               Filter Header Authorization Profiles function      ${Info}
 
             IF    """${Info[8]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[8]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Filter Special Character HeaderAuthProfiles
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[10]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               Filter Special Charaters Header Authorization Profiles function      ${Info}
 
             IF    """${Info[10]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[10]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END



######################### AuthProfiles ################################
Add AuthProfiles
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[24]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
                    Add Authorization Profiles function      ${Info}
 
             IF    """${Info[24]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[24]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Add Invalid AuthProfiles
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[24]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
                    Add Invalid Authorization Profiles function      ${Info}
 
             IF    """${Info[24]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[24]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Edit AuthProfiles
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[25]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
            Edit Authorization Profiles function      ${Info}
 
             IF    """${Info[25]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[25]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Delete AuthProfiles
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[7]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
            Delete Authorization Profiles function      ${Info}
 
             IF    """${Info[7]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[7]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Sort AuthProfiles
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    Click Element       ${AP_Field}
    Sleep   1s
    Sort Element  Index
    Sort Element  Default authorization

View AuthProfiles
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[7]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               View Authorization Profiles function      ${Info}
 
             IF    """${Info[7]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[7]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Filter AuthProfiles
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[7]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               Filter Authorization Profiles function      ${Info}
 
             IF    """${Info[7]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[7]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Filter Special Character AuthProfiles
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[11]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               Filter Special Charaters Authorization Profiles function      ${Info}
 
             IF    """${Info[11]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[11]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

# Add RoutingProfiles
#     [Arguments]  ${Scenarios}
#     ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
#     #LoginApp_SBC.#Navigate to Sign In Page
#     LoginApp_SBC.Attempt to Single Login   ${Login_single}
#     PCSCF_PeerPage.Go to Peer section in PCSCF tab
#     Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
  #  FOR    ${Info}  IN  @{Scenarios}
#         TRY
#             Add Routing Profiles function      ${Info}
 
#         EXCEPT    AS    ${error}
#             Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
#         END
#     END


# Edit RoutingProfiles
#     [Arguments]  ${Scenarios}
#     ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
#     #LoginApp_SBC.#Navigate to Sign In Page
#     LoginApp_SBC.Attempt to Single Login   ${Login_single}
#     PCSCF_PeerPage.Go to Peer section in PCSCF tab
#     Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
  #  FOR    ${Info}  IN  @{Scenarios}
#         TRY
#             Edit Routing Profiles function      ${Info}
 
#         EXCEPT    AS    ${error}
#             Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
#         END
#     END


# Delete RoutingProfiles
#     [Arguments]  ${Scenarios}
#     ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
#     #LoginApp_SBC.#Navigate to Sign In Page
#     LoginApp_SBC.Attempt to Single Login   ${Login_single}
#     PCSCF_PeerPage.Go to Peer section in PCSCF tab
#     Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
   # FOR    ${Info}  IN  @{Scenarios}
#         TRY
#             Delete Routing Profiles function      ${Info}
 
#         EXCEPT    AS    ${error}
#             Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
#         END
#     END

################################## HeaderManipulation #########################################
Add HeaderManipulation
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[50]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
            Add Header Manipulation function      ${Info}
 
             IF    """${Info[50]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[50]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Edit HeaderManipulation
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[50]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
            Edit Header Manipulation function      ${Info}
 
             IF    """${Info[50]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[50]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Delete HeaderManipulation
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[50]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
            Delete Header Manipulation function      ${Info}
 
             IF    """${Info[50]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[50]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Sort HeaderManipulation
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    Click Element       ${HM_Field}
    Sleep   1s
    Sort Element  SIP manipulation profile
    Sort Element  Processing order

View HeaderManipulation
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[50]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               View Header Manipulation function      ${Info}
 
             IF    """${Info[50]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[50]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Filter HeaderManipulation
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[50]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               Filter Header Manipulation function      ${Info}
 
             IF    """${Info[50]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[50]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Filter Special Character HeaderManipulation
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[11]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               Filter Special Charaters Header Manipulation function      ${Info}
 
             IF    """${Info[11]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[11]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

# Add SDPProfile
#     [Arguments]  ${Scenarios}
#     ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
#     #LoginApp_SBC.#Navigate to Sign In Page
#     LoginApp_SBC.Attempt to Single Login   ${Login_single}
#     PCSCF_PeerPage.Go to Peer section in PCSCF tab
#     Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
  #  FOR    ${Info}  IN  @{Scenarios}
#         TRY
#             Add SDP Profile function      ${Info}
 
#         EXCEPT    AS    ${error}
#             Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
#         END
#     END


# Edit SDPProfile
#     [Arguments]  ${Scenarios}
#     ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
#     #LoginApp_SBC.#Navigate to Sign In Page
#     LoginApp_SBC.Attempt to Single Login   ${Login_single}
#     PCSCF_PeerPage.Go to Peer section in PCSCF tab
#     Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
   # FOR    ${Info}  IN  @{Scenarios}
#         TRY
#             Edit SDP Profile function      ${Info}
 
#         EXCEPT    AS    ${error}
#             Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
#         END
#     END


# Delete SDPProfile
#     [Arguments]  ${Scenarios}
#     ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
#     #LoginApp_SBC.#Navigate to Sign In Page
#     LoginApp_SBC.Attempt to Single Login   ${Login_single}
#     PCSCF_PeerPage.Go to Peer section in PCSCF tab
#     Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
  #  FOR    ${Info}  IN  @{Scenarios}
#         TRY
#             Delete SDP Profile function      ${Info}
 
#         EXCEPT    AS    ${error}
#             Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
#         END
#     END


# Add SessionLimiter
#     [Arguments]  ${Scenarios}
#     ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
#     #LoginApp_SBC.#Navigate to Sign In Page
#     LoginApp_SBC.Attempt to Single Login   ${Login_single}
#     PCSCF_PeerPage.Go to Peer section in PCSCF tab
#     Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
   # FOR    ${Info}  IN  @{Scenarios}
#         TRY
#             Add Session Limiter function      ${Info}
 
#         EXCEPT    AS    ${error}
#             Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
#         END
#     END


# Edit SessionLimiter
#     [Arguments]  ${Scenarios}
#     ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
#     #LoginApp_SBC.#Navigate to Sign In Page
#     LoginApp_SBC.Attempt to Single Login   ${Login_single}
#     PCSCF_PeerPage.Go to Peer section in PCSCF tab
#     Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
  #  FOR    ${Info}  IN  @{Scenarios}
#         TRY
#             Edit Session Limiter function      ${Info}
 
#         EXCEPT    AS    ${error}
#             Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
#         END
#     END


# Delete SessionLimiter
#     [Arguments]  ${Scenarios}
#     ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
#     #LoginApp_SBC.#Navigate to Sign In Page
#     LoginApp_SBC.Attempt to Single Login   ${Login_single}
#     PCSCF_PeerPage.Go to Peer section in PCSCF tab
#     Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
 #   FOR    ${Info}  IN  @{Scenarios}
#         TRY
#             Delete Session Limiter function      ${Info}
 
#         EXCEPT    AS    ${error}
#             Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
#         END
#     END



################################# SessionControl #########################################



Add SessionControl 
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[20]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
            Add Session Control function      ${Info}
 
             IF    """${Info[20]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[20]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Edit SessionControl 
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[38]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
            Edit Session Control function      ${Info}
 
             IF    """${Info[38]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[38]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Delete SessionControl
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[26]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
            Delete Session Control function      ${Info}
 
             IF    """${Info[26]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[26]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END



Sort SessionControl
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    Click Element       ${SC_Field}
    Sleep   1s
    Sort Element  Name

View SessionControl
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[38]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               View Session Control function      ${Info}
 
             IF    """${Info[38]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[38]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Filter SessionControl
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[38]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               Filter Session Control function      ${Info}
 
             IF    """${Info[38]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[38]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Filter Special Character SessionControl
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[9]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               Filter Special Charaters Session Control function      ${Info}
 
             IF    """${Info[9]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[9]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END





########################### UAPCSCF ######################################
Add UAPCSCF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[30]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
            Add User Agent function      ${Info}
 
             IF    """${Info[30]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[30]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Edit UAPCSCF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[30]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
            Edit User Agent function      ${Info}
 
             IF    """${Info[30]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[30]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Delete UAPCSCF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[30]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
            Delete User Agent function      ${Info}
 
             IF    """${Info[30]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[30]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Sort UAPCSCF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    Click Element       ${UA_Field}
    Sleep   1s
    Sort Element  UA profile

View UAPCSCF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[30]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               View User Agent function      ${Info}
 
             IF    """${Info[30]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[30]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Filter UAPCSCF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[30]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               Filter User Agent function      ${Info}
 
             IF    """${Info[30]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[30]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Filter Special Character UAPCSCF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[9]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               Filter Special Charaters User Agent function      ${Info}
 
             IF    """${Info[9]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[9]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END




############################### PCRF ###################################
Add PCRF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[12]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
            Add PCRF function      ${Info}
 
             IF    """${Info[12]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[12]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Edit PCRF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[12]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
            Edit PCRF function      ${Info}
 
             IF    """${Info[12]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[12]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Delete PCRF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[12]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
            Delete PCRF function      ${Info}
 
             IF    """${Info[12]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[12]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Sort PCRF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    Scroll Element Into View    ${While_Label}
    Sleep       1s
    Click Element       ${PCRF_Field}
    Sleep   1s
    Sort Element  ID


View PCRF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[12]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               View PCRF function      ${Info}
 
             IF    """${Info[12]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[12]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Filter PCRF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[12]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               Filter PCRF function      ${Info}
 
             IF    """${Info[12]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[12]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Filter Special Character PCRF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[7]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               Filter Special Charaters PCRF function      ${Info}
 
             IF    """${Info[7]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[7]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END




###################### PHF ########################

Add PHF 
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[24]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
            Add PHF function      ${Info}
 
             IF    """${Info[24]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[24]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END



Edit PHF 
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[24]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
            Edit PHF function     ${Info}
 
             IF    """${Info[24]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[24]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Delete PHF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[22]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
            Delete PHF function      ${Info}
 
             IF    """${Info[22]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[22]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END



Sort PHF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    Scroll Element Into View    ${While_Label}
    Sleep       1s
    Click Element       ${PHF_Field}
    Sleep   1s
    Sort Element  Name

View PHF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[24]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               View PHF function      ${Info}
 
             IF    """${Info[24]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[24]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Filter PHF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[24]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               Filter PHF function      ${Info}
 
             IF    """${Info[24]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[24]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Filter Special Character PHF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[9]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               Filter Special Charaters PHF function      ${Info}
 
             IF    """${Info[9]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[9]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END



############################# PeerPCSCF #################################

Add PeerPCSCF 
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[51]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
                Add PeerPCSCF function     ${Info}
 
             IF    """${Info[51]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[51]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Edit PeerPCSCF 
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[51]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
                    Edit PeerPCSCF function       ${Info}
                    PCSCF_PeerPage.View Peer   ${Info[4]}  ${Info[5]}  ${Info[24]}  ${Info[35]}  ${Info[49]}
                    Back from View Page
                    
             IF    """${Info[51]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[51]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Delete PeerPCSCF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[45]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
            Delete PeerPCSCF function      ${Info}
 
             IF    """${Info[45]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[45]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Sort PeerPCSCF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    Click Element       ${Peer_Field}
    Sleep   1s
    Sort Element  Name
    Sort Element  Domain

View PeerPCSCF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[51]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
                       View PeerPCSCF function      ${Info}
 
             IF    """${Info[51]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[51]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Filter PeerPCSCF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[51]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               Filter PeerPCSCF function      ${Info}
 
             IF    """${Info[51]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[51]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Filter Special Character PeerPCSCF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[10]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               Filter Special Charaters PeerPCSCF function      ${Info}
 
             IF    """${Info[10]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[10]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END



############################# RFC4028 ##################################
Add Valid RFC4028
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[16]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
                    Add Valid RFC4028 function      ${Info}
 
             IF    """${Info[16]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[16]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Add Invalid RFC4028
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[17]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               Add invalid RFC4028 function      ${Info}
               Verify Page Contains Error Message     ${Info[15]}
 
             IF    """${Info[17]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[17]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Edit Valid RFC4028
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[16]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               Edit Valid RFC4028 function      ${Info}
 
             IF    """${Info[16]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[16]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Edit Invalid RFC4028
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[17]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               Edit invalid RFC4028 function          ${Info}
               Verify Page Contains Error Message     ${Info[15]}
 
             IF    """${Info[17]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[17]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

    

#################################################################################################################################
#                                                           ---FUNCTION---                                                      #
#################################################################################################################################

Add PeerPCSCF function 
    [Arguments]  ${Info}
    PCSCF_PeerPage.Add Peer  ${Info[4]}  ${Info[5]}   ${Info[6]}    ${Info[7]}    ${Info[8]}  ${Info[9]}   ${Info[10]}  ${Info[11]}
    ...    ${Info[12]}    ${Info[13]}    ${Info[14]}   ${Info[15]}    ${Info[16]}    ${Info[17]}   ${Info[18]}  ${Info[19]}
    ...    ${Info[20]}    ${Info[21]}    ${Info[22]}    ${Info[23]}   ${Info[43]}    ${Info[45]}     ${Info[47]}   ${Info[49]}
    Reload Page
    Verify Page Contains 2 Expected Elements     ${Info[4]}  ${Info[5]}

Edit PeerPCSCF function 
    [Arguments]  ${Info}
    PCSCF_PeerPage.Edit Peer   ${Info[4]}  ${Info[6]}  ${Info[24]}  ${Info[25]}  ${Info[26]}   ${Info[27]}   ${Info[28]}    ${Info[29]}
    ...   ${Info[30]}   ${Info[31]}    ${Info[32]}    ${Info[33]}   ${Info[34]}   ${Info[35]}   ${Info[36]}   ${Info[37]}
    ...   ${Info[38]}  ${Info[39]}  ${Info[40]}  ${Info[41]}    ${Info[43]}    ${Info[45]}     ${Info[47]}  ${Info[49]}
    Reload Page
    Verify Page Contains 2 Expected Elements     ${Info[4]}  ${Info[24]}

Delete PeerPCSCF function
    [Arguments]  ${Info}
    Click Element       ${Peer_Field}
    Sleep   1s
    Delete with 2 info  ${Info[4]}  ${Info[25]}
    Verify Page Not Contains 2 Expect Elements  ${Info[4]}  ${Info[25]}

View PeerPCSCF function
    [Arguments]  ${Info}
    PCSCF_PeerPage.View Peer   ${Info[4]}  ${Info[5]}  ${Info[24]}  ${Info[35]}  ${Info[49]}
    Back from View Page

Filter PeerPCSCF function
    [Arguments]  ${Info}
    Click Element       ${Peer_Field}
    Sleep   1s
    Filter 3 value           ${Info[4]}  ${Info[5]}  ${Info[24]}

Filter Special Charaters PeerPCSCF function
    [Arguments]  ${Info}
    Click Element       ${Peer_Field}
    Sleep   1s
    Filter special character 3 value           ${Info[4]}  ${Info[5]}  ${Info[6]}   ${Info[7]}  ${Info[8]}
############################## Matching Rules #################################
Add Matching function
    [Arguments]  ${Info}
    PCSCF_PeerPage.Add Matching  ${Info[4]}  ${Info[5]}   ${Info[6]}    ${Info[7]}    ${Info[8]}  ${Info[9]}   ${Info[10]}   ${Info[11]}     ${Info[12]}   ${Info[13]}   ${Info[14]}
    Reload Page
    Verify Page Contains 2 Expected Elements     ${Info[4]}  ${Info[5]}

Edit Matching function
    [Arguments]  ${Info}
    PCSCF_PeerPage.Edit Matching  ${Info[4]}  ${Info[5]}   ${Info[15]}    ${Info[16]}    ${Info[17]}   ${Info[18]}   ${Info[19]}   ${Info[20]}     ${Info[21]}   ${Info[22]}   ${Info[23]}   ${Info[24]}
    Reload Page
    Verify Page Contains 2 Expected Elements     ${Info[4]}  ${Info[15]}

Delete Matching function
    [Arguments]  ${Info}
    Click Element       ${MatchingRule}
    Sleep   1s
    Delete with 2 info  ${Info[4]}  ${Info[5]}
    Verify Page Not Contains 2 Expect Elements  ${Info[4]}  ${Info[5]}

Verify errors in matching rules function
    [Arguments]  ${Info}
    PCSCF_PeerPage.Add Matching  ${Info[4]}  ${Info[5]}   ${Info[6]}    ${Info[7]}    ${Info[8]}  ${Info[9]}   ${Info[10]}   ${Info[11]}     ${Info[12]}   ${Info[13]}   ${Info[14]}
    Reload Page
    Verify Page Contains Error Message  ${Info[15]}

Verify errors in edit matching rules function
    [Arguments]  ${Info}
    PCSCF_PeerPage.Edit Matching  ${Info[4]}  ${Info[5]}   ${Info[6]}    ${Info[7]}    ${Info[8]}  ${Info[9]}   ${Info[10]}   ${Info[11]}     ${Info[12]}   ${Info[13]}   ${Info[14]}  ${Info[15]}
    Verify Page Contains Error Message  ${Info[16]}

View Matching rules function
    [Arguments]  ${Info}
    PCSCF_PeerPage.View Matching  ${Info[4]}  ${Info[5]}   ${Info[6]}   ${Info[7]}  ${Info[25]}   ${Info[11]}      ${Info[12]}      ${Info[13]}   ${Info[14]}
    Back from View Page

Filter Matching rules function
    [Arguments]  ${Info}
    Click Element       ${MatchingRule}
    Sleep   1s
    Filter 2 value           ${Info[4]}  ${Info[5]}

Filter Special Charaters Matching rules function
    [Arguments]  ${Info}
    Click Element       ${MatchingRule}
    Sleep   1s
    Filter special character 2 value           ${Info[4]}  ${Info[5]}  ${Info[6]}   ${Info[7]}

############################## Manipulation Rules #################################
Add Manipulation Rules function
    [Arguments]  ${Info}
    PCSCF_PeerPage.Add Manipulation Rules    ${Info[4]}  ${Info[5]}   ${Info[6]}    ${Info[7]}    ${Info[8]}  ${Info[9]}   ${Info[10]}
    ...                                   ${Info[11]}     ${Info[12]}   ${Info[13]}   ${Info[14]}   ${Info[15]}     ${Info[16]}   ${Info[17]}
    ...                                   ${Info[18]}     ${Info[19]}     ${Info[20]}   ${Info[21]}   ${Info[22]}
    Reload Page
    Verify Page Contains 2 Expected Elements     ${Info[4]}  ${Info[5]}

Edit Manipulation Rules function
    [Arguments]  ${Info}
    PCSCF_PeerPage.Edit Manipulation Rules  ${Info[4]}  ${Info[5]}   ${Info[23]}    ${Info[24]}    ${Info[25]}  ${Info[26]}   ${Info[27]}
    ...                                   ${Info[28]}     ${Info[29]}   ${Info[30]}   ${Info[31]}   ${Info[32]}     ${Info[33]}   ${Info[34]}
    ...                                   ${Info[35]}     ${Info[36]}     ${Info[37]}   ${Info[38]}   ${Info[39]}   ${Info[40]}
    Reload Page
    Verify Page Contains 2 Expected Elements     ${Info[4]}  ${Info[23]}

Delete Manipulation Rules function
    [Arguments]  ${Info}
    Click Element       ${ManiRule}
    Sleep   1s
    Delete with 3 info  ${Info[4]}  ${Info[5]}  ${Info[6]}
    Verify Page Not Contains 2 Expect Elements  ${Info[4]}  ${Info[5]}

View Manipulation rules function
    [Arguments]  ${Info}
    PCSCF_PeerPage.View Manipulation  ${Info[4]}  ${Info[5]}   ${Info[6]}
    Back from View Page

Filter Manipulation rules function
    [Arguments]  ${Info}
    Click Element       ${ManiRule}
    Sleep   1s
    Filter 3 value           ${Info[4]}  ${Info[5]}  ${Info[6]}

Filter Special Charaters Manipulation rules function
    [Arguments]  ${Info}
    Click Element       ${ManiRule}
    Sleep   1s
    Filter special character 2 value           ${Info[4]}  ${Info[5]}  ${Info[6]}   ${Info[7]}

############################## Header Authorization Profiles #################################
Add Valid Header Authorization Profiles function
    [Arguments]  ${Info}
    PCSCF_PeerPage.Add Header Authorization Profiles    ${Info[4]}  ${Info[5]}   ${Info[6]}    ${Info[7]}    ${Info[8]}  ${Info[9]}  ${Info[10]}  ${Info[11]}
    Reload Page
    # Run Keyword If  '${Info[4]}' == 'auto_HAP_12'      Click Element     ${Next_page}
    # Run Keyword If  '${Info[4]}' == 'auto_HAP_15'      Click Element     ${Next_page}
    # Run Keyword If  '${Info[4]}' == 'auto_HAP_17'      Click Element     ${Next_page}
    # Verify Page Contains 2 Expected Elements     ${Info[4]}  ${Info[6]}
    ${arg} =  Create List    ${Info[4]}  ${Info[6]}
    Run Keyword N Times And Stop If Success   Verify Page Contains 2 Expected Elements    ${arg}    Click Element   ${Next_page}   3
    Sleep   3s

Add Invalid Header Authorization Profiles function
    [Arguments]  ${Info}
    PCSCF_PeerPage.Add Header Authorization Profiles    ${Info[4]}  ${Info[5]}   ${Info[6]}    ${Info[7]}    ${Info[8]}  ${Info[9]}  ${Info[10]}  ${Info[11]}
    Run Keyword If    '${Info[12]}' != '#BLANK'         Verify Page Contains Error Message     ${Info[12]}
    Run Keyword If    '${Info[13]}' != '#BLANK'         Verify Page Contains Error Message     ${Info[13]}
    Run Keyword If    '${Info[14]}' != '#BLANK'         Verify Page Contains Error Message     ${Info[14]}
    Run Keyword If    '${Info[15]}' != '#BLANK'         Verify Page Contains Error Message     ${Info[15]}
    #Run Keyword If    '${Info[15]}' != '#BLANK'         Verify Special Character For String To Get Error Message Has Special Character    ${Info[12]}   ${Info[15]}


Verify Special Character For String To Get Error Message Has Special Character
    [Arguments]   ${First}   ${Second}
    ${Pattern} =  Set Variable    This value <${First}> is contain characters not allowed.
    Should Match Regexp    ${Second}    ${Pattern}

Add And Then View Header Authorization Profiles function
    [Arguments]  ${Info}
    PCSCF_PeerPage.Add And Then View Header Authorization Profiles  ${Info[4]}  ${Info[5]}   ${Info[6]}  ${Info[7]}  ${Info[9]}  ${Info[10]}  ${Info[12]}
    Back from View Page

View Header Authorization Profiles function
    [Arguments]  ${Info}
    PCSCF_PeerPage.View Header Authorization Profiles  ${Info[4]}  ${Info[5]}   ${Info[6]}  ${Info[7]}  ${Info[9]}  ${Info[10]}  ${Info[11]}
    Back from View Page

Filter Header Authorization Profiles function
    [Arguments]  ${Info}
    Click Element       ${HAP_Field}
    Sleep   1s
    Filter 3 value           ${Info[4]}  ${Info[6]}  ${Info[5]}

Filter Special Charaters Header Authorization Profiles function
    [Arguments]  ${Info}
    Click Element       ${HAP_Field}
    Sleep   1s
    Filter special character 3 value           ${Info[4]}  ${Info[5]}  ${Info[6]}   ${Info[7]}  ${Info[8]}

Delete Header Authorization Profiles function
    [Arguments]  ${Info}
    Click Element       ${HAP_Field}
    Sleep   1s
    Delete with 3 info  ${Info[4]}  ${Info[6]}  ${Info[5]}
    Verify Page Not Contains 2 Expect Elements  ${Info[4]}  ${Info[6]}

#################################### Authorization Profiles #################################
Add Authorization Profiles function
    [Arguments]  ${Info}
    PCSCF_PeerPage.Add Authorization Profiles    ${Info[4]}  ${Info[5]}   ${Info[6]}    ${Info[7]}    ${Info[8]}    ${Info[9]}
    ...         ${Info[10]}    ${Info[11]}    ${Info[12]}     ${Info[13]}    ${Info[14]}    ${Info[15]}       ${Info[16]}
    ...         ${Info[17]}    ${Info[18]}    ${Info[19]}     ${Info[20]}    ${Info[21]}
#    Reload Page
    Wait Until Page Does Not Contain Element   ${Confirm_Add_Type_Button}   10s
    # ${is_Page_2} =  run keyword and return status   Page Should Contain Element     ${Next_page}
    # Run Keyword If  '${is_Page_2}' == 'True'        Click Element    ${Next_page}
    # Verify Page Contains 2 Expected Elements    ${Info[4]}  ${Info[5]}     
    ${arg} =  Create List   ${Info[4]}  ${Info[5]}  
    Run Keyword N Times And Stop If Success  Verify Page Contains 2 Expected Elements   ${arg}    Click Element   ${Next_page}   3
    Sleep   3s

Add Invalid Authorization Profiles function
    [Arguments]  ${Info}
    PCSCF_PeerPage.Add Authorization Profiles    ${Info[4]}  ${Info[5]}   ${Info[6]}    ${Info[7]}    ${Info[8]}    ${Info[9]}
    ...         ${Info[10]}    ${Info[11]}    ${Info[12]}     ${Info[13]}    ${Info[14]}    ${Info[15]}       ${Info[16]}
    ...         ${Info[17]}    ${Info[18]}    ${Info[19]}     ${Info[20]}    ${Info[21]}
    IF    '${Info[18]}' != '#BLANK'         Verify Page Contains Error Message     ${Info[18]}
    ${arg} =  Create List   ${Info[4]}  ${Info[5]}  
    Run Keyword N Times And Stop If Success  Verify Page Not Contains 2 Expected Elements   ${arg}    Click Element   ${Next_page}   3
    Sleep   3s


Edit Authorization Profiles function
    [Arguments]  ${Info}
    PCSCF_PeerPage.Edit Authorization Profiles    ${Info[4]}  ${Info[5]}   ${Info[6]}    ${Info[7]}    ${Info[8]}    ${Info[9]}
    ...         ${Info[10]}    ${Info[11]}    ${Info[12]}     ${Info[13]}    ${Info[14]}    ${Info[15]}       ${Info[16]}
    ...         ${Info[17]}    ${Info[18]}    ${Info[19]}     ${Info[20]}    ${Info[21]}    ${Info[22]}
#    Reload Page
    Wait Until Page Does Not Contain Element   ${Confirm_Add_Type_Button}   10s
    # Verify Page Contains 2 Expected Elements     ${Info[4]}  ${Info[6]}
    ${arg} =  Create List   ${Info[4]}  ${Info[6]}  
    Run Keyword N Times And Stop If Success  Verify Page Contains 2 Expected Elements   ${arg}    Click Element   ${Next_page}   3
    Sleep   3s

Delete Authorization Profiles function
    [Arguments]  ${Info}
    Click Element       ${AP_Field}
    Sleep   1s
    Delete with 2 info  ${Info[4]}  ${Info[5]}
    Verify Page Not Contains 2 Expect Elements  ${Info[4]}  ${Info[5]}

Filter Authorization Profiles function
    [Arguments]  ${Info}
    Click Element       ${AP_Field}
    Sleep   1s
    Filter 2 value           ${Info[4]}  ${Info[5]}

View Authorization Profiles function
    [Arguments]  ${Info}
    PCSCF_PeerPage.View Authorization Profiles  ${Info[4]}  ${Info[5]}
    Back from View Page

Filter Special Charaters Authorization Profiles function
    [Arguments]  ${Info}
    Click Element       ${AP_Field}
    Sleep   1s
    Filter special character 4 value           ${Info[4]}  ${Info[5]}  ${Info[6]}   ${Info[7]}  ${Info[8]}  ${Info[9]}

#################################### Header Manipulation #################################
Add Header Manipulation function
    [Arguments]  ${Info}
    PCSCF_PeerPage.Add Header Manipulation    ${Info[4]}  ${Info[5]}   ${Info[6]}    ${Info[7]}    ${Info[8]}    ${Info[9]}     ${Info[10]}
    ...   ${Info[11]}  ${Info[12]}   ${Info[13]}    ${Info[14]}    ${Info[15]}    ${Info[16]}     ${Info[17]}   ${Info[18]}
    ...   ${Info[19]}   ${Info[20]}    ${Info[21]}    ${Info[22]}    ${Info[23]}     ${Info[24]}    ${Info[25]}     ${Info[26]}
    Reload Page
    Verify Page Contains 2 Expected Elements     ${Info[4]}  ${Info[5]}

Edit Header Manipulation function
    [Arguments]  ${Info}
    PCSCF_PeerPage.Edit Header Manipulation    ${Info[4]}  ${Info[5]}  ${Info[27]}    ${Info[28]}     ${Info[29]}      ${Info[30]}
    ...    ${Info[31]}  ${Info[32]}   ${Info[33]}    ${Info[34]}    ${Info[35]}    ${Info[36]}     ${Info[37]}    ${Info[38]}  ${Info[39]}
    ...   ${Info[40]}   ${Info[41]}   ${Info[42]}    ${Info[43]}    ${Info[44]}    ${Info[45]}     ${Info[46]}    ${Info[47]}   ${Info[48]}
    Reload Page
    Verify Page Contains 2 Expected Elements     ${Info[4]}  ${Info[27]}

Delete Header Manipulation function
    [Arguments]  ${Info}
    Click Element       ${HM_Field}
    Sleep   1s
    Delete with 2 info  ${Info[4]}  ${Info[27]}
    Verify Page Not Contains 2 Expect Elements  ${Info[4]}  ${Info[27]}

View Header Manipulation function
    [Arguments]  ${Info}
    PCSCF_PeerPage.View Header Manipulation  ${Info[4]}  ${Info[5]}   ${Info[24]}  ${Info[25]}  ${Info[26]}
    Back from View Page

Filter Header Manipulation function
    [Arguments]  ${Info}
    Click Element       ${HM_Field}
    Sleep   1s
    Filter 2 value           ${Info[4]}  ${Info[5]}

Filter Special Charaters Header Manipulation function
    [Arguments]  ${Info}
    Click Element       ${HM_Field}
    Sleep   1s
    Filter special character 4 value           ${Info[4]}  ${Info[5]}  ${Info[6]}   ${Info[7]}  ${Info[8]}  ${Info[9]}
#################################### Session Control Profile #################################


Delete Session Control function
    [Arguments]  ${Info}

    Click Element       ${SC_Field}
    Sleep   1s
    Delete with 2 info  ${Info[4]}  ${Info[17]}
    Verify Page Not Contains 2 Expect Elements  ${Info[4]}  ${Info[17]}

View Session Control function
    [Arguments]  ${Info}
    PCSCF_PeerPage.View Session Control   ${Info[4]}  ${Info[6]}  ${Info[7]}  ${Info[8]}    ${Info[9]}
    Back from View Page

Filter Session Control function
    [Arguments]  ${Info}
    Click Element       ${SC_Field}
    Sleep   1s
    Filter 2 value           ${Info[4]}  ${Info[6]}

Filter Special Charaters Session Control function
    [Arguments]  ${Info}
    Click Element       ${SC_Field}
    Sleep   1s
    Filter special character 2 value           ${Info[4]}  ${Info[5]}  ${Info[6]}   ${Info[7]}

Add Session Control function 
    [Arguments]  ${Info}
    PCSCF_PeerPage.Add Session Control    ${Info[4]}   ${Info[6]}    ${Info[7]}    ${Info[8]}    ${Info[9]}
    ...     ${Info[11]}   ${Info[12]}    ${Info[13]}    ${Info[14]}  ${Info[15]}   ${Info[16]}    ${Info[17]}    ${Info[18]}
    Reload Page
    Verify Page Contains 2 Expected Elements     ${Info[4]}  ${Info[6]}

Edit Session Control function 
    [Arguments]  ${Info}
    PCSCF_PeerPage.Edit Session Control    ${Info[4]}  ${Info[6]}   ${Info[25]}    ${Info[26]}    ${Info[27]}    ${Info[28]}     ${Info[29]}
    ...     ${Info[30]}   ${Info[31]}    ${Info[32]}    ${Info[33]}     ${Info[34]}  ${Info[35]}    ${Info[36]}
    Reload Page
    Verify Page Contains 2 Expected Elements     ${Info[4]}  ${Info[29]}

#################################### User Agent Profile #################################
Add User Agent function
    [Arguments]  ${Info}
    PCSCF_PeerPage.Add User Agent    ${Info[4]}  ${Info[5]}   ${Info[6]}    ${Info[7]}    ${Info[8]}    ${Info[9]}   ${Info[10]}   ${Info[11]}   ${Info[12]}
    ...                              ${Info[13]}    ${Info[14]}   ${Info[15]}   ${Info[16]}
    Reload Page
    Verify Page Contains 2 Expected Elements     ${Info[4]}  ${Info[5]}

Edit User Agent function
    [Arguments]  ${Info}
    PCSCF_PeerPage.Edit User Agent    ${Info[4]}  ${Info[5]}   ${Info[17]}    ${Info[18]}    ${Info[19]}   ${Info[20]}   ${Info[21]}   ${Info[22]}
    ...                              ${Info[23]}    ${Info[24]}   ${Info[25]}   ${Info[26]}  ${Info[27]}    ${Info[28]}
    Reload Page
    Verify Page Contains 2 Expected Elements     ${Info[4]}  ${Info[17]}

Delete User Agent function
    [Arguments]  ${Info}

    Click Element       ${UA_Field}
    Sleep   1s
    Delete with 2 info  ${Info[4]}  ${Info[5]}
    Verify Page Not Contains 2 Expect Elements  ${Info[4]}  ${Info[5]}

View User Agent function
    [Arguments]  ${Info}
    PCSCF_PeerPage.View UA   ${Info[4]}  ${Info[5]}
    Back from View Page

Filter User Agent function
    [Arguments]  ${Info}
    Click Element       ${UA_Field}
    Sleep   1s
    Filter 2 value           ${Info[4]}  ${Info[5]}

Filter Special Charaters User Agent function
    [Arguments]  ${Info}
    Click Element       ${UA_Field}
    Sleep   1s
    Filter special character 2 value           ${Info[4]}  ${Info[5]}  ${Info[6]}   ${Info[7]}
#################################### PCRF Profile #################################
Add PCRF function
    [Arguments]  ${Info}
    PCSCF_PeerPage.Add PCRF    ${Info[4]}  ${Info[5]}   ${Info[6]}    ${Info[7]}
    Reload Page
    Verify Page Contains 1 Expected Elements     ${Info[4]}

Edit PCRF function
    [Arguments]  ${Info}
    PCSCF_PeerPage.Edit PCRF    ${Info[4]}  ${Info[5]}   ${Info[8]}    ${Info[9]}   ${Info[10]}
    Reload Page
    Verify Page Contains 1 Expected Elements     ${Info[4]}

Delete PCRF function
    [Arguments]  ${Info}

    Scroll Element Into View    ${While_Label}
    Sleep       1s
    Click Element       ${PCRF_Field}
    Sleep   1s
    Delete with 1 info  ${Info[4]}
    Verify Page Not Contains 1 Expect Elements  ${Info[4]}

View PCRF function
    [Arguments]  ${Info}
    PCSCF_PeerPage.View PCRF   ${Info[4]}  ${Info[5]}  ${Info[6]}   ${Info[7]}
    Back from View Page

Filter PCRF function
    [Arguments]  ${Info}
    Scroll Element Into View    ${While_Label}
    Click Element       ${PCRF_Field}
    Sleep   1s
    Filter 1 value           ${Info[4]}

Filter Special Charaters PCRF function
    [Arguments]  ${Info}
    Scroll Element Into View    ${While_Label}
    Click Element       ${PCRF_Field}
    Sleep   1s
    Filter special character 1 value           ${Info[4]}  ${Info[5]}  ${Info[6]}

#################################### PHF Profile #################################

Add PHF function 
    [Arguments]  ${Info}
    PCSCF_PeerPage.Add PHF   ${Info[4]}  ${Info[5]}   ${Info[6]}    ${Info[7]}   ${Info[8]}   ${Info[9]}   ${Info[10]}    ${Info[11]}     ${Info[12]}  ${Info[13]}   ${Info[21]}
    Reload Page
    Verify Page Contains 1 Expected Elements     ${Info[4]}


Edit PHF function 
    [Arguments]  ${Info}
    PCSCF_PeerPage.Edit PHF    ${Info[4]}  ${Info[13]}   ${Info[14]}    ${Info[15]}   ${Info[16]}   ${Info[17]}   ${Info[18]}    ${Info[19]}   ${Info[20]}  ${Info[21]}  ${Info[22]}
    Reload Page
    Verify Page Contains 1 Expected Elements     ${Info[4]}


Delete PHF function
    [Arguments]  ${Info}

    Scroll Element Into View    ${While_Label}
    Sleep       1s
    Click Element       ${PHF_Field}
    Sleep   1s
    Sort Element  Name
    Sleep       1s
    Delete with 1 info  ${Info[4]}
    Verify Page Not Contains 2 Expect Elements  ${Info[4]}  ${Info[13]}

View PHF function
    [Arguments]  ${Info}
    PCSCF_PeerPage.View PHF   ${Info[4]}  ${Info[6]}  ${Info[7]}  ${Info[8]}  ${Info[9]}  ${Info[10]}  ${Info[11]}  ${Info[12]}
    Back from View Page

Filter PHF function
    [Arguments]  ${Info}
    Scroll Element Into View    ${While_Label}
    Click Element       ${PHF_Field}
    Sleep   1s
    Filter 1 value           ${Info[4]}

Filter Special Charaters PHF function
    [Arguments]  ${Info}
    Scroll Element Into View    ${While_Label}
    Click Element       ${PHF_Field}
    Sleep   3s
    Filter special character 2 value           ${Info[4]}  ${Info[5]}  ${Info[6]}   ${Info[7]}

#################################### RFC4028 Profile #################################



Add Valid RFC4028 function
    [Arguments]  ${Info}
    PCSCF_PeerPage.Add RFC4028     ${Info[4]}  ${Info[5]}   ${Info[6]}    ${Info[7]}    ${Info[8]}    ${Info[9]}
    Reload Page
    Verify Page Contains 2 Expected Elements     ${Info[4]}  ${Info[5]}

Add invalid RFC4028 function
    [Arguments]  ${Info}
    PCSCF_PeerPage.Add RFC4028     ${Info[4]}  ${Info[5]}   ${Info[6]}    ${Info[7]}    ${Info[8]}    ${Info[9]}


Edit Valid RFC4028 function
    [Arguments]  ${Info}
    PCSCF_PeerPage.Edit RFC4028    ${Info[4]}  ${Info[5]}   ${Info[10]}    ${Info[11]}    ${Info[12]}    ${Info[13]}     ${Info[14]}
    Reload Page
    Verify Page Contains 2 Expected Elements     ${Info[4]}  ${Info[10]}

Edit invalid RFC4028 function
    [Arguments]  ${Info}
    PCSCF_PeerPage.Edit RFC4028    ${Info[4]}  ${Info[5]}   ${Info[10]}    ${Info[11]}    ${Info[12]}    ${Info[13]}     ${Info[14]}


