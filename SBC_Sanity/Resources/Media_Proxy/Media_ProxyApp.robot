*** Settings ***
Resource  ../Admin/LoginApp_SBC.robot
Resource  ./PO/Media_ProxyPage.robot
Resource  ../Admin/PO/UserManagerPage.robot
Resource  ../Common.robot

*** Variables ***

*** Keywords ***

Add Forwarder
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    Media_ProxyPage.Go to Media Proxy tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to Forwarder section in Media Proxy tab
               Add forwarder function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Delete Forwarder
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    Media_ProxyPage.Go to Media Proxy tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to Forwarder section in Media Proxy tab
               Delete function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Sort Forwarder
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
	Media_ProxyPage.Go to Media Proxy tab
    Media_ProxyPage.Go to Forwarder section in Media Proxy tab
    Sort Element  Name
    Page should not contain  Internal Server Error

Filter Forwarder
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
	Media_ProxyPage.Go to Media Proxy tab
    Media_ProxyPage.Go to Forwarder section in Media Proxy tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Filter Forwarder function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Filter Special Character Forwarder
    [Arguments]  ${Scenarios}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Filter Special Charaters Forwarder function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Add ICMP Check
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    Media_ProxyPage.Go to Media Proxy tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to ICMP section in Media Proxy tab
               Add icmp function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Delete ICMP Check
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    Media_ProxyPage.Go to Media Proxy tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to ICMP section in Media Proxy tab
               Delete function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END




Sort ICMP
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
	Media_ProxyPage.Go to Media Proxy tab
    Media_ProxyPage.Go to ICMP section in Media Proxy tab
    Sort Element  Name

Filter ICMP
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
	Media_ProxyPage.Go to Media Proxy tab
    Media_ProxyPage.Go to ICMP section in Media Proxy tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Filter ICMP function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Filter Special Character ICMP
    [Arguments]  ${Scenarios}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Filter Special Charaters ICMP function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Add VNIC
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    Media_ProxyPage.Go to Media Proxy tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to VNIC section in Media Proxy tab
               Add vnic function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Add VNIC 71
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    Media_ProxyPage.Go to Media Proxy tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to VNIC section in Media Proxy tab
               Add vnic function 71      ${Info}
               View VNIC function 71     ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Edit VNIC
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    Media_ProxyPage.Go to Media Proxy tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to VNIC section in Media Proxy tab
               Edit vnic function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Edit VNIC 71
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    Media_ProxyPage.Go to Media Proxy tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to VNIC section in Media Proxy tab
               Edit vnic function 71      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Delete VNIC
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    Media_ProxyPage.Go to Media Proxy tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to VNIC section in Media Proxy tab
               Delete vnic function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Sort VNIC
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
	Media_ProxyPage.Go to Media Proxy tab
    Media_ProxyPage.Go to VNIC section in Media Proxy tab
    Sort Element  Name

Filter VNIC
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
	Media_ProxyPage.Go to Media Proxy tab
    Media_ProxyPage.Go to VNIC section in Media Proxy tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Filter VNIC function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Filter Special Character VNIC
    [Arguments]  ${Scenarios}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Filter Special Charaters VNIC function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


View VNIC
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
	Media_ProxyPage.Go to Media Proxy tab
    Media_ProxyPage.Go to VNIC section in Media Proxy tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               View VNIC function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


View VNIC 71
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
	Media_ProxyPage.Go to Media Proxy tab
    Media_ProxyPage.Go to VNIC section in Media Proxy tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               View VNIC function 71      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Add forwarder function
    [Arguments]  ${Info}
    Media_ProxyPage.Add MPForwarder    ${Info[4]}     ${Info[5]}
    reload page
    Verify Page Contains 2 Expected Elements     ${Info[4]}   ${Info[5]}

Delete function
    [Arguments]  ${Info}
    Delete with 1 info  ${Info[4]}
    Verify Page Not Contains 1 Expect Elements  ${Info[4]}

Filter Forwarder function
    [Arguments]  ${Info}
    Click Element       ${Forwarder_section}
    Sleep   1s
    Filter 2 value           ${Info[4]}  ${Info[5]}

