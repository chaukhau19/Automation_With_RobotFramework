*** Settings ***
Library  SeleniumLibrary
Resource  ../../Resources/Admin/LoginApp_SBC.robot
Resource  ./PO/IBCF_PeerPage.robot
Resource  ../Admin/PO/UserManagerPage.robot
Resource  ../Common.robot

*** Keywords ***

Add MatchingRules
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Add Matching function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Add Invalid MatchingRules
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Verify errors in matching rules function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Edit Invalid MatchingRules
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Verify errors in edit matching rules function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Sort MatchingRules
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    Click Element       ${MatchingRule}
    Sleep   1s
    Sort Element  Matching rule name
    Sort Element  Header name
    Page should not contain  Internal Server Error
View MatchingRules
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               View Matching rules function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Filter MatchingRules
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Filter Matching rules function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Filter Special Character MatchingRules
    [Arguments]  ${Scenarios}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Filter Special Charaters Matching rules function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Edit MatchingRules
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Edit Matching function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END



Delete MatchingRules
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Delete Matching function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Add ManiRules
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Add Manipulation Rules function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Sort ManiRules
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    Click Element       ${ManiRule}
    Sleep   1s
    Sort Element  Manipulation rule name
    Sort Element  Header name

View ManiRules
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               View Manipulation rules function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Filter ManiRules
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Filter Manipulation rules function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Filter Special Character ManiRules
    [Arguments]  ${Scenarios}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Filter Special Charaters Manipulation rules function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Edit ManiRules
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Edit Manipulation Rules function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Delete ManiRules
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Delete Manipulation Rules function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Add Valid HeaderAuthProfiles
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Add Valid Header Authorization Profiles function      ${Info}
               Add And Then View Header Authorization Profiles function           ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Add HeaderAuthProfiles
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            Add Header Authorization Profiles function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Sort HeaderAuthProfiles
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
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
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               View Header Authorization Profiles function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Filter HeaderAuthProfiles
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Filter Header Authorization Profiles function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Filter Special Character HeaderAuthProfiles
    [Arguments]  ${Scenarios}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Filter Special Charaters Header Authorization Profiles function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Delete HeaderAuthProfiles
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            Delete Header Authorization Profiles function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Add AuthProfiles
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            Add Authorization Profiles function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Sort AuthProfiles
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    Click Element       ${AP_Field}
    Sleep   1s
    Sort Element  Index
    Sort Element  Default authorization

View AuthProfiles
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               View Authorization Profiles function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Filter AuthProfiles
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Filter Authorization Profiles function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Filter Special Character AuthProfiles
    [Arguments]  ${Scenarios}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Filter Special Charaters Authorization Profiles function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Edit AuthProfiles
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            Edit Authorization Profiles function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Delete AuthProfiles
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            Delete Authorization Profiles function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Add RoutingProfiles
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            Add Routing Profiles function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Sort RoutingProfiles
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    Click Element       ${RP_Field}
    Sleep   1s
    Sort Element  Index
    Sort Element  Default routing

Filter RoutingProfiles
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Filter Routing Profiles function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Filter Special Character RoutingProfiles
    [Arguments]  ${Scenarios}
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
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            Edit Routing Profiles function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Delete RoutingProfiles
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            Delete Routing Profiles function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Add HeaderManipulation
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            Add Header Manipulation function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Sort HeaderManipulation
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    Click Element       ${HM_Field}
    Sleep   1s
    Sort Element  SIP manipulation profile
    Sort Element  Processing order

View HeaderManipulation
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               View Header Manipulation function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Filter HeaderManipulation
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Filter Header Manipulation function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Filter Special Character HeaderManipulation
    [Arguments]  ${Scenarios}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Filter Special Charaters Header Manipulation function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Edit HeaderManipulation
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            Edit Header Manipulation function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Delete HeaderManipulation
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            Delete Header Manipulation function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Add Valid SDPProfile
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            Add Valid SDP Profile function   ${Info}
            View SDP Profile function   ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


# Add SDPProfile
#     [Arguments]  ${Scenarios}
#     ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
#     LoginApp_SBC.Navigate to Sign In Page
#     LoginApp_SBC.Attempt to Single Login   ${Login_single}
#     IBCF_PeerPage.Go to Peer section in IBCF tab
#     FOR    ${Info}  IN  @{Scenarios}
#         TRY
#             Add SDP Profile function      ${Info}
 
#         EXCEPT    AS    ${error}
#             Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
#         END
#     END


Sort SDPProfile
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    Click Element       ${SP_Field}
    Sleep   1s
    Sort Element  Index
    Sort Element  Media type

