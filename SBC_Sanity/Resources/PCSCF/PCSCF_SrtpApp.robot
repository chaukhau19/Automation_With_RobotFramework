*** Settings ***
Resource  ../../Resources/Admin/LoginApp_SBC.robot
Resource  ./PO/PCSCF_SrtpPage.robot
Resource  ../Admin/PO/UserManagerPage.robot
Resource  ../Common.robot

*** Keywords ***

Add SRTPPCSCF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_SrtpPage.Go to PCSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to SRTP section in PCSCF tab
               Add SRTP function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Edit SRTPPCSCF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_SrtpPage.Go to PCSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to SRTP section in PCSCF tab
               Edit SRTP function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Delete SRTPPCSCF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_SrtpPage.Go to PCSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to SRTP section in PCSCF tab
               Delete SRTP function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Sort SRTPPCSCF 64
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_SrtpPage.Go to PCSCF tab
    PCSCF_SrtpPage.Go to SRTP section in PCSCF tab
    Sort Element  Index64
    Page should not contain  Internal Server Error

Sort SRTPPCSCF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_SrtpPage.Go to PCSCF tab
    PCSCF_SrtpPage.Go to SRTP section in PCSCF tab
    Sort Element  Index
    Page should not contain  Internal Server Error
View SRTPPCSCF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_SrtpPage.Go to PCSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to SRTP section in PCSCF tab
               View SRTP function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Filter SRTPPCSCF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_SrtpPage.Go to PCSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to SRTP section in PCSCF tab
               Filter SRTP function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Filter Special Character SRTPPCSCF
    [Arguments]  ${Scenarios}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Filter Special Charaters SRTP function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Add SRTP function
    [Arguments]  ${Info}
    PCSCF_SrtpPage.Add SRTP  ${Info[4]}  ${Info[5]}   ${Info[6]}    ${Info[7]}    ${Info[8]}  ${Info[9]}
    reload page
    Verify Page Contains 2 Expected Elements     ${Info[4]}  ${Info[5]}

Verify errors in SRTP rules function
    [Arguments]  ${Info}
    PCSCF_SrtpPage.Add SRTP  ${Info[4]}  ${Info[5]}   ${Info[6]}    ${Info[7]}    ${Info[8]}  ${Info[9]}   ${Info[10]}   ${Info[11]}     ${Info[12]}   ${Info[13]}   ${Info[14]}
    reload page
    Verify Page Contains Error Message  ${Info[15]}

Edit SRTP function
    [Arguments]  ${Info}
    PCSCF_SrtpPage.Edit SRTP  ${Info[4]}  ${Info[5]}  ${Info[10]}   ${Info[11]}    ${Info[12]}    ${Info[13]}  ${Info[14]}
    reload page
    Verify Page Contains 2 Expected Elements     ${Info[4]}  ${Info[10]}

Verify errors in edit SRTP rules function
    [Arguments]  ${Info}
    PCSCF_SrtpPage.Edit SRTP  ${Info[4]}  ${Info[5]}   ${Info[6]}    ${Info[7]}    ${Info[8]}  ${Info[9]}   ${Info[10]}   ${Info[11]}     ${Info[12]}   ${Info[13]}   ${Info[14]}  ${Info[15]}
    Verify Page Contains Error Message  ${Info[16]}

Delete SRTP function
    [Arguments]  ${Info}
    Delete with 2 info  ${Info[4]}  ${Info[5]}
    Verify Page Not Contains 2 Expect Elements  ${Info[4]}  ${Info[5]}

View SRTP function
    [Arguments]  ${Info}
    PCSCF_SrtpPage.View SRTP  ${Info[4]}  ${Info[5]}   ${Info[6]}   ${Info[7]}  ${Info[8]}   ${Info[9]}
    Back from View Page

Filter SRTP function
    [Arguments]  ${Info}
    Filter 3 value           ${Info[4]}  ${Info[5]}  ${Info[6]}

Filter Special Charaters SRTP function
    [Arguments]  ${Info}
    Filter special character 3 value           ${Info[4]}  ${Info[5]}  ${Info[6]}   ${Info[7]}  ${Info[8]}
