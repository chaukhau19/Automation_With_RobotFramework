*** Settings ***
Library  SeleniumLibrary
Resource  ../../Resources/Admin/LoginApp_SBC.robot
Resource  ./PO/IBCF_SCSCFPage.robot
Resource  ../Admin/PO/UserManagerPage.robot
Resource  ../Common.robot

*** Keywords ***

Add Capability
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    #IBCF_SCSCFPage.Go to SCSCF section in IBCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Add Capability function     ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Add Invalid Capability
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
   # IBCF_PeerPage.Go to Peer section in IBCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Verify errors in Capability function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Edit Capability
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
   # IBCF_PeerPage.Go to Peer section in IBCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Edit Capability function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Edit Invalid Capability
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
   # IBCF_SCSCFPage.Go to Peer section in IBCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Verify errors in edit Capability function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


View Capability
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_SCSCFPage.Go to SCSCF section in IBCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               View Capability function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Sort Capability
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_SCSCFPage.Go to SCSCF section in IBCF tab
    Click Element       ${Capability}
    Sleep   1s
    Sort Element  Name
    Page should not contain  Internal Server Error

Filter Capability
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_SCSCFPage.Go to SCSCF section in IBCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Filter Capability function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Filter Special Character Capability
    [Arguments]  ${Scenarios}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Filter Special Charaters Capability function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Delete Capability
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_SCSCFPage.Go to SCSCF section in IBCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Delete Capability function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Add Scscf
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    #IBCF_SCSCFPage.Go to SCSCF section in IBCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Add Scscf function     ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Add Invalid Scscf
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
   # IBCF_PeerPage.Go to Peer section in IBCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Verify errors in Scscf function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Edit Scscf
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
   # IBCF_PeerPage.Go to Peer section in IBCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Edit Scscf function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Edit Invalid Scscf
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
   # IBCF_SCSCFPage.Go to Peer section in IBCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Verify errors in edit Scscf function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Sort Scscf
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_SCSCFPage.Go to SCSCF section in IBCF tab
    Click Element       ${Capability}
    Sleep   1s
    Sort Element  Name
    Page should not contain  Internal Server Error

View Scscf
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_SCSCFPage.Go to SCSCF section in IBCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               View Scscf function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Filter Scscf
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_SCSCFPage.Go to SCSCF section in IBCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Filter Scscf function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Filter Special Character Scscf
    [Arguments]  ${Scenarios}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Filter Special Charaters Scscf function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Delete Scscf
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    IBCF_SCSCFPage.Go to SCSCF section in IBCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Delete Scscf function      ${Info}

############################## Capability #################################
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Add Capability function
    [Arguments]  ${Info}
    IBCF_SCSCFPage.Add Valid Capability  ${Info[4]}  ${Info[5]}
    reload page
    Verify Page Contains 2 Expected Elements     ${Info[4]}  ${Info[5]}

Verify errors in Capability function
    [Arguments]  ${Info}
    IBCF_SCSCFPage.Add Valid Capability  ${Info[4]}  ${Info[5]}
    reload page
    Verify Page Contains Error Message  ${Info[6]}

Edit Capability function
    [Arguments]  ${Info}
    IBCF_SCSCFPage.Edit Valid Capability     ${Info[4]}  ${Info[5]}
    reload page
    Verify Page Contains 1 Expected Elements     ${Info[5]}

Verify errors in edit Capability function
    [Arguments]  ${Info}
    IBCF_SCSCFPage.Edit Valid Capability  ${Info[4]}  ${Info[5]}
    Verify Page Contains Error Message  ${Info[6]}

View Capability function
    [Arguments]  ${Info}
    IBCF_SCSCFPage.View Capability  ${Info[5]}  ${Info[6]}
    Back from View Page

Filter Capability function
    [Arguments]  ${Info}
    Click Element       ${Capability}
    Sleep   1s
    Filter 2 value           ${Info[5]}  ${Info[6]}

Filter Special Charaters Capability function
    [Arguments]  ${Info}
    Click Element       ${Capability}
    Sleep   1s
    Filter special character 2 value           ${Info[4]}  ${Info[5]}  ${Info[6]}   ${Info[7]}

Delete Capability function
    [Arguments]  ${Info}
    Click Element       ${Capability}
    Sleep   1s
    Delete with 1 info  ${Info[4]}
    Verify Page Not Contains 2 Expect Elements  ${Info[4]}  ${Info[5]}

############################## Scscf #################################
Add Scscf function
    [Arguments]  ${Info}
    IBCF_SCSCFPage.Add Valid Scscf  ${Info[4]}  ${Info[5]}   ${Info[6]}    ${Info[7]}    ${Info[8]}
    reload page
    Verify Page Contains 4 Expected Elements     ${Info[4]}  ${Info[5]}   ${Info[6]}    ${Info[7]}

Verify errors in Scscf function
    [Arguments]  ${Info}
    IBCF_SCSCFPage.Add Valid Scscf  ${Info[4]}  ${Info[5]}   ${Info[6]}    ${Info[7]}    ${Info[8]}
    reload page
    Verify Page Contains Error Message  ${Info[9]}

Edit Scscf function
    [Arguments]  ${Info}
    IBCF_SCSCFPage.Edit Valid Scscf    ${Info[4]}  ${Info[5]}   ${Info[6]}    ${Info[7]}    ${Info[8]}
    reload page
    Verify Page Contains 2 Expected Elements     ${Info[6]}  ${Info[7]}

Verify errors in edit Scscf function
    [Arguments]  ${Info}
    IBCF_SCSCFPage.Edit Valid Scscf  ${Info[4]}  ${Info[5]}   ${Info[6]}    ${Info[7]}    ${Info[8]}
    Verify Page Contains Error Message  ${Info[9]}

View Scscf function
    [Arguments]  ${Info}
    IBCF_SCSCFPage.View Scscf  ${Info[6]}  ${Info[7]}   ${Info[9]}
    Back from View Page

Filter Scscf function
    [Arguments]  ${Info}
    Click Element       ${Scscf}
    Sleep   1s
    Filter 4 value           ${Info[4]}   ${Info[5]}    ${Info[6]}    ${Info[7]}

Filter Special Charaters Scscf function
    [Arguments]  ${Info}
    Click Element       ${Scscf}
    Sleep   1s
    Filter special character 4 value           ${Info[4]}  ${Info[5]}  ${Info[6]}   ${Info[7]}   ${Info[8]}   ${Info[9]}

Delete Scscf function
    [Arguments]  ${Info}
    Click Element       ${Scscf}
    Sleep   1s
    Delete with 1 info  ${Info[4]}
    Verify Page Not Contains 2 Expect Elements  ${Info[4]}  ${Info[5]}