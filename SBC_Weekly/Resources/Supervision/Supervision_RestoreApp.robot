*** Settings ***
Resource  ./PO/Supervision_RestorePage.robot
Resource  ../../Resources/Admin/LoginApp_SBC.robot
Resource  ../Common.robot

*** Keywords ***

Go to Restore section in Supervision Page
    Supervision_RestorePage.Navigate to Restore section in Supervision Page

Go to Backup section in Supervision Page
    Supervision_RestorePage.Navigate to Backup section in Supervision Page

Restore Valid Configuration file
    [Arguments]  ${AdministrationScenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    Go to Restore section in Supervision Page
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    
    FOR  ${Info}  IN  @{AdministrationScenarios}
        TRY        
              Restore Valid configuration File function  ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

Restore Invalid Configuration file
    [Arguments]  ${AdministrationScenarios}
    ${Login_single} =  DataManager.Get CSV Data  ${LOGINPAGE_FROM_CSV}
    #Navigate to Sign In Page
    LoginApp_SBC.Attempt to Single Login   ${Login_single}
    Go to Restore section in Supervision Page
    FOR  ${Info}  IN  @{AdministrationScenarios}
        TRY
               Restore Invalid configuration File function  ${Info}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END

#################################################################################################################################
#                                                           ---FUNCTION---                                                      #
#################################################################################################################################

# Backup Valid configuration File function
#     [Arguments]   ${Info}
#     Run Keyword And Continue On Failure     Supervision_RestorePage.Backup Valid configuration    ${Info[4]}  ${Info[5]}


Restore Valid configuration File function
    [Arguments]   ${Info}
    Run Keyword And Continue On Failure     Supervision_RestorePage.Restore Valid configuration    ${Info[4]}  ${Info[5]}
    Verify Page Contains 2 Expected Info     ${Info[6]}  ${Info[7]}

Restore Invalid configuration File function
    [Arguments]   ${Info}
    Run Keyword And Continue On Failure     Supervision_RestorePage.Restore Invalid configuration    ${Info[4]}  ${Info[5]}
    Verify Page Contains Error Message      ${Info[6]}
    Click Element       ${Close_Button}
    #Restore file removed to lab OK when Running Auto Done
    Change The Owner File To Omni          ${HOST_CIRPACK}
 