View SDPProfile
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               View SDP Profile function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Filter SDPProfile
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Filter SDP Profile function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Filter Special Character SDPProfile
    [Arguments]  ${Scenarios}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Filter Special Charaters SDP Profile function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Edit Valid SDPProfile
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            Edit Valid SDP Profile function   ${Info}
            View SDP Profile function   ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


# Edit SDPProfile
#     [Arguments]  ${Scenarios}
#     ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
#     LoginApp_SBC.Navigate to Sign In Page
#     LoginApp_SBC.Attempt to Single Login   ${Login_single}
#     IBCF_PeerPage.Go to Peer section in IBCF tab
#     FOR    ${Info}  IN  @{Scenarios}
#         TRY
#             Edit SDP Profile function      ${Info}
 
#         EXCEPT    AS    ${error}
#             Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
#         END
#     END


Delete SDPProfile
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            Delete SDP Profile function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Add SessionLimiter
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            Add Session Limiter function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Sort SessionLimiter
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    Click Element       ${SLP_Field}
    Sleep   1s
    Sort Element  Index

View SessionLimiter
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               View Session Limiter function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Filter SessionLimiter
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Filter Session Limiter function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Filter Special Character SessionLimiter
    [Arguments]  ${Scenarios}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Filter Special Charaters Session Limiter function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Edit SessionLimiter
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            Edit Session Limiter function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Delete SessionLimiter
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            Delete Session Limiter function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Add SessionControl
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            Add Session Control function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Sort SessionControl
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    Scroll Element Into View    ${PCSCF_tab}
    Sleep  1s
    Click Element       ${SC_Field}
    Sleep   1s
    Sort Element  Name


View SessionControl
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               View Session Control function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Filter SessionControl
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Filter Session Control function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Filter Special Character SessionControl
    [Arguments]  ${Scenarios}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Filter Special Charaters Session Control function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Edit SessionControl
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            Edit Session Control function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Delete SessionControl
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            Delete Session Control function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END



Add RFC4028
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            Add RFC4028 function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Edit RFC4028
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            Edit RFC4028 function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Delete RFC4028
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            Delete RFC4028 function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Sort RFC4028
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    Sleep  1s
    Scroll Element Into View    ${PCSCF_tab}
    Click Element       ${RFC4028_Field}
    Sleep   1s
    Sort Element  ID
    Sort Element  Session Expire

View RFC4028
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               View RFC4028 function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Filter RFC4028
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Filter RFC4028 function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Filter Special Character RFC4028
    [Arguments]  ${Scenarios}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Filter Special Charaters RFC4028 function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Add Core Domain
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            Add Core Domain function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Delete Core Domain
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            Delete Core Domain function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Add PeerIBCF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            Add Peer function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Add PeerIBCF64
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            Add Peer function 64      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Add PeerIBCF71
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            Add Peer function 71      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Add PeerIBCF63
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            Add Peer function 63      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Edit PeerIBCF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            Edit Peer function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


# Edit PeerIBCF64
#     [Arguments]  ${Scenarios}
#     ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
#     LoginApp_SBC.Navigate to Sign In Page
#     LoginApp_SBC.Attempt to Single Login   ${Login_single}
#     IBCF_PeerPage.Go to Peer section in IBCF tab
#     FOR    ${Info}  IN  @{Scenarios}
#         TRY
#             Edit Peer function 64      ${Info}
 
#         EXCEPT    AS    ${error}
#             Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
#         END
#     END


Edit PeerIBCF71
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            Edit Peer function 71      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Edit PeerIBCF63
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            Edit Peer function 63      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Delete PeerIBCF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            Delete Peer function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Sort PeerIBCF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    Click Element       ${Peer_Field}
    Sleep   1s
    Sort Element  Name
    Sort Element  Domain

View PeerIBCF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               View Peer function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


View PeerIBCF71
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               View Peer function 71      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Filter PeerIBCF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_PeerPage.Go to Peer section in IBCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Filter Peer function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Filter Special Character PeerIBCF
    [Arguments]  ${Scenarios}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Filter Special Charaters Peer function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Add Peer function
    [Arguments]  ${Info}
    IBCF_PeerPage.Add Peer  ${Info[4]}  ${Info[5]}   ${Info[6]}    ${Info[7]}    ${Info[8]}  ${Info[9]}   ${Info[10]}
    ...   ${Info[11]}  ${Info[12]}    ${Info[13]}    ${Info[14]}   ${Info[15]}    ${Info[16]}    ${Info[17]}   ${Info[18]}
    ...   ${Info[19]}  ${Info[20]}    ${Info[21]}    ${Info[22]}    ${Info[23]}     ${Info[24]}     ${Info[25]}     ${Info[26]}
    ...   ${Info[27]}  ${Info[28]}    ${Info[29]}    ${Info[30]}    ${Info[31]}     ${Info[32]}     ${Info[33]}     ${Info[34]}
    ...   ${Info[35]}  ${Info[36]}    ${Info[37]}    ${Info[38]}    ${Info[39]}     ${Info[40]}     ${Info[41]}     ${Info[42]}
    ...   ${Info[43]}  ${Info[44]}    ${Info[45]}    ${Info[46]}    ${Info[47]}     ${Info[48]}     ${Info[49]}     #${Info[50]}
    #...   ${Info[51]}  ${Info[52]}    ${Info[53]}    ${Info[54]}
    reload page
    Verify Page Contains 2 Expected Elements     ${Info[4]}  ${Info[9]}

