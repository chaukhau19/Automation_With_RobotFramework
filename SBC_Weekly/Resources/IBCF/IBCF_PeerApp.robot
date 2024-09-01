*** Settings ***
Library  SeleniumLibrary
Resource  ../../Resources/Admin/LoginApp_SBC.robot
Resource  ./PO/IBCF_PeerPage.robot
Resource  ../Admin/PO/UserManagerPage.robot
Resource  ../Common.robot


*** Variables ***
################# General variables #################
${Next_page}              	xpath=//a[contains(text(),'»')]

*** Keywords ***

####################################### Matching Rules #################################################
Add MatchingRules
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
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

Add Invalid MatchingRules
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[17]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
                   Verify errors in matching rules function      ${Info}
 
             IF    """${Info[17]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[17]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Edit MatchingRules
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
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

Edit Invalid MatchingRules
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[18]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
                   Verify errors in edit matching rules function      ${Info}
 
             IF    """${Info[18]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[18]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Sort MatchingRules
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    Click Element       ${MatchingRule}
    Sleep   1s
    Sort Element  Matching rule name
    Sort Element  Header name
    Page Should Not Contain  Internal Server Error


View MatchingRules
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
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
    IBCF_PeerPage.Go to Peer section in IBCF tab
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
    IBCF_PeerPage.Go to Peer section in IBCF tab
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

Delete MatchingRules
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[27]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               Delete Matching function      ${Info}
 
             IF    """${Info[27]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[27]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END






###################################### Manipulation Rules #############################################


Add ManiRules
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
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

Sort ManiRules
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    Click Element       ${ManiRule}
    Sleep   1s
    Sort Element  Manipulation rule name
    Sort Element  Header name

View ManiRules
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
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
    IBCF_PeerPage.Go to Peer section in IBCF tab
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
    IBCF_PeerPage.Go to Peer section in IBCF tab
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

Edit ManiRules
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
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
    IBCF_PeerPage.Go to Peer section in IBCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[25]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               Delete Manipulation Rules function      ${Info}
 
             IF    """${Info[25]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[25]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END




##################################### HeaderAuthProfiles ##################################################
Add Valid HeaderAuthProfiles
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
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
    IBCF_PeerPage.Go to Peer section in IBCF tab
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

Sort HeaderAuthProfiles
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
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
    IBCF_PeerPage.Go to Peer section in IBCF tab
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
    IBCF_PeerPage.Go to Peer section in IBCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[14]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               Filter Header Authorization Profiles function      ${Info}
 
             IF    """${Info[14]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[14]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Filter Special Character HeaderAuthProfiles
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
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

Delete HeaderAuthProfiles
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
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



###################################################### AuthProfiles #################################################################
Add AuthProfiles
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
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
    IBCF_PeerPage.Go to Peer section in IBCF tab
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

Sort AuthProfiles
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    Click Element       ${AP_Field}
    Sleep   1s
    Sort Element  Index
    Sort Element  Default authorization

View AuthProfiles
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
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
    IBCF_PeerPage.Go to Peer section in IBCF tab
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
    IBCF_PeerPage.Go to Peer section in IBCF tab
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

Edit AuthProfiles
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
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
    IBCF_PeerPage.Go to Peer section in IBCF tab
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



############################################### RoutingProfiles ##################################################
Add RoutingProfiles
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[13]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
            Add Routing Profiles function      ${Info}
 
             IF    """${Info[13]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[13]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Sort RoutingProfiles
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    Click Element       ${RP_Field}
    Sleep   1s
    Sort Element  Index
    Sort Element  Default routing

Filter RoutingProfiles
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[8]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               Filter Routing Profiles function      ${Info}
 
             IF    """${Info[8]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[8]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Filter Special Character RoutingProfiles
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Filter Special Charaters Routing Profiles function      ${Info}

        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Edit RoutingProfiles
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[14]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
            Edit Routing Profiles function      ${Info}
 
             IF    """${Info[14]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[14]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Delete RoutingProfiles
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[7]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
            Delete Routing Profiles function      ${Info}
 
             IF    """${Info[7]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[7]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END




################################### HeaderManipulation ############################################
Add HeaderManipulation
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
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

Sort HeaderManipulation
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    Click Element       ${HM_Field}
    Sleep   1s
    Sort Element  SIP manipulation profile
    Sort Element  Processing order

View HeaderManipulation
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
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
    IBCF_PeerPage.Go to Peer section in IBCF tab
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
    IBCF_PeerPage.Go to Peer section in IBCF tab
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

Edit HeaderManipulation
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
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
    IBCF_PeerPage.Go to Peer section in IBCF tab
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




#################################### SDPProfile ##################################################
Add Valid SDPProfile
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[25]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
                Add Valid SDP Profile function   ${Info}
 
             IF    """${Info[25]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[25]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Add Invalid SDPProfile
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[24]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
            Add Invalid SDP Profile function      ${Info}
 
             IF    """${Info[24]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[24]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Sort SDPProfile
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    Click Element       ${SP_Field}
    Sleep   1s
    Sort Element  Index
    Sort Element  Media type

View SDPProfile
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[25]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
                   View SDP Profile function      ${Info}
 
             IF    """${Info[25]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[25]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Filter SDPProfile
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[25]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               Filter SDP Profile function      ${Info}
 
             IF    """${Info[25]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[25]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Filter Special Character SDPProfile
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[10]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               Filter Special Charaters SDP Profile function      ${Info}
 
             IF    """${Info[10]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[10]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Edit Valid SDPProfile
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[25]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
                    Edit Valid SDP Profile function   ${Info}
 
             IF    """${Info[25]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[25]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Edit Invalid SDPProfile
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[25]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
                    Edit Invalid SDP Profile function   ${Info}
 
             IF    """${Info[25]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[25]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Delete SDPProfile
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[25]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
                    Delete SDP Profile function      ${Info}
 
             IF    """${Info[25]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[25]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END







################################# SessionLimiter #####################################
Add SessionLimiter
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[32]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
            Add Session Limiter function      ${Info}
 
             IF    """${Info[32]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[32]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Sort SessionLimiter
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    Click Element       ${SLP_Field}
    Sleep   1s
    Sort Element  Index

View SessionLimiter
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[32]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               View Session Limiter function      ${Info}
 
             IF    """${Info[32]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[32]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Filter SessionLimiter
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[32]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               Filter Session Limiter function      ${Info}
 
             IF    """${Info[32]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[32]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Filter Special Character SessionLimiter
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[11]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               Filter Special Charaters Session Limiter function      ${Info}
 
             IF    """${Info[11]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[11]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Edit SessionLimiter
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[32]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
            Edit Session Limiter function      ${Info}
 
             IF    """${Info[32]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[32]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Delete SessionLimiter
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[32]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
            Delete Session Limiter function      ${Info}
 
             IF    """${Info[32]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[32]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END




########################### SessionControl ##################################
Add SessionControl
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[32]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
            Add Session Control function      ${Info}
 
             IF    """${Info[32]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[32]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Sort SessionControl
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    Scroll Element Into View    ${PCSCF_tab}
    Sleep       1s
    Click Element       ${SC_Field}
    Sleep   1s
    Sort Element  Name


View SessionControl
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[32]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               View Session Control function      ${Info}
 
             IF    """${Info[32]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[32]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Filter SessionControl
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[32]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               Filter Session Control function      ${Info}
 
             IF    """${Info[32]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[32]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Filter Special Character SessionControl
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[11]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               Filter Special Charaters Session Control function      ${Info}
 
             IF    """${Info[11]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[11]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Edit SessionControl
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[32]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
            Edit Session Control function      ${Info}
 
             IF    """${Info[32]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[32]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Delete SessionControl
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[32]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
            Delete Session Control function      ${Info}
 
             IF    """${Info[32]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[32]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END




######################### RFC4028 ###############################
Add Valid RFC4028
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[11]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
            Add Valid RFC4028 function      ${Info}
 
             IF    """${Info[11]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[11]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Add Invalid RFC4028
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[12]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               Add invalid RFC4028 function      ${Info}
               Verify Page Contains Error Message     ${Info[10]}
 
             IF    """${Info[12]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[12]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Edit Valid RFC4028
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
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

Edit invalid RFC4028
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[17]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               Edit invalid RFC4028 function      ${Info}
               Verify Page Contains Error Message     ${Info[15]}
 
             IF    """${Info[17]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[17]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Delete RFC4028
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[16]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
            Delete RFC4028 function      ${Info}
 
             IF    """${Info[16]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[16]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Sort RFC4028
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    Sleep       1s
    Scroll Element Into View    ${PCSCF_tab}
    Click Element       ${RFC4028_Field}
    Sleep   1s
    Sort Element  ID
    Sort Element  Session Expire

View RFC4028
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[16]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               View RFC4028 function      ${Info}
 
             IF    """${Info[16]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[16]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Filter RFC4028
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[16]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               Filter RFC4028 function      ${Info}
 
             IF    """${Info[16]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[16]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Filter Special Character RFC4028
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[11]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               Filter Special Charaters RFC4028 function      ${Info}
 
             IF    """${Info[11]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[11]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END



################################# Core Domain ########################################
Add Core Domain
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[6]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
            Add Core Domain function      ${Info}
 
             IF    """${Info[6]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[6]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Delete Core Domain
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[6]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
            Delete Core Domain function      ${Info}
 
             IF    """${Info[6]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[6]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END







########################################## PeerIBCF ###################################################

Add PeerIBCF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[116]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
                Add PeerIBCF function      ${Info}
 
             IF    """${Info[116]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[116]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Edit PeerIBCF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[115]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
                Edit PeerIBCF function       ${Info}
 
             IF    """${Info[115]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[115]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Delete PeerIBCF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[106]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
                Delete PeerIBCF function      ${Info}
 
             IF    """${Info[106]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[106]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Sort PeerIBCF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    Click Element       ${Peer_Field}
    Sleep   1s
    Sort Element  Name
    Sort Element  Domain


View PeerIBCF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[15]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
                   View PeerIBCF function       ${Info}
 
             IF    """${Info[15]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[15]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Filter PeerIBCF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[115]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               Filter PeerIBCF function      ${Info}
 
             IF    """${Info[115]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[115]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Filter Special Character PeerIBCF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[11]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
               Filter Special Charaters PeerIBCF function      ${Info}
 
             IF    """${Info[11]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[11]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END



#################################################################################################################################
#                                                           ---FUNCTION---                                                      #
#################################################################################################################################




Add PeerIBCF function 
    [Arguments]  ${Info}
    IBCF_PeerPage.Add PeerIBCF  ${Info[4]}  ${Info[5]}   ${Info[6]}    ${Info[7]}    ${Info[8]}  ${Info[9]}   ${Info[10]}
    ...   ${Info[11]}  ${Info[12]}    ${Info[13]}    ${Info[14]}   ${Info[15]}    ${Info[16]}    ${Info[17]}   ${Info[18]}
    ...   ${Info[19]}  ${Info[20]}    ${Info[21]}    ${Info[22]}    ${Info[23]}     ${Info[24]}     ${Info[25]}     ${Info[26]}
    ...   ${Info[27]}  ${Info[28]}    ${Info[29]}    ${Info[30]}    ${Info[31]}     ${Info[32]}     ${Info[33]}     ${Info[34]}
    ...   ${Info[35]}  ${Info[36]}    ${Info[37]}    ${Info[38]}    ${Info[39]}     ${Info[40]}     ${Info[41]}     ${Info[42]}
    ...   ${Info[43]}  ${Info[44]}    ${Info[45]}    ${Info[46]}    ${Info[47]}     ${Info[48]}     ${Info[49]}     ${Info[103]}
    ...   ${Info[105]}  ${Info[107]}    ${Info[109]}  ${Info[111]}  ${Info[112]}  ${Info[113]}   ${Info[114]}
    Reload Page
    Verify Page Contains 2 Expected Elements     ${Info[4]}  ${Info[9]}




Edit PeerIBCF function 
    [Arguments]  ${Info}
    IBCF_PeerPage.Edit PeerIBCF  ${Info[4]}  ${Info[50]}  ${Info[9]}  ${Info[51]}   ${Info[52]}   ${Info[53]}    ${Info[54]}   ${Info[55]}
    ...   ${Info[56]}    ${Info[57]}    ${Info[58]}   ${Info[59]}   ${Info[60]}   ${Info[61]}   ${Info[62]}
    ...   ${Info[63]}    ${Info[64]}  ${Info[65]}  ${Info[66]}   ${Info[67]}   ${Info[68]}   ${Info[69]}   ${Info[70]}
    ...   ${Info[71]}    ${Info[72]}  ${Info[73]}  ${Info[74]}   ${Info[75]}   ${Info[76]}   ${Info[77]}   ${Info[78]}
    ...   ${Info[79]}    ${Info[80]}  ${Info[81]}  ${Info[82]}   ${Info[83]}   ${Info[84]}   ${Info[85]}   ${Info[86]}
    ...   ${Info[87]}    ${Info[88]}  ${Info[89]}  ${Info[90]}   ${Info[91]}   ${Info[92]}   ${Info[93]}   ${Info[94]}
    ...   ${Info[95]}    ${Info[96]}  ${Info[97]}  ${Info[98]}   ${Info[99]}   ${Info[100]}   ${Info[101]}  ${Info[102]}
    ...   ${Info[104]}   ${Info[106]}   ${Info[108]}  ${Info[110]}  ${Info[111]}  ${Info[112]}  ${Info[113]}
    Reload Page
    Verify Page Contains 2 Expected Elements     ${Info[4]}  ${Info[51]}


Delete PeerIBCF function
    [Arguments]  ${Info}
    Click Element       ${Peer_Field}
    Sleep   1s
    Delete with 2 info  ${Info[4]}  ${Info[9]}
    Verify Page Not Contains 2 Expect Elements  ${Info[4]}  ${Info[9]}

View PeerIBCF function 
    [Arguments]  ${Info}
    IBCF_PeerPage.View PeerIBCF   ${Info[4]}  ${Info[5]}   ${Info[6]}  ${Info[7]}  ${Info[8]}  ${Info[9]}  ${Info[10]}  ${Info[11]}  ${Info[12]}  ${Info[13]}
    Back from View Page

Filter PeerIBCF function
    [Arguments]  ${Info}
    Click Element       ${Peer_Field}
    Sleep   1s
    Filter 2 value           ${Info[4]}  ${Info[51]}      #${Info[9]}--->bi nham element khi edit

Filter Special Charaters PeerIBCF function
    [Arguments]  ${Info}
    Click Element       ${Peer_Field}
    Sleep   1s
    Filter special character 4 value           ${Info[4]}  ${Info[5]}  ${Info[6]}   ${Info[7]}  ${Info[8]}  ${Info[9]}





#################################### Matching Rules ##############################################
Add Matching function
    [Arguments]  ${Info}
    IBCF_PeerPage.Add Matching  ${Info[4]}  ${Info[5]}   ${Info[6]}    ${Info[7]}    ${Info[8]}  ${Info[9]}   ${Info[10]}   ${Info[11]}     ${Info[12]}   ${Info[13]}   ${Info[14]}
    Reload Page
    Verify Page Contains 2 Expected Elements     ${Info[4]}  ${Info[5]}

Verify errors in matching rules function
    [Arguments]  ${Info}
    IBCF_PeerPage.Add Matching  ${Info[4]}  ${Info[5]}   ${Info[6]}    ${Info[7]}    ${Info[8]}  ${Info[9]}   ${Info[10]}   ${Info[11]}     ${Info[12]}   ${Info[13]}   ${Info[14]}
    Reload Page
    Verify Page Contains Error Message  ${Info[15]}

Edit Matching function
    [Arguments]  ${Info}
    IBCF_PeerPage.Edit Matching  ${Info[4]}  ${Info[5]}   ${Info[15]}    ${Info[16]}    ${Info[17]}  ${Info[18]}   ${Info[19]}   ${Info[20]}     ${Info[21]}   ${Info[22]}   ${Info[23]}  ${Info[24]}
    Reload Page
    Verify Page Contains 2 Expected Elements     ${Info[4]}  ${Info[15]}

Verify errors in edit matching rules function
    [Arguments]  ${Info}
    IBCF_PeerPage.Edit Matching  ${Info[4]}  ${Info[5]}   ${Info[6]}    ${Info[7]}    ${Info[8]}  ${Info[9]}   ${Info[10]}   ${Info[11]}     ${Info[12]}   ${Info[13]}   ${Info[14]}  ${Info[15]}
    Verify Page Contains Error Message  ${Info[16]}

Delete Matching function
    [Arguments]  ${Info}
    Click Element       ${MatchingRule}
    Sleep   1s
    Delete with 2 info  ${Info[4]}  ${Info[5]}
    Verify Page Not Contains 2 Expect Elements  ${Info[4]}  ${Info[5]}

View Matching rules function
    [Arguments]  ${Info}
    IBCF_PeerPage.View Matching  ${Info[4]}  ${Info[5]}   ${Info[6]}   ${Info[7]}  ${Info[25]}   ${Info[11]}  ${Info[13]}   ${Info[14]}     ${Info[12]}
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
    IBCF_PeerPage.Add Manipulation Rules    ${Info[4]}  ${Info[5]}   ${Info[6]}    ${Info[7]}    ${Info[8]}  ${Info[9]}   ${Info[10]}
    ...                                   ${Info[11]}     ${Info[12]}   ${Info[13]}   ${Info[14]}   ${Info[15]}     ${Info[16]}   ${Info[17]}
    ...                                   ${Info[18]}     ${Info[19]}     ${Info[20]}   ${Info[21]}   ${Info[22]}
    Reload Page
    Verify Page Contains 2 Expected Elements     ${Info[4]}  ${Info[5]}

Edit Manipulation Rules function
    [Arguments]  ${Info}
    IBCF_PeerPage.Edit Manipulation Rules  ${Info[4]}  ${Info[5]}   ${Info[23]}    ${Info[24]}    ${Info[25]}  ${Info[26]}   ${Info[27]}
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
    IBCF_PeerPage.View Manipulation  ${Info[4]}  ${Info[5]}   ${Info[6]}
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
    IBCF_PeerPage.Add Header Authorization Profiles    ${Info[4]}  ${Info[5]}  ${Info[6]}   ${Info[7]}   ${Info[8]}  ${Info[9]}  ${Info[10]}  ${Info[11]}
    Reload Page
    ${arg} =  Create List    ${Info[4]}  ${Info[6]}
    Run Keyword N Times And Stop If Success    Verify Page Contains 2 Expected Elements   ${arg}    Click Element   ${Next_page}   6
    Sleep   3s

    # Run Keyword If  '${Info[4]}' == 'auto_HAP_12'      Click Element     ${Next_page}
    # Run Keyword If  '${Info[4]}' == 'auto_HAP_15'      Click Element     ${Next_page}
    # Run Keyword If  '${Info[4]}' == 'auto_HAP_17'      Click Element     ${Next_page}
    # Verify Page Contains 2 Expected Elements     ${Info[4]}  ${Info[6]}

Add Invalid Header Authorization Profiles function
    [Arguments]  ${Info}
    IBCF_PeerPage.Add Header Authorization Profiles    ${Info[4]}  ${Info[5]}  ${Info[6]}   ${Info[7]}   ${Info[8]}  ${Info[9]}  ${Info[10]}  ${Info[11]}
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
    IBCF_PeerPage.Add And Then View Header Authorization Profiles  ${Info[4]}  ${Info[5]}   ${Info[6]}  ${Info[7]}  ${Info[9]}  ${Info[10]}  ${Info[12]}
    Back from View Page

View Header Authorization Profiles function
    [Arguments]  ${Info}
    IBCF_PeerPage.View Header Authorization Profiles  ${Info[4]}  ${Info[5]}   ${Info[6]}  ${Info[7]}  ${Info[9]}  ${Info[10]}  ${Info[11]}
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




#################################### Authorization Profiles ###########################################
Add Authorization Profiles function
    [Arguments]  ${Info}
    IBCF_PeerPage.Add Authorization Profiles    ${Info[4]}  ${Info[5]}   ${Info[6]}    ${Info[7]}    ${Info[8]}    ${Info[9]}
    ...         ${Info[10]}    ${Info[11]}    ${Info[12]}     ${Info[13]}    ${Info[14]}    ${Info[15]}       ${Info[16]}
    ...         ${Info[17]}    ${Info[18]}    ${Info[19]}     ${Info[20]}    ${Info[21]}
#    Reload Page
    Wait Until Page Does Not Contain Element    ${Confirm_Add_Type_Button}   10s
    # ${is_Page_2} =  run keyword and return status   Page Should Contain Element     ${Next_page}
    # Run Keyword If  '${is_Page_2}' == 'True'        Click Element    ${Next_page}
    # Verify Page Contains 2 Expected Elements     ${Info[4]}  ${Info[5]}
    ${arg} =  Create List   ${Info[4]}  ${Info[5]}  
    Run Keyword N Times And Stop If Success  Verify Page Contains 2 Expected Elements   ${arg}    Click Element   ${Next_page}   3
    Sleep   3s

Add Invalid Authorization Profiles function
    [Arguments]  ${Info}
    IBCF_PeerPage.Add Invalid Authorization Profiles    ${Info[4]}  ${Info[5]}   ${Info[6]}    ${Info[7]}    ${Info[8]}    ${Info[9]}
    ...         ${Info[10]}    ${Info[11]}    ${Info[12]}     ${Info[13]}    ${Info[14]}    ${Info[15]}       ${Info[16]}
    ...         ${Info[17]}    ${Info[18]}    ${Info[19]}     ${Info[20]}    ${Info[21]}
    IF    '${Info[18]}' != '#BLANK'         Verify Page Contains Error Message     ${Info[18]}
    ${arg} =  Create List   ${Info[4]}  ${Info[5]}  
    Run Keyword N Times And Stop If Success  Verify Page Not Contains 2 Expected Elements   ${arg}    Click Element   ${Next_page}   3
    Sleep   3s
    
View Authorization Profiles function
    [Arguments]  ${Info}
    IBCF_PeerPage.View Authorization Profiles  ${Info[4]}  ${Info[5]}
    Back from View Page

Filter Authorization Profiles function
    [Arguments]  ${Info}
    Click Element       ${AP_Field}
    Sleep   1s
    Filter 2 value           ${Info[4]}  ${Info[5]}

Filter Special Charaters Authorization Profiles function
    [Arguments]  ${Info}
    Click Element       ${AP_Field}
    Sleep   1s
    Filter special character 4 value           ${Info[4]}  ${Info[5]}  ${Info[6]}   ${Info[7]}  ${Info[8]}  ${Info[9]}

Edit Authorization Profiles function
    [Arguments]  ${Info}
    IBCF_PeerPage.Edit Authorization Profiles    ${Info[4]}  ${Info[5]}   ${Info[6]}    ${Info[7]}    ${Info[8]}    ${Info[9]}
    ...         ${Info[10]}    ${Info[11]}    ${Info[12]}     ${Info[13]}    ${Info[14]}    ${Info[15]}       ${Info[16]}
    ...         ${Info[17]}    ${Info[18]}    ${Info[19]}     ${Info[20]}    ${Info[21]}    ${Info[22]}
#    Reload Page
    Wait Until Page Does Not Contain Element   ${Confirm_Add_Type_Button}   10s
 #   Verify Page Contains 2 Expected Elements     ${Info[4]}  ${Info[6]}
    ${arg} =  Create List   ${Info[4]}  ${Info[6]}  
    Run Keyword N Times And Stop If Success  Verify Page Contains 2 Expected Elements   ${arg}    Click Element   ${Next_page}   3
    Sleep   3s

Delete Authorization Profiles function
    [Arguments]  ${Info}
    Click Element       ${AP_Field}
    Sleep   1s
    Delete with 2 info  ${Info[4]}  ${Info[5]}
    Verify Page Not Contains 2 Expect Elements  ${Info[4]}  ${Info[5]}

#################################### Routing Profiles #################################
Add Routing Profiles function
    [Arguments]  ${Info}
    IBCF_PeerPage.Add Routing Profiles    ${Info[4]}  ${Info[5]}   ${Info[6]}    ${Info[7]}    ${Info[8]}    ${Info[9]}     ${Info[10]}    ${Info[11]}
    Reload Page
    Verify Page Contains 2 Expected Elements     ${Info[4]}  ${Info[5]}

Filter Routing Profiles function
    [Arguments]  ${Info}
    Click Element       ${RP_Field}
    Sleep   1s
    Filter 3 value           ${Info[4]}  ${Info[5]}  ${Info[6]}

Filter Special Charaters Routing Profiles function
    [Arguments]  ${Info}
    Click Element       ${RP_Field}
    Sleep   1s
    Filter special character 3 value           ${Info[4]}  ${Info[5]}  ${Info[6]}   ${Info[7]}  ${Info[8]}

Edit Routing Profiles function
    [Arguments]  ${Info}
    IBCF_PeerPage.Edit Routing Profiles    ${Info[4]}  ${Info[5]}   ${Info[6]}    ${Info[7]}    ${Info[8]}    ${Info[9]}     ${Info[10]}    ${Info[11]}     ${Info[12]}
    Reload Page
    Verify Page Contains 2 Expected Elements     ${Info[4]}  ${Info[6]}

Delete Routing Profiles function
    [Arguments]  ${Info}
    Click Element       ${RP_Field}
    Sleep   1s
    Delete with 2 info  ${Info[4]}  ${Info[5]}
    Verify Page Not Contains 2 Expect Elements  ${Info[4]}  ${Info[5]}

#################################### Header Manipulation #################################
Add Header Manipulation function
    [Arguments]  ${Info}
    IBCF_PeerPage.Add Header Manipulation    ${Info[4]}  ${Info[5]}   ${Info[6]}    ${Info[7]}    ${Info[8]}    ${Info[9]}     ${Info[10]}
    ...   ${Info[11]}  ${Info[12]}   ${Info[13]}    ${Info[14]}    ${Info[15]}    ${Info[16]}     ${Info[17]}   ${Info[18]}
    ...   ${Info[19]}   ${Info[20]}    ${Info[21]}    ${Info[22]}    ${Info[23]}     ${Info[24]}    ${Info[25]}     ${Info[26]}
    Reload Page
    Verify Page Contains 2 Expected Elements     ${Info[4]}  ${Info[5]}

View Header Manipulation function
    [Arguments]  ${Info}
    IBCF_PeerPage.View Header Manipulation  ${Info[4]}  ${Info[5]}   ${Info[24]}  ${Info[25]}  ${Info[26]}
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

Edit Header Manipulation function
    [Arguments]  ${Info}
    IBCF_PeerPage.Edit Header Manipulation    ${Info[4]}  ${Info[5]}  ${Info[27]}    ${Info[28]}     ${Info[29]}      ${Info[30]}
    ...    ${Info[31]}  ${Info[32]}   ${Info[33]}    ${Info[34]}    ${Info[35]}    ${Info[36]}     ${Info[37]}    ${Info[38]}  ${Info[39]}
    ...   ${Info[40]}   ${Info[41]}   ${Info[42]}    ${Info[43]}    ${Info[44]}    ${Info[45]}     ${Info[46]}    ${Info[47]}   ${Info[48]}
    Reload Page
    Verify Page Contains 2 Expected Elements     ${Info[4]}  ${Info[27]}

Delete Header Manipulation function
    [Arguments]  ${Info}
    Click Element       ${HM_Field}
    Sleep   1s
    Delete with 2 info  ${Info[4]}  ${Info[5]}
    Verify Page Not Contains 2 Expect Elements  ${Info[4]}  ${Info[5]}

#################################### SDP Profile #################################
Add Valid SDP Profile function
    [Arguments]  ${Info}
    IBCF_PeerPage.Add SDP Profile    ${Info[4]}  ${Info[5]}   ${Info[6]}    ${Info[7]}    ${Info[8]}    ${Info[9]}     ${Info[10]}
    ...     ${Info[11]}   ${Info[12]}    ${Info[13]}    ${Info[14]}    ${Info[15]}  ${Info[16]}  ${Info[17]}  ${Info[18]}
    #Reload Page
    # Run Keyword If  '${Info[4]}' == '20'      Click Element     ${Next_page}
    # Run Keyword If  '${Info[4]}' == '21'      Click Element     ${Next_page}
    # Run Keyword If  '${Info[4]}' == '31'      Click Element     ${Next_page}
    ${is_Page_2} =  run keyword and return status   Page Should Contain Element    ${Next_page}
    Run Keyword If  '${is_Page_2}' == 'True'        Click Element    ${Next_page}
    Sleep       3s
    
    Run Keyword If    '${Info[5]}' == '#BLANK' and '${Info[12]}' != 'cancel'     Verify Page Not Contains 2 Expect Elements   ${Info[4]}  ${Info[5]}
    Run Keyword If    '${Info[5]}' != '#BLANK' and '${Info[12]}' != 'cancel'     Verify Page Contains 2 Expected Elements     ${Info[4]}  ${Info[5]}

Add Invalid SDP Profile function
    [Arguments]  ${Info}
    IBCF_PeerPage.Add SDP Profile    ${Info[4]}  ${Info[5]}   ${Info[6]}    ${Info[7]}    ${Info[8]}    ${Info[9]}     ${Info[10]}
    ...     ${Info[11]}   ${Info[12]}    ${Info[13]}    ${Info[14]}    ${Info[15]}  ${Info[16]}  ${Info[17]}  ${Info[18]}
    Run Keyword If    '${Info[19]}' != '#BLANK'         Verify Page Contains Error Message     ${Info[19]}
    Run Keyword If    '${Info[20]}' != '#BLANK'         Verify Page Contains Error Message     ${Info[20]}
    Run Keyword If    '${Info[21]}' != '#BLANK'         Verify Page Contains Error Message     ${Info[21]}


View SDP Profile function
    [Arguments]  ${Info}
    IBCF_PeerPage.View SDP Profile  ${Info[4]}  ${Info[22]}  ${Info[8]}   ${Info[9]}  ${Info[11]}  ${Info[12]}  ${Info[19]}  ${Info[21]}
    #Run Keyword If   '${Info[12]}' != 'cancel'        Back from View Page

Filter SDP Profile function
    [Arguments]  ${Info}
    Click Element       ${SP_Field}
    Sleep   1s
    Filter 3 value           ${Info[4]}  ${Info[21]}  ${Info[10]}

Filter Special Charaters SDP Profile function
    [Arguments]  ${Info}
    Click Element       ${SP_Field}
    Sleep   1s
    Filter special character 3 value           ${Info[4]}  ${Info[5]}  ${Info[6]}   ${Info[7]}  ${Info[8]}

Edit Valid SDP Profile function
    [Arguments]  ${Info}
    IBCF_PeerPage.Edit Valid SDP Profile    ${Info[4]}  ${Info[5]}   ${Info[6]}    ${Info[7]}    ${Info[8]}    ${Info[9]}     ${Info[10]}
    ...     ${Info[11]}   ${Info[12]}    ${Info[13]}    ${Info[14]}    ${Info[15]}     ${Info[16]}     ${Info[17]}     ${Info[18]}   ${Info[20]}
    # Reload Page
    # Run Keyword If  '${Info[4]}' == '20'      Click Element     ${Next_page}
    # Run Keyword If  '${Info[4]}' == '21'      Click Element     ${Next_page}
    # Run Keyword If  '${Info[4]}' == '31'      Click Element     ${Next_page}

   # Verify Page Contains 2 Expected Elements     ${Info[4]}  ${Info[10]}

     ${arg} =  Create List   ${Info[4]}  ${Info[10]}
    Run Keyword N Times And Stop If Success  Verify Page Contains 2 Expected Elements   ${arg}    Click Element   ${Next_page}   4
    Sleep   3s


Edit Invalid SDP Profile function
    [Arguments]  ${Info}
    IBCF_PeerPage.Edit Invalid SDP Profile    ${Info[4]}  ${Info[5]}   ${Info[6]}    ${Info[7]}    ${Info[8]}    ${Info[9]}     ${Info[10]}
    ...     ${Info[11]}   ${Info[12]}    ${Info[13]}    ${Info[14]}    ${Info[15]}  ${Info[16]}  ${Info[17]}  ${Info[18]}  ${Info[22]}
    Run Keyword If    '${Info[19]}' != '#BLANK'         Verify Page Contains Error Message     ${Info[19]}
    Run Keyword If    '${Info[20]}' != '#BLANK'         Verify Page Contains Error Message     ${Info[20]}
    Run Keyword If    '${Info[21]}' != '#BLANK'         Verify Page Contains Error Message     ${Info[21]}


Delete SDP Profile function
    [Arguments]  ${Info}
    Click Element       ${SP_Field}
    Sleep   1s
    ${arg} =  Create List   ${Info[4]}  ${Info[21]}
    Run Keyword N Times And Stop If Success   Delete with 2 info   ${arg}    Click Element   ${Next_page}   6
    Sleep   3s

    # Delete with 2 info  ${Info[4]}  ${Info[21]}
    Verify Page Not Contains 2 Expect Elements  ${Info[4]}  ${Info[21]}

#################################### Session Limiter Profile #################################
Add Session Limiter function
    [Arguments]  ${Info}
    IBCF_PeerPage.Add Session Limiter    ${Info[4]}  ${Info[5]}   ${Info[6]}    ${Info[7]}    ${Info[8]}    ${Info[9]}     ${Info[10]}
    ...     ${Info[11]}   ${Info[12]}    ${Info[13]}    ${Info[14]}    ${Info[15]}     ${Info[16]}     ${Info[17]}
    Reload Page
    Verify Page Contains 2 Expected Elements     ${Info[4]}  ${Info[5]}

View Session Limiter function
    [Arguments]  ${Info}
    IBCF_PeerPage.View Session Limiter  ${Info[4]}  ${Info[5]}   ${Info[6]}    ${Info[7]}    ${Info[8]}    ${Info[9]}     ${Info[10]}
    ...     ${Info[11]}   ${Info[12]}    ${Info[13]}    ${Info[14]}    ${Info[15]}     ${Info[16]}     ${Info[17]}
    Back from View Page

Filter Session Limiter function
    [Arguments]  ${Info}
    Click Element       ${SLP_Field}
    Sleep   1s
    Filter 4 value           ${Info[4]}  ${Info[5]}  ${Info[7]}  ${Info[9]}

Filter Special Charaters Session Limiter function
    [Arguments]  ${Info}
    Click Element       ${SLP_Field}
    Sleep   1s
    Filter special character 4 value           ${Info[4]}  ${Info[5]}  ${Info[6]}   ${Info[7]}  ${Info[8]}  ${Info[9]}

Edit Session Limiter function
    [Arguments]  ${Info}
    IBCF_PeerPage.Edit Session Limiter    ${Info[4]}  ${Info[5]}   ${Info[18]}    ${Info[19]}    ${Info[20]}    ${Info[21]}     ${Info[22]}
    ...     ${Info[23]}   ${Info[24]}    ${Info[25]}    ${Info[26]}    ${Info[27]}     ${Info[28]}     ${Info[29]}   ${Info[30]}
    Reload Page
    Verify Page Contains 2 Expected Elements     ${Info[4]}  ${Info[18]}

Delete Session Limiter function
    [Arguments]  ${Info}
    Click Element       ${SLP_Field}
    Sleep   1s
    Delete with 2 info  ${Info[4]}  ${Info[5]}
    Verify Page Not Contains 2 Expect Elements  ${Info[4]}  ${Info[5]}

#################################### Session Control Profile #################################
Add Session Control function
    [Arguments]  ${Info}
    IBCF_PeerPage.Add Session Control    ${Info[4]}  ${Info[5]}   ${Info[6]}    ${Info[7]}    ${Info[8]}    ${Info[9]}     ${Info[10]}
    ...     ${Info[11]}   ${Info[12]}    ${Info[13]}    ${Info[14]}    ${Info[15]}     ${Info[16]}     ${Info[17]}
    Reload Page
    Verify Page Contains 2 Expected Elements     ${Info[4]}  ${Info[5]}

Edit Session Control function
    [Arguments]  ${Info}
    IBCF_PeerPage.Edit Session Control    ${Info[4]}  ${Info[5]}   ${Info[18]}    ${Info[19]}    ${Info[20]}    ${Info[21]}     ${Info[22]}
    ...     ${Info[23]}   ${Info[24]}    ${Info[25]}    ${Info[26]}    ${Info[27]}     ${Info[28]}     ${Info[29]}      ${Info[30]}
    Reload Page
    Verify Page Contains 2 Expected Elements     ${Info[4]}  ${Info[18]}

Delete Session Control function
    [Arguments]  ${Info}

    Scroll Element Into View    ${PCSCF_tab}
    Sleep       1s
    Click Element       ${SC_Field}
    Sleep   1s
    Delete with 2 info  ${Info[4]}  ${Info[5]}
    Verify Page Not Contains 2 Expect Elements  ${Info[4]}  ${Info[5]}

View Session Control function
    [Arguments]  ${Info}
    IBCF_PeerPage.View Session Control   ${Info[4]}  ${Info[5]}  ${Info[6]}   ${Info[7]}
    Back from View Page

Filter Session Control function
    [Arguments]  ${Info}
    Scroll Element Into View    ${PCSCF_tab}
    Click Element       ${SC_Field}
    Sleep   1s
    Filter 4 value           ${Info[4]}  ${Info[5]}  ${Info[6]}   ${Info[7]}

Filter Special Charaters Session Control function
    [Arguments]  ${Info}
    Scroll Element Into View    ${PCSCF_tab}
    Click Element       ${SC_Field}
    Sleep   1s
    Filter special character 4 value           ${Info[4]}  ${Info[5]}  ${Info[6]}   ${Info[7]}  ${Info[8]}  ${Info[9]}
#################################### RFC4028 Profile #################################
Add Valid RFC4028 function
    [Arguments]  ${Info}
    IBCF_PeerPage.Add RFC4028    ${Info[4]}  ${Info[5]}   ${Info[6]}    ${Info[7]}    ${Info[8]}    ${Info[9]}
    Reload Page
    Verify Page Contains 2 Expected Elements     ${Info[4]}  ${Info[5]}

Add invalid RFC4028 function
    [Arguments]  ${Info}
    IBCF_PeerPage.Add RFC4028    ${Info[4]}  ${Info[5]}   ${Info[6]}    ${Info[7]}    ${Info[8]}    ${Info[9]}

Edit Valid RFC4028 function
    [Arguments]  ${Info}
    IBCF_PeerPage.Edit RFC4028    ${Info[4]}  ${Info[5]}   ${Info[10]}    ${Info[11]}    ${Info[12]}    ${Info[13]}     ${Info[14]}
    Reload Page
    Verify Page Contains 2 Expected Elements     ${Info[4]}  ${Info[10]}

Edit invalid RFC4028 function
    [Arguments]  ${Info}
    IBCF_PeerPage.Edit RFC4028    ${Info[4]}  ${Info[5]}   ${Info[10]}    ${Info[11]}    ${Info[12]}    ${Info[13]}     ${Info[14]}

Delete RFC4028 function
    [Arguments]  ${Info}
    Scroll Element Into View    ${PCSCF_tab}

    Click Element       ${RFC4028_Field}
    Sleep   1s
    Delete with 2 info  ${Info[4]}  ${Info[5]}
    Verify Page Not Contains 2 Expect Elements  ${Info[4]}  ${Info[5]}

View RFC4028 function
    [Arguments]  ${Info}
    IBCF_PeerPage.View RFC4028  ${Info[4]}  ${Info[7]}  ${Info[5]}   ${Info[6]}  ${Info[9]}   ${Info[8]}
    Back from View Page

Filter RFC4028 function
    [Arguments]  ${Info}
    Scroll Element Into View    ${PCSCF_tab}

    Click Element       ${RFC4028_Field}
    Sleep   1s
    Filter 4 value           ${Info[4]}  ${Info[7]}  ${Info[5]}   ${Info[6]}

Filter Special Charaters RFC4028 function
    [Arguments]  ${Info}
    Scroll Element Into View    ${PCSCF_tab}

    Click Element       ${RFC4028_Field}
    Sleep   1s
    Filter special character 4 value           ${Info[4]}  ${Info[5]}  ${Info[6]}   ${Info[7]}  ${Info[8]}  ${Info[9]}
#################################### Core Domain #################################
Add Core Domain function
    [Arguments]  ${Info}
    IBCF_PeerPage.Add Core Domain    ${Info[4]}
    Reload Page
    Verify Page Contains 1 Expected Elements     ${Info[4]}

Delete Core Domain function
    [Arguments]  ${Info}
    Click Element       ${Core_Domain_Field}
    Sleep   1s
    Delete with 1 info  ${Info[4]}
    Verify Page Not Contains 1 Expect Elements  ${Info[4]}

