*** Settings ***
Library  SeleniumLibrary
Resource  ../../Common.robot
Resource  ../../../Data/InputData.robot

*** Variables ***
############ General variables ##############
${CoreDomain_section}                  xpath=//*[@class='first-menu' and contains(text(),'Core Domain')]

*** Keywords ***
Go to SCSCF tab
    Click Element        ${SCSCF_tab}
    Sleep  1s

Go to CoreDomain section in SCSCF tab
    Click Element        ${CoreDomain_section}
    Sleep   3s

Add CoreDomain
    [Arguments]     ${Domain}
    Click Element       ${Add_Button}
    Sleep  3s
    Run Keyword If  '${Domain}' != '#BLANK'    input text       ${Domain_Field}              ${Domain}
    Sleep       1s

    Click Element       ${Confirm_Add_MatRul}
    Sleep       3s