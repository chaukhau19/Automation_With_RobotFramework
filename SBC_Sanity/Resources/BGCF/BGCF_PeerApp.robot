*** Settings ***
Library     SeleniumLibrary
Resource  ../../Resources/Admin/LoginApp_SBC.robot
Resource  ./PO/BGCF_PeerPage.robot
Resource  ../Admin/PO/UserManagerPage.robot
Resource  ../../Resources/Common.robot

*** Keywords ***

Add
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    BGCF_PeerPage.Go to Peer in BGCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to Peer section in BGCF PEER tab
               Add Peer function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Add with multi domains
    [Arguments]  ${Scenarios}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to Peer section in BGCF PEER tab
               Add Peer with multi domains      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Add63
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    BGCF_PeerPage.Go to Peer in BGCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to Peer section in BGCF PEER tab
               Add Peer function 63     ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Add65
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    BGCF_PeerPage.Go to Peer in BGCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to Peer section in BGCF PEER tab
               Add Peer function 65     ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END



Edit
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    BGCF_PeerPage.Go to Peer in BGCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to Peer section in BGCF PEER tab
               Edit Peer function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Edit63
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    BGCF_PeerPage.Go to Peer in BGCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to Peer section in BGCF PEER tab
               Edit Peer function 63     ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Edit65
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    BGCF_PeerPage.Go to Peer in BGCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to Peer section in BGCF PEER tab
               Edit Peer function 65     ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Delete
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    BGCF_PeerPage.Go to Peer in BGCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to Peer section in BGCF PEER tab
               Delete Peer function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Delete multi domains
    [Arguments]  ${Scenarios}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to Peer section in BGCF PEER tab
               Delete Peer with multi domains     ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Add Invalid Peer
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    BGCF_PeerPage.Go to Peer in BGCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to Peer section in BGCF PEER tab
               Verify error message peer invalid case  ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Edit Invalid Peer
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    BGCF_PeerPage.Go to Peer in BGCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to Peer section in BGCF PEER tab
               Verify error message edit peer invalid case  ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


View
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    BGCF_PeerPage.Go to Peer in BGCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to Peer section in BGCF PEER tab
               View Peer function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Sort 64
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    Go to Peer in BGCF tab
    Go to Peer section in BGCF PEER tab
    Sort Element     Name64
    Sort Element     Domain64
    Page should not contain  Internal Server Error

Sort
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    Go to Peer in BGCF tab
    Go to Peer section in BGCF PEER tab
    Sort Element     Name
    Sort Element     Domain
    Page should not contain  Internal Server Error
Filter
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    BGCF_PeerPage.Go to Peer in BGCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to Peer section in BGCF PEER tab
               Filter Peer function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Add Peer function
    [Arguments]  ${Info}
    BGCF_PeerPage.Add Peer  ${Info[4]}  ${Info[5]}  ${Info[6]}    ${Info[7]}    ${Info[8]}  ${Info[9]}   ${Info[10]}
    ...   ${Info[11]}  ${Info[12]}    ${Info[13]}    ${Info[14]}   ${Info[15]}  ${Info[16]}    ${Info[17]}   ${Info[18]}
    ...   ${Info[19]}  ${Info[20]}    ${Info[21]}    ${Info[22]}   ${Info[48]}  ${Info[49]}
    reload page
    Verify Page Contains 2 Expected Elements     ${Info[4]}  ${Info[5]}

Add Peer with multi domains
    [Arguments]  ${Info}
    BGCF_PeerPage.Add Peer multi domains  ${Info[4]}  ${Info[5]}  ${Info[6]}    ${Info[7]}
    reload page
    Verify Page Contains 2 Expected Elements with 3 domains     ${Info[4]}  ${Info[5]}   ${Info[6]}    ${Info[7]}