Add Peer function 64
    [Arguments]  ${Info}
    IBCF_PeerPage.Add Peer64  ${Info[4]}  ${Info[5]}   ${Info[6]}    ${Info[7]}    ${Info[8]}  ${Info[9]}   ${Info[10]}
    ...   ${Info[11]}  ${Info[12]}    ${Info[13]}    ${Info[14]}   ${Info[15]}    ${Info[16]}    ${Info[17]}   ${Info[18]}
    ...   ${Info[19]}  ${Info[20]}    ${Info[21]}    ${Info[22]}    ${Info[23]}     ${Info[24]}     ${Info[25]}     ${Info[26]}
    ...   ${Info[27]}  ${Info[28]}    ${Info[29]}    ${Info[30]}    ${Info[31]}     ${Info[32]}     ${Info[33]}     ${Info[34]}
    ...   ${Info[35]}  ${Info[36]}    ${Info[37]}    ${Info[38]}    ${Info[39]}     ${Info[40]}     ${Info[41]}     ${Info[42]}
    ...   ${Info[43]}  ${Info[44]}    ${Info[45]}    ${Info[46]}    ${Info[47]}     ${Info[48]}     ${Info[49]}     ${Info[103]}
    ...   ${Info[105]}  ${Info[107]}    ${Info[109]}  ${Info[111]}
    reload page
    Verify Page Contains 2 Expected Elements     ${Info[4]}  ${Info[9]}

Add Peer function 71
    [Arguments]  ${Info}
    IBCF_PeerPage.Add Peer71  ${Info[4]}  ${Info[5]}   ${Info[6]}    ${Info[7]}    ${Info[8]}  ${Info[9]}   ${Info[10]}
    ...   ${Info[11]}  ${Info[12]}    ${Info[13]}    ${Info[14]}   ${Info[15]}    ${Info[16]}    ${Info[17]}   ${Info[18]}
    ...   ${Info[19]}  ${Info[20]}    ${Info[21]}    ${Info[22]}    ${Info[23]}     ${Info[24]}     ${Info[25]}     ${Info[26]}
    ...   ${Info[27]}  ${Info[28]}    ${Info[29]}    ${Info[30]}    ${Info[31]}     ${Info[32]}     ${Info[33]}     ${Info[34]}
    ...   ${Info[35]}  ${Info[36]}    ${Info[37]}    ${Info[38]}    ${Info[39]}     ${Info[40]}     ${Info[41]}     ${Info[42]}
    ...   ${Info[43]}  ${Info[44]}    ${Info[45]}    ${Info[46]}    ${Info[47]}     ${Info[48]}     ${Info[49]}     ${Info[103]}
    ...   ${Info[105]}  ${Info[107]}    ${Info[109]}  ${Info[111]}  ${Info[112]}  ${Info[113]}
    reload page
    Verify Page Contains 2 Expected Elements     ${Info[4]}  ${Info[9]}

Add Peer function 63
    [Arguments]  ${Info}
    IBCF_PeerPage.Add Peer63  ${Info[4]}  ${Info[5]}   ${Info[6]}    ${Info[7]}    ${Info[8]}  ${Info[9]}   ${Info[10]}
    ...   ${Info[11]}  ${Info[12]}    ${Info[13]}    ${Info[14]}   ${Info[15]}    ${Info[16]}    ${Info[17]}   ${Info[18]}
    ...   ${Info[19]}  ${Info[20]}    ${Info[21]}    ${Info[22]}    ${Info[23]}     ${Info[24]}     ${Info[25]}     ${Info[26]}
    ...   ${Info[27]}  ${Info[28]}    ${Info[29]}    ${Info[30]}    ${Info[31]}     ${Info[32]}     ${Info[33]}     ${Info[34]}
    ...   ${Info[35]}  ${Info[36]}    ${Info[37]}    ${Info[38]}    ${Info[39]}     ${Info[40]}     ${Info[41]}     ${Info[42]}
    ...   ${Info[43]}  ${Info[44]}    ${Info[45]}    ${Info[46]}    ${Info[47]}     ${Info[48]}     ${Info[49]}     ${Info[103]}
    ...   ${Info[105]}  ${Info[107]}   # ${Info[109]}
    reload page
    Verify Page Contains 2 Expected Elements     ${Info[4]}  ${Info[9]}

