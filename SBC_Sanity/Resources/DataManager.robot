*** Settings ***
Documentation  Use this layer to get data from external files
Library  SeleniumLibrary
Library  ../CustomLibs/Csv.py
Library  ../CustomLibs/Excel.py
Library  ../CustomLibs/ReadDataExcel.py
Library  ../CustomLibs/Priority.py
Resource  ../Data/InputData.robot


*** Keywords ***
Get CSV Data
    [Arguments]  ${FilePath}
    ${Data} =  read csv file  ${FilePath}
    RETURN  ${Data}

Get Excel Data
    [Arguments]  ${FilePath}    ${Worksheet}
    Log    ${FilePath}
    ${PRIORITY_COLUMN} =  get_priority_colums  ${FilePath}     ${Worksheet}
    ${Data} =  read excel file  ${FilePath}     ${Worksheet}     ${TC_PRIORITY}     ${PRIORITY_COLUMN}
    #pass execution if    '${Data}' == '[]'  Skip_non_critical_TC
    RETURN  ${Data}
