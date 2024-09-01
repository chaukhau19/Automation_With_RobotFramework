*** Settings ***
Resource  ../../Resources/Admin/LoginApp_SBC.robot
Resource  ./PO/SCSCF_PBXASPage.robot
Resource  ../Admin/PO/UserManagerPage.robot
Resource  ../Common.robot

*** Keywords ***

Add PBXAS
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    SCSCF_PBXASPage.Go to SCSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to PBXAS section in SCSCF tab
               Add PBXAS Function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Filter PBXAS
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    SCSCF_PBXASPage.Go to SCSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to PBXAS section in SCSCF tab
               Filter PBXAS Function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Add PBXAS Invalid Cases
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    SCSCF_PBXASPage.Go to SCSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to PBXAS section in SCSCF tab
               Verify error message PBXAS invalid cases     ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Delete PBXAS
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    SCSCF_PBXASPage.Go to SCSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to PBXAS section in SCSCF tab
               Delete PBXAS Function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END



Add PBXAS Function
    [Arguments]  ${Info}
    SCSCF_PBXASPage.Add PBXAS              ${Info[4]}
    reload page
    Verify Page Contains 1 Expected Elements    ${Info[4]}

Delete PBXAS Function
    [Arguments]  ${Info}
    Delete with 1 info      ${Info[4]}
    reload page
    Verify Page Not Contains 1 Expect Elements  ${Info[4]}

Filter PBXAS Function
    [Arguments]  ${Info}
    Common.Filter 1 value  ${Info[4]}
    Common.Filter special character 1 value  ${Info[5]}  ${Info[6]}   ${Info[7]}

Verify error message PBXAS invalid cases
    [Arguments]  ${Info}
    SCSCF_PBXASPage.Add PBXAS     ${Info[4]}
    Verify Page Contains Error Message      ${Info[5]}