Edit Peer function
    [Arguments]  ${Info}
    IBCF_PeerPage.Edit Peer  ${Info[4]}  ${Info[50]}  ${Info[9]}  ${Info[51]}   ${Info[52]}   ${Info[53]}    ${Info[54]}   ${Info[55]}
    ...   ${Info[56]}    ${Info[57]}    ${Info[58]}   ${Info[59]}   ${Info[60]}   ${Info[61]}   ${Info[62]}
    ...   ${Info[63]}    ${Info[64]}  ${Info[65]}  ${Info[66]}   ${Info[67]}   ${Info[68]}   ${Info[69]}   ${Info[70]}
    ...   ${Info[71]}    ${Info[72]}  ${Info[73]}  ${Info[74]}   ${Info[75]}   ${Info[76]}   ${Info[77]}   ${Info[78]}
    ...   ${Info[79]}    ${Info[80]}  ${Info[81]}  ${Info[82]}   ${Info[83]}   ${Info[84]}   ${Info[85]}   ${Info[86]}
    ...   ${Info[87]}    ${Info[88]}  ${Info[89]}  ${Info[90]}   ${Info[91]}   ${Info[92]}   ${Info[93]}   ${Info[94]}
    ...   ${Info[95]}    ${Info[96]}  ${Info[97]}  ${Info[98]}   ${Info[99]}   ${Info[100]}   ${Info[101]}  ${Info[102]}

    reload page
    Verify Page Contains 2 Expected Elements     ${Info[4]}  ${Info[53]}

# Edit Peer function 64
#     [Arguments]  ${Info}
#     IBCF_PeerPage.Edit Peer64  ${Info[4]}  ${Info[50]}  ${Info[9]}  ${Info[51]}   ${Info[52]}   ${Info[53]}    ${Info[54]}   ${Info[55]}
#     ...   ${Info[56]}    ${Info[57]}    ${Info[58]}   ${Info[59]}   ${Info[60]}   ${Info[61]}   ${Info[62]}
#     ...   ${Info[63]}    ${Info[64]}  ${Info[65]}  ${Info[66]}   ${Info[67]}   ${Info[68]}   ${Info[69]}   ${Info[70]}
#     ...   ${Info[71]}    ${Info[72]}  ${Info[73]}  ${Info[74]}   ${Info[75]}   ${Info[76]}   ${Info[77]}   ${Info[78]}
#     ...   ${Info[79]}    ${Info[80]}  ${Info[81]}  ${Info[82]}   ${Info[83]}   ${Info[84]}   ${Info[85]}   ${Info[86]}
#     ...   ${Info[87]}    ${Info[88]}  ${Info[89]}  ${Info[90]}   ${Info[91]}   ${Info[92]}   ${Info[93]}   ${Info[94]}
#     ...   ${Info[95]}    ${Info[96]}  ${Info[97]}  ${Info[98]}   ${Info[99]}   ${Info[100]}   ${Info[101]}  ${Info[102]}
#     ...   ${Info[104]}   ${Info[106]}   ${Info[108]}  ${Info[110]}
#     reload page
#     Verify Page Contains 2 Expected Elements     ${Info[4]}  ${Info[51]}

Edit Peer function 71
    [Arguments]  ${Info}
    IBCF_PeerPage.Edit Peer71  ${Info[4]}  ${Info[50]}  ${Info[9]}  ${Info[51]}   ${Info[52]}   ${Info[53]}    ${Info[54]}   ${Info[55]}
    ...   ${Info[56]}    ${Info[57]}    ${Info[58]}   ${Info[59]}   ${Info[60]}   ${Info[61]}   ${Info[62]}
    ...   ${Info[63]}    ${Info[64]}  ${Info[65]}  ${Info[66]}   ${Info[67]}   ${Info[68]}   ${Info[69]}   ${Info[70]}
    ...   ${Info[71]}    ${Info[72]}  ${Info[73]}  ${Info[74]}   ${Info[75]}   ${Info[76]}   ${Info[77]}   ${Info[78]}
    ...   ${Info[79]}    ${Info[80]}  ${Info[81]}  ${Info[82]}   ${Info[83]}   ${Info[84]}   ${Info[85]}   ${Info[86]}
    ...   ${Info[87]}    ${Info[88]}  ${Info[89]}  ${Info[90]}   ${Info[91]}   ${Info[92]}   ${Info[93]}   ${Info[94]}
    ...   ${Info[95]}    ${Info[96]}  ${Info[97]}  ${Info[98]}   ${Info[99]}   ${Info[100]}   ${Info[101]}  ${Info[102]}
    ...   ${Info[104]}   ${Info[106]}   ${Info[108]}  ${Info[110]}  ${Info[111]}  ${Info[112]}
    reload page
    Verify Page Contains 2 Expected Elements     ${Info[4]}  ${Info[51]}


