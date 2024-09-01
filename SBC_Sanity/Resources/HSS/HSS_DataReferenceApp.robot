*** Settings ***
Resource  ../../Resources/Admin/LoginApp_SBC.robot
Resource  ./PO/HSS_DataReferencePage.robot
Resource  ../Admin/PO/UserManagerPage.robot
Resource  ../Common.robot

*** Keywords ***

Add
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    HSS_DataReferencePage.Go to HSS tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to Data Reference tab
               Add DataReference function        ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Add Invalid
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    HSS_DataReferencePage.Go to HSS tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to Data Reference tab
               Verify error message DataReference invalid case        ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


View
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    HSS_DataReferencePage.Go to HSS tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to Data Reference tab
               View DataReference function        ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Delete
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    HSS_DataReferencePage.Go to HSS tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to Data Reference tab
               Delete DataReference function        ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Sort
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    HSS_DataReferencePage.Go to HSS tab
    Go to Data Reference tab
    Sort Element     Name
    Sort Element     Data Reference
    Sort Element     Service Indication
    Sort Element     Max Size
    Page should not contain  Internal Server Error
Filter
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    HSS_DataReferencePage.Go to HSS tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to Data Reference tab
               Filter DataReference function        ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Filter special characters
    [Arguments]  ${Scenarios}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to Data Reference tab
               Filter special characters DataReference function        ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Add DataReference function
    [Arguments]  ${Info}
    HSS_DataReferencePage.Add DataReference   ${Info[4]}  ${Info[5]}  ${Info[6]}    ${Info[7]}
    reload page
    Sort Element     Name
    Sleep  2s
    Verify Page Contains 4 Expected Elements     ${Info[4]}  ${Info[5]}  ${Info[6]}    ${Info[7]}

Filter DataReference function
    [Arguments]  ${Info}
    Filter 4 value               ${Info[4]}  ${Info[5]}  ${Info[6]}    ${Info[7]}

Filter special characters DataReference function
    [Arguments]  ${Info}
    Filter special character 4 value  ${Info[4]}  ${Info[5]}  ${Info[6]}   ${Info[7]}  ${Info[8]}   ${Info[9]}

View DataReference function
    [Arguments]  ${Info}
    HSS_DataReferencePage.View DataReference         ${Info[4]}  ${Info[5]}  ${Info[6]}  ${Info[7]}

Delete DataReference function
    [Arguments]  ${Info}
    Sort Element     Data Reference
    Sleep  1s
    Delete with 2 info                      ${Info[4]}      ${Info[5]}
    Verify Page Not Contains 2 Expected Elements     ${Info[4]}      ${Info[5]}


Verify error message DataReference invalid case
    [Arguments]  ${Info}
    HSS_DataReferencePage.Add DataReference                                  ${Info[4]}  ${Info[5]}  ${Info[6]}    ${Info[7]}
    Verify Page Contains Error Message     ${Info[8]}
