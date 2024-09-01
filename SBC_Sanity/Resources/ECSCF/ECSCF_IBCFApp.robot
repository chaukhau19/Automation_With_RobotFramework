*** Settings ***
Resource  ../../Resources/Admin/LoginApp_SBC.robot
Resource  ./PO/ECSCF_IBCFPage.robot
Resource  ../../Resources/Common.robot
Resource  ../DataManager.robot
Resource  ../../Data/InputData.robot


*** Keywords ***

Add Valid Cases
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    ECSCF_IBCFPage.Go to ECSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               ECSCF_IBCFPage.Go to IBCF section in ECSCF tab
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
    ECSCF_IBCFPage.Go to ECSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               ECSCF_IBCFPage.Go to IBCF section in ECSCF tab
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
    ECSCF_IBCFPage.Go to ECSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               ECSCF_IBCFPage.Go to IBCF section in ECSCF tab
               Filter ibcf function     ${Info[4]}  ${Info[5]}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Filter Special Cases
    [Arguments]  ${Scenarios}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               ECSCF_IBCFPage.Go to IBCF section in ECSCF tab
               Filter special character ibcf function     ${Info[4]}  ${Info[5]}  ${Info[6]}  ${Info[7]}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


View Cases
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    ECSCF_IBCFPage.Go to ECSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to IBCF section in ECSCF tab
               View ibcf function     ${Info[4]}  ${Info[5]}  ${Info[6]}  ${Info[7]}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Sort Cases
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    ECSCF_IBCFPage.Go to ECSCF tab
    Go to IBCF section in ECSCF tab
    Sort Element  IP
    Page should not contain  Internal Server Error

Edit Valid Cases
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    ECSCF_IBCFPage.Go to ECSCF tab
    ECSCF_IBCFPage.Go to IBCF section in ECSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            Go to IBCF section in ECSCF tab
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
    ECSCF_IBCFPage.Go to ECSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               ECSCF_IBCFPage.Go to IBCF section in ECSCF tab
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
    ECSCF_IBCFPage.Go to ECSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               ECSCF_IBCFPage.Go to IBCF section in ECSCF tab
               Delete ibcf function       ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Add ibcf function
    [Arguments]  ${Info}
    ECSCF_IBCFPage.Add IBCF                                  ${Info[4]}  ${Info[5]}  ${Info[6]}    ${Info[7]}
    Common.Verify Page Contains 2 Expected Elements     ${Info[4]}  ${Info[5]}

Filter ibcf function
    [Arguments]  ${Info[4]}  ${Info[5]}
    Common.Filter 2 value                ${Info[4]}  ${Info[5]}

Filter special character ibcf function
    [Arguments]  ${Info[4]}  ${Info[5]}  ${Info[6]}  ${Info[7]}
    Common.Filter special character 2 value                ${Info[4]}  ${Info[5]}  ${Info[6]}  ${Info[7]}

View ibcf function
    [Arguments]  ${Info[4]}  ${Info[5]}  ${Info[6]}  ${Info[7]}
    ECSCF_IBCFPage.View IBCF          ${Info[4]}  ${Info[5]}  ${Info[6]}  ${Info[7]}


Edit ibcf function
    [Arguments]  ${Info}
    ECSCF_IBCFPage.Edit ibcf                   ${Info[4]}     ${Info[5]}  ${Info[8]}     ${Info[9]}
    Verify Page Contains 2 Expected Elements     ${Info[4]}      ${Info[5]}

Delete ibcf function
    [Arguments]  ${Info}
    Delete with 2 info                      ${Info[4]}      ${Info[5]}
    Verify Page Not Contains 2 Expected Elements     ${Info[4]}      ${Info[5]}


Verify error message IBCF invalid Add
    [Arguments]  ${Info}
    ECSCF_IBCFPage.Add ibcf                   ${Info[4]}  ${Info[5]}  ${Info[6]}    ${Info[7]}
    Verify Page Contains Error Message       ${Info[8]}
    ECSCF_IBCFPage.Cancel invalid add

Verify error message IBCF invalid Edit
    [Arguments]  ${Info}
    ECSCF_IBCFPage.Edit ibcf                                  ${Info[4]}     ${Info[5]}   ${Info[8]}     ${Info[9]}
    Verify Page Contains Error Message     ${Info[10]}
    ECSCF_IBCFPage.Cancel invalid add

