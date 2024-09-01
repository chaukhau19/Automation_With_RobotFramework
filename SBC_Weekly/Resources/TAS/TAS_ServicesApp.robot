*** Settings ***
Resource  ../../Resources/Admin/LoginApp_SBC.robot
Resource  ./PO/TAS_ServicesPage.robot
Resource  ../Admin/PO/UserManagerPage.robot
Resource  ../Common.robot

*** Keywords ***

Services
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #LoginApp_SBC.#Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    TAS_ServicesPage.Go to TAS tab
    TAS_ServicesPage.Go to Services tab
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
            IF    """${Info[57]}""" != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
             View all services       ${Info}
 
             IF    """${Info[57]}""" != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[57]}
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

View all services
    [Arguments]     ${Info}
    Verify Page Contains 1 Expected Elements    ${Info[4]}
    Verify Page Contains 1 Expected Elements    ${Info[5]}
    Verify Page Contains 1 Expected Elements    ${Info[6]}
    Verify Page Contains 1 Expected Elements    ${Info[7]}
    Verify Page Contains 1 Expected Elements    ${Info[8]}
    Verify Page Contains 1 Expected Elements    ${Info[9]}
    Verify Page Contains 1 Expected Elements    ${Info[10]}
    Verify Page Contains 1 Expected Elements    ${Info[11]}
    Verify Page Contains 1 Expected Elements    ${Info[12]}
    Verify Page Contains 1 Expected Elements    ${Info[13]}
    Verify Page Contains 1 Expected Elements    ${Info[14]}
    Verify Page Contains 1 Expected Elements    ${Info[15]}
    Verify Page Contains 1 Expected Elements    ${Info[16]}
    Verify Page Contains 1 Expected Elements    ${Info[17]}
    Verify Page Contains 1 Expected Elements    ${Info[18]}
    Verify Page Contains 1 Expected Elements    ${Info[19]}
    Verify Page Contains 1 Expected Elements    ${Info[20]}
    Verify Page Contains 1 Expected Elements    ${Info[21]}
    Verify Page Contains 1 Expected Elements    ${Info[22]}
    Verify Page Contains 1 Expected Elements    ${Info[23]}
    Verify Page Contains 1 Expected Elements    ${Info[24]}
    Verify Page Contains 1 Expected Elements    ${Info[25]}
    Verify Page Contains 1 Expected Elements    ${Info[26]}
    Verify Page Contains 1 Expected Elements    ${Info[27]}
    Verify Page Contains 1 Expected Elements    ${Info[28]}
    Verify Page Contains 1 Expected Elements    ${Info[29]}
    Verify Page Contains 1 Expected Elements    ${Info[30]}
    Verify Page Contains 1 Expected Elements    ${Info[31]}
    Verify Page Contains 1 Expected Elements    ${Info[32]}
    Verify Page Contains 1 Expected Elements    ${Info[33]}
    Verify Page Contains 1 Expected Elements    ${Info[34]}
    Verify Page Contains 1 Expected Elements    ${Info[35]}
    Verify Page Contains 1 Expected Elements    ${Info[36]}
    Verify Page Contains 1 Expected Elements    ${Info[37]}
    Verify Page Contains 1 Expected Elements    ${Info[38]}
    Verify Page Contains 1 Expected Elements    ${Info[39]}
    Verify Page Contains 1 Expected Elements    ${Info[40]}
    Verify Page Contains 1 Expected Elements    ${Info[41]}
    Verify Page Contains 1 Expected Elements    ${Info[42]}
    Verify Page Contains 1 Expected Elements    ${Info[43]}
    Verify Page Contains 1 Expected Elements    ${Info[44]}
    Verify Page Contains 1 Expected Elements    ${Info[45]}
    Verify Page Contains 1 Expected Elements    ${Info[46]}
    Verify Page Contains 1 Expected Elements    ${Info[47]}
    Verify Page Contains 1 Expected Elements    ${Info[48]}
    Verify Page Contains 1 Expected Elements    ${Info[49]}
    Verify Page Contains 1 Expected Elements    ${Info[50]}
    Verify Page Contains 1 Expected Elements    ${Info[51]}
    Verify Page Contains 1 Expected Elements    ${Info[52]}
    Verify Page Contains 1 Expected Elements    ${Info[53]}
    Verify Page Contains 1 Expected Elements    ${Info[54]}
    Verify Page Contains 1 Expected Elements    ${Info[55]}
