*** Settings ***
Library  SeleniumLibrary
Resource  ../../Common.robot
Resource  ../../../Data/InputData.robot

*** Variables ***
############ General variables ##############
${PBXAS_section}                  xpath=//*[@class='first-menu' and contains(text(),'PBX AS')]

*** Keywords ***
Go to SCSCF tab
    Click Element        ${SCSCF_tab}
    Sleep       1s

Go to PBXAS section in SCSCF tab
    Click Element        ${PBXAS_section}
    Sleep   3s

Add PBXAS
    [Arguments]     ${Domain}
    Click Element       ${Add_Button}
    Sleep       3s
    Run Keyword If  '${Domain}' != '#BLANK'    Input Text       ${Domain_Field}              ${Domain}
    Sleep       1s

    Click Element       ${Confirm_Add_Type_3}
    Sleep       3s