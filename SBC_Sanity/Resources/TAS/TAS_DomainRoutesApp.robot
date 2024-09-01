*** Settings ***
Resource  ../../Resources/Admin/LoginApp_SBC.robot
Resource  ./PO/TAS_DomainRoutesPage.robot
Resource  ../Admin/PO/UserManagerPage.robot
Resource  ../Common.robot

*** Keywords ***

Add
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    TAS_DomainRoutesPage.Go to TAS tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to Domain Route tab
               Add DomainRoutes function        ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Add Invalid
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    TAS_DomainRoutesPage.Go to TAS tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to Domain Route tab
               Verify error message DomainRoutes invalid case        ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Edit Invalid
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    TAS_DomainRoutesPage.Go to TAS tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to Domain Route tab
               Verify error message DomainRoutes edit invalid case        ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Edit
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    TAS_DomainRoutesPage.Go to TAS tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to Domain Route tab
               Edit DomainRoutes function        ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


View
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    TAS_DomainRoutesPage.Go to TAS tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to Domain Route tab
               View DomainRoutes function        ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Sort
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    TAS_DomainRoutesPage.Go to TAS tab
    Go to Domain Route tab
    Sort Element     Domain
    Sort Element     IP Destination
    Page should not contain  Internal Server Error
Filter
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    TAS_DomainRoutesPage.Go to TAS tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to Domain Route tab
               Filter DomainRoutes function        ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Filter special characters
    [Arguments]  ${Scenarios}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to Domain Route tab
               Filter special characters DomainRoutes function        ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Add DomainRoutes function
    [Arguments]  ${Info}
    TAS_DomainRoutesPage.Add DomainRoute   ${Info[4]}  ${Info[5]}  ${Info[6]}
    reload page
    Verify Page Contains 2 Expected Elements     ${Info[4]}  ${Info[5]}

Filter DomainRoutes function
    [Arguments]  ${Info}
    Filter 2 value               ${Info[4]}  ${Info[5]}

Filter special characters DomainRoutes function
    [Arguments]  ${Info}
    Filter special character 2 value  ${Info[4]}  ${Info[5]}  ${Info[6]}   ${Info[7]}

View DomainRoutes function
    [Arguments]  ${Info}
    TAS_DomainRoutesPage.View DomainRoute         ${Info[4]}  ${Info[5]}  ${Info[6]}


Edit DomainRoutes function
    [Arguments]  ${Info}
    TAS_DomainRoutesPage.Edit DomainRoute                   ${Info[4]}     ${Info[5]}  ${Info[6]}
    Verify Page Contains 2 Expected Elements     ${Info[4]}   ${Info[5]}

Verify error message DomainRoutes invalid case
    [Arguments]  ${Info}
    TAS_DomainRoutesPage.Add DomainRoute                    ${Info[4]}  ${Info[5]}  ${Info[6]}
    Verify Page Contains Error Message     ${Info[7]}

Verify error message DomainRoutes edit invalid case
    [Arguments]  ${Info}
    TAS_DomainRoutesPage.Edit DomainRoute                      ${Info[4]}  ${Info[5]}  ${Info[6]}
    Verify Page Contains Error Message     ${Info[7]}