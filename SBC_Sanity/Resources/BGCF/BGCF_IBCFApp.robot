*** Settings ***
Library     SeleniumLibrary
Resource  ../../Resources/Admin/LoginApp_SBC.robot
Resource  ./PO/BGCF_IBCFPage.robot
Resource  ../../Resources/Common.robot
Resource  ../DataManager.robot
Resource  ../../Data/InputData.robot


*** Keywords ***

Add Valid Cases
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    BGCF_IBCFPage.Go to BGCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               BGCF_IBCFPage.Go to IBCF section in BGCF tab
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
    BGCF_IBCFPage.Go to BGCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               BGCF_IBCFPage.Go to IBCF section in BGCF tab
               Verify error message IBCF invalid Add  ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Add Valid Cases 65
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    BGCF_IBCFPage.Go to BGCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               BGCF_IBCFPage.Go to IBCF section in BGCF tab
               Add ibcf function 65        ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Add Invalid Cases 65
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    BGCF_IBCFPage.Go to BGCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               BGCF_IBCFPage.Go to IBCF section in BGCF tab
               Verify error message IBCF invalid Add 65  ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Filter Cases
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    BGCF_IBCFPage.Go to BGCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               BGCF_IBCFPage.Go to IBCF section in BGCF tab
               Filter ibcf function     ${Info[4]}  ${Info[5]}  ${Info[6]}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Filter Special Cases
    [Arguments]  ${Scenarios}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               BGCF_IBCFPage.Go to IBCF section in BGCF tab
               Filter special character ibcf function     ${Info[4]}  ${Info[5]}  ${Info[6]}  ${Info[7]}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Filter Cases 65
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    BGCF_IBCFPage.Go to BGCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               BGCF_IBCFPage.Go to IBCF section in BGCF tab
               Filter ibcf function     ${Info[4]}  ${Info[5]}  ${Info[7]}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Filter Special Cases 65
    [Arguments]  ${Scenarios}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               BGCF_IBCFPage.Go to IBCF section in BGCF tab
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
    BGCF_IBCFPage.Go to BGCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to IBCF section in BGCF tab
               View ibcf function     ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


View Cases 65
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    BGCF_IBCFPage.Go to BGCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to IBCF section in BGCF tab
               View ibcf function 65     ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Sort Cases 64
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    BGCF_IBCFPage.Go to BGCF tab
    Go to IBCF section in BGCF tab
    Sort Element  IP64
    #Sort Element  Port
    #Sort Element  Domain
    Page should not contain  Internal Server Error

Sort Cases
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    BGCF_IBCFPage.Go to BGCF tab
    Go to IBCF section in BGCF tab
    Sort Element  IP
    Sort Element  Port
    #Sort Element  Domain
    Page should not contain  Internal Server Error

Edit Valid Cases
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    BGCF_IBCFPage.Go to BGCF tab
    BGCF_IBCFPage.Go to IBCF section in BGCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            Go to IBCF section in BGCF tab
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
    BGCF_IBCFPage.Go to BGCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               BGCF_IBCFPage.Go to IBCF section in BGCF tab
               Verify error message IBCF invalid Edit  ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Edit Valid Cases 65
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    BGCF_IBCFPage.Go to BGCF tab
    BGCF_IBCFPage.Go to IBCF section in BGCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            Go to IBCF section in BGCF tab
            Edit ibcf function 65       ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END



Edit Invalid Cases 65
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    BGCF_IBCFPage.Go to BGCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               BGCF_IBCFPage.Go to IBCF section in BGCF tab
               Verify error message IBCF invalid Edit 65  ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Delete Cases
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    BGCF_IBCFPage.Go to BGCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               BGCF_IBCFPage.Go to IBCF section in BGCF tab
               Delete ibcf function       ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Delete Cases 65
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    BGCF_IBCFPage.Go to BGCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               BGCF_IBCFPage.Go to IBCF section in BGCF tab
               Delete ibcf function 65      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Add ibcf function
    [Arguments]  ${Info}
    BGCF_IBCFPage.Add IBCF                                  ${Info[4]}  ${Info[5]}  ${Info[6]}    ${Info[7]}
    Common.Verify Page Contains 3 Expected Elements     ${Info[4]}  ${Info[5]}  ${Info[6]}