Edit Peer function 63
    [Arguments]  ${Info}
    IBCF_PeerPage.Edit Peer63  ${Info[4]}  ${Info[50]}  ${Info[9]}  ${Info[51]}   ${Info[52]}   ${Info[53]}    ${Info[54]}   ${Info[55]}
    ...   ${Info[56]}    ${Info[57]}    ${Info[58]}   ${Info[59]}   ${Info[60]}   ${Info[61]}   ${Info[62]}
    ...   ${Info[63]}    ${Info[64]}  ${Info[65]}  ${Info[66]}   ${Info[67]}   ${Info[68]}   ${Info[69]}   ${Info[70]}
    ...   ${Info[71]}    ${Info[72]}  ${Info[73]}  ${Info[74]}   ${Info[75]}   ${Info[76]}   ${Info[77]}   ${Info[78]}
    ...   ${Info[79]}    ${Info[80]}  ${Info[81]}  ${Info[82]}   ${Info[83]}   ${Info[84]}   ${Info[85]}   ${Info[86]}
    ...   ${Info[87]}    ${Info[88]}  ${Info[89]}  ${Info[90]}   ${Info[91]}   ${Info[92]}   ${Info[93]}   ${Info[94]}
    ...   ${Info[95]}    ${Info[96]}  ${Info[97]}  ${Info[98]}   ${Info[99]}   ${Info[100]}   ${Info[101]}  ${Info[102]}
    ...   ${Info[106]}   ${Info[108]}  ${Info[110]}
    reload page
    Verify Page Contains 2 Expected Elements     ${Info[4]}  ${Info[53]}

Delete Peer function
    [Arguments]  ${Info}
    Click Element       ${Peer_Field}
    Sleep   1s
    Delete with 2 info  ${Info[4]}  ${Info[9]}
    Verify Page Not Contains 2 Expect Elements  ${Info[4]}  ${Info[9]}

View Peer function
    [Arguments]  ${Info}
    IBCF_PeerPage.View Peer  ${Info[4]}  ${Info[5]}   ${Info[6]}  ${Info[7]}  ${Info[8]}  ${Info[9]}
    Back from View Page

View Peer function 71
    [Arguments]  ${Info}
    IBCF_PeerPage.View Peer 71  ${Info[4]}  ${Info[5]}   ${Info[6]}  ${Info[7]}  ${Info[8]}  ${Info[9]}  ${Info[112]}  ${Info[113]}
    Back from View Page

Filter Peer function
    [Arguments]  ${Info}
    Click Element       ${Peer_Field}
    Sleep   1s
    Filter 2 value           ${Info[4]}  ${Info[9]}

Filter Special Charaters Peer function
    [Arguments]  ${Info}
    Click Element       ${Peer_Field}
    Sleep   1s
    Filter special character 4 value           ${Info[4]}  ${Info[5]}  ${Info[6]}   ${Info[7]}  ${Info[8]}  ${Info[9]}
##############################Matching Rules #################################
Add Matching function
    [Arguments]  ${Info}
    IBCF_PeerPage.Add Matching  ${Info[4]}  ${Info[5]}   ${Info[6]}    ${Info[7]}    ${Info[8]}  ${Info[9]}   ${Info[10]}   ${Info[11]}     ${Info[12]}   ${Info[13]}   ${Info[14]}
    reload page
    Verify Page Contains 2 Expected Elements     ${Info[4]}  ${Info[5]}

Verify errors in matching rules function
    [Arguments]  ${Info}
    IBCF_PeerPage.Add Matching  ${Info[4]}  ${Info[5]}   ${Info[6]}    ${Info[7]}    ${Info[8]}  ${Info[9]}   ${Info[10]}   ${Info[11]}     ${Info[12]}   ${Info[13]}   ${Info[14]}
    reload page
    Verify Page Contains Error Message  ${Info[15]}

Edit Matching function
    [Arguments]  ${Info}
    IBCF_PeerPage.Edit Matching  ${Info[4]}  ${Info[5]}   ${Info[15]}    ${Info[16]}    ${Info[17]}  ${Info[18]}   ${Info[19]}   ${Info[20]}     ${Info[21]}   ${Info[22]}   ${Info[23]}  ${Info[24]}
    reload page
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
    reload page
    Verify Page Contains 2 Expected Elements     ${Info[4]}  ${Info[5]}

