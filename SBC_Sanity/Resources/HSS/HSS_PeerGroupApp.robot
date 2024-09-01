*** Settings ***
Resource  ../../Resources/Admin/LoginApp_SBC.robot
Resource  ./PO/HSS_PeerGroupPage.robot
Resource  ../Admin/PO/UserManagerPage.robot
Resource  ../Common.robot

*** Keywords ***

Add
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    HSS_PeerGroupPage.Go to HSS tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to Peer Group tab
               Add Peer Group function        ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Detach
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    HSS_PeerGroupPage.Go to HSS tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to Peer Group tab
               Detach Peer Group function         ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Attach
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    HSS_PeerGroupPage.Go to HSS tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to Peer Group tab
               Attach Peer Group function         ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Delete
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    HSS_PeerGroupPage.Go to HSS tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to Peer Group tab
               Delete Peer Group function        ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Sort
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    HSS_PeerGroupPage.Go to HSS tab
    Go to Peer Group tab
    Sort Element     Name
    Sort Element     Peer Name
    Sort Element     Priority
    Verify Page Not Contains 1 Expected Elements  Internal Server Error

Filter
    [Arguments]  ${Scenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    LoginApp_SBC.Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    HSS_PeerGroupPage.Go to HSS tab
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to Peer Group tab
               Filter Peer Group function        ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Filter special characters
    [Arguments]  ${Scenarios}
    FOR    ${Info}  IN  @{Scenarios}
        TRY
               Go to Peer Group tab
               Filter special characters Peer Group function        ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Add Peer Group function
    [Arguments]  ${Info}
    HSS_PeerGroupPage.Add Peer Group   ${Info[4]}  ${Info[5]}  ${Info[6]}  ${Info[7]}  ${Info[8]}  ${Info[9]}  ${Info[10]}
    reload page
    Verify Page Contains 3 Expected Elements     ${Info[4]}  ${Info[6]}  ${Info[7]}
    Verify Page Contains 3 Expected Elements PeerGroup     ${Info[4]}  ${Info[9]}  ${Info[10]}

Detach Peer Group function
    [Arguments]  ${Info}
    HSS_PeerGroupPage.Detach Peer   ${Info[4]}  ${Info[5]}  ${Info[6]}
    reload page
    Verify Page Not Contains 3 Expected Elements     ${Info[4]}  ${Info[5]}  ${Info[6]}

Attach Peer Group function
    [Arguments]  ${Info}

    HSS_PeerGroupPage.Attach Peer Page   ${Info[4]}  ${Info[5]}  ${Info[6]}  ${Info[7]}  ${Info[8]}  ${Info[9]}  ${Info[10]}
    reload page
    Verify Page Contains 3 Expected Elements     ${Info[4]}  ${Info[6]}  ${Info[7]}
    Verify Page Contains 3 Expected Elements PeerGroup     ${Info[4]}  ${Info[9]}  ${Info[10]}

Filter Peer Group function
    [Arguments]  ${Info}
    Filter 3 value               ${Info[4]}  ${Info[5]}  ${Info[6]}

Filter special characters Peer Group function
    [Arguments]  ${Info}
    Filter special character 3 value  ${Info[4]}  ${Info[5]}  ${Info[6]}   ${Info[7]}  ${Info[8]}

Delete Peer Group function
    [Arguments]  ${Info}
    Delete with 1 info                      ${Info[4]}
    Verify Page Not Contains 1 Expected Elements     ${Info[4]}