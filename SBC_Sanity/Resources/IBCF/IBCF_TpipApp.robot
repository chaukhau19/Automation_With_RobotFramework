*** Settings ***
Resource  ../../Resources/Admin/LoginApp_SBC.robot
Resource  ./PO/IBCF_TpipPage.robot
Resource  ../Admin/PO/UserManagerPage.robot
Resource  ../Common.robot

*** Keywords ***

Add
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_TpipPage.Go to IBCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               IBCF_TpipPage.Go to TPIP section in IBCF tab
               Add TPIP function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


View
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_TpipPage.Go to IBCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               IBCF_TpipPage.Go to TPIP section in IBCF tab
               View TPIP function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Filter
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_TpipPage.Go to IBCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               IBCF_TpipPage.Go to TPIP section in IBCF tab
               Filter TPIP function            ${Info}
               Filter TPIP special charaters   ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Sort 64
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_TpipPage.Go to IBCF tab
    Go to TPIP section in IBCF tab
    Sort Element  Name64
    Sort Element  Type64
    Page should not contain  Internal Server Error

Sort
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_TpipPage.Go to IBCF tab
    Go to TPIP section in IBCF tab
    Sort Element  Name
    Sort Element  Type
    Page should not contain  Internal Server Error
Edit
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_TpipPage.Go to IBCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               IBCF_TpipPage.Go to TPIP section in IBCF tab
               Edit TPIP function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Add Invalid
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_TpipPage.Go to IBCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            Go to TPIP section in IBCF tab
            Verify error message invalid case  ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END



Add TPIP function
    [Arguments]  ${Info}
    IBCF_TpipPage.Add TPIP    ${Info[4]}  ${Info[5]}  ${Info[6]}   ${Info[7]}  ${Info[8]}   ${Info[9]}   ${Info[10]}  ${Info[11]}      ${Info[12]}   ${Info[13]}
    ...           ${Info[14]}    ${Info[15]}  ${Info[16]}  ${Info[17]}   ${Info[18]}   ${Info[19]}  ${Info[20]}  ${Info[21]}   ${Info[22]}   ${Info[27]}   ${Info[28]}

    reload page
    Run Keyword If      '${Info[5]}' =='Auto_TPIP5'         Click Element     ${Page_2}
    Run Keyword If      '${Info[5]}' =='Auto_TPIP6'         Click Element     ${Page_2}
    Verify Page Contains 3 Expected Elements     ${Info[5]}  ${Info[8]}       ${Info[4]}


Edit TPIP function
    [Arguments]  ${Info}
    IBCF_TpipPage.Edit TPIP   ${Info[5]}  ${Info[8]}   ${Info[23]}   ${Info[24]}  ${Info[25]}
    reload page
    Verify Page Contains 2 Expected Elements     ${Info[5]}  ${Info[8]}

View TPIP function
    [Arguments]   ${Info}
    IBCF_TpipPage.View TPIP  ${Info[4]}  ${Info[5]}  ${Info[6]}  ${Info[8]}
    Back from View Page

Filter TPIP function
    [Arguments]  ${Info}
    Filter 4 value           ${Info[5]}  ${Info[6]}  ${Info[8]}  ${Info[4]}

Filter TPIP special charaters
    [Arguments]  ${Info}
    Filter special character 1 value  ${Info[26]}  ${Info[5]}  ${Info[6]}

Verify error message invalid case
    [Arguments]  ${Info}
    IBCF_TpipPage.Add TPIP        ${Info[4]}  ${Info[5]}  ${Info[6]}   ${Info[7]}  ${Info[8]}   ${Info[9]}   ${Info[10]}  ${Info[11]}      ${Info[10]}   ${Info[13]}
    ...           ${Info[14]}    ${Info[15]}  ${Info[16]}  ${Info[17]}   ${Info[18]}   ${Info[19]}  ${Info[20]}  ${Info[21]}   ${Info[22]}   ${Info[23]}   ${Info[24]}
    Verify Page Contains Error Message        ${Info[23]}

