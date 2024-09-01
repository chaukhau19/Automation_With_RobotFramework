*** Settings ***
Library     SeleniumLibrary
Resource  ../../Resources/Admin/LoginApp_SBC.robot
Resource  ./PO/IBCF_SessionBackupPage.robot
Resource  ../Admin/PO/UserManagerPage.robot
Resource  ../../Resources/Common.robot
*** Variables ***

*** Keywords ***

Session Backup Manipulate
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_SessionBackupPage.Go to IBCF tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[7]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
             Go to Session Backup section in IBCF tab
             Session Backup Function    ${Info}
 
             IF    """${Info[7]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[7]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END
#################################################################################################################################
#                                                           ---FUNCTION---                                                      #
#################################################################################################################################
Session Backup Function
    [Arguments]  ${Info}
    Common.Session Backup         ${Info[4]}
    Page Should Contain           ${Info[5]}
