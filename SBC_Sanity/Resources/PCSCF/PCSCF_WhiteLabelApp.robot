*** Settings ***
Library  SeleniumLibrary
Resource  ../../Resources/Admin/LoginApp_SBC.robot
Resource  ./PO/PCSCF_WhiteLabelPage.robot
Resource  ../Admin/PO/UserManagerPage.robot
Resource  ../Common.robot

*** Keywords ***

Edit Whitelabel 64
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_WhiteLabelPage.Go to PCSCF tab
    PCSCF_WhiteLabelPage.Go to Whitelabel section in PCSCF tab 64
    FOR    ${Info}  IN  @{Scenarios}
        TRY
    #\   run keyword and continue on failure     Go to Whitelabel section in Whitelabel tab
               Edit Whitelabel function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Edit Whitelabel
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_WhiteLabelPage.Go to PCSCF tab
    PCSCF_WhiteLabelPage.Go to Whitelabel section in PCSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to Whitelabel section in Whitelabel tab
               Edit Whitelabel function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Filtering Whitelabel

    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_WhiteLabelPage.Go to PCSCF tab
    PCSCF_WhiteLabelPage.Go to Whitelabel section in PCSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to Filtering section in Whitelabel tab
               Add Filtering function      ${Info}
               Edit Filtering function      ${Info}
               Delete Filtering function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Edit Whitelabel function
    [Arguments]  ${Info}
    PCSCF_WhiteLabelPage.Edit Whitelabel  ${Info[4]}  ${Info[5]}   ${Info[6]}    ${Info[7]}  ${Info[8]}  ${Info[9]}   ${Info[10]}    ${Info[11]}
    ...         ${Info[12]}    ${Info[13]}  ${Info[14]}  ${Info[15]}   ${Info[16]}
    reload page
    Verify Page Contains 5 Expected Elements     ${Info[17]}   ${Info[4]}  ${Info[7]}    ${Info[5]}  ${Info[8]}

Reset Whitelabel 64
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_WhiteLabelPage.Go to PCSCF tab
    PCSCF_WhiteLabelPage.Go to Whitelabel section in PCSCF tab 64
    #PCSCF_WhiteLabelPage.Go to Whitelabel section in Whitelabel tab 64
    Click Element   ${Reset_Button}
    Verify Page Contains 5 Expected Elements   none  none  none  none  none

Reset Whitelabel
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_WhiteLabelPage.Go to PCSCF tab
    PCSCF_WhiteLabelPage.Go to Whitelabel section in PCSCF tab
    PCSCF_WhiteLabelPage.Go to Whitelabel section in Whitelabel tab
    Click Element   ${Reset_Button}
    Verify Page Contains 5 Expected Elements   none  none  none  none  none

Add Filtering function
    [Arguments]  ${Info}
    PCSCF_WhiteLabelPage.Add Filtering  ${Info[4]}  ${Info[5]}   ${Info[6]}    ${Info[7]}
    reload page
    Verify Page Contains 2 Expected Elements  ${Info[4]}  ${Info[6]}

Edit Filtering function
    [Arguments]  ${Info}
    PCSCF_WhiteLabelPage.Edit Filtering  ${Info[4]}  ${Info[5]}  ${Info[8]}  ${Info[9]}
    reload page
    Verify Page Contains 2 Expected Elements  ${Info[4]}  ${Info[10]}

Delete Filtering function
    [Arguments]  ${Info}
    Delete with 1 info  ${Info[4]}
    Verify Page Not Contains 1 Expect Elements  ${Info[4]}