Filter Special Charaters Forwarder function
    [Arguments]  ${Info}
    Click Element       ${Forwarder_section}
    Sleep   1s
    Filter special character 2 value           ${Info[4]}  ${Info[5]}  ${Info[6]}   ${Info[7]}

Add icmp function
    [Arguments]  ${Info}
    Media_ProxyPage.Add ICMP    ${Info[4]}  ${Info[5]}  ${Info[6]}  ${Info[7]}  ${Info[8]}   ${Info[9]}  ${Info[10]}   ${Info[11]}
    reload page
    Verify Page Contains 2 Expected Elements     ${Info[4]}   ${Info[5]}

Filter ICMP function
    [Arguments]  ${Info}
    Click Element       ${ICMP_section}
    Sleep   1s
    Filter 2 value           ${Info[4]}  ${Info[5]}

Filter Special Charaters ICMP function
    [Arguments]  ${Info}
    Click Element       ${ICMP_section}
    Sleep   1s
    Filter special character 2 value           ${Info[4]}  ${Info[5]}  ${Info[6]}   ${Info[7]}

Add vnic function
    [Arguments]  ${Info}
    Media_ProxyPage.Add MPVNIC    ${Info[4]}  ${Info[5]}  ${Info[6]}  ${Info[7]}  ${Info[8]}   ${Info[9]}  ${Info[10]}   ${Info[11]}  ${Info[12]}   ${Info[13]}
    reload page
    Verify Page Contains 2 Expected Elements     ${Info[5]}   ${Info[4]}

Add vnic function 71
    [Arguments]  ${Info}
    Media_ProxyPage.Add MPVNIC 71    ${Info[4]}  ${Info[5]}  ${Info[6]}  ${Info[7]}  ${Info[8]}   ${Info[9]}  ${Info[10]}   ${Info[11]}  ${Info[12]}   ${Info[13]}    ${Info[18]}
    reload page
    Verify Page Contains 2 Expected Elements     ${Info[5]}   ${Info[4]}

Edit vnic function
    [Arguments]  ${Info}
    Media_ProxyPage.Edit MPVNIC    ${Info[4]}  ${Info[5]}  ${Info[14]}   ${Info[15]}  ${Info[16]}
    reload page
    Verify Page Contains 2 Expected Elements     ${Info[5]}   ${Info[4]}

Edit vnic function 71
    [Arguments]  ${Info}
    Media_ProxyPage.Edit MPVNIC 71    ${Info[4]}  ${Info[5]}  ${Info[14]}   ${Info[15]}  ${Info[16]}  ${Info[18]}
    reload page
    Media_ProxyPage.View MPVNIC 71    ${Info[4]}  ${Info[5]}  ${Info[6]}  ${Info[7]}  ${Info[17]}  ${Info[18]}

Delete vnic function
    [Arguments]  ${Info}
    Delete with 2 info  ${Info[6]}   ${Info[4]}
    Verify Page Not Contains 3 Expect Elements  ${Info[19]}   ${Info[6]}   ${Info[4]}

Filter VNIC function
    [Arguments]  ${Info}
    Click Element       ${VNIC_section}
    Sleep   1s
    Filter 2 value           ${Info[5]}_${Info[6]}  ${Info[5]}

Filter Special Charaters VNIC function
    [Arguments]  ${Info}
    Click Element       ${VNIC_section}
    Sleep   1s
    Filter special character 2 value           ${Info[4]}  ${Info[5]}  ${Info[6]}   ${Info[7]}

View VNIC function
    [Arguments]  ${Info}
    Media_ProxyPage.View MPVNIC    ${Info[4]}  ${Info[5]}  ${Info[6]}  ${Info[7]}  ${Info[17]}
    Back from View Page

View VNIC function 71
    [Arguments]  ${Info}
    Media_ProxyPage.View MPVNIC 71    ${Info[4]}  ${Info[5]}  ${Info[6]}  ${Info[7]}  ${Info[17]}  ${Info[18]}
    Back from View Page