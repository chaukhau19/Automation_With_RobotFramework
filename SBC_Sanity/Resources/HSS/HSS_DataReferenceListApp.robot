*** Settings ***
Resource  ../../Resources/Admin/LoginApp_SBC.robot
Resource  ./PO/HSS_DataReferenceListPage.robot
Resource  ../Admin/PO/UserManagerPage.robot
Resource  ../Common.robot

*** Keywords ***

Add
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    HSS_DataReferenceListPage.Go to HSS tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to Data Reference List tab
               Add DataReferenceList function        ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Edit
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    HSS_DataReferenceListPage.Go to HSS tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to Data Reference List tab
               Edit DataReferenceList function        ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


View
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    HSS_DataReferenceListPage.Go to HSS tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to Data Reference List tab
               View DataReferenceList function        ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Delete
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    HSS_DataReferenceListPage.Go to HSS tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to Data Reference List tab
               Delete DataReferenceList function        ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Sort
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    HSS_DataReferenceListPage.Go to HSS tab
    Go to Data Reference List tab
    Sort Element     Name
    Sort Element     Data References
    Page should not contain  Internal Server Error
Filter
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    HSS_DataReferenceListPage.Go to HSS tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to Data Reference List tab
               Filter DataReferenceList function        ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Filter special characters
    [Arguments]  ${Scenarios}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to Data Reference List tab
               Filter special characters DataReferenceList function        ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Add DataReferenceList function
    [Arguments]  ${Info}
    HSS_DataReferenceListPage.Add DataReferenceList   ${Info[4]}  ${Info[5]}  ${Info[6]}    ${Info[7]}  ${Info[8]}   ${Info[9]}
    ...  ${Info[10]}  ${Info[11]}  ${Info[12]}    ${Info[13]}  ${Info[14]}   ${Info[15]}   ${Info[16]}  ${Info[17]}   ${Info[18]}
     ...  ${Info[19]}  ${Info[20]}  ${Info[21]}    ${Info[22]}  ${Info[23]}   ${Info[24]}
    reload page
    Verify Page Contains 2 Expected Elements     ${Info[4]}  ${Info[6]}

Edit DataReferenceList function
    [Arguments]  ${Info}
    HSS_DataReferenceListPage.Edit DataReferenceList   ${Info[4]}  ${Info[5]}  ${Info[6]}    ${Info[7]}  ${Info[8]}   ${Info[9]}
    ...  ${Info[10]}  ${Info[11]}  ${Info[12]}    ${Info[13]}  ${Info[14]}   ${Info[15]}   ${Info[16]}  ${Info[17]}   ${Info[18]}
     ...  ${Info[19]}  ${Info[20]}  ${Info[21]}    ${Info[22]}  ${Info[23]}   ${Info[24]}
    reload page
    Verify Page Contains 2 Expected Elements     ${Info[4]}  ${Info[25]}

Filter DataReferenceList function
    [Arguments]  ${Info}
    Filter 2 value               ${Info[4]}  ${Info[5]}

Filter special characters DataReferenceList function
    [Arguments]  ${Info}
    Filter special character 2 value  ${Info[4]}  ${Info[5]}  ${Info[6]}   ${Info[7]}

View DataReferenceList function
    [Arguments]  ${Info}
    HSS_DataReferenceListPage.View DataReferenceList         ${Info[4]}  ${Info[5]}  ${Info[6]}    ${Info[7]}  ${Info[8]}   ${Info[9]}
    ...  ${Info[10]}  ${Info[11]}  ${Info[12]}    ${Info[13]}  ${Info[14]}   ${Info[15]}   ${Info[16]}  ${Info[17]}

Delete DataReferenceList function
    [Arguments]  ${Info}
    Delete with 1 info                      ${Info[4]}
    Verify Page Not Contains 2 Expected Elements     ${Info[4]}  ${Info[5]}
