*** Settings ***
Library  SeleniumLibrary
Resource  ../../Common.robot
Resource  ../../../Data/InputData.robot

*** Variables ***
${Bypass_section}       xpath=//*[@class='collapsible-header active' and contains(text(),'Pcscf')]/following::div//a[@class='first-menu' and contains(text(),'Bypass')]
*** Keywords ***
Go to PCSCF tab
    Click Element        ${PCSCF_tab}
    Sleep       1s

Go to Bypass section in PCSCF tab
    Click Element        ${Bypass_section}
    Sleep   1s
    Wait Until Page Contains Element    ${Data_table}         20

Add PCSCF_Bypass
    [Arguments]     ${Name}  ${Domain1}  ${less_more_domain}  ${Domain2}

    Click Element       ${Add_Button}
    Sleep       2s

    Run Keyword If  '${Name}' != '#BLANK'                              Input Text                   ${Name_Field}              ${Name}
    Add_Edit PCSCF_Bypass   ${Domain1}  ${less_more_domain}  ${Domain2}

Edit PCSCF_Bypass
    [Arguments]     ${Name}  ${Domain1}  ${less_more_domain}  ${Domain2}

    Click Edit Element With 1 Info      ${Name}
    Sleep       1s
    Add_Edit PCSCF_Bypass   ${Domain1}  ${less_more_domain}  ${Domain2}

Add_Edit PCSCF_Bypass
    [Arguments]     ${Domain1}  ${less_more_domain}  ${Domain2}

    Run Keyword If  '${Domain1}' != '#BLANK'                              Input Text                   ${Multi_Domain_Field}              ${Domain1}

    Run Keyword If      '${less_more_domain}' == 'add'                        Click Element               ${Add_Domain}
    Run Keyword If      '${less_more_domain}' == 'remove'                     Click Element               ${Remove_Domain}
    Sleep       1s
    Run Keyword If  '${Domain2}' != '#BLANK'                              Input Text                   ${Multi_Domain_Field1}              ${Domain2}
    Sleep       1s
    Click Element   ${Confirm_Add_Type_Input_2}
    Sleep       3s


View PCSCF_Bypass
    [Arguments]     ${Name}

    Click View Element With 1 Info          ${Name}
    Sleep       3s

    Verify Page Contains 2 Expected Elements    Name                                                       ${Name}
