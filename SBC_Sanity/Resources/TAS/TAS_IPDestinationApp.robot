*** Settings ***
Resource  ../../Resources/Admin/LoginApp_SBC.robot
Resource  ./PO/TAS_IPDestinationPage.robot
Resource  ../Admin/PO/UserManagerPage.robot
Resource  ../Common.robot

*** Keywords ***

Add
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    TAS_IPDestinationPage.Go to TAS tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to IP Destination tab
               Add IPDestination function        ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END



Add Invalid
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    TAS_IPDestinationPage.Go to TAS tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to IP Destination tab
               Verify error message IPDestination invalid case        ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END



Edit Invalid
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    TAS_IPDestinationPage.Go to TAS tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to IP Destination tab
               Verify error message IPDestination edit invalid case        ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END



Edit
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    TAS_IPDestinationPage.Go to TAS tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to IP Destination tab
               Edit IPDestination function        ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


View
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    TAS_IPDestinationPage.Go to TAS tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to IP Destination tab
               View IPDestination function        ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Sort
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    TAS_IPDestinationPage.Go to TAS tab
    Go to IP Destination tab
    Sort Element     IP Name
    Sort Element     IP
    Sort Element     Port
    Sort Element     Protocol
    Page should not contain  Internal Server Error

Filter
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    TAS_IPDestinationPage.Go to TAS tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to IP Destination tab
               Filter IPDestination function        ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Filter special characters
    [Arguments]  ${Scenarios}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to IP Destination tab
               Filter special characters IPDestination function        ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Add IPDestination function
    [Arguments]  ${Info}
    TAS_IPDestinationPage.Add IPDestination   ${Info[4]}  ${Info[5]}  ${Info[6]}    ${Info[7]}
    reload page
    Verify Page Contains 4 Expected Elements     ${Info[4]}  ${Info[5]}  ${Info[6]}    ${Info[7]}

Filter IPDestination function
    [Arguments]  ${Info}
    Filter 4 value               ${Info[4]}  ${Info[5]}  ${Info[6]}    ${Info[7]}

Filter special characters IPDestination function
    [Arguments]  ${Info}
    Filter special character 4 value  ${Info[4]}  ${Info[5]}  ${Info[6]}   ${Info[7]}  ${Info[8]}   ${Info[9]}

View IPDestination function
    [Arguments]  ${Info}
    TAS_IPDestinationPage.View IPDestination         ${Info[4]}  ${Info[5]}  ${Info[6]}  ${Info[7]}


Edit IPDestination function
    [Arguments]  ${Info}
    TAS_IPDestinationPage.Edit IPDestination                   ${Info[4]}     ${Info[5]}  ${Info[6]}   ${Info[7]}   ${Info[8]}   ${Info[9]}   ${Info[10]}
    Verify Page Contains 4 Expected Elements     ${Info[4]}      ${Info[8]}  ${Info[9]}   ${Info[10]}

Verify error message IPDestination invalid case
    [Arguments]  ${Info}
    TAS_IPDestinationPage.Add IPDestination                                  ${Info[4]}  ${Info[5]}  ${Info[6]}    ${Info[7]}
    Verify Page Contains Error Message     ${Info[8]}

Verify error message IPDestination edit invalid case
    [Arguments]  ${Info}
    TAS_IPDestinationPage.Edit IPDestination                      ${Info[4]}  ${Info[5]}  ${Info[6]}    ${Info[7]}  ${Info[8]}  ${Info[9]}   ${Info[10]}
    Verify Page Contains Error Message     ${Info[11]}