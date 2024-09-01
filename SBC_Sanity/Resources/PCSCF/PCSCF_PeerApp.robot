*** Settings ***
Library  SeleniumLibrary
Resource  ../../Resources/Admin/LoginApp_SBC.robot
Resource  ./PO/PCSCF_PeerPage.robot
Resource  ../Admin/PO/UserManagerPage.robot
Resource  ../Common.robot

*** Keywords ***

Add MatchingRules
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Add Matching function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Edit MatchingRules
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
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
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Delete Matching function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Add Invalid MatchingRules
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
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
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Verify errors in edit matching rules function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Sort MatchingRules 64
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    Click Element       ${MatchingRule}
    Sleep   1s
    Sort Element  Matching rule name64
    Sort Element  Header name64

Sort MatchingRules
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    Click Element       ${MatchingRule}
    Sleep   1s
    Sort Element  Matching rule name
    Sort Element  Header name

View MatchingRules
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
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
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
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



Add ManiRules
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Add Manipulation Rules function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Edit ManiRules
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
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
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Delete Manipulation Rules function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Sort ManiRules 64
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    Click Element       ${ManiRule}
    Sleep   1s
    Sort Element  Manipulation rule name64
    Sort Element  Header name64
    Page should not contain  Internal Server Error

Sort ManiRules
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    Click Element       ${ManiRule}
    Sleep   1s
    Sort Element  Manipulation rule name
    Sort Element  Header name
    Page should not contain  Internal Server Error
View ManiRules
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
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
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
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


Add HeaderAuthProfiles
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            Add Header Authorization Profiles function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Delete HeaderAuthProfiles
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            Delete Header Authorization Profiles function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Sort HeaderAuthProfiles 64
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    Click Element       ${HAP_Field}
    Sleep   1s
    Sort Element  Name64
    Sort Element  Policy64
    Sort Element  Method type64

Sort HeaderAuthProfiles 64
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    Click Element       ${HAP_Field}
    Sleep   1s
    Sort Element  Name64
    Sort Element  Policy64
    Sort Element  Method type64

Sort HeaderAuthProfiles
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
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
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
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
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
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


Add AuthProfiles
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            Add Authorization Profiles function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Edit AuthProfiles
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
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
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            Delete Authorization Profiles function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Sort AuthProfiles 64
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    Click Element       ${AP_Field}
    Sleep   1s
    Sort Element  Index64
    Sort Element  Default authorization64

Sort AuthProfiles
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    Click Element       ${AP_Field}
    Sleep   1s
    Sort Element  Index
    Sort Element  Default authorization

View AuthProfiles
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
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
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
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


Add RoutingProfiles
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            Add Routing Profiles function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Edit RoutingProfiles
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
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
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
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
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            Add Header Manipulation function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Edit HeaderManipulation
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
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
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            Delete Header Manipulation function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Sort HeaderManipulation 64
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    Click Element       ${HM_Field}
    Sleep   1s
    Sort Element  SIP manipulation profile64
    Sort Element  Processing order64

Sort HeaderManipulation
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    Click Element       ${HM_Field}
    Sleep   1s
    Sort Element  SIP manipulation profile
    Sort Element  Processing order

View HeaderManipulation
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
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
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
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


Add SDPProfile
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            Add SDP Profile function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Edit SDPProfile
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            Edit SDP Profile function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Delete SDPProfile
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
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
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            Add Session Limiter function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Edit SessionLimiter
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
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
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
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
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            Add Session Control function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Add SessionControl 65
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            Add Session Control function 65     ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Edit SessionControl
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            Edit Session Control function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Edit SessionControl 65
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            Edit Session Control function 65     ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Delete SessionControl
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            Delete Session Control function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Sort SessionControl 64
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    Click Element       ${SC_Field}
    Sleep   1s
    Sort Element  Name64

Sort SessionControl
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    Click Element       ${SC_Field}
    Sleep   1s
    Sort Element  Name

View SessionControl
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
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
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
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


Add UAPCSCF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            Add User Agent function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Edit UAPCSCF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            Edit User Agent function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Delete UAPCSCF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            Delete User Agent function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Sort UAPCSCF 64
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    Click Element       ${UA_Field}
    Sleep   1s
    Sort Element  UA profile 64

