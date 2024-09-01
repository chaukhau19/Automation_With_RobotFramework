*** Settings ***
Resource  ../../Resources/Admin/LoginApp_SBC.robot
Resource  ./PO/BGCF_TpipPage.robot
Resource  ../Admin/PO/UserManagerPage.robot
Resource  ../../Resources/Common.robot

*** Keywords ***

Add Valid Cases
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    BGCF_TPIPPage.Go to BGCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            Go to TPIP section in BGCF tab
            Add TPIP function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END



Add Invalid Cases
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    BGCF_TPIPPage.Go to BGCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            Go to TPIP section in BGCF tab
            Verify error message invalid case  ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Filter Cases
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    BGCF_TPIPPage.Go to BGCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            Go to TPIP section in BGCF tab
            Filter TPIP function  ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Filter Special Cases
    [Arguments]  ${Scenarios}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            Go to TPIP section in BGCF tab
            Filter Special Cases TPIP function  ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


View Cases
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    BGCF_TPIPPage.Go to BGCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            Go to TPIP section in BGCF tab
            View TPIP function  ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Add TPIP function
    [Arguments]  ${Info}
    BGCF_TpipPage.Add TPIP      ${Info[4]}  ${Info[5]}  ${Info[6]}    ${Info[7]}    ${Info[8]}  ${Info[9]}  ${Info[10]}    ${Info[11]}    ${Info[12]}
    reload page
    Verify Page Contains 3 Expected Elements     ${Info[4]}  ${Info[5]}  ${Info[6]}

Filter TPIP function
    [Arguments]  ${Info}
    Filter 3 value               ${Info[4]}  ${Info[5]}  ${Info[6]}

Filter Special Cases TPIP function
    [Arguments]  ${Info}
    Filter special character 3 value               ${Info[4]}  ${Info[5]}  ${Info[6]}  ${Info[7]}    ${Info[8]}

View TPIP function
    [Arguments]  ${Info}
    BGCF_TpipPage.View TPIP          ${Info[4]}  ${Info[5]}  ${Info[6]}    ${Info[7]}    ${Info[8]}      ${Info[9]}

Verify error message invalid case
    [Arguments]  ${Info}
    BGCF_TpipPage.Add TPIP         ${Info[4]}  ${Info[5]}  ${Info[6]}    ${Info[7]}    ${Info[8]}      ${Info[9]}  ${Info[10]}      ${Info[11]}      ${Info[13]}
    Verify Page Contains Error Message        ${Info[12]}


Sort Cases 64
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    BGCF_TpipPage.Go to BGCF tab
    Go to TPIP section in BGCF tab
    Sort Element  Name64
    Sort Element  Port64
    Page should not contain  Internal Server Error

Sort Cases
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    BGCF_TpipPage.Go to BGCF tab
    Go to TPIP section in BGCF tab
    Sort Element  Name
    Page should not contain  Internal Server Error