Edit Manipulation Rules function
    [Arguments]  ${Info}
    IBCF_PeerPage.Edit Manipulation Rules  ${Info[4]}  ${Info[5]}   ${Info[23]}    ${Info[24]}    ${Info[25]}  ${Info[26]}   ${Info[27]}
    ...                                   ${Info[28]}     ${Info[29]}   ${Info[30]}   ${Info[31]}   ${Info[32]}     ${Info[33]}   ${Info[34]}
    ...                                   ${Info[35]}     ${Info[36]}     ${Info[37]}   ${Info[38]}   ${Info[39]}   ${Info[40]}
    reload page
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
    reload page
    Run Keyword If  '${Info[4]}' == 'auto_HAP_12'      Click Element     ${Next_page}
    Run Keyword If  '${Info[4]}' == 'auto_HAP_15'      Click Element     ${Next_page}
    Run Keyword If  '${Info[4]}' == 'auto_HAP_17'      Click Element     ${Next_page}
    Verify Page Contains 2 Expected Elements     ${Info[4]}  ${Info[6]}

Add Header Authorization Profiles function
    [Arguments]  ${Info}
    IBCF_PeerPage.Add Header Authorization Profiles    ${Info[4]}  ${Info[5]}   ${Info[6]}    ${Info[7]}    ${Info[8]}  ${Info[9]}  ${Info[10]}  ${Info[11]}
    reload page
    Verify Page Contains 2 Expected Elements     ${Info[4]}  ${Info[6]}

Add And Then View Header Authorization Profiles function
    [Arguments]  ${Info}
    IBCF_PeerPage.Add And Then View Header Authorization Profiles  ${Info[4]}  ${Info[5]}   ${Info[6]}  ${Info[7]}  ${Info[9]}  ${Info[10]}  ${Info[11]}
    Back from View Page

View Header Authorization Profiles function
    [Arguments]  ${Info}
    IBCF_PeerPage.View Header Authorization Profiles  ${Info[4]}  ${Info[5]}   ${Info[6]}  ${Info[8]}
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
    IBCF_PeerPage.Add Authorization Profiles    ${Info[4]}  ${Info[5]}   ${Info[6]}    ${Info[7]}    ${Info[8]}    ${Info[9]}
    ...         ${Info[10]}    ${Info[11]}    ${Info[12]}     ${Info[13]}    ${Info[14]}    ${Info[15]}       ${Info[16]}
    reload page
    Verify Page Contains 2 Expected Elements     ${Info[4]}  ${Info[5]}

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
    IBCF_PeerPage.Edit Authorization Profiles    ${Info[4]}  ${Info[5]}   ${Info[17]}    ${Info[18]}    ${Info[19]}    ${Info[20]}
    ...         ${Info[21]}    ${Info[22]}    ${Info[23]}     ${Info[24]}    ${Info[25]}    ${Info[26]}       ${Info[27]}   ${Info[28]}
    reload page
    Verify Page Contains 2 Expected Elements     ${Info[4]}  ${Info[17]}

Delete Authorization Profiles function
    [Arguments]  ${Info}
    Click Element       ${AP_Field}
    Sleep   1s
    Delete with 2 info  ${Info[4]}  ${Info[5]}
    Verify Page Not Contains 2 Expect Elements  ${Info[4]}  ${Info[5]}

#################################### Routing Profiles #################################
Add Routing Profiles function
    [Arguments]  ${Info}
    IBCF_PeerPage.Add Routing Profiles    ${Info[4]}  ${Info[5]}   ${Info[6]}    ${Info[7]}    ${Info[8]}    ${Info[9]}     ${Info[10]}
    reload page
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
    IBCF_PeerPage.Edit Routing Profiles    ${Info[4]}  ${Info[5]}   ${Info[11]}    ${Info[12]}    ${Info[13]}    ${Info[14]}     ${Info[15]}    ${Info[16]}
    reload page
    Verify Page Contains 2 Expected Elements     ${Info[4]}  ${Info[11]}

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
    reload page
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
    reload page
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
    reload page
    Run Keyword If  '${Info[4]}' == '20'      Click Element     ${Next_page}
    Run Keyword If  '${Info[4]}' == '21'      Click Element     ${Next_page}
    Run Keyword If  '${Info[4]}' == '31'      Click Element     ${Next_page}
    Run Keyword If    '${Info[5]}' == '#BLANK' and '${Info[12]}' != 'cancel'     Verify Page Not Contains 2 Expect Elements   ${Info[4]}  ${Info[5]}
    Run Keyword If    '${Info[5]}' != '#BLANK' and '${Info[12]}' != 'cancel'     Verify Page Contains 2 Expected Elements     ${Info[4]}  ${Info[5]}

