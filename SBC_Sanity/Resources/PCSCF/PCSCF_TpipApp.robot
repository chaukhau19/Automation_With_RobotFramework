*** Settings ***
Resource  ../../Resources/Admin/LoginApp_SBC.robot
Resource  ./PO/PCSCF_TpipPage.robot
Resource  ../Admin/PO/UserManagerPage.robot
Resource  ../Common.robot

*** Variables ***
################# General variables #################
${Next_page}              	xpath=//a[contains(text(),'»')]

*** Keywords ***

Add
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_TpipPage.Go to PCSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               PCSCF_TpipPage.Go to TPIP section in PCSCF tab
               Add TPIP function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Add Invalid Protected
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_TpipPage.Go to PCSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               PCSCF_TpipPage.Go to TPIP section in PCSCF tab
               Add Invalid Protected TPIP function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


View
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_TpipPage.Go to PCSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               PCSCF_TpipPage.Go to TPIP section in PCSCF tab
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
    PCSCF_TpipPage.Go to PCSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               PCSCF_TpipPage.Go to TPIP section in PCSCF tab
               Filter TPIP function            ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Filter Special Character TPIP
    [Arguments]  ${Scenarios}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Filter special charaters TPIP function   ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Sort 64
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_TpipPage.Go to PCSCF tab
    Go to TPIP section in PCSCF tab
    Sort Element  Name64
    Sort Element  Type64
    Page should not contain  Internal Server Error

Sort
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_TpipPage.Go to PCSCF tab
    Go to TPIP section in PCSCF tab
    Sort Element  Name
    Sort Element  Type
    Page should not contain  Internal Server Error
Edit
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_TpipPage.Go to PCSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               PCSCF_TpipPage.Go to TPIP section in PCSCF tab
               Edit TPIP function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Invalid Case
    [Arguments]  ${Scenarios}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            Navigate to Sign In Page
            Attempt to Login   ${Info}
            Go to TPIP section in PCSCF tab

            Verify error message invalid case  ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END



Add TPIP function
    [Arguments]  ${Info}
    PCSCF_TpipPage.Add TPIP    ${Info[4]}     ${Info[5]}       ${Info[6]}    ${Info[7]}   ${Info[8]}      ${Info[9]}      ${Info[10]}
    ...          ${Info[11]}   ${Info[12]}    ${Info[13]}      ${Info[14]}   ${Info[15]}  ${Info[16]}     ${Info[17]}     ${Info[18]}
    ...          ${Info[19]}   ${Info[20]}    ${Info[21]}      ${Info[22]}    ${Info[23]}  ${Info[28]}
    reload page
    Run Keyword If  '${Info[5]}' == 'auto_home_eth'      Click Element     ${Next_page}
    Run Keyword If  '${Info[5]}' == 'auto_extern_eth'      Click Element     ${Next_page}
    Run Keyword If  '${Info[5]}' == 'auto_atcf_eth'      Click Element     ${Next_page}
    Verify Page Contains 2 Expected Elements     ${Info[5]}   ${Info[8]}

Add Invalid Protected TPIP function
    [Arguments]  ${Info}
    PCSCF_TpipPage.Add TPIP    ${Info[4]}     ${Info[5]}       ${Info[6]}    ${Info[7]}   ${Info[8]}      ${Info[9]}      ${Info[10]}
    ...          ${Info[11]}   ${Info[12]}    ${Info[13]}      ${Info[14]}   ${Info[15]}  ${Info[16]}     ${Info[17]}     ${Info[18]}
    ...          ${Info[19]}   ${Info[20]}    ${Info[21]}      ${Info[22]}    ${Info[23]}   ${Info[28]}
    Verify Page Contains Error Message       ${Info[29]}
    Click Close Error Panel


Edit TPIP function
    [Arguments]  ${Info}
    PCSCF_TpipPage.Edit TPIP   ${Info[4]}   ${Info[5]}  ${Info[8]}   ${Info[24]}   ${Info[25]}   ${Info[26]}    ${Info[27]}
    reload page
    Run Keyword If  '${Info[5]}' == 'auto_extern_eth'      Click Element     ${Next_page}
    Verify Page Contains 2 Expected Elements     ${Info[5]}  ${Info[8]}

Verify error message invalid case
    [Arguments]  ${Info}
    PCSCF_TpipPage.Add TPIP        ${Info[4]}  ${Info[5]}  ${Info[6]}    ${Info[7]}
    ...     ${Info[8]}      ${Info[9]}   ${Info[10]}    ${Info[11]}      ${Info[12]}
    Verify Page Contains Error Message        ${Info[13]}
    UserManagerPage.Log out

View TPIP function
    [Arguments]   ${Info}
    Run Keyword If  '${Info[5]}' == 'auto_home_eth'      Click Element     ${Next_page}
    Run Keyword If  '${Info[5]}' == 'auto_extern_eth'      Click Element     ${Next_page}
    Run Keyword If  '${Info[5]}' == 'auto_atcf_eth'      Click Element     ${Next_page}
    PCSCF_TpipPage.View TPIP  ${Info[4]}  ${Info[5]}  ${Info[6]}  ${Info[8]}
    Back from View Page

Filter TPIP function
    [Arguments]  ${Info}
    Filter 4 value           ${Info[5]}  ${Info[6]}  ${Info[8]}  ${Info[4]}

Filter special charaters TPIP function
    [Arguments]  ${Info}
    Filter special character 4 value  ${Info[4]}  ${Info[5]}  ${Info[6]}  ${Info[7]}  ${Info[8]}  ${Info[9]}