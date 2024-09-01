*** Settings ***
Resource  ../../Resources/Admin/LoginApp_SBC.robot
Resource  ./PO/IBCF_BGCFPage.robot
Resource  ../Admin/PO/UserManagerPage.robot
Resource  ../Common.robot

*** Keywords ***

Add
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_BGCFPage.Go to IBCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to BGCF section in IBCF tab
               Add BGCF function        ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Add64
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_BGCFPage.Go to IBCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to BGCF section in IBCF tab
               Add BGCF function 64       ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Add Invalid
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_BGCFPage.Go to IBCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to BGCF section in IBCF tab
               Verify error message BGCF invalid case        ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Add Invalid 64
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_BGCFPage.Go to IBCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to BGCF section in IBCF tab
               Verify error message BGCF invalid case 64       ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Edit Invalid
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_BGCFPage.Go to IBCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to BGCF section in IBCF tab
               Verify error message BGCF edit invalid case        ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Edit Invalid 64
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_BGCFPage.Go to IBCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to BGCF section in IBCF tab
               Verify error message BGCF edit invalid case 64       ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Edit
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_BGCFPage.Go to IBCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to BGCF section in IBCF tab
               Edit BGCF function        ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Edit64
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_BGCFPage.Go to IBCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to BGCF section in IBCF tab
               Edit BGCF function 64       ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


View
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_BGCFPage.Go to IBCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to BGCF section in IBCF tab
               View BGCF function        ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Sort 64
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_BGCFPage.Go to IBCF tab
    Go to BGCF section in IBCF tab
    Sort Element     IP64
    Page should not contain  Internal Server Error

Sort
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_BGCFPage.Go to IBCF tab
    Go to BGCF section in IBCF tab
    Sort Element     IP
    Page should not contain  Internal Server Error

Filter 64
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_BGCFPage.Go to IBCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to BGCF section in IBCF tab
               Filter BGCF function 64        ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Filter
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_BGCFPage.Go to IBCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to BGCF section in IBCF tab
               Filter BGCF function        ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Filter special characters 64
    [Arguments]  ${Scenarios}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to BGCF section in IBCF tab
               Filter special characters BGCF function 64        ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Filter special characters
    [Arguments]  ${Scenarios}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to BGCF section in IBCF tab
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
    IBCF_BGCFPage.Go to IBCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to BGCF section in IBCF tab
               Delete BGCF function        ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Retry_Domain
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_BGCFPage.Go to IBCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to BGCF section in IBCF tab
               Configure Retry Domain function        ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Add BGCF function
    [Arguments]  ${Info}
    IBCF_BGCFPage.Add BGCF   ${Info[4]}  ${Info[5]}  ${Info[6]}    ${Info[7]}
    reload page
    Verify Page Contains 3 Expected Elements     ${Info[4]}  ${Info[5]}  ${Info[6]}

Add BGCF function 64
    [Arguments]  ${Info}
    IBCF_BGCFPage.Add BGCF 64   ${Info[4]}  ${Info[5]}  ${Info[6]}    ${Info[7]}  ${Info[8]}
    reload page
    Verify Page Contains 3 Expected Elements     ${Info[4]}  ${Info[5]}  ${Info[6]}

Filter BGCF function 64
    [Arguments]  ${Info}
    Filter 3 value 64               ${Info[4]}  ${Info[5]}  ${Info[7]}

Filter BGCF function
    [Arguments]  ${Info}
    Filter 3 value               ${Info[4]}  ${Info[5]}  ${Info[7]}

Filter special characters BGCF function 64
    [Arguments]  ${Info}
    Filter special character 3 value 64  ${Info[4]}  ${Info[5]}  ${Info[6]}   ${Info[7]}  ${Info[8]}

Filter special characters BGCF function
    [Arguments]  ${Info}
    Filter special character 3 value  ${Info[4]}  ${Info[5]}  ${Info[6]}   ${Info[7]}  ${Info[8]}

View BGCF function
    [Arguments]  ${Info}
    IBCF_BGCFPage.View BGCF         ${Info[4]}  ${Info[5]}  ${Info[6]}  ${Info[7]}


Edit BGCF function
    [Arguments]  ${Info}
    IBCF_BGCFPage.Edit BGCF                   ${Info[4]}     ${Info[5]}   ${Info[6]}   ${Info[8]}     ${Info[9]}
    Verify Page Contains 3 Expected Elements     ${Info[4]}      ${Info[5]}     ${Info[8]}

Edit BGCF function 64
    [Arguments]  ${Info}
    IBCF_BGCFPage.Edit BGCF 64                  ${Info[4]}     ${Info[5]}   ${Info[6]}   ${Info[8]}     ${Info[9]}  ${Info[13]}
    Verify Page Contains 3 Expected Elements     ${Info[4]}      ${Info[5]}     ${Info[8]}

Delete BGCF function
    [Arguments]  ${Info}
    Delete with 3 info                      ${Info[4]}      ${Info[5]}     ${Info[6]}
    Verify Page Not Contains 3 Expected Elements     ${Info[4]}      ${Info[5]}     ${Info[6]}

Verify error message BGCF invalid case
    [Arguments]  ${Info}
    IBCF_BGCFPage.Add BGCF                                  ${Info[4]}  ${Info[5]}  ${Info[6]}    ${Info[7]}
    Verify Page Contains Error Message     ${Info[8]}

Verify error message BGCF invalid case 64
    [Arguments]  ${Info}
    IBCF_BGCFPage.Add BGCF 64                                 ${Info[4]}  ${Info[5]}  ${Info[6]}    ${Info[7]}  ${Info[8]}
    Verify Page Contains Error Message     ${Info[9]}

Verify error message BGCF edit invalid case
    [Arguments]  ${Info}
    IBCF_BGCFPage.Edit BGCF                                  ${Info[4]}  ${Info[5]}  ${Info[6]}    ${Info[10]}  ${Info[11]}
    Verify Page Contains Error Message     ${Info[12]}

Verify error message BGCF edit invalid case 64
    [Arguments]  ${Info}
    IBCF_BGCFPage.Edit BGCF 64                                 ${Info[4]}  ${Info[5]}  ${Info[6]}    ${Info[7]}  ${Info[8]}  ${Info[9]}
    Verify Page Contains Error Message     ${Info[10]}

Configure Retry Domain function
    [Arguments]  ${Info}
    IBCF_BGCFPage.Retry Pref and Domain Origin   ${Info[4]}
    reload page