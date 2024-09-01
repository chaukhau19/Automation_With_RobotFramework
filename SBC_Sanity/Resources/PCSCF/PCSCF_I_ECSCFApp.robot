*** Settings ***
Library  SeleniumLibrary
Resource  ../../Resources/Admin/LoginApp_SBC.robot
Resource  ./PO/PCSCF_I_ECSCFPage.robot
Resource  ../Admin/PO/UserManagerPage.robot
Resource  ../Common.robot

*** Keywords ***

Add ICSCF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_I_ECSCFPage.Go to PCSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to ICSCF section in PCSCF tab
               Add ICSCF function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Add ICSCF function
    [Arguments]  ${Info}
    PCSCF_I_ECSCFPage.Add ICSCF  ${Info[4]}  ${Info[5]}   ${Info[6]}    ${Info[7]}  ${Info[8]}
    reload page
    Verify Page Contains 2 Expected Elements     ${Info[4]}  ${Info[5]}

Edit ICSCF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_I_ECSCFPage.Go to PCSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to ICSCF section in PCSCF tab
               Edit ICSCF function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Edit ICSCF function
    [Arguments]  ${Info}
    PCSCF_I_ECSCFPage.Edit ICSCF  ${Info[4]}  ${Info[5]}   ${Info[9]}  ${Info[10]}  ${Info[11]}
    reload page
    Verify Page Contains 2 Expected Elements     ${Info[4]}  ${Info[9]}

Delete ICSCF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_I_ECSCFPage.Go to PCSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to ICSCF section in PCSCF tab
               Delete ICSCF function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Delete ICSCF function
    [Arguments]  ${Info}
    Delete with 1 info  ${Info[4]}
    Verify Page Not Contains 2 Expect Elements  ${Info[4]}      ${Info[5]}

Sort ICSCF 64
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_I_ECSCFPage.Go to PCSCF tab
    PCSCF_I_ECSCFPage.Go to ICSCF section in PCSCF tab
    Sort Element  IP64
    Page should not contain  Internal Server Error

Sort ICSCF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_I_ECSCFPage.Go to PCSCF tab
    PCSCF_I_ECSCFPage.Go to ICSCF section in PCSCF tab
    Sort Element  IP
    Page should not contain  Internal Server Error
View ICSCF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_I_ECSCFPage.Go to PCSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to ICSCF section in PCSCF tab
               View ICSCF function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Filter ICSCF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_I_ECSCFPage.Go to PCSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to ICSCF section in PCSCF tab
               Filter ICSCF function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Filter Special Character ICSCF
    [Arguments]  ${Scenarios}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Filter Special Charaters ICSCF function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


View ICSCF function
    [Arguments]  ${Info}
    PCSCF_I_ECSCFPage.View PCSCF_ICSCF  ${Info[4]}  ${Info[5]}  ${Info[6]}  ${Info[7]}  ${Info[8]}
    Back from View Page

Filter ICSCF function
    [Arguments]  ${Info}
    Filter 4 value           ${Info[4]}  ${Info[5]}   ${Info[7]}  ${Info[6]}

Filter Special Charaters ICSCF function
    [Arguments]  ${Info}
    Filter special character 4 value           ${Info[4]}  ${Info[5]}  ${Info[6]}  ${Info[7]}  ${Info[8]}  ${Info[9]}


Add ECSCF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_I_ECSCFPage.Go to PCSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to ECSCF section in PCSCF tab
               Add ICSCF function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END



Edit ECSCF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_I_ECSCFPage.Go to PCSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to ECSCF section in PCSCF tab
               Edit ECSCF function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END



Delete ECSCF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_I_ECSCFPage.Go to PCSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to ECSCF section in PCSCF tab
               Delete ICSCF function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Sort ECSCF 64
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_I_ECSCFPage.Go to PCSCF tab
    PCSCF_I_ECSCFPage.Go to ECSCF section in PCSCF tab
    Sort Element  IP64
    Page should not contain  Internal Server Error

Sort ECSCF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_I_ECSCFPage.Go to PCSCF tab
    PCSCF_I_ECSCFPage.Go to ECSCF section in PCSCF tab
    Sort Element  IP
    Page should not contain  Internal Server Error

View ECSCF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_I_ECSCFPage.Go to PCSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to ECSCF section in PCSCF tab
               View ECSCF function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Filter ECSCF
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_I_ECSCFPage.Go to PCSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to ECSCF section in PCSCF tab
               Filter ECSCF function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Filter Special Character ECSCF
    [Arguments]  ${Scenarios}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Filter Special Charaters ECSCF function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


View ECSCF function
    [Arguments]  ${Info}
    PCSCF_I_ECSCFPage.View PCSCF_ICSCF  ${Info[4]}  ${Info[5]}  ${Info[6]}  ${Info[7]}  ${Info[8]}
    Back from View Page

Filter ECSCF function
    [Arguments]  ${Info}
    Filter 4 value           ${Info[4]}  ${Info[5]}   ${Info[6]}  ${Info[8]}

Filter Special Charaters ECSCF function
    [Arguments]  ${Info}
    Filter special character 4 value           ${Info[4]}  ${Info[5]}  ${Info[6]}  ${Info[7]}  ${Info[8]}  ${Info[9]}

Edit ECSCF function
    [Arguments]  ${Info}
    PCSCF_I_ECSCFPage.Edit ICSCF  ${Info[4]}  ${Info[5]}   ${Info[9]}  ${Info[10]}  ${Info[11]}
    reload page
    Verify Page Contains 2 Expected Elements     ${Info[4]}  ${Info[11]}