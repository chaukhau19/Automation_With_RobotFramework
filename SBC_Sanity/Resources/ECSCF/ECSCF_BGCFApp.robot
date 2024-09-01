*** Settings ***
Resource  ../../Resources/Admin/LoginApp_SBC.robot
Resource  ./PO/ECSCF_BGCFPage.robot
Resource  ../Admin/PO/UserManagerPage.robot
Resource  ../Common.robot

*** Keywords ***

Add
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    ECSCF_BGCFPage.Go to ECSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to BGCF section in ECSCF tab
               Add BGCF function        ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END



Add Invalid
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    ECSCF_BGCFPage.Go to ECSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to BGCF section in ECSCF tab
               Verify error message BGCF invalid case        ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END



Edit Invalid
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    ECSCF_BGCFPage.Go to ECSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to BGCF section in ECSCF tab
               Verify error message BGCF edit invalid case        ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END



Edit
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    ECSCF_BGCFPage.Go to ECSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to BGCF section in ECSCF tab
               Edit BGCF function        ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


View
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    ECSCF_BGCFPage.Go to ECSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to BGCF section in ECSCF tab
               View BGCF function        ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Sort
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    ECSCF_BGCFPage.Go to ECSCF tab
    Go to BGCF section in ECSCF tab
    Sort Element     IP
    Page should not contain  Internal Server Error

Filter
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    ECSCF_BGCFPage.Go to ECSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to BGCF section in ECSCF tab
               Filter BGCF function        ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Filter special characters
    [Arguments]  ${Scenarios}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to BGCF section in ECSCF tab
               Filter special characters BGCF function        ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Delete
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    ECSCF_BGCFPage.Go to ECSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to BGCF section in ECSCF tab
               Delete BGCF function        ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END



Add BGCF function
    [Arguments]  ${Info}
    ECSCF_BGCFPage.Add BGCF   ${Info[4]}  ${Info[5]}  ${Info[6]}    ${Info[7]}
    reload page
    Verify Page Contains 2 Expected Elements     ${Info[4]}  ${Info[5]}

Filter BGCF function
    [Arguments]  ${Info}
    Filter 2 value               ${Info[4]}  ${Info[5]}

Filter special characters BGCF function
    [Arguments]  ${Info}
    Filter special character 2 value  ${Info[4]}  ${Info[5]}  ${Info[6]}   ${Info[7]}

View BGCF function
    [Arguments]  ${Info}
    ECSCF_BGCFPage.View BGCF         ${Info[4]}  ${Info[5]}  ${Info[6]}  ${Info[7]}


Edit BGCF function
    [Arguments]  ${Info}
    ECSCF_BGCFPage.Edit BGCF                   ${Info[4]}     ${Info[5]}  ${Info[6]}   ${Info[8]}     ${Info[9]}
    Verify Page Contains 2 Expected Elements     ${Info[4]}      ${Info[5]}

Delete BGCF function
    [Arguments]  ${Info}
    Delete with 2 info                      ${Info[4]}      ${Info[5]}
    Verify Page Not Contains 2 Expected Elements     ${Info[4]}      ${Info[5]}

Verify error message BGCF invalid case
    [Arguments]  ${Info}
    ECSCF_BGCFPage.Add BGCF                                  ${Info[4]}  ${Info[5]}  ${Info[6]}    ${Info[7]}
    Verify Page Contains Error Message     ${Info[8]}

Verify error message BGCF edit invalid case
    [Arguments]  ${Info}
    ECSCF_BGCFPage.Edit BGCF                      ${Info[4]}  ${Info[5]}  ${Info[6]}    ${Info[7]}  ${Info[8]}
    Verify Page Contains Error Message     ${Info[9]}
