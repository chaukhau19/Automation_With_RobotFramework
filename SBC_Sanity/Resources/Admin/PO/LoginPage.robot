*** Settings ***
Library  SeleniumLibrary
Library         String
Resource  ../../../Data/InputData.robot
Resource  ../../../Resources/DataManager.robot

*** Variables ***
${SIGN_IN_USERNAME} =  name=username
${SIGN_IN_PASSWORD} =  id=password
${LOGIN_SUBMIT_BUTTON} =  name=btnLogin
${LOGOUT_BUTTON} =    xpath=//*[@id='container']/header/nav/div/span/a/i
${SUPERVISION} =     xpath=//*[@class='collapsible-header' and contains(text(),'Supervision')]
${STATICTIS} =    	  xpath=//a[contains(text(),'Statistic')]
${GRAPHICS} =         xpath=//a[contains(text(),'Graphics')]
${REPORT} =           xpath=//a[contains(text(),'Report')]
${LocalHost}         		  xpath=//span[@id="select-hosts"]//following::li/span[text()="LocalHost"]
${LocalHost_dropdown}         xpath=/html/body/div[1]/section/header/nav/div/span[1]/div

*** Keywords ***
Navigate To
    go to  ${BASE_URL}
    Sleep  1s



Enter Credentials
    [Arguments]  ${Credentials}
    Run Keyword If  '${Credentials[0]}' != '#BLANK'   Input Text   ${SIGN_IN_USERNAME}   ${Credentials[0]}
    Run Keyword If  '${Credentials[1]}' != '#BLANK'   Input Text   ${SIGN_IN_PASSWORD}   ${Credentials[1]}
    Sleep  1s

Enter Single Credentials
    [Arguments]  ${Credentials}
    Run Keyword If  '${Credentials[0][0]}' != '#BLANK'   Input Text   ${SIGN_IN_USERNAME}  ${Credentials[0][0]}
    Run Keyword If  '${Credentials[0][1]}' != '#BLANK'   Input Text   ${SIGN_IN_PASSWORD}  ${Credentials[0][1]}
    Sleep  1s

Click Submit
    Click Button  ${LOGIN_SUBMIT_BUTTON}

Verify Expected Message
    [Arguments]  ${ExpectedMessage}
    Title Should be  ${ExpectedMessage[2]}
    Page Should Contain  ${ExpectedMessage[3]}

Clear Input Fields
    Clear Element Text  ${SIGN_IN_USERNAME}
    Clear Element Text  ${SIGN_IN_PASSWORD}

Verify default statictis user
    [Arguments]  ${Credentials}
    Click Element        ${SUPERVISION}
    Sleep  0.5s
    Click Element        ${STATICTIS}
    Sleep  0.5s
    Click Element        ${GRAPHICS}
    Sleep  1s
    Page Should Contain Button  //button[contains(text(),'Proxy')]
    #
    Click Element        ${SUPERVISION}
    Sleep  0.5s
    Click Element        ${STATICTIS}
    Sleep  0.5s
    Click Element        ${REPORT}
    Sleep  1s
    Page Should Contain  Date
    # Change to remote host
    Click Element   ${LocalHost_dropdown}
    Sleep  2s
    Click Element   xpath=//span[contains(text(),'${Credentials[4]}')]
    Sleep  2s
    #
    Click Element        ${SUPERVISION}
    Sleep  0.5s
    Click Element        ${STATICTIS}
    Sleep  0.5s
    Click Element        ${GRAPHICS}
    Sleep  1s
    Page Should Contain Button  //button[contains(text(),'Proxy')]
    #
    Click Element        ${SUPERVISION}
    Sleep  0.5s
    Click Element        ${STATICTIS}
    Sleep  0.5s
    Click Element        ${REPORT}
    Sleep  1s
   Page Should Contain  Date
   # Back to localhost
    Click Element   xpath=//input[@value='${Credentials[4]}']
    Sleep  2s
    Click Element   ${LocalHost}
    Sleep  2s