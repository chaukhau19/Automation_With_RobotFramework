*** Settings ***
Library  SeleniumLibrary
Resource  ../../Common.robot
Resource  ../../../Data/InputData.robot

*** Variables ***
############ General variables ##############
${DataReference_tab}              xpath=//*[@class='first-menu' and text()='Data Reference']
${IPName_Field}                   id=ipname
${DataReference_Dropdown_list}    xpath=//label[contains(text(),'Data Reference')]//preceding::div[1]/input
${DataReference_RD}               xpath=//label[contains(text(),'Data Reference')]//preceding::span[text()='rd']
${DataReference_ARD}              xpath=//label[contains(text(),'Data Reference')]//preceding::span[text()='ard']
${ServiceIndication_Field}        id=si
${MaxSize_Field}                  id=size
*** Keywords ***
Go to HSS tab
    Click Element        ${HSS_tab}
    Sleep  1s

Go to Data Reference tab
    Click Element        ${DataReference_tab}
    Sleep  1s

Add DataReference
    [Arguments]  ${Name}    ${DataReference}      ${ServiceIndication}     ${MaxSize}
    Click Element       ${Add_Button}
    Sleep       3s
    Run Keyword If  '${Name}' != '#BLANK'    input text   ${Name_Field}   ${Name}

    Run Keyword If  '${DataReference}' != '#BLANK'    Click Element   ${DataReference_Dropdown_list}
    Sleep  1s
    Run Keyword If      '${DataReference}' == '0'    Click Element   ${DataReference_RD}
    ...     ELSE IF     '${DataReference}' == '20'    Click Element   ${DataReference_ARD}
    Sleep       1s

    Run Keyword If  '${ServiceIndication}' != '#BLANK'    input text     ${ServiceIndication_Field}    ${ServiceIndication}


    Run Keyword If  '${MaxSize}' != '#BLANK'    input text     ${MaxSize_Field}    ${MaxSize}
    Sleep       1s

    Click Element       ${Confirm_Add_MatRul}
    Sleep       3s

View DataReference
    [Arguments]     ${Name}    ${DataReference}      ${ServiceIndication}     ${MaxSize}
    Sort Element     Name
    Sleep  2s
    Click View Element With 2 Info     ${Name}    ${DataReference}
    Sleep       3s

    Verify Page Contains 2 Expected Elements    Name                              ${Name}
    Verify Page Contains 2 Expected Elements    Data Reference                    ${DataReference}
    Verify Page Contains 2 Expected Elements    Service Indication                ${ServiceIndication}
    Verify Page Contains 2 Expected Elements    Max Size                          ${MaxSize}
    Click Element       ${Cancel_View}
    Sleep       3s