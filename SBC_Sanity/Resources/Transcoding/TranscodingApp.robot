*** Settings ***
Resource  ../Admin/LoginApp_SBC.robot
Resource  ./PO/TranscodingPage.robot
Resource  ../Admin/PO/UserManagerPage.robot
Resource  ../Common.robot

*** Variables ***

*** Keywords ***

Add Card
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    TranscodingPage.Go to TCGW tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               TranscodingPage.Go to Card section in TCGW tab
               Add card function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Delete Card
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    TranscodingPage.Go to TCGW tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               TranscodingPage.Go to Card section in TCGW tab
               Delete function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Sort Card 64
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
	TranscodingPage.Go to TCGW tab
    TranscodingPage.Go to Card section in TCGW tab
    Sort Element  Name64
    Page should not contain  Internal Server Error

Sort Card
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
	TranscodingPage.Go to TCGW tab
    TranscodingPage.Go to Card section in TCGW tab
    Sort Element  Name
    Page should not contain  Internal Server Error
View Card
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
	TranscodingPage.Go to TCGW tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
	\   run keyword and continue on failure     TranscodingPage.Go to Card section in TCGW tab
               View Card function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Filter Card
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
	TranscodingPage.Go to TCGW tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
	\   run keyword and continue on failure     TranscodingPage.Go to Card section in TCGW tab
               Filter Card function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Filter Special Character Card
    [Arguments]  ${Scenarios}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Filter Special Charaters Card function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Add Profile
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    TranscodingPage.Go to TCGW tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               TranscodingPage.Go to Profile section in TCGW tab
               Add profile function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Delete Profile
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    TranscodingPage.Go to TCGW tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               TranscodingPage.Go to Profile section in TCGW tab
               Delete function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Sort Profile 64
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
	TranscodingPage.Go to TCGW tab
    TranscodingPage.Go to Profile section in TCGW tab
    Sort Element  Name64

Sort Profile
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
	TranscodingPage.Go to TCGW tab
    TranscodingPage.Go to Profile section in TCGW tab
    Sort Element  Name

Filter Profile
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
	TranscodingPage.Go to TCGW tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
	\   run keyword and continue on failure     TranscodingPage.Go to Profile section in TCGW tab
               Filter Profile function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Filter Special Character Profile
    [Arguments]  ${Scenarios}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Filter Special Charaters Profile function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Add TCGW
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    TranscodingPage.Go to TCGW tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               TranscodingPage.Go to TCGW section in TCGW tab
               Add TCGW function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Sort TCGW 64
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
	TranscodingPage.Go to TCGW tab
    TranscodingPage.Go to TCGW section in TCGW tab
    Sort Element  Name64

Sort TCGW
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
	TranscodingPage.Go to TCGW tab
    TranscodingPage.Go to TCGW section in TCGW tab
    Sort Element  Name

Filter TCGW
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
	TranscodingPage.Go to TCGW tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
	\   run keyword and continue on failure     TranscodingPage.Go to TCGW section in TCGW tab
               Filter TCGW function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Filter Special Character TCGW
    [Arguments]  ${Scenarios}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Filter Special Charaters TCGW function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Delete TCGW
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    TranscodingPage.Go to TCGW tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               TranscodingPage.Go to TCGW section in TCGW tab
               Delete function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Add card function
    [Arguments]  ${Info}
    TranscodingPage.Add TCGWCard    ${Info[4]}     ${Info[5]}   ${Info[6]}    ${Info[7]}   ${Info[8]}
    reload page
    Verify Page Contains 2 Expected Elements     ${Info[4]}   ${Info[6]}

Filter Card function
    [Arguments]  ${Info}
    Click Element       ${Card_section}
    Sleep   1s
    Filter 4 value           ${Info[4]}  ${Info[6]}  ${Info[7]}   ${Info[8]}

Filter Special Charaters Card function
    [Arguments]  ${Info}
    Click Element       ${Card_section}
    Sleep   1s
    Filter special character 4 value           ${Info[4]}  ${Info[5]}  ${Info[6]}   ${Info[7]}  ${Info[8]}   ${Info[9]}

View Card function
    [Arguments]  ${Info}
     TranscodingPage.View TCGWCard    ${Info[4]}   ${Info[6]}    ${Info[7]}   ${Info[8]}  ${Info[5]}

Add profile function
    [Arguments]  ${Info}
    TranscodingPage.Add TCGWProfile    ${Info[4]}     ${Info[5]}   ${Info[6]}    ${Info[7]}   ${Info[8]}  ${Info[9]}   ${Info[10]}    ${Info[11]}   ${Info[12]}
    reload page
    Verify Page Contains 1 Expected Elements     ${Info[4]}

Filter Profile function
    [Arguments]  ${Info}
    Click Element       ${Profile_section}
    Sleep   1s
    Filter 2 value           ${Info[4]}  ${Info[5]}

Filter Special Charaters Profile function
    [Arguments]  ${Info}
    Click Element       ${Profile_section}
    Sleep   1s
    Filter special character 2 value           ${Info[4]}  ${Info[5]}  ${Info[6]}   ${Info[7]}

Add TCGW function
    [Arguments]  ${Info}
    TranscodingPage.Add TCGW    ${Info[4]}     ${Info[5]}   ${Info[6]}
    reload page
    Verify Page Contains 1 Expected Elements     ${Info[4]}

Filter TCGW function
    [Arguments]  ${Info}
    Click Element       ${TCGW_section}
    Sleep   1s
    Filter 2 value           ${Info[4]}  ${Info[5]}

Filter Special Charaters TCGW function
    [Arguments]  ${Info}
    Click Element       ${TCGW_section}
    Sleep   1s
    Filter special character 2 value           ${Info[4]}  ${Info[5]}  ${Info[6]}   ${Info[7]}

Delete function
    [Arguments]  ${Info}
    Delete with 1 info  ${Info[4]}
    Verify Page Not Contains 1 Expect Elements  ${Info[4]}