Add Peer function 63
    [Arguments]  ${Info}
    BGCF_PeerPage.Add Peer 63  ${Info[4]}  ${Info[5]}  ${Info[6]}    ${Info[7]}    ${Info[8]}  ${Info[9]}   ${Info[10]}
    ...   ${Info[11]}  ${Info[12]}    ${Info[13]}    ${Info[14]}   ${Info[15]}  ${Info[16]}    ${Info[17]}   ${Info[18]}
    ...   ${Info[19]}  ${Info[20]}    ${Info[21]}    ${Info[22]}  ${Info[46]}
    reload page
    Verify Page Contains 2 Expected Elements     ${Info[4]}  ${Info[5]}

Add Peer function 65
    [Arguments]  ${Info}
    BGCF_PeerPage.Add Peer 65  ${Info[4]}  ${Info[5]}  ${Info[6]}    ${Info[7]}    ${Info[8]}  ${Info[9]}   ${Info[10]}
    ...   ${Info[11]}  ${Info[12]}    ${Info[13]}    ${Info[14]}   ${Info[15]}  ${Info[16]}    ${Info[17]}   ${Info[18]}
    ...   ${Info[19]}  ${Info[20]}    ${Info[21]}    ${Info[22]}  ${Info[46]}  ${Info[48]}    ${Info[49]}  ${Info[52]}
    ...   ${Info[53]}
    reload page
    Verify Page Contains 2 Expected Elements     ${Info[4]}  ${Info[5]}

Edit Peer function
    [Arguments]  ${Info}
    BGCF_PeerPage.Edit Peer  ${Info[4]}  ${Info[5]}   ${Info[23]}    ${Info[24]}    ${Info[25]}   ${Info[26]}    ${Info[27]}
    ...    ${Info[28]}  ${Info[29]}  ${Info[30]}   ${Info[31]}  ${Info[32]}    ${Info[33]}    ${Info[34]}   ${Info[35]}
    ...  ${Info[36]}    ${Info[37]}   ${Info[38]}   ${Info[39]}  ${Info[40]}   ${Info[41]}   ${Info[42]}  ${Info[43]}  ${Info[44]}  ${Info[45]}  ${Info[50]}  ${Info[51]}
    reload page
    Verify Page Contains 2 Expected Elements with 3 domains     ${Info[4]}  ${Info[23]}  ${Info[24]}  ${Info[25]}

Edit Peer function 63
    [Arguments]  ${Info}
    BGCF_PeerPage.Edit Peer 63  ${Info[4]}  ${Info[5]}   ${Info[23]}    ${Info[24]}    ${Info[25]}   ${Info[26]}    ${Info[27]}
    ...    ${Info[28]}  ${Info[29]}  ${Info[30]}   ${Info[31]}  ${Info[32]}    ${Info[33]}    ${Info[34]}   ${Info[35]}
    ...  ${Info[36]}    ${Info[37]}   ${Info[38]}   ${Info[39]}  ${Info[40]}   ${Info[41]}   ${Info[42]}  ${Info[43]}  ${Info[44]}  ${Info[45]}  ${Info[47]}
    reload page
    Verify Page Contains 2 Expected Elements with 3 domains     ${Info[4]}  ${Info[23]}  ${Info[24]}  ${Info[25]}

Edit Peer function 65
    [Arguments]  ${Info}
    BGCF_PeerPage.Edit Peer 65  ${Info[4]}  ${Info[5]}   ${Info[23]}    ${Info[24]}    ${Info[25]}   ${Info[26]}    ${Info[27]}
    ...    ${Info[28]}  ${Info[29]}  ${Info[30]}   ${Info[31]}  ${Info[32]}    ${Info[33]}    ${Info[34]}   ${Info[35]}
    ...  ${Info[36]}    ${Info[37]}   ${Info[38]}   ${Info[39]}  ${Info[40]}   ${Info[41]}   ${Info[42]}  ${Info[43]}  ${Info[44]}  ${Info[45]}  ${Info[47]}
    ...  ${Info[50]}    ${Info[51]}   ${Info[54]}   ${Info[55]}
    reload page
    Verify Page Contains 2 Expected Elements with 3 domains     ${Info[4]}  ${Info[23]}  ${Info[24]}  ${Info[25]}

