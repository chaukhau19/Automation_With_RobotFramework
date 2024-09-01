*** Settings ***
Resource  ./PO/HomePage.robot
Resource  ../Common.robot



*** Keywords ***

Search Valid
    [Arguments]  ${LoginScenarios}
    FOR  ${Info}  IN  @{LoginScenarios}
    ${keyword}=  Get From List  ${Info}  1  
        TRY
            Navigate to Home Page
            Attempt to Search  ${Info}
            Wait Until Page Contains Element    xpath=//span[contains(text(), 'results for')]
            Page Should Contain     results for "${keyword}"
            Capture Page Screenshot

        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END



Search Invalid
    [Arguments]  ${LoginScenarios}
    FOR  ${Info}  IN  @{LoginScenarios}
        TRY
            Navigate to Home Page
            Attempt to Search  ${Info}                 
            HomePage.Verify Error Messages     ${Info}
            Capture Page Screenshot

        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

##############################################################

Change Language 
    [Arguments]  ${LoginScenarios}
    FOR  ${Info}  IN  @{LoginScenarios}
        TRY
            Navigate to Home Page
            Attempt to Change Language  ${Info}
            Capture Page Screenshot

        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

##############################################################

Change Deliver
    [Arguments]  ${LoginScenarios}
    FOR  ${Info}  IN  @{LoginScenarios}
        TRY
            Navigate to Home Page
            Attempt to Deliver  ${Info}
            Capture Page Screenshot

        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END
