*** Settings ***
Resource  ../../Resources/Admin/LoginApp_SBC.robot
Resource  ./PO/HSS_ApplicationServerPage.robot
Resource  ../Admin/PO/UserManagerPage.robot
Resource  ../Common.robot

*** Keywords ***

Add
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    HSS_ApplicationServerPage.Go to HSS tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to Application Server tab
               Add ApplicationServer function        ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Add Invalid
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    HSS_ApplicationServerPage.Go to HSS tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to Application Server tab
               Verify error message ApplicationServer invalid case        ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


View
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    HSS_ApplicationServerPage.Go to HSS tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to Application Server tab
               View ApplicationServer function        ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Delete
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    HSS_ApplicationServerPage.Go to HSS tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to Application Server tab
               Delete ApplicationServer function        ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Sort
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    HSS_ApplicationServerPage.Go to HSS tab
    Go to Application Server tab
    Sort Element     Name
    Sort Element     Domain
    Page should not contain  Internal Server Error
Filter
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    HSS_ApplicationServerPage.Go to HSS tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to Application Server tab
               Filter ApplicationServer function        ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Filter special characters
    [Arguments]  ${Scenarios}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to Application Server tab
               Filter special characters ApplicationServer function        ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Add ApplicationServer function
    [Arguments]  ${Info}
    HSS_ApplicationServerPage.Add ApplicationServer   ${Info[4]}  ${Info[5]}  ${Info[6]}    ${Info[7]}  ${Info[8]}
    reload page
    Verify Page Contains 2 Expected Elements     ${Info[4]}  ${Info[5]}

Filter ApplicationServer function
    [Arguments]  ${Info}
    Filter 2 value               ${Info[4]}  ${Info[5]}

Filter special characters ApplicationServer function
    [Arguments]  ${Info}
    Filter special character 2 value  ${Info[4]}  ${Info[5]}  ${Info[6]}   ${Info[7]}

View ApplicationServer function
    [Arguments]  ${Info}
    HSS_ApplicationServerPage.View ApplicationServer         ${Info[4]}  ${Info[5]}  ${Info[6]}  ${Info[7]}  ${Info[8]}

Delete ApplicationServer function
    [Arguments]  ${Info}
    Delete with 2 info                      ${Info[4]}      ${Info[5]}
    Verify Page Not Contains 2 Expected Elements     ${Info[4]}      ${Info[5]}


Verify error message ApplicationServer invalid case
    [Arguments]  ${Info}
    HSS_ApplicationServerPage.Add ApplicationServer            ${Info[4]}  ${Info[5]}  ${Info[6]}   ${Info[7]}  ${Info[8]}
    Verify Page Contains Error Message     ${Info[9]}
