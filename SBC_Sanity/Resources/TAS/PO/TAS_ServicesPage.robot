*** Settings ***
Library  SeleniumLibrary
Resource  ../../Common.robot
Resource  ../../../Data/InputData.robot

*** Variables ***
############ General variables ##############
${Services_tab}     xpath=//*[@class='first-menu' and contains(text(),'Services')]
${Directionless_Block_Button}     xpath=//td[contains(text(),'Directionless Services')]//following-sibling::td[1]/a[1][contains(text(),'Block')]
*** Keywords ***
Go to TAS tab
    Click Element        ${TAS_tab}
    Sleep  1s

Go to Services tab
    Click Element        ${Services_tab}
    Sleep  1s

Block directionless services
    [Arguments]     ${Directionless_Block}

    ${attribute}=  Get Element Attribute   ${Directionless_Block_Button}   @class
    Log To Console   ${attribute}