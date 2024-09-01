*** Settings ***
Resource  ../../Resources/Admin/LoginApp_SBC.robot
Resource  ./PO/SCSCF_IBCFPage.robot
Resource  ../../Resources/Common.robot
Resource  ../DataManager.robot
Resource  ../../Data/InputData.robot


*** Keywords ***

Add Valid Cases
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    SCSCF_IBCFPage.Go to SCSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               SCSCF_IBCFPage.Go to IBCF section in SCSCF tab
               Add ibcf function        ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Add Invalid Cases
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    SCSCF_IBCFPage.Go to SCSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               SCSCF_IBCFPage.Go to IBCF section in SCSCF tab
               Verify error message IBCF invalid Add  ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Filter Cases
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    SCSCF_IBCFPage.Go to SCSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               SCSCF_IBCFPage.Go to IBCF section in SCSCF tab
               Filter ibcf function     ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Filter Special Cases
    [Arguments]  ${Scenarios}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               SCSCF_IBCFPage.Go to IBCF section in SCSCF tab
               Filter special character ibcf function     ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


View Cases
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    SCSCF_IBCFPage.Go to SCSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to IBCF section in SCSCF tab
               View ibcf function     ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Sort Cases
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    SCSCF_IBCFPage.Go to SCSCF tab
    Go to IBCF section in SCSCF tab
    Sort Element  IP
    Sort Element  Domain
    Page should not contain  Internal Server Error
Edit Valid Cases
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    SCSCF_IBCFPage.Go to SCSCF tab
    SCSCF_IBCFPage.Go to IBCF section in SCSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            Go to IBCF section in SCSCF tab
            Edit ibcf function       ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END



Edit Invalid Cases
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    SCSCF_IBCFPage.Go to SCSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               SCSCF_IBCFPage.Go to IBCF section in SCSCF tab
               Verify error message IBCF invalid Edit  ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Delete Cases
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    SCSCF_IBCFPage.Go to SCSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               SCSCF_IBCFPage.Go to IBCF section in SCSCF tab
               Delete ibcf function       ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Add ibcf function
    [Arguments]  ${Info}
    SCSCF_IBCFPage.Add IBCF                      ${Info[4]}  ${Info[5]}  ${Info[6]}  ${Info[7]}  ${Info[8]}
    Common.Verify Page Contains 3 Expected Elements     ${Info[4]}  ${Info[5]}  ${Info[7]}

Filter ibcf function
    [Arguments]  ${Info}
    Common.Filter 3 value                ${Info[4]}  ${Info[5]}  ${Info[7]}

Filter special character ibcf function
    [Arguments]  ${Info}
    Common.Filter special character value                ${Info[4]}  ${Info[5]}  ${Info[6]}  ${Info[8]}

View ibcf function
    [Arguments]  ${Info}
    SCSCF_IBCFPage.View IBCF          ${Info[4]}  ${Info[5]}  ${Info[7]}


Edit ibcf function
    [Arguments]  ${Info}
    SCSCF_IBCFPage.Edit ibcf                   ${Info[4]}     ${Info[5]}   ${Info[7]}   ${Info[9]}     ${Info[10]}
    Verify Page Contains 3 Expected Elements     ${Info[4]}      ${Info[5]}     ${Info[7]}

Delete ibcf function
    [Arguments]  ${Info}
    Delete with 3 info                      ${Info[4]}      ${Info[5]}     ${Info[7]}
    Verify Page Not Contains 3 Expected Elements     ${Info[4]}      ${Info[5]}     ${Info[7]}


Verify error message IBCF invalid Add
    [Arguments]  ${Info}
    SCSCF_IBCFPage.Add ibcf                   ${Info[4]}  ${Info[5]}  ${Info[6]}    ${Info[7]}  ${Info[8]}
    Verify Page Contains Error Message       ${Info[9]}
    SCSCF_IBCFPage.Cancel invalid add

Verify error message IBCF invalid Edit
    [Arguments]  ${Info}
    SCSCF_IBCFPage.Edit ibcf                                  ${Info[4]}     ${Info[5]}   ${Info[7]}   ${Info[8]}     ${Info[9]}
    Verify Page Contains Error Message     ${Info[10]}
    SCSCF_IBCFPage.Cancel invalid add

