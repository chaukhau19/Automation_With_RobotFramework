*** Settings ***
Resource  ../../Resources/Admin/LoginApp_SBC.robot
Resource  ./PO/SCSCF_DNSPage.robot
Resource  ../Admin/PO/UserManagerPage.robot
Resource  ../Common.robot

*** Keywords ***

Edit
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    Go to SCSCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to DNS section in SCSCF tab
               Go to Configuration section in DNS tab
               Go to Configuration section in Configuration tab
               Edit DNS function        ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Edit DNS function
    [Arguments]  ${Info}
    SCSCF_DNSPage.Edit DNS   ${Info[4]}  ${Info[5]}  ${Info[6]}  ${Info[7]}  ${Info[8]}  ${Info[9]}  ${Info[10]}  ${Info[11]}
    ...   ${Info[12]}  ${Info[13]}  ${Info[14]}  ${Info[15]}  ${Info[16]}
    Verify Page Contains 2 Expected Elements DNS  Key Out  ${Info[4]}
    Verify Page Contains 2 Expected Elements DNS  Key In  ${Info[5]}
    Verify Page Contains 2 Expected Elements DNS  Time Wait For DNS  ${Info[6]}
    Verify Page Contains 2 Expected Elements DNS  Use DNS For Via FQDN  ${Info[7]}
    Verify Page Contains 2 Expected Elements DNS  Use Caching  ${Info[8]}
    Verify Page Contains 2 Expected Elements DNS  Caching Time  ${Info[9]}
    Verify Page Contains 2 Expected Elements DNS  Blacklisting  ${Info[10]}
    Verify Page Contains 2 Expected Elements DNS  Refuse Call  ${Info[12]}
    Verify Page Contains 2 Expected Elements DNS  Reason Code  ${Info[13]}
    Verify Page Contains 2 Expected Elements DNS  Blacklist Time  ${Info[11]}
    Verify Page Contains 2 Expected Elements DNS  SNMP  ${Info[15]}
    Verify Page Contains 2 Expected Elements DNS  SRV Only  ${Info[16]}

Add Valid Cases
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    SCSCF_DNSPage.Go to SCSCF tab
    Go to DNS section in SCSCF tab
    Go to Configuration section in DNS tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to Resolver section in Configuration tab
               Add resolver function        ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Add Invalid Cases
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    SCSCF_DNSPage.Go to SCSCF tab
    Go to DNS section in SCSCF tab
    Go to Configuration section in DNS tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to Resolver section in Configuration tab
               Verify error message resolver invalid add  ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Filter Cases
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    SCSCF_DNSPage.Go to SCSCF tab
    Go to DNS section in SCSCF tab
    Go to Configuration section in DNS tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to Resolver section in Configuration tab
               Filter resolver function     ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Filter Special Cases
    [Arguments]  ${Scenarios}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to Resolver section in Configuration tab
               Filter special character resolver function     ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


View Cases
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    SCSCF_DNSPage.Go to SCSCF tab
    Go to DNS section in SCSCF tab
    Go to Configuration section in DNS tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to Resolver section in Configuration tab
               View resolver function     ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Sort Cases
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    SCSCF_DNSPage.Go to SCSCF tab
    Go to DNS section in SCSCF tab
    Go to Configuration section in DNS tab
    Go to Resolver section in Configuration tab
    Sort Element  FQDN
    Sort Element  IP
    Sort Element  Port
    Sort Element  Protocol
    Page should not contain  Internal Server Error
Edit Valid Cases
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    SCSCF_DNSPage.Go to SCSCF tab
    SCSCF_DNSPage.Go to DNS section in SCSCF tab
    Go to Configuration section in DNS tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to Resolver section in Configuration tab
               Edit resolver function       ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END



Edit Invalid Cases
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    SCSCF_DNSPage.Go to SCSCF tab
    Go to DNS section in SCSCF tab
    Go to Configuration section in DNS tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to Resolver section in Configuration tab
               Verify error message resolver invalid edit  ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Delete Cases
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    SCSCF_DNSPage.Go to SCSCF tab
    Go to DNS section in SCSCF tab
    Go to Configuration section in DNS tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to Resolver section in Configuration tab
               Delete resolver function       ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Add resolver function
    [Arguments]  ${Info}
    SCSCF_DNSPage.Add resolver                      ${Info[4]}  ${Info[5]}  ${Info[6]}  ${Info[7]}  ${Info[8]}  ${Info[9]}
    Common.Verify Page Contains 4 Expected Elements     ${Info[4]}  ${Info[5]}  ${Info[6]}   ${Info[7]}

Filter resolver function
    [Arguments]  ${Info}
    Common.Filter 4 value                ${Info[4]}  ${Info[5]}   ${Info[6]}  ${Info[7]}

Filter special character resolver function
    [Arguments]  ${Info}
    Common.Filter special character 4 value           ${Info[4]}  ${Info[5]}  ${Info[6]}  ${Info[7]}  ${Info[8]}  ${Info[9]}

View resolver function
    [Arguments]  ${Info}
    SCSCF_DNSPage.View resolver          ${Info[4]}  ${Info[5]}  ${Info[6]}  ${Info[7]}  ${Info[8]}  ${Info[9]}


Edit resolver function
    [Arguments]  ${Info}
    SCSCF_DNSPage.Edit resolver                   ${Info[4]}     ${Info[5]}   ${Info[6]}  ${Info[7]}   ${Info[10]}     ${Info[11]}
    Verify Page Contains 4 Expected Elements     ${Info[4]}     ${Info[5]}   ${Info[6]}  ${Info[7]}

Delete resolver function
    [Arguments]  ${Info}
    Delete with 3 info                      ${Info[4]}      ${Info[5]}   ${Info[6]}
    Verify Page Not Contains 3 Expected Elements     ${Info[4]}      ${Info[5]}   ${Info[6]}


Verify error message resolver invalid add
    [Arguments]  ${Info}
    SCSCF_DNSPage.Add resolver                   ${Info[4]}  ${Info[5]}  ${Info[6]}    ${Info[7]}  ${Info[8]}  ${Info[9]}
    Verify Page Contains Error Message       ${Info[10]}
    SCSCF_DNSPage.Cancel invalid add

Verify error message resolver invalid edit
    [Arguments]  ${Info}
    SCSCF_DNSPage.Edit resolver                   ${Info[4]}     ${Info[5]}  ${Info[6]}   ${Info[7]}   ${Info[8]}     ${Info[9]}
    Verify Page Contains Error Message     ${Info[10]}
    SCSCF_DNSPage.Cancel invalid add
