*** Settings ***
Library  SeleniumLibrary
Resource  ../../Common.robot
Resource  ../../../Data/InputData.robot

*** Variables ***
############ General variables ##############
${ApplicationServer_tab}                xpath=//*[@class='first-menu' and text()='Application Server']
${IPName_Field}                         id=ipname
${Pull_Dropdown_list}                   xpath=//label[contains(text(),'Pull List')]//preceding::div[1]/input
${Pull_Pull0}                           xpath=//label[contains(text(),'Pull List')]//preceding::span[text()='pull0']
${Pull_Upd0}                            xpath=//label[contains(text(),'Pull List')]//preceding::span[text()='upd0']
${Pull_None}                            xpath=//label[contains(text(),'Pull List')]//preceding::span[text()='None']
${Updated_Dropdown_list}                xpath=//label[contains(text(),'Update List')]//preceding::div[1]/input
${Updated_Pull0}                        xpath=//label[contains(text(),'Update List')]//preceding::div[1]//span[text()='pull0']
${Updated_Upd0}                         xpath=//label[contains(text(),'Update List')]//preceding::div[1]//span[text()='upd0']
${Updated_None}                         xpath=//label[contains(text(),'Update List')]//preceding::div[1]//span[text()='None']
${Subscriber_Dropdown_list}             xpath=//label[contains(text(),'Subscriber List')]//preceding::div[1]/input
${Subscriber_Pull0}                     xpath=//label[contains(text(),'Subscriber List')]//preceding::div[1]//span[text()='pull0']
${Subscriber_Upd0}                      xpath=//label[contains(text(),'Subscriber List')]//preceding::div[1]//span[text()='upd0']

*** Keywords ***
Go to HSS tab
    Click Element        ${HSS_tab}
    Sleep       1s

Go to Application Server tab
    Click Element        ${ApplicationServer_tab}
    Sleep       1s

Add ApplicationServer
    [Arguments]  ${Name}    ${Domain}      ${PullList}     ${UpdatedList}  ${SubscriberList}
    Click Element       ${Add_Button}
    Sleep       3s
    Run Keyword If  '${Name}' != '#BLANK'      Input Text   ${Name_Field}   ${Name}
    Run Keyword If  '${Domain}' != '#BLANK'    Input Text   ${FQDN_Field}   ${Domain}
    Sleep       3s
    Run Keyword If  '${PullList}' != '#BLANK'    Click Element   ${Pull_Dropdown_list}
    Sleep       2s
    Run Keyword If      '${PullList}' == 'pull0'    Click Element   ${Pull_Pull0}
    ...     ELSE IF     '${PullList}' == 'upd0'     Click Element   ${Pull_Upd0}
    ...     ELSE IF     '${PullList}' == 'None'     Click Element   ${Pull_None}
    Sleep       2s

    Run Keyword If  '${UpdatedList}' != '#BLANK'    Click Element   ${Updated_Dropdown_list}
    Sleep       2s
    Run Keyword If      '${UpdatedList}' == 'pull0'    Click Element   ${Updated_Pull0}
    ...     ELSE IF     '${UpdatedList}' == 'upd0'     Click Element   ${Updated_Upd0}
    ...     ELSE IF     '${UpdatedList}' == 'None'     Click Element   ${Updated_None}
    Sleep       2s

    Run Keyword If  '${SubscriberList}' != '#BLANK'    Click Element   ${Subscriber_Dropdown_list}
    Sleep       2s
    Run Keyword If      '${SubscriberList}' == 'pull0'    Click Element   ${Subscriber_Pull0}
    ...     ELSE IF     '${SubscriberList}' == 'upd0'     Click Element   ${Subscriber_Upd0}
    Sleep       1s

    Click Element       ${Confirm_Add_Type_3}
    Sleep       3s

View ApplicationServer
    [Arguments]     ${Name}    ${Domain}      ${PullList}     ${UpdatedList}  ${SubscriberList}

    Click View Element With 2 Info     ${Name}    ${Domain}
    Sleep       3s

    Verify Page Contains 2 Expected Elements    Name                                ${Name}
    Verify Page Contains 2 Expected Elements    Domain                              ${Domain}
    Verify Page Contains 2 Expected Elements    Pull List                           ${PullList}
    Verify Page Contains 2 Expected Elements    Update List                         ${UpdatedList}
    Verify Page Contains 2 Expected Elements    Subscribe List                     ${SubscriberList}
    Click Element       ${Cancel_View}
    Sleep       3s