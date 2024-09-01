*** Settings ***
Resource  D:/RF/Resources/LoginApp_SBC.robot
Resource  D:/RF/Resources/BGCF/PO/BGCF_IncomingProxyPage.robot
Resource  D:/RF/Resources/PO/UserManagerPage.robot
Resource  D:/RF/Resources/Common.robot

*** Keywords ***

Valid Case
    [Arguments]  ${Scenarios}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            Navigate to Sign In Page
            Attempt to Login       ${Info}
            Go to Incoming Proxy section in BGCF tab

            Add Incoming Proxy function      ${Info}

            Filter Incoming Proxy function      ${Info}

            Delete Incoming Proxy function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END



Invalid Case
    [Arguments]  ${Scenarios}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            Navigate to Sign In Page
            Attempt to Login   ${Info}
            Go to Incoming Proxy section in BGCF tab

            Verify error message Proxy invalid case  ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Add Incoming Proxy function
    [Arguments]  ${Info}
    BGCF_IncomingProxyPage.Add Incoming Proxy                                       ${Info[4]}  ${Info[5]}
    reload page
    Verify Page Contains 2 Expected Elements     ${Info[4]}  ${Info[5]}
    #UserManagerPage.Log out

Filter Incoming Proxy function
    [Arguments]  ${Info}
    Filter 2 value               ${Info[4]}  ${Info[5]}

Delete Incoming Proxy function
    [Arguments]  ${Info}
    Delete with 2 info            ${Info[4]}      ${Info[5]}
    Verify Page Not Contains 2 Expect Elements     ${Info[4]}      ${Info[5]}
    UserManagerPage.Log out

Verify error message Proxy invalid case
    [Arguments]  ${Info}
    BGCF_IncomingProxyPage.Add Incoming Proxy                                  ${Info[4]}  ${Info[5]}
    Verify Page Contains Error Message        ${Info[6]}
    UserManagerPage.Log out
