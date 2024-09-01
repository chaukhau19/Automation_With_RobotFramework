*** Settings ***
Resource  ./PO/ProxyPage.robot
Resource  ../../Resources/Admin/LoginApp_SBC.robot
Resource  ../Common.robot
*** Variables ***
#${LocalHost_dropdown}         xpath=//input[@value='LocalHost']
#${LocalHost}         		  xpath=//span[contains(text(),'LocalHost')]
${LocalHost}         		  xpath=//span[@id="select-hosts"]//following::li/span[text()="LocalHost"]
# ${LocalHost_dropdown}         xpath=/html/body/div[1]/section/header/nav/div/span[1]/div
# ${LocalHost_dropdown}      xpath=/html/body/div[1]/section/header/nav/div/span[1]/div/input
#${LocalHost_dropdown}         xpath=//span[@id="select-hosts"]//following::span[@class="caret"]
*** Keywords ***

Go to Proxy Page
    Navigate to Proxy Page


Get Getenforce Display Element
    Run Keyword If    '${lab_value}' == 'SBC_Normal'     Display Element Normal
    ...    ELSE IF    '${lab_value}' == 'SBC_Secure'     Display Element Secure
   

Proxy
    [Arguments]  ${LoginScenarios}
    Common.Open SSH Connection To Remote Server  ${HOST_SBC}   ${USER_SIPP}    ${PASS_SIPP}
    FOR  ${Info}  IN  @{LoginScenarios}
        TRY
            IF    '${Info[5]}' != ''
                  ${LOG_SUFFIX_PID}=   Tail CWA Log In Remote Machine
            END
                        #Navigate to Sign In Page
                        Attempt to Login  ${Info}
                        Go to Proxy Page
                        Get Getenforce Display Element

           IF    '${Info[5]}' != ''    Stop And Validate CWA Log In Remote Machine    ${LOG_SUFFIX_PID}        ${Info[5]}

        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END



TR_19262 function
    [Arguments]  ${LoginScenarios}
    FOR  ${Info}  IN  @{LoginScenarios}
        TRY
                #Navigate to Sign In Page
                Attempt to Login  ${Info}
#changed host
               # Go to Proxy Page
               # Get Getenforce Display Element
                Change to a RemoteHost  ${Info[6]}
                # Go to Proxy Page
                # Verify Element SBC
                # Reset Proxy 
                # Display Element SBC
#changed host               
                Change to LocalHost  ${Info[6]}
                # Go to Proxy Page
                # Verify Element SBC
                # Reset Proxy 
                # Display Element SBC
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


TR_22983
    [Arguments]  ${LoginScenarios}
    FOR  ${Info}  IN  @{LoginScenarios}
        TRY
                #Navigate to Sign In Page
                Attempt to Login  ${Info}
                Go to Proxy Page
                Reset Proxy 
                Using reload button in Configuration file page
                Go to Proxy Page
                Get Getenforce Display Element
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END




##########################################################

Display Element Normal
    [Arguments]
    Reset Proxy 
    Run Keyword And Continue On Failure  Display BGCF to the List
    Run Keyword And Continue On Failure  Display IBCF to the List
    Run Keyword And Continue On Failure  Display Media
    Run Keyword And Continue On Failure  Display PCSCF to the List
    Run Keyword And Continue On Failure  Display Process  activehss
    Run Keyword And Continue On Failure  Display Process  annsrv
    Run Keyword And Continue On Failure  Display Process  ecscf
    Run Keyword And Continue On Failure  Display Process  icscf
    Run Keyword And Continue On Failure  Display Process  nodir_services
    Run Keyword And Continue On Failure  Display Process  orig_services
    Run Keyword And Continue On Failure  Display Process  term_services
    Run Keyword And Continue On Failure  Display Process  scscf
    Run Keyword And Continue On Failure  Display Process  sr

    Run Keyword And Continue On Failure  Verify Element SBC



Display Element Secure
    [Arguments]
    Reset Proxy 
    Run Keyword And Continue On Failure  Display BGCF_STANDALONE to the List
    Run Keyword And Continue On Failure  Display IBCF_STANDALONE to the List
    Run Keyword And Continue On Failure  Display PCSCF_STANDALONE to the List
    Run Keyword And Continue On Failure  Display Media
    Run Keyword And Continue On Failure  Display Process  ecscf_standalone

    Run Keyword And Continue On Failure  Verify Element SBC




Display Element SBC
    [Arguments]
    Run Keyword And Continue On Failure    Reset Proxy 
    # Run Keyword And Continue On Failure    Display Process  bgcf_active
    # Run Keyword And Continue On Failure    Display Process  ibcf_active
    # Run Keyword And Continue On Failure    Display Process  pcscf_active
    # Run Keyword And Continue On Failure    Display Media

    # Run Keyword And Continue On Failure    Verify Element SBC


Change to a RemoteHost
    [Arguments]   ${Hosts}
    Click Element       ${LocalHost_dropdown}
    Sleep       2s
    Click Element   xpath=//span[contains(text(),'${Hosts}')]
    Sleep       2s

Change to LocalHost
    [Arguments]  ${Hosts}
   # Click Element   xpath=//input[@value='${Hosts}']
    Click Element       ${LocalHost_dropdown}
    Sleep       1.5s
    Click Element   ${LocalHost}
    Sleep       1.5s

Using reload button in Configuration file page
    [Arguments]
    Click Element  ${Supervision_tab}
    Sleep       1s
    Click Element  ${Configuration_file_tab}
    Sleep       1s
    Click Element  ${Reload_button}
    Sleep       1s
    Page Should Contain         Proxy