*** Settings ***
Library  SeleniumLibrary
Library  ../CustomLibs/Excel.py
Library  ../CustomLibs/ReadDataExcel.py
Library  ../CustomLibs/Priority.py
Resource  ../Data/InputData.robot
Resource  ./Common.robot


*** Keywords ***
Get Excel Data
    [Arguments]  ${FilePath}    ${Worksheet}
    Log    ${FilePath}
    ${PRIORITY_COLUMN} =  get_priority_colums  ${FilePath}     ${Worksheet}
    ${Data} =  read excel file  ${FilePath}     ${Worksheet}     ${TC_PRIORITY}     ${PRIORITY_COLUMN}
    [Return]  ${Data}