View Peer function
    [Arguments]    ${Info}
    BGCF_PeerPage.View Peer     ${Info[4]}  ${Info[5]}  ${Info[12]}  ${Info[13]}    ${Info[14]}  ${Info[15]}   ${Info[17]}  ${Info[16]}  ${Info[18]}
    Back from View Page

Filter Peer function
    [Arguments]  ${Info}
    Filter 2 value            ${Info[4]}  ${Info[5]}

Delete Peer function
    [Arguments]  ${Info}
    Delete with 1 info      ${Info[4]}
    reload page
    Verify Page Not Contains 2 Expect Elements  ${Info[4]}  ${Info[5]}

Delete Peer with multi domains
    [Arguments]  ${Info}
    Delete with 1 info      ${Info[4]}
    reload page
    Verify Page Not Contains 2 Expect Elements  ${Info[4]}  ${Info[5]}

Verify error message peer invalid case
    [Arguments]  ${Info}
    BGCF_PeerPage.Add Invalid Peer  ${Info[4]}  ${Info[5]}   ${Info[6]}  ${Info[8]}   ${Info[9]}
    Verify Page Contains Error Message        ${Info[7]}

Verify error message edit peer invalid case
    [Arguments]  ${Info}
    BGCF_PeerPage.Edit Invalid Peer  ${Info[4]}  ${Info[5]}   ${Info[6]}  ${Info[8]}   ${Info[9]}
    Verify Page Contains Error Message        ${Info[7]}
############################  Peer Configuration  ########################

Peer Configuration
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    Go to Peer in BGCF tab
    Go to Peer configuration section in BGCF tab
    BGCF_PeerPage.Check Trusted

############################  Trusted  ###################################

Add Trusted
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    BGCF_PeerPage.Go to Peer in BGCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to Trusted section in BGCF tab
               Add Trusted Function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Filter Trusted
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    BGCF_PeerPage.Go to Peer in BGCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to Trusted section in BGCF tab
               Filter Trusted Function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Add Trusted Invalid Cases
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    BGCF_PeerPage.Go to Peer in BGCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to Trusted section in BGCF tab
               Verify error message trusted invalid cases     ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Delete Trusted
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    BGCF_PeerPage.Go to Peer in BGCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to Trusted section in BGCF tab
               Delete Trusted Function      ${Info}
############################  Not Trusted  ###############################
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Add Not Trusted
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    BGCF_PeerPage.Go to Peer in BGCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to Not Trusted section in BGCF tab
               Add Trusted Function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END



Filter Not Trusted
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    BGCF_PeerPage.Go to Peer in BGCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to Not Trusted section in BGCF tab
               Filter Trusted Function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Add Not Trusted Invalid Cases
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    BGCF_PeerPage.Go to Peer in BGCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to Not Trusted section in BGCF tab
               Verify error message trusted invalid cases     ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Delete Not Trusted
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    BGCF_PeerPage.Go to Peer in BGCF tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to Not Trusted section in BGCF tab
               Delete Trusted Function      ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Add Trusted Function
    [Arguments]  ${Info}
    BGCF_PeerPage.Add Trusted Peer              ${Info[4]}  ${Info[5]}
    reload page
    Verify Page Contains 2 Expected Elements    ${Info[4]}  ${Info[5]}

Delete Trusted Function
    [Arguments]  ${Info}
    Delete with 1 info      ${Info[4]}
    reload page
    Verify Page Not Contains 2 Expect Elements  ${Info[4]}  ${Info[5]}

Filter Trusted Function
    [Arguments]  ${Info}
    Common.Filter 2 value  ${Info[4]}  ${Info[5]}
    Common.Filter special character 1 value  ${Info[6]}  ${Info[7]}  ${Info[8]}

Verify error message trusted invalid cases
    [Arguments]  ${Info}
    BGCF_PeerPage.Add Trusted Peer      ${Info[4]}  ${Info[5]}
    Verify Page Contains Error Message      ${Info[6]}