Sort UAPCSCF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    Click Element       ${UA_Field}
    Sleep   1s
    Sort Element  UA profile

View UAPCSCF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               View User Agent function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Filter UAPCSCF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Filter User Agent function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Filter Special Character UAPCSCF
    [Arguments]  ${Scenarios}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Filter Special Charaters User Agent function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Add PCRF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            Add PCRF function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Edit PCRF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            Edit PCRF function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Delete PCRF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            Delete PCRF function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Sort PCRF 64
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    Scroll Element Into View    ${While_Label}
    Sleep  1s
    Click Element       ${PCRF_Field}
    Sleep   1s
    Sort Element  ID64

Sort PCRF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    Scroll Element Into View    ${While_Label}
    Sleep  1s
    Click Element       ${PCRF_Field}
    Sleep   1s
    Sort Element  ID


View PCRF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               View PCRF function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Filter PCRF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Filter PCRF function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Filter Special Character PCRF
    [Arguments]  ${Scenarios}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Filter Special Charaters PCRF function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Add PHF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            Add PHF function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Add PHF 63
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            Add PHF function 63     ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END



Edit PHF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            Edit PHF function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Edit PHF 63
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            Edit PHF function 63      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END



Delete PHF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            Delete PHF function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Sort PHF 64
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    Scroll Element Into View    ${While_Label}
    Sleep  1s
    Click Element       ${PHF_Field}
    Sleep   1s
    Sort Element  Name64


Sort PHF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    Scroll Element Into View    ${While_Label}
    Sleep  1s
    Click Element       ${PHF_Field}
    Sleep   1s
    Sort Element  Name

View PHF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               View PHF function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Filter PHF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Filter PHF function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Filter Special Character PHF
    [Arguments]  ${Scenarios}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Filter Special Charaters PHF function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Add PeerPCSCF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            Add Peer function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Add PeerPCSCF 63
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            Add Peer function 63      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Edit PeerPCSCF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            Edit Peer function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Edit PeerPCSCF 63
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            Edit Peer function 63      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Delete PeerPCSCF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            Delete Peer function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Sort PeerPCSCF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    Click Element       ${Peer_Field}
    Sleep   1s
    Sort Element  Name
    Sort Element  Domain

View PeerPCSCF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               View Peer function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Filter PeerPCSCF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_PeerPage.Go to Peer section in PCSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Filter Peer function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Filter Special Character PeerPCSCF
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
    PCSCF_PeerPage.Add Peer  ${Info[4]}  ${Info[5]}   ${Info[6]}    ${Info[7]}    ${Info[8]}  ${Info[9]}   ${Info[10]}  ${Info[11]}
    ...    ${Info[12]}    ${Info[13]}    ${Info[14]}   ${Info[15]}    ${Info[16]}    ${Info[17]}   ${Info[18]}  ${Info[19]}
    ...    ${Info[20]}    ${Info[21]}    ${Info[22]}    ${Info[23]}
    reload page
    Verify Page Contains 2 Expected Elements     ${Info[4]}  ${Info[5]}

Add Peer function 63
    [Arguments]  ${Info}
    PCSCF_PeerPage.Add Peer 63  ${Info[4]}  ${Info[5]}   ${Info[6]}    ${Info[7]}    ${Info[8]}  ${Info[9]}   ${Info[10]}  ${Info[11]}
    ...    ${Info[12]}    ${Info[13]}    ${Info[14]}   ${Info[15]}    ${Info[16]}    ${Info[17]}   ${Info[18]}  ${Info[19]}
    ...    ${Info[20]}    ${Info[21]}    ${Info[22]}    ${Info[23]}   ${Info[42]}    ${Info[44]}     ${Info[46]}
    reload page
    Verify Page Contains 2 Expected Elements     ${Info[4]}  ${Info[5]}