Add ibcf function 65
    [Arguments]  ${Info}
    BGCF_IBCFPage.Add IBCF 65                                  ${Info[4]}  ${Info[5]}  ${Info[6]}  ${Info[7]}  ${Info[8]}
    Common.Verify Page Contains 3 Expected Elements     ${Info[4]}  ${Info[5]}  ${Info[7]}

Filter ibcf function
    [Arguments]  ${Info[4]}  ${Info[5]}  ${Info[6]}
    Common.Filter 3 value                ${Info[4]}  ${Info[5]}  ${Info[6]}

Filter special character ibcf function
    [Arguments]  ${Info[4]}  ${Info[5]}  ${Info[6]}  ${Info[7]}
    Common.Filter special character value                ${Info[4]}  ${Info[5]}  ${Info[6]}  ${Info[7]}

View ibcf function
    [Arguments]  ${Info}
    BGCF_IBCFPage.View IBCF          ${Info[4]}  ${Info[5]}  ${Info[6]}

View ibcf function 65
    [Arguments]  ${Info}
    BGCF_IBCFPage.View IBCF 65         ${Info[4]}  ${Info[5]}  ${Info[6]}  ${Info[7]}  ${Info[10]}

Edit ibcf function
    [Arguments]  ${Info}
    BGCF_IBCFPage.Edit ibcf                   ${Info[4]}     ${Info[5]}   ${Info[6]}   ${Info[8]}     ${Info[9]}
    Verify Page Contains 3 Expected Elements     ${Info[4]}      ${Info[5]}     ${Info[8]}

Edit ibcf function 65
    [Arguments]  ${Info}
    BGCF_IBCFPage.Edit ibcf 65                   ${Info[4]}     ${Info[5]}   ${Info[7]}   ${Info[8]}   ${Info[9]}  ${Info[11]}
    Verify Page Contains 3 Expected Elements     ${Info[4]}      ${Info[5]}     ${Info[9]}

Delete ibcf function
    [Arguments]  ${Info}
    Delete with 3 info                      ${Info[4]}      ${Info[5]}     ${Info[6]}
    Verify Page Not Contains 3 Expected Elements     ${Info[4]}      ${Info[5]}     ${Info[6]}

Delete ibcf function 65
    [Arguments]  ${Info}
    Delete with 3 info                      ${Info[4]}      ${Info[5]}     ${Info[7]}
    Verify Page Not Contains 3 Expected Elements     ${Info[4]}      ${Info[5]}     ${Info[7]}

Verify error message IBCF invalid Add
    [Arguments]  ${Info}
    BGCF_IBCFPage.Add ibcf                   ${Info[4]}  ${Info[5]}  ${Info[6]}    ${Info[7]}
    Verify Page Contains Error Message       ${Info[8]}
    BGCF_IBCFPage.Cancel invalid add

Verify error message IBCF invalid Edit
    [Arguments]  ${Info}
    BGCF_IBCFPage.Edit ibcf                                  ${Info[4]}     ${Info[5]}   ${Info[6]}   ${Info[8]}     ${Info[9]}
    Verify Page Contains Error Message     ${Info[10]}
    BGCF_IBCFPage.Cancel invalid add

Verify error message IBCF invalid Add 65
    [Arguments]  ${Info}
    BGCF_IBCFPage.Add ibcf 65                   ${Info[4]}  ${Info[5]}  ${Info[6]}  ${Info[7]}  ${Info[9]}
    Verify Page Contains Error Message       ${Info[8]}
    BGCF_IBCFPage.Cancel invalid add

Verify error message IBCF invalid Edit 65
    [Arguments]  ${Info}
    BGCF_IBCFPage.Edit ibcf 65                         ${Info[4]}     ${Info[5]}   ${Info[7]}   ${Info[8]}     ${Info[9]}  ${Info[10]}
    Verify Page Contains Error Message     ${Info[11]}
    BGCF_IBCFPage.Cancel invalid add

