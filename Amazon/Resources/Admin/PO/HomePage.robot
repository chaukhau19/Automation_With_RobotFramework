*** Settings ***
Resource  ../../Common.robot

*** Variables ***
${Search_Field}  xpath=//*[@id="twotabsearchtextbox"]
${Search_Button}  xpath=//*[@id="nav-search-submit-button"]


${Changed_Language_Page}  xpath=/html/body/div[1]/div[1]
${Deliver_Page}  xpath=//*[@id="a-popover-content-1"]

${Laguage_Button}  xpath=/html/body/div[1]/header/div/div[1]/div[3]/div/a[1]/span/span[2]/span[2]
${EN}  xpath=/html/body/div[1]/div[1]/div/form/div[1]/div[1]/div[2]/div/label/i
${ES}   xpath=/html/body/div[1]/div[1]/div/form/div[1]/div[1]/div[3]/div/label/i
${SaveChange_Button}  xpath=//*[@id="icp-save-button"]/span/input

${Inform_Test}   xpath=//*[@id="glow-toaster-body"]/span
${Dismiss}   xpath=//*[@id="nav-main"]/div[1]/div/div/div[3]/span[1]/span/input

${Deliver_Button}   xpath=//*[@id="nav-global-location-popover-link"]
${Deliver_Dropdown}   xpath=//*[@id="GLUXCountryListDropdown"]/span/span

${Deliver_Vietnam}  xpath=//*[@id="GLUXCountryList_239"]
${Deliver_UnitedKingdom}  xpath=//*[@id="GLUXCountryList_233"]
${Done_Button}  xpath=//*[@id="a-popover-1"]/div/div[2]/span/span/span/button

*** Keywords ***
Navigate to Home Page
    Go To  ${BASE_URL}
    Sleep  1s
    Set Window Size  2000  1150
    Maximize Browser Window
    Sleep  2s

########################## Search ###############################
Attempt to Search
    [Arguments]  ${Credentials}
    HomePage.Enter Search  ${Credentials}
    Click Button  ${Search_Button}
    Sleep    2s

Attempt to Search Invalid
    [Arguments]  ${Credentials}
    HomePage.Enter Search  ${Credentials}
    Click Button  ${Search_Button}
    Sleep    3s
    IF   '${Credentials[1]}' == '#BLANK'    Page Should Contain Element    id="pageContent"
    ...    ELSE IF '${Credentials[1]}' != '#BLANK'     Wait Until Page Contains Element    id=noResultsTitle  
        

Enter Search
    [Arguments]  ${Credentials}
    Run Keyword If  '${Credentials[1]}' != '#BLANK'   Input Text   ${Search_Field}   ${Credentials[1]}



Verify Error Messages
    [Arguments]  ${Credentials}
    Run Keyword If  '${Credentials[3]}' != '#BLANK'     Page Should Contain  ${Credentials[3]}


######################    Change Language     ########################

Attempt to Change Language
    [Arguments]  ${Credentials}
    ${element_exist}    Run Keyword And Return Status    Element Should Be Visible    ${Inform_Test}
    Run Keyword If    '${element_exist}' == 'True'    Click Element    ${Dismiss}
    Sleep    1s
    Click Element    ${Laguage_Button}
    Sleep    1s
    HomePage.Changed Language  ${Credentials}
    Sleep    1s

Changed Language
    [Arguments]  ${Credentials}
    IF  '${Credentials[1]}' == 'English - EN'   Run Keyword     Click Element    ${EN}
    ...  ELSE IF  '${Credentials[1]}' == 'español - ES'    Run Keyword     Click Element    ${ES}
    Wait Until Page Contains Element    ${Changed_Language_Page}
    Page Should Contain     ${Credentials[2]}
    Click Element     ${SaveChange_Button}
    Sleep   2s
    Page Should Contain Element     xpath=//*[@id="pageContent"]
    
######################   Deliver    ########################
Attempt to Deliver 
    [Arguments]  ${Credentials}
    Click Element    ${Deliver_Button}
    Sleep   2s
    Wait Until Page Contains Element  ${Deliver_Page} 
    Page Should Contain   Choose your location
    Click Element    ${Deliver_Dropdown}
    Sleep   3s
    IF  '${Credentials[1]}' == 'Vietnam'   Run Keyword     Click Element    ${Deliver_Vietnam}
    ...  ELSE IF  '${Credentials[1]}' == 'UnitedKingdom'    Run Keyword     Click Element    ${Deliver_UnitedKingdom}
    Sleep   3s  
    Click Element    ${Done_Button}
