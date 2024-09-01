*** Settings ***
Library  SeleniumLibrary
Resource  ../../Resources/Admin/LoginApp_SBC.robot
Resource  ./PO/PCSCF_AKAProfilePage.robot
Resource  ../Admin/PO/UserManagerPage.robot
Resource  ../Common.robot

*** Keywords ***

Add AKA Profile
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_AKAProfilePage.Go to PCSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to AKA Profile section in PCSCF tab
               Add AKA Profile function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Add invalid AKA Profile
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_AKAProfilePage.Go to PCSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to AKA Profile section in PCSCF tab
               Verify error message invalid add AKA      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Edit AKA Profile
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_AKAProfilePage.Go to PCSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to AKA Profile section in PCSCF tab
               Edit AKA Profile function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Edit invalid AKA Profile
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_AKAProfilePage.Go to PCSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to AKA Profile section in PCSCF tab
               Verify error message invalid edit AKA      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Delete AKA Profile
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_AKAProfilePage.Go to PCSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to AKA Profile section in PCSCF tab
               Delete AKA Profile function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Sort AKA Profile
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_AKAProfilePage.Go to PCSCF tab
    PCSCF_AKAProfilePage.Go to AKA Profile section in PCSCF tab
    Sort Element  Index
#    Sort Element  Protected Server Port

View AKA Profile
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_AKAProfilePage.Go to PCSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to AKA Profile section in PCSCF tab
               View AKA Profile function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Filter AKA Profile
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_AKAProfilePage.Go to PCSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to AKA Profile section in PCSCF tab
               Filter AKA Profile function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Filter Special Character AKA Profile
    [Arguments]  ${Scenarios}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Filter Special Charaters AKA Profile function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Add AKA Profile function
    [Arguments]  ${Info}
    PCSCF_AKAProfilePage.Add AKAProfile  ${Info[4]}  ${Info[5]}   ${Info[6]}    ${Info[7]}    ${Info[8]}  ${Info[9]}   ${Info[10]}
    reload page
    Verify Page Contains 2 Expected Elements     ${Info[4]}  ${Info[5]}

Edit AKA Profile function
    [Arguments]  ${Info}
    PCSCF_AKAProfilePage.Edit AKAProfile  ${Info[4]}  ${Info[5]}   ${Info[6]}    ${Info[7]}    ${Info[8]}  ${Info[9]}   ${Info[10]}   ${Info[11]}
    reload page
    Verify Page Contains 2 Expected Elements     ${Info[4]}  ${Info[6]}

Delete AKA Profile function
    [Arguments]  ${Info}
    Delete with 2 info  ${Info[4]}  ${Info[5]}
    Verify Page Not Contains 2 Expect Elements  ${Info[4]}      ${Info[5]}

View AKA Profile function
    [Arguments]  ${Info}
    PCSCF_AKAProfilePage.View AKAProfile  ${Info[4]}  ${Info[5]}   ${Info[6]}   ${Info[7]}
    Back from View Page

Filter AKA Profile function
    [Arguments]  ${Info}
    Filter 2 value           ${Info[4]}  ${Info[5]}

Filter Special Charaters AKA Profile function
    [Arguments]  ${Info}
    Filter special character 2 value           ${Info[4]}  ${Info[5]}  ${Info[6]}   ${Info[7]}

Verify error message invalid add AKA
    [Arguments]  ${Info}
    PCSCF_AKAProfilePage.Add AKAProfile  ${Info[4]}  ${Info[5]}   ${Info[6]}    ${Info[7]}    ${Info[8]}  ${Info[9]}   ${Info[10]}
    Verify Page Contains Error Message       ${Info[11]}

Verify error message invalid edit AKA
    [Arguments]  ${Info}
    PCSCF_AKAProfilePage.Edit AKAProfile  ${Info[4]}  ${Info[5]}   ${Info[6]}    ${Info[7]}    ${Info[8]}  ${Info[9]}   ${Info[10]}  ${Info[11]}
    Verify Page Contains Error Message       ${Info[12]}