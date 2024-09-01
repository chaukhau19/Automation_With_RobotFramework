*** Settings ***
Resource  ../../Resources/Admin/LoginApp_SBC.robot
Resource  ./PO/IBCF_AlertingPage.robot
Resource  ../Admin/PO/UserManagerPage.robot
Resource  ../Common.robot

*** Keywords ***

Add AlertingIBCF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_AlertingPage.Go to IBCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to Alerting section in IBCF tab
               Add Alerting function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Edit AlertingIBCF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_AlertingPage.Go to IBCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to Alerting section in IBCF tab
               Edit Alerting function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Delete AlertingIBCF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_AlertingPage.Go to IBCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to Alerting section in IBCF tab
               Delete Alerting function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Sort AlertingIBCF 64
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_AlertingPage.Go to IBCF tab
    IBCF_AlertingPage.Go to Alerting section in IBCF tab
    Sort Element  Object64
    Sort Element  Event64
    Page should not contain  Internal Server Error

Sort AlertingIBCF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_AlertingPage.Go to IBCF tab
    IBCF_AlertingPage.Go to Alerting section in IBCF tab
    Sort Element  Object
    Sort Element  Event
    Page should not contain  Internal Server Error

View AlertingIBCF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_AlertingPage.Go to IBCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to Alerting section in IBCF tab
               View Alerting function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Filter AlertingIBCF 64
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_AlertingPage.Go to IBCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to Alerting section in IBCF tab
               Filter Alerting function 64      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Filter AlertingIBCF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_AlertingPage.Go to IBCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to Alerting section in IBCF tab
               Filter Alerting function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Filter Special Character AlertingIBCF 64
    [Arguments]  ${Scenarios}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Filter Special Charaters Alerting function 64      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Filter Special Character AlertingIBCF
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
    IBCF_AlertingPage.Add Alerting  ${Info[4]}  ${Info[5]}   ${Info[6]}    ${Info[7]}    ${Info[8]}  ${Info[9]}  ${Info[10]}
    reload page
    Verify Page Contains 2 Expected Elements     ${Info[4]}  ${Info[6]}

Verify errors in Alerting rules function
    [Arguments]  ${Info}
    IBCF_AlertingPage.Add Alerting  ${Info[4]}  ${Info[5]}   ${Info[6]}    ${Info[7]}    ${Info[8]}  ${Info[9]}   ${Info[10]}   ${Info[11]}     ${Info[12]}   ${Info[13]}   ${Info[14]}
    reload page
    Verify Page Contains Error Message  ${Info[15]}

Edit Alerting function
    [Arguments]  ${Info}
    IBCF_AlertingPage.Edit Alerting  ${Info[4]}  ${Info[5]}  ${Info[6]}   ${Info[11]}    ${Info[12]}    ${Info[13]}  ${Info[14]}
    reload page
    Verify Page Contains 2 Expected Elements     ${Info[4]}  ${Info[11]}

Verify errors in edit Alerting rules function
    [Arguments]  ${Info}
    IBCF_AlertingPage.Edit Alerting  ${Info[4]}  ${Info[5]}   ${Info[6]}    ${Info[7]}    ${Info[8]}  ${Info[9]}   ${Info[10]}   ${Info[11]}     ${Info[12]}   ${Info[13]}   ${Info[14]}  ${Info[15]}
    Verify Page Contains Error Message  ${Info[16]}

Delete Alerting function
    [Arguments]  ${Info}
    Delete with 3 info  ${Info[4]}  ${Info[6]}  ${Info[11]}
    Verify Page Not Contains 1 Expect Elements  ${Info[6]}

View Alerting function
    [Arguments]  ${Info}
    IBCF_AlertingPage.View Alerting  ${Info[4]}  ${Info[5]}   ${Info[6]}   ${Info[7]}  ${Info[8]}   ${Info[9]}  ${Info[10]}
    Back from View Page

Filter Alerting function 64
    [Arguments]  ${Info}
    Filter 1 value 64          ${Info[4]}

Filter Alerting function
    [Arguments]  ${Info}
    Filter 1 value           ${Info[4]}

Filter Special Charaters Alerting function 64
    [Arguments]  ${Info}
    Filter special character 3 value 64           ${Info[4]}  ${Info[5]}  ${Info[6]}   ${Info[7]}  ${Info[8]}

Filter Special Charaters Alerting function
    [Arguments]  ${Info}
    Filter special character 3 value           ${Info[4]}  ${Info[5]}  ${Info[6]}   ${Info[7]}  ${Info[8]}