Edit Peer function
    [Arguments]  ${Info}
    PCSCF_PeerPage.Edit Peer  ${Info[4]}  ${Info[6]}  ${Info[24]}  ${Info[25]}  ${Info[26]}   ${Info[27]}   ${Info[28]}    ${Info[29]}
    ...   ${Info[30]}   ${Info[31]}    ${Info[32]}    ${Info[33]}   ${Info[34]}   ${Info[35]}   ${Info[36]}   ${Info[37]}
    ...   ${Info[38]}  ${Info[39]}  ${Info[40]}  ${Info[41]}
    reload page
    Verify Page Contains 2 Expected Elements     ${Info[4]}  ${Info[24]}

Edit Peer function 63
    [Arguments]  ${Info}
    PCSCF_PeerPage.Edit Peer 63  ${Info[4]}  ${Info[6]}  ${Info[24]}  ${Info[25]}  ${Info[26]}   ${Info[27]}   ${Info[27]}    ${Info[29]}
    ...   ${Info[30]}   ${Info[31]}    ${Info[32]}    ${Info[33]}   ${Info[34]}   ${Info[35]}   ${Info[36]}   ${Info[37]}
    ...   ${Info[38]}  ${Info[39]}  ${Info[40]}  ${Info[41]}    ${Info[43]}    ${Info[45]}     ${Info[47]}
    reload page
    Verify Page Contains 2 Expected Elements     ${Info[4]}  ${Info[24]}

Delete Peer function
    [Arguments]  ${Info}
    Click Element       ${Peer_Field}
    Sleep   1s
    Delete with 2 info  ${Info[4]}  ${Info[25]}
    Verify Page Not Contains 2 Expect Elements  ${Info[4]}  ${Info[25]}

View Peer function
    [Arguments]  ${Info}
    PCSCF_PeerPage.View Peer   ${Info[4]}  ${Info[5]}  ${Info[6]}
    Back from View Page

Filter Peer function
    [Arguments]  ${Info}
    Click Element       ${Peer_Field}
    Sleep   1s
    Filter 3 value           ${Info[4]}  ${Info[5]}  ${Info[6]}

Filter Special Charaters Peer function
    [Arguments]  ${Info}
    Click Element       ${Peer_Field}
    Sleep   1s
    Filter special character 3 value           ${Info[4]}  ${Info[5]}  ${Info[6]}   ${Info[7]}  ${Info[8]}
##############################Matching Rules #################################
Add Matching function
    [Arguments]  ${Info}
    PCSCF_PeerPage.Add Matching  ${Info[4]}  ${Info[5]}   ${Info[6]}    ${Info[7]}    ${Info[8]}  ${Info[9]}   ${Info[10]}   ${Info[11]}     ${Info[12]}   ${Info[13]}   ${Info[14]}
    reload page
    Verify Page Contains 2 Expected Elements     ${Info[4]}  ${Info[5]}

Edit Matching function
    [Arguments]  ${Info}
    PCSCF_PeerPage.Edit Matching  ${Info[4]}  ${Info[5]}   ${Info[15]}    ${Info[16]}    ${Info[17]}   ${Info[18]}   ${Info[19]}   ${Info[20]}     ${Info[21]}   ${Info[22]}   ${Info[23]}   ${Info[24]}
    reload page
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
    reload page
    Verify Page Contains Error Message  ${Info[15]}

Verify errors in edit matching rules function
    [Arguments]  ${Info}
    PCSCF_PeerPage.Edit Matching  ${Info[4]}  ${Info[5]}   ${Info[6]}    ${Info[7]}    ${Info[8]}  ${Info[9]}   ${Info[10]}   ${Info[11]}     ${Info[12]}   ${Info[13]}   ${Info[14]}  ${Info[15]}
    Verify Page Contains Error Message  ${Info[16]}

View Matching rules function
    [Arguments]  ${Info}
    PCSCF_PeerPage.View Matching  ${Info[4]}  ${Info[5]}   ${Info[6]}   ${Info[7]}  ${Info[25]}   ${Info[11]}  ${Info[13]}   ${Info[14]}     ${Info[12]}
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
    reload page
    Verify Page Contains 2 Expected Elements     ${Info[4]}  ${Info[5]}

