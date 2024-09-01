*** Settings ***
Resource  ../../Resources/Admin/LoginApp_SBC.robot
Resource  ./PO/SCSCF_CoreDomainPage.robot
Resource  ../Admin/PO/UserManagerPage.robot
Resource  ../Common.robot

*** Keywords ***

Add CoreDomain
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    SCSCF_CoreDomainPage.Go to SCSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to CoreDomain section in SCSCF tab
               Add CoreDomain Function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Filter CoreDomain
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    SCSCF_CoreDomainPage.Go to SCSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to CoreDomain section in SCSCF tab
               Filter CoreDomain Function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Add CoreDomain Invalid Cases
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    SCSCF_CoreDomainPage.Go to SCSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to CoreDomain section in SCSCF tab
               Verify error message CoreDomain invalid cases     ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Delete CoreDomain
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    SCSCF_CoreDomainPage.Go to SCSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to CoreDomain section in SCSCF tab
               Delete CoreDomain Function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END



Add CoreDomain Function
    [Arguments]  ${Info}
    SCSCF_CoreDomainPage.Add CoreDomain              ${Info[4]}
    reload page
    Verify Page Contains 1 Expected Elements    ${Info[4]}

Delete CoreDomain Function
    [Arguments]  ${Info}
    Delete with 1 info      ${Info[4]}
    reload page
    Verify Page Not Contains 1 Expect Elements  ${Info[4]}

Filter CoreDomain Function
    [Arguments]  ${Info}
    Common.Filter 1 value  ${Info[4]}
    Common.Filter special character 1 value  ${Info[5]}  ${Info[6]}   ${Info[7]}

Verify error message CoreDomain invalid cases
    [Arguments]  ${Info}
    SCSCF_CoreDomainPage.Add CoreDomain     ${Info[4]}
    Verify Page Contains Error Message      ${Info[5]}

