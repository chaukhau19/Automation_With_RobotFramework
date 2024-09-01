*** Settings ***
Resource  ../../Resources/Admin/LoginApp_SBC.robot
Resource  ./PO/PCSCF_AlertingPage.robot
Resource  ../Admin/PO/UserManagerPage.robot
Resource  ../Common.robot

*** Keywords ***

Add AlertingPCSCF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_AlertingPage.Go to PCSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to Alerting section in PCSCF tab
               Add Alerting function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Edit AlertingPCSCF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_AlertingPage.Go to PCSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to Alerting section in PCSCF tab
               Edit Alerting function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Delete AlertingPCSCF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_AlertingPage.Go to PCSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to Alerting section in PCSCF tab
               Delete Alerting function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Sort AlertingPCSCF 64
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_AlertingPage.Go to PCSCF tab
    PCSCF_AlertingPage.Go to Alerting section in PCSCF tab
    Sort Element  Object64
    Sort Element  Event64
    Page should not contain  Internal Server Error

Sort AlertingPCSCF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_AlertingPage.Go to PCSCF tab
    PCSCF_AlertingPage.Go to Alerting section in PCSCF tab
    Sort Element  Object
    Sort Element  Event
    Page should not contain  Internal Server Error
View AlertingPCSCF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_AlertingPage.Go to PCSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to Alerting section in PCSCF tab
               View Alerting function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Filter AlertingPCSCF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_AlertingPage.Go to PCSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to Alerting section in PCSCF tab
               Filter Alerting function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Filter Special Character AlertingPCSCF
    [Arguments]  ${Scenarios}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Filter Special Charaters Alerting function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Add Alerting function
    [Arguments]  ${Info}
    PCSCF_AlertingPage.Add Alerting  ${Info[4]}  ${Info[5]}   ${Info[6]}    ${Info[7]}    ${Info[8]}  ${Info[9]}  ${Info[10]}
    reload page
    Verify Page Contains 2 Expected Elements     ${Info[4]}  ${Info[6]}

Verify errors in Alerting rules function
    [Arguments]  ${Info}
    PCSCF_AlertingPage.Add Alerting  ${Info[4]}  ${Info[5]}   ${Info[6]}    ${Info[7]}    ${Info[8]}  ${Info[9]}   ${Info[10]}   ${Info[11]}     ${Info[12]}   ${Info[13]}   ${Info[14]}
    reload page
    Verify Page Contains Error Message  ${Info[15]}

Edit Alerting function
    [Arguments]  ${Info}
    PCSCF_AlertingPage.Edit Alerting  ${Info[4]}  ${Info[5]}  ${Info[6]}   ${Info[11]}    ${Info[12]}    ${Info[13]}  ${Info[14]}
    reload page
    Verify Page Contains 2 Expected Elements     ${Info[4]}  ${Info[11]}

Verify errors in edit Alerting rules function
    [Arguments]  ${Info}
    PCSCF_AlertingPage.Edit Alerting  ${Info[4]}  ${Info[5]}   ${Info[6]}    ${Info[7]}    ${Info[8]}  ${Info[9]}   ${Info[10]}   ${Info[11]}     ${Info[12]}   ${Info[13]}   ${Info[14]}  ${Info[15]}
    Verify Page Contains Error Message  ${Info[16]}

Delete Alerting function
    [Arguments]  ${Info}
    Delete with 1 info  ${Info[6]}
    Verify Page Not Contains 1 Expect Elements  ${Info[6]}

View Alerting function
    [Arguments]  ${Info}
    PCSCF_AlertingPage.View Alerting  ${Info[4]}  ${Info[5]}   ${Info[6]}   ${Info[7]}  ${Info[8]}   ${Info[9]}  ${Info[10]}
    Back from View Page

Filter Alerting function
    [Arguments]  ${Info}
    Filter 1 value           ${Info[4]}

Filter Special Charaters Alerting function
    [Arguments]  ${Info}
    Filter special character 3 value           ${Info[4]}  ${Info[5]}  ${Info[6]}   ${Info[7]}  ${Info[8]}
