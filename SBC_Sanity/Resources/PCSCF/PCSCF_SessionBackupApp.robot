*** Settings ***
Library     SeleniumLibrary
Resource  ../../Resources/Admin/LoginApp_SBC.robot
Resource  ./PO/PCSCF_SessionBackupPage.robot
Resource  ../Admin/PO/UserManagerPage.robot
Resource  ../../Resources/Common.robot
*** Variables ***

*** Keywords ***

Session Backup Manipulate
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    PCSCF_SessionBackupPage.Go to PCSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
             Go to Session Backup section in PCSCF tab
             Session Backup Function    ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Session Backup Function
    [Arguments]  ${Info}
    Common.Session Backup         ${Info[4]}
    page should contain           ${Info[5]}
