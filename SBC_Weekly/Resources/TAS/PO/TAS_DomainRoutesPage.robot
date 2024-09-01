*** Settings ***
Library  SeleniumLibrary
Resource  ../../Common.robot
Resource  ../../../Data/InputData.robot

*** Variables ***
############ General variables ##############
${DomainRoute_tab}                  xpath=//*[@class='first-menu' and contains(text(),'Domain Route')]
${IP_Destination_Dropdown_list}     xpath=//label[contains(text(),'IP Destination')]//preceding::div[1]/input
${IP_Destination_1}                 xpath=//label[contains(text(),'IP Destination')]//preceding::span[contains(.,'auto_edit1')]
${IP_Destination_2}                 xpath=//label[contains(text(),'IP Destination')]//preceding::span[contains(.,'auto_edit2')]

*** Keywords ***
Go to TAS tab
    Click Element        ${TAS_tab}
    Sleep       1s

Go to Domain Route tab
    Click Element        ${DomainRoute_tab}
    Sleep       1s

Add DomainRoute
    [Arguments]  ${Domain}    ${IP_Destination}      ${Weight}
    Click Element       ${Add_Button}
    Sleep       3s
    Run Keyword If  '${Domain}' != '#BLANK'    Input Text   ${Domain_Field}   ${Domain}

    Run Keyword If  '${IP_Destination}' != '#BLANK'    Click Element   ${IP_Destination_Dropdown_list}
    Sleep       1s

    Run Keyword If      '${IP_Destination}' == 'auto_edit1'    Click Element   ${IP_Destination_1}
    ...     ELSE IF     '${IP_Destination}' == 'auto_edit2'    Click Element   ${IP_Destination_2}
    Sleep       1s
    Run Keyword If  '${Weight}' != '#BLANK'    Input Text     ${Weight_Field}    ${Weight}
    Click Element       ${Confirm_Add_Type_3}
    Sleep       3s

Edit DomainRoute
    [Arguments]    ${Domain}    ${IP_Destination}      ${Edit_Weight}
    Click Edit Element With 2 Info      ${Domain}    ${IP_Destination}
    Sleep       3s

    Run Keyword If  '${Edit_Weight}' != '#BLANK'    Input Text      ${Weight_Field}          ${Edit_Weight}
    Sleep       1s

    Click Element       ${Confirm_Add_Type_3}
    Sleep       3s
    Reload Page

View DomainRoute
    [Arguments]     ${Domain}    ${IP_Destination}      ${Weight}
    Click View Element With 2 Info      ${Domain}    ${IP_Destination}
    Sleep       3s

    Verify Page Contains 2 Expected Elements    Domain                                 ${Domain}
    Verify Page Contains 2 Expected Elements    IP Destination                         ${IP_Destination}
    Verify Page Contains 2 Expected Elements    Weight                                 ${Weight}

    Click Element       ${Cancel_View}
    Sleep       3s