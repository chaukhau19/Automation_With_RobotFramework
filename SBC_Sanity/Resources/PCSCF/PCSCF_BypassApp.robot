*** Settings ***
Library  SeleniumLibrary
Resource  ../../Resources/Admin/LoginApp_SBC.robot
Resource  ./PO/PCSCF_BypassPage.robot
Resource  ../Admin/PO/UserManagerPage.robot
Resource  ../Common.robot

*** Keywords ***

Add Bypass
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_BypassPage.Go to PCSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to Bypass section in PCSCF tab
               Add Bypass function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Edit Bypass
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_BypassPage.Go to PCSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to Bypass section in PCSCF tab
               Edit Bypass function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Delete Bypass
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_BypassPage.Go to PCSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to Bypass section in PCSCF tab
               Delete Bypass function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Sort Bypass 64
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_BypassPage.Go to PCSCF tab
    PCSCF_BypassPage.Go to Bypass section in PCSCF tab
    Sort Element  Name64
    Sort Element  Domain64
    Page should not contain  Internal Server Error

Sort Bypass
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_BypassPage.Go to PCSCF tab
    PCSCF_BypassPage.Go to Bypass section in PCSCF tab
    Sort Element  Name
    Sort Element  Domain
    Page should not contain  Internal Server Error
View Bypass
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_BypassPage.Go to PCSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to Bypass section in PCSCF tab
               View Bypass function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Filter Bypass
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_BypassPage.Go to PCSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to Bypass section in PCSCF tab
               Filter Bypass function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Filter Special Character Bypass
    [Arguments]  ${Scenarios}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Filter Special Charaters Bypass function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Add Bypass function
    [Arguments]  ${Info}
    PCSCF_BypassPage.Add PCSCF_Bypass  ${Info[4]}  ${Info[5]}   ${Info[6]}    ${Info[7]}
    reload page
    Verify Page Contains 1 Expected Elements     ${Info[4]}

Edit Bypass function
    [Arguments]  ${Info}
    PCSCF_BypassPage.Edit PCSCF_Bypass  ${Info[4]}  ${Info[8]}   ${Info[9]}    ${Info[10]}
    reload page
    Verify Page Contains 1 Expected Elements     ${Info[4]}

Delete Bypass function
    [Arguments]  ${Info}
    Delete with 1 info  ${Info[4]}
    Verify Page Not Contains 1 Expect Elements  ${Info[4]}

View Bypass function
    [Arguments]  ${Info}
    PCSCF_BypassPage.View PCSCF_Bypass  ${Info[4]}
    Back from View Page

Filter Bypass function
    [Arguments]  ${Info}
    Filter 1 value           ${Info[4]}

Filter Special Charaters Bypass function
    [Arguments]  ${Info}
    Filter special character 2 value           ${Info[4]}  ${Info[5]}  ${Info[6]}  ${Info[7]}