Edit Manipulation Rules function
    [Arguments]  ${Info}
    PCSCF_PeerPage.Edit Manipulation Rules  ${Info[4]}  ${Info[5]}   ${Info[23]}    ${Info[24]}    ${Info[25]}  ${Info[26]}   ${Info[27]}
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
Add Header Authorization Profiles function
    [Arguments]  ${Info}
    PCSCF_PeerPage.Add Header Authorization Profiles    ${Info[4]}  ${Info[5]}   ${Info[6]}    ${Info[7]}    ${Info[8]}
    reload page
    Verify Page Contains 2 Expected Elements     ${Info[4]}  ${Info[6]}

Delete Header Authorization Profiles function
    [Arguments]  ${Info}
    Click Element       ${HAP_Field}
    Sleep   1s
    Delete with 3 info  ${Info[4]}  ${Info[6]}  ${Info[5]}
    Verify Page Not Contains 2 Expect Elements  ${Info[4]}  ${Info[6]}

View Header Authorization Profiles function
    [Arguments]  ${Info}
    PCSCF_PeerPage.View Header Authorization Profiles  ${Info[4]}  ${Info[5]}   ${Info[6]}  ${Info[8]}
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

#################################### Authorization Profiles #################################
Add Authorization Profiles function
    [Arguments]  ${Info}
    PCSCF_PeerPage.Add Authorization Profiles    ${Info[4]}  ${Info[5]}   ${Info[6]}    ${Info[7]}    ${Info[8]}    ${Info[9]}
    ...         ${Info[10]}    ${Info[11]}    ${Info[12]}     ${Info[13]}    ${Info[14]}    ${Info[15]}       ${Info[16]}
    reload page
    Verify Page Contains 2 Expected Elements     ${Info[4]}  ${Info[5]}

Edit Authorization Profiles function
    [Arguments]  ${Info}
    PCSCF_PeerPage.Edit Authorization Profiles    ${Info[4]}  ${Info[5]}   ${Info[17]}    ${Info[18]}    ${Info[19]}    ${Info[20]}
    ...         ${Info[21]}    ${Info[22]}    ${Info[23]}     ${Info[24]}    ${Info[25]}    ${Info[26]}       ${Info[27]}   ${Info[28]}
    reload page
    Verify Page Contains 2 Expected Elements     ${Info[4]}  ${Info[17]}

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
    reload page
    Verify Page Contains 2 Expected Elements     ${Info[4]}  ${Info[5]}

Edit Header Manipulation function
    [Arguments]  ${Info}
    PCSCF_PeerPage.Edit Header Manipulation    ${Info[4]}  ${Info[5]}  ${Info[27]}    ${Info[28]}     ${Info[29]}      ${Info[30]}
    ...    ${Info[31]}  ${Info[32]}   ${Info[33]}    ${Info[34]}    ${Info[35]}    ${Info[36]}     ${Info[37]}    ${Info[38]}  ${Info[39]}
    ...   ${Info[40]}   ${Info[41]}   ${Info[42]}    ${Info[43]}    ${Info[44]}    ${Info[45]}     ${Info[46]}    ${Info[47]}   ${Info[48]}
    reload page
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
Add Session Control function
    [Arguments]  ${Info}
    PCSCF_PeerPage.Add Session Control    ${Info[4]}  ${Info[5]}   ${Info[6]}    ${Info[7]}    ${Info[8]}    ${Info[9]}     ${Info[10]}
    ...     ${Info[11]}   ${Info[12]}    ${Info[13]}    ${Info[14]}
    reload page
    Verify Page Contains 2 Expected Elements     ${Info[4]}  ${Info[6]}

Edit Session Control function
    [Arguments]  ${Info}
    PCSCF_PeerPage.Edit Session Control    ${Info[4]}  ${Info[6]}   ${Info[15]}    ${Info[16]}    ${Info[17]}    ${Info[18]}     ${Info[19]}
    ...     ${Info[20]}   ${Info[21]}    ${Info[22]}    ${Info[23]}     ${Info[24]}
    reload page
    Verify Page Contains 2 Expected Elements     ${Info[4]}  ${Info[17]}

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

Add Session Control function 65
    [Arguments]  ${Info}
    PCSCF_PeerPage.Add Session Control 65   ${Info[4]}   ${Info[6]}    ${Info[7]}    ${Info[8]}    ${Info[9]}
    ...     ${Info[11]}   ${Info[12]}    ${Info[13]}    ${Info[14]}  ${Info[15]}   ${Info[16]}    ${Info[17]}    ${Info[18]}
    reload page
    Verify Page Contains 2 Expected Elements     ${Info[4]}  ${Info[6]}

Edit Session Control function 65
    [Arguments]  ${Info}
    PCSCF_PeerPage.Edit Session Control 65   ${Info[4]}  ${Info[6]}   ${Info[25]}    ${Info[26]}    ${Info[27]}    ${Info[28]}     ${Info[29]}
    ...     ${Info[30]}   ${Info[31]}    ${Info[32]}    ${Info[33]}     ${Info[34]}  ${Info[35]}    ${Info[36]}
    reload page
    Verify Page Contains 2 Expected Elements     ${Info[4]}  ${Info[29]}

#################################### User Agent Profile #################################
Add User Agent function
    [Arguments]  ${Info}
    PCSCF_PeerPage.Add User Agent    ${Info[4]}  ${Info[5]}   ${Info[6]}    ${Info[7]}    ${Info[8]}    ${Info[9]}   ${Info[10]}   ${Info[11]}   ${Info[12]}
    ...                              ${Info[13]}    ${Info[14]}   ${Info[15]}   ${Info[16]}
    reload page
    Verify Page Contains 2 Expected Elements     ${Info[4]}  ${Info[5]}

Edit User Agent function
    [Arguments]  ${Info}
    PCSCF_PeerPage.Edit User Agent    ${Info[4]}  ${Info[5]}   ${Info[17]}    ${Info[18]}    ${Info[19]}   ${Info[20]}   ${Info[21]}   ${Info[22]}
    ...                              ${Info[23]}    ${Info[24]}   ${Info[25]}   ${Info[26]}  ${Info[27]}    ${Info[28]}
    reload page
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
    reload page
    Verify Page Contains 1 Expected Elements     ${Info[4]}

Edit PCRF function
    [Arguments]  ${Info}
    PCSCF_PeerPage.Edit PCRF    ${Info[4]}  ${Info[5]}   ${Info[8]}    ${Info[9]}   ${Info[10]}
    reload page
    Verify Page Contains 1 Expected Elements     ${Info[4]}

Delete PCRF function
    [Arguments]  ${Info}

    Scroll Element Into View    ${While_Label}
    Sleep  1s
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
    PCSCF_PeerPage.Add PHF    ${Info[4]}  ${Info[5]}   ${Info[6]}    ${Info[7]}   ${Info[8]}   ${Info[9]}   ${Info[10]}    ${Info[11]}     ${Info[12]}
    reload page
    Verify Page Contains 1 Expected Elements     ${Info[4]}

Add PHF function 63
    [Arguments]  ${Info}
    PCSCF_PeerPage.Add PHF 63    ${Info[4]}  ${Info[5]}   ${Info[6]}    ${Info[7]}   ${Info[8]}   ${Info[9]}   ${Info[10]}    ${Info[11]}     ${Info[12]}  ${Info[13]}   ${Info[21]}
    reload page
    Verify Page Contains 1 Expected Elements     ${Info[4]}

Edit PHF function
    [Arguments]  ${Info}
    PCSCF_PeerPage.Edit PHF    ${Info[4]}  ${Info[13]}   ${Info[14]}    ${Info[15]}   ${Info[16]}   ${Info[17]}   ${Info[18]}    ${Info[19]}   ${Info[20]}
    reload page
    Verify Page Contains 1 Expected Elements     ${Info[4]}

Edit PHF function 63
    [Arguments]  ${Info}
    PCSCF_PeerPage.Edit PHF 63    ${Info[4]}  ${Info[13]}   ${Info[14]}    ${Info[15]}   ${Info[16]}   ${Info[17]}   ${Info[18]}    ${Info[19]}   ${Info[20]}  ${Info[21]}  ${Info[22]}
    reload page
    Verify Page Contains 1 Expected Elements     ${Info[4]}


Delete PHF function
    [Arguments]  ${Info}

    Scroll Element Into View    ${While_Label}
    Sleep  1s
    Click Element       ${PHF_Field}
    Sleep   1s
    Sort Element  Name
    Sleep  1s
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