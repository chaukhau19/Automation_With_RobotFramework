*** Settings ***
Resource  ./PO/ProxyPage.robot
Resource  ../../Resources/Admin/LoginApp_SBC.robot
Resource  ../Common.robot
*** Variables ***
${LocalHost_dropdown}         xpath=//input[@value='LocalHost']
${LocalHost}         		  xpath=//span[contains(text(),'LocalHost')]

*** Keywords ***
Proxy
    [Arguments]  ${LoginScenarios}
    FOR  ${Info}  IN  @{LoginScenarios}
        TRY
           Navigate to Sign In Page
           Attempt to Login  ${Info}
           Go to Proxy Page
           Display Element
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Proxy 64
    [Arguments]  ${LoginScenarios}
    FOR  ${Info}  IN  @{LoginScenarios}
        TRY
           Navigate to Sign In Page
           Attempt to Login  ${Info}
           Go to Proxy Page
           Display Element 64
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


TR_19262 function
    [Arguments]  ${LoginScenarios}
    FOR  ${Info}  IN  @{LoginScenarios}
        TRY
# login
           Navigate to Sign In Page
           Attempt to Login  ${Info}
# display proxy
           Go to Proxy Page
           Display Element
           Change to a Host  ${Info[6]}
           Go to Proxy Page
    #\  run keyword and continue on failure  Click Element  ${Proxy_section}
           Display Element SBC
# verify proxy setting
           Change to LocalHost  ${Info[6]}
           Go to Proxy Page
    #\  run keyword and continue on failure  Click Element  ${Proxy_section}
           Verify element
           Change to a Host  ${Info[6]}
           Go to Proxy Page
    #\  run keyword and continue on failure  Click Element  ${Proxy_section}
           Verify element SBC
# Back to Localhost
           Change to LocalHost  ${Info[6]}
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


TR_22983
    [Arguments]  ${LoginScenarios}
    FOR  ${Info}  IN  @{LoginScenarios}
        TRY
           Navigate to Sign In Page
           Attempt to Login  ${Info}
           Go to Proxy Page
           Reset Proxy Page
           Using reload button in Configuration file page
           Go to Proxy Page
           Display Element
 
        EXCEPT    AS    ${error}
            Run Keyword And Continue On Failure    Fail   ${error}    TCS Failed
        END
    END


Go to Proxy Page
    Navigate to Proxy Page

Display Element
    [Arguments]
    Reset Proxy Page
    Display BGCF to the List
    Display IBCF to the List
    Display Media
    Display PCSCF to the List
    Display Process  activehss
    #Display Process  dbcache
    Display Process  ecscf
    Display Process  icscf
    Display Process  nodir_services
    Display Process  orig_services
    Display Process  term_services
    Display Process  scscf
    Display Process  sr

    Verify element

Display Element SBC
    [Arguments]
    Reset Proxy Page
    Display Process  bgcf_active
    Display Process  ibcf_active
    Display Media
    Display Process  pcscf_active

    Verify element SBC

Display Element 64
    [Arguments]
    Reset Proxy Page
    Display BGCF to the List
    Display IBCF to the List
    Display Media
    Display PCSCF to the List 64
    #Display Process  activehss
    #Display Process  dbcache
    #Display Process  ecscf
    #Display Process  icscf
    #Display Process  nodir_services
    #Display Process  orig_services
    #Display Process  term_services
    #Display Process  scscf
    #Display Process  sr

    Verify element

Change to a Host
    [Arguments]  ${Hosts}
    Click Element   ${LocalHost_dropdown}
    Sleep  2s
    Click Element   xpath=//span[contains(text(),'${Hosts}')]
    Sleep  2s

Change to LocalHost
    [Arguments]  ${Hosts}
    Click Element   xpath=//input[@value='${Hosts}']
    Sleep  2s
    Click Element   ${LocalHost}
    Sleep  2s

Using reload button in Configuration file page
    [Arguments]
    Click Element  ${Supervision_tab}
    Sleep  0.5
    Click Element  ${Configuration_file_tab}
    Sleep  1
    Click Element  ${Reload_button}
    Sleep  1
    page should contain         Proxy