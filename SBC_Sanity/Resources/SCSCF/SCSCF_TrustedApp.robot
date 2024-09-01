*** Settings ***
Resource  ../../Resources/Admin/LoginApp_SBC.robot
Resource  ./PO/SCSCF_TrustedPage.robot
Resource  ../Admin/PO/UserManagerPage.robot
Resource  ../Common.robot

*** Keywords ***

Add Trusted
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    Go to SCSCF tab
    Go to Trusted section in SCSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to Trusted section in Trusted tab
               Add Trusted Function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Filter Trusted
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    Go to SCSCF tab
    Go to Trusted section in SCSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to Trusted section in Trusted tab
               Filter Trusted Function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Add Trusted Invalid Cases
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    Go to SCSCF tab
    Go to Trusted section in SCSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to Trusted section in Trusted tab
               Verify error message trusted invalid cases     ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Delete Trusted
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    Go to SCSCF tab
    Go to Trusted section in SCSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to Trusted section in Trusted tab
               Delete Trusted Function      ${Info}
############################  Not Trusted  ###############################
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Add Not Trusted
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    Go to SCSCF tab
    Go to Trusted section in SCSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to Not Trusted section in Trusted tab
               Add Trusted Function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END



Filter Not Trusted
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    Go to SCSCF tab
    Go to Trusted section in SCSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to Not Trusted section in Trusted tab
               Filter Trusted Function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Add Not Trusted Invalid Cases
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    Go to SCSCF tab
    Go to Trusted section in SCSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to Not Trusted section in Trusted tab
               Verify error message trusted invalid cases     ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Delete Not Trusted
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    Go to SCSCF tab
    Go to Trusted section in SCSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to Not Trusted section in Trusted tab
               Delete Trusted Function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Add Trusted Function
    [Arguments]  ${Info}
    Add Trusted Peer              ${Info[4]}  ${Info[5]}
    reload page
    Verify Page Contains 2 Expected Elements    ${Info[4]}  ${Info[6]}

Delete Trusted Function
    [Arguments]  ${Info}
    Delete with 1 info      ${Info[4]}
    reload page
    Verify Page Not Contains 2 Expect Elements  ${Info[4]}  ${Info[6]}

Filter Trusted Function
    [Arguments]  ${Info}
    Common.Filter 2 value  ${Info[4]}  ${Info[5]}
    Common.Filter special character 1 value  ${Info[7]}  ${Info[8]}   ${Info[9]}

Verify error message trusted invalid cases
    [Arguments]  ${Info}
    Add Trusted Peer      ${Info[4]}  ${Info[5]}
    Verify Page Contains Error Message      ${Info[6]}