#Add SDP Profile function
    #[Arguments]  ${Info}
    #IBCF_PeerPage.Add SDP Profile    ${Info[4]}  ${Info[5]}   ${Info[6]}    ${Info[7]}    ${Info[8]}    ${Info[9]}     ${Info[10]}
    #...     ${Info[11]}   ${Info[12]}    ${Info[13]}    ${Info[14]}    ${Info[15]}     ${Info[16]}     ${Info[17]}     ${Info[18]}
    #reload page
    #Verify Page Contains 2 Expected Elements     ${Info[4]}  ${Info[6]}

#View SDP Profile function
    #[Arguments]  ${Info}
    #IBCF_PeerPage.View SDP Profile  ${Info[4]}  ${Info[6]}  ${Info[9]}   ${Info[11]}  ${Info[12]}
    #Back from View Page

View SDP Profile function
    [Arguments]  ${Info}
    IBCF_PeerPage.View SDP Profile  ${Info[4]}  ${Info[22]}  ${Info[8]}   ${Info[9]}  ${Info[11]}  ${Info[12]}  ${Info[19]}  ${Info[21]}
    Run Keyword If   '${Info[12]}' != 'cancel'        Back from View Page

Filter SDP Profile function
    [Arguments]  ${Info}
    Click Element       ${SP_Field}
    Sleep   1s
    Filter 3 value           ${Info[4]}  ${Info[6]}  ${Info[11]}

Filter Special Charaters SDP Profile function
    [Arguments]  ${Info}
    Click Element       ${SP_Field}
    Sleep   1s
    Filter special character 3 value           ${Info[4]}  ${Info[5]}  ${Info[6]}   ${Info[7]}  ${Info[8]}

#Edit SDP Profile function
    #[Arguments]  ${Info}
    #IBCF_PeerPage.Edit SDP Profile    ${Info[4]}  ${Info[19]}   ${Info[20]}    ${Info[21]}    ${Info[22]}    ${Info[23]}     ${Info[24]}
    #...     ${Info[11]}   ${Info[25]}    ${Info[26]}    ${Info[27]}    ${Info[28]}     ${Info[29]}     ${Info[30]}     ${Info[31]}  ${Info[32]}
    #reload page
    #Verify Page Contains 2 Expected Elements     ${Info[4]}  ${Info[25]}

Edit Valid SDP Profile function
    [Arguments]  ${Info}
    IBCF_PeerPage.Edit Valid SDP Profile    ${Info[4]}  ${Info[5]}   ${Info[6]}    ${Info[7]}    ${Info[8]}    ${Info[9]}     ${Info[10]}
    ...     ${Info[11]}   ${Info[12]}    ${Info[13]}    ${Info[14]}    ${Info[15]}     ${Info[16]}     ${Info[17]}     ${Info[18]}   ${Info[20]}
    reload page
    Run Keyword If  '${Info[4]}' == '20'      Click Element     ${Next_page}
    Run Keyword If  '${Info[4]}' == '21'      Click Element     ${Next_page}
    Run Keyword If  '${Info[4]}' == '31'      Click Element     ${Next_page}
    Verify Page Contains 2 Expected Elements     ${Info[4]}  ${Info[10]}

Delete SDP Profile function
    [Arguments]  ${Info}
    Click Element       ${SP_Field}
    Sleep   1s
    Delete with 2 info  ${Info[4]}  ${Info[6]}
    Verify Page Not Contains 2 Expect Elements  ${Info[4]}  ${Info[6]}

#################################### Session Limiter Profile #################################
Add Session Limiter function
    [Arguments]  ${Info}
    IBCF_PeerPage.Add Session Limiter    ${Info[4]}  ${Info[5]}   ${Info[6]}    ${Info[7]}    ${Info[8]}    ${Info[9]}     ${Info[10]}
    ...     ${Info[11]}   ${Info[12]}    ${Info[13]}    ${Info[14]}    ${Info[15]}     ${Info[16]}     ${Info[17]}
    reload page
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
    reload page
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
    reload page
    Verify Page Contains 2 Expected Elements     ${Info[4]}  ${Info[5]}

Edit Session Control function
    [Arguments]  ${Info}
    IBCF_PeerPage.Edit Session Control    ${Info[4]}  ${Info[5]}   ${Info[18]}    ${Info[19]}    ${Info[20]}    ${Info[21]}     ${Info[22]}
    ...     ${Info[23]}   ${Info[24]}    ${Info[25]}    ${Info[26]}    ${Info[27]}     ${Info[28]}     ${Info[29]}      ${Info[30]}
    reload page
    Verify Page Contains 2 Expected Elements     ${Info[4]}  ${Info[18]}

Delete Session Control function
    [Arguments]  ${Info}

    Scroll Element Into View    ${PCSCF_tab}
    Sleep  1s
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
Add RFC4028 function
    [Arguments]  ${Info}
    IBCF_PeerPage.Add RFC4028    ${Info[4]}  ${Info[5]}   ${Info[6]}    ${Info[7]}    ${Info[8]}    ${Info[9]}
    reload page
    Verify Page Contains 2 Expected Elements     ${Info[4]}  ${Info[5]}

Edit RFC4028 function
    [Arguments]  ${Info}
    IBCF_PeerPage.Edit RFC4028    ${Info[4]}  ${Info[5]}   ${Info[10]}    ${Info[11]}    ${Info[12]}    ${Info[13]}     ${Info[14]}
    reload page
    Verify Page Contains 2 Expected Elements     ${Info[4]}  ${Info[10]}

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
    reload page
    Verify Page Contains 1 Expected Elements     ${Info[4]}

Delete Core Domain function
    [Arguments]  ${Info}
    Click Element       ${Core_Domain_Field}
    Sleep   1s
    Delete with 1 info  ${Info[4]}
    Verify Page Not Contains 1 Expect Elements  ${Info[4]}

################################ SRTP #########################################
# Add SRTPIBCF
#     [Arguments]  ${Scenarios}
#     ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
#     LoginApp_SBC.Navigate to Sign In Page
#     LoginApp_SBC.Attempt to Single Login   ${Login_single}
#     IBCF_SRTPPage.Go to SRTP section in IBCF tab
#     FOR    ${Info}  IN  @{Scenarios}
#         TRY
#             Add SRTP function      ${Info}
 
#         EXCEPT    AS    ${error}
#             Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
#         END
#     END


# Edit SRTPIBCF
#     [Arguments]  ${Scenarios}
#     ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
#     LoginApp_SBC.Navigate to Sign In Page
#     LoginApp_SBC.Attempt to Single Login   ${Login_single}
#     IBCF_SRTPPage.Go to SRTP section in IBCF tab
#     FOR    ${Info}  IN  @{Scenarios}
#         TRY
#             Edit SRTP function      ${Info}
 
#         EXCEPT    AS    ${error}
#             Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
#         END
#     END


# Delete SRTPIBCF
#     [Arguments]  ${Scenarios}
#     ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
#     LoginApp_SBC.Navigate to Sign In Page
#     LoginApp_SBC.Attempt to Single Login   ${Login_single}
#     IBCF_SRTPPage.Go to SRTP section in IBCF tab
#     FOR    ${Info}  IN  @{Scenarios}
#         TRY
#             Delete SRTP function      ${Info}
 
#         EXCEPT    AS    ${error}
#             Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
#         END
#     END


# Sort SRTPIBCF
#     [Arguments]  ${Scenarios}
#     ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
#     LoginApp_SBC.Navigate to Sign In Page
#     LoginApp_SBC.Attempt to Single Login   ${Login_single}
#     IBCF_SRTPPage.Go to SRTP section in IBCF tab
#     Click Element       ${SRTP_Field}
#     Sleep   1s
#     Sort Element  Name
#     Sort Element  Domain

# View SRTPIBCF
#     [Arguments]  ${Scenarios}
#     ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
#     LoginApp_SBC.Navigate to Sign In Page
#     LoginApp_SBC.Attempt to Single Login   ${Login_single}
#     IBCF_SRTPPage.Go to SRTP section in IBCF tab
#     FOR    ${Info}  IN  @{Scenarios}
#         TRY
#                View SRTP function      ${Info}
 
#         EXCEPT    AS    ${error}
#             Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
#         END
#     END


# Filter SRTPIBCF
#     [Arguments]  ${Scenarios}
#     ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
#     LoginApp_SBC.Navigate to Sign In Page
#     LoginApp_SBC.Attempt to Single Login   ${Login_single}
#     IBCF_SRTPPage.Go to SRTP section in IBCF tab
#     FOR    ${Info}  IN  @{Scenarios}
#         TRY
#                Filter SRTP function      ${Info}
 
#         EXCEPT    AS    ${error}
#             Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
#         END
#     END


# Filter Special Character SRTPIBCF
#     [Arguments]  ${Scenarios}
#     FOR    ${Info}  IN  @{Scenarios}
#         TRY
#                Filter Special Charaters SRTP function      ${Info}
 
#         EXCEPT    AS    ${error}
#             Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
#         END
#     END
