*** Settings ***
Resource  ../../Resources/Admin/LoginApp_SBC.robot
Resource  ./PO/HSS_RealmPage.robot
Resource  ../Admin/PO/UserManagerPage.robot
Resource  ../Common.robot

*** Keywords ***

Add
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    HSS_RealmPage.Go to HSS tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to Realm tab
               Add Realm function        ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Add Invalid
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    HSS_RealmPage.Go to HSS tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to Realm tab
               Verify error message Realm invalid case        ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


View
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    HSS_RealmPage.Go to HSS tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to Realm tab
               View Realm function        ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Delete
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    HSS_RealmPage.Go to HSS tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to Realm tab
               Delete Realm function        ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Sort
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    HSS_RealmPage.Go to HSS tab
    Go to Realm tab
    Sort Element     Name
    Page should not contain  Internal Server Error

Filter
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    HSS_RealmPage.Go to HSS tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to Realm tab
               Filter Realm function        ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Filter special characters
    [Arguments]  ${Scenarios}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to Realm tab
               Filter special characters Realm function        ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Add Realm function
    [Arguments]  ${Info}
    HSS_RealmPage.Add Realm   ${Info[4]}  ${Info[5]}  ${Info[6]}    ${Info[7]}
    reload page
    Verify Page Contains 1 Expected Elements     ${Info[4]}

Filter Realm function
    [Arguments]  ${Info}
    Filter 1 value               ${Info[4]}

Filter special characters Realm function
    [Arguments]  ${Info}
    Filter special character 1 value  ${Info[4]}  ${Info[5]}  ${Info[6]}

View Realm function
    [Arguments]  ${Info}
    HSS_RealmPage.View Realm         ${Info[4]}  ${Info[5]}  ${Info[6]}  ${Info[7]}

Delete Realm function
    [Arguments]  ${Info}
    Delete with 1 info                      ${Info[4]}
    Verify Page Not Contains 1 Expected Elements     ${Info[4]}


Verify error message Realm invalid case
    [Arguments]  ${Info}
    HSS_RealmPage.Add Realm            ${Info[4]}  ${Info[5]}  ${Info[6]}   ${Info[7]}
    Verify Page Contains Error Message     ${Info[8]}
