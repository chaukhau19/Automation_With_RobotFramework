*** Settings ***
Resource  ../../Resources/Admin/LoginApp_SBC.robot
Resource  ./PO/BGCF_IncomingProxyPage.robot
Resource  ../Admin/PO/UserManagerPage.robot
Resource  ../../Resources/Common.robot

*** Keywords ***

Add Valid
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    BGCF_IncomingProxyPage.Go to BGCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            Go to Incoming Proxy section in BGCF tab
            Add Incoming Proxy function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Add Invalid
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    BGCF_IncomingProxyPage.Go to BGCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            Go to Incoming Proxy section in BGCF tab
            Verify error message Proxy invalid case  ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Filter IncomingProxy
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    BGCF_IncomingProxyPage.Go to BGCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            Go to Incoming Proxy section in BGCF tab
            Filter Incoming Proxy function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Delete
    [Arguments]  ${Scenarios}

    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    BGCF_IncomingProxyPage.Go to BGCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            Go to Incoming Proxy section in BGCF tab
            Delete Incoming Proxy function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Add Incoming Proxy function
    [Arguments]  ${Info}
    BGCF_IncomingProxyPage.Add Incoming Proxy                                       ${Info[4]}  ${Info[5]}
    reload page
    Verify Page Contains 2 Expected Elements     ${Info[4]}  ${Info[5]}

Filter Incoming Proxy function
    [Arguments]  ${Info}
    Filter 2 value               ${Info[4]}  ${Info[5]}
    Filter special character 1 value  ${Info[6]}  ${Info[7]}  ${Info[8]}

Delete Incoming Proxy function
    [Arguments]  ${Info}
    Delete with 2 info            ${Info[4]}      ${Info[5]}
    Verify Page Not Contains 2 Expect Elements     ${Info[4]}      ${Info[5]}


Verify error message Proxy invalid case
    [Arguments]  ${Info}
    BGCF_IncomingProxyPage.Add Incoming Proxy                                  ${Info[4]}  ${Info[5]}
    Verify Page Contains Error Message        ${Info[6]}

