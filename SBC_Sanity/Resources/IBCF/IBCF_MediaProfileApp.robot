*** Settings ***
Library  SeleniumLibrary
Resource  ../../Resources/Admin/LoginApp_SBC.robot
Resource  ./PO/IBCF_MediaProfilePage.robot
Resource  ../Admin/PO/UserManagerPage.robot
Resource  ../Common.robot

*** Keywords ***

Add Media Profile
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_MediaProfilePage.Go to IBCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to Media Profile section in IBCF tab
               Add Media Profile function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Edit Media Profile
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_MediaProfilePage.Go to IBCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to Media Profile section in IBCF tab
               Edit Media Profile function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Delete Media Profile
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_MediaProfilePage.Go to IBCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to Media Profile section in IBCF tab
               Delete Media Profile function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Sort Media Profile 64
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_MediaProfilePage.Go to IBCF tab
    IBCF_MediaProfilePage.Go to Media Profile section in IBCF tab
    Sort Element  Index64
    Sort Element  DTMF Handling64
    Sort Element  Transrating64
    Page should not contain  Internal Server Error

Sort Media Profile
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_MediaProfilePage.Go to IBCF tab
    IBCF_MediaProfilePage.Go to Media Profile section in IBCF tab
    Sort Element  Index
    Sort Element  DTMF Handling
    Sort Element  Transrating
    Page should not contain  Internal Server Error
View Media Profile
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_MediaProfilePage.Go to IBCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to Media Profile section in IBCF tab
               View Media Profile function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Filter Media Profile
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_MediaProfilePage.Go to IBCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to Media Profile section in IBCF tab
               Filter Media Profile function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Filter Special Character Media Profile
    [Arguments]  ${Scenarios}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Filter Special Charaters Media Profile function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Add Media Profile function
    [Arguments]  ${Info}
    IBCF_MediaProfilePage.Add MediaProfile  ${Info[4]}  ${Info[5]}   ${Info[6]}    ${Info[7]}    ${Info[8]}  ${Info[9]}   ${Info[10]}   ${Info[11]}     ${Info[12]}   ${Info[13]}   ${Info[14]}  ${Info[15]}
    reload page
    Verify Page Contains 1 Expected Elements     ${Info[4]}

Edit Media Profile function
    [Arguments]  ${Info}
    IBCF_MediaProfilePage.Edit MediaProfile  ${Info[4]}  ${Info[16]}   ${Info[17]}    ${Info[18]}    ${Info[19]}  ${Info[20]}   ${Info[21]}   ${Info[22]}     ${Info[23]}   ${Info[24]}   ${Info[25]}  ${Info[26]}
    reload page
    Verify Page Contains 1 Expected Elements     ${Info[4]}

Delete Media Profile function
    [Arguments]  ${Info}
    Delete with 1 info  ${Info[4]}
    Verify Page Not Contains 2 Expect Elements  ${Info[4]}      ${Info[16]}

View Media Profile function
    [Arguments]  ${Info}
    IBCF_MediaProfilePage.View MediaProfile  ${Info[4]}  ${Info[5]}   ${Info[6]}   ${Info[7]}  ${Info[8]}   ${Info[9]}   ${Info[10]}   ${Info[11]}     ${Info[12]}   ${Info[13]}   ${Info[14]}
    Back from View Page

Filter Media Profile function
    [Arguments]  ${Info}
    Filter 1 value           ${Info[4]}

Filter Special Charaters Media Profile function
    [Arguments]  ${Info}
    Filter special character 4 value           ${Info[4]}  ${Info[5]}  ${Info[6]}   ${Info[7]}  ${Info[8]}  ${Info[9]}