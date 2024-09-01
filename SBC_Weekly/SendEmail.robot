*** Settings ***
Documentation    Tool to send notification email
Library  SSHLibrary
Library   OperatingSystem
Resource  Data/InputData.robot
Resource  Resources/Common.robot

*** Variables ***


*** Tasks ***
Send Auto Result Notification Email
    [Tags]    SendEmail      

    #Run Keyword And Continue On Failure  Send Notification Email for SBC
    Run Keyword If  '${REPORT_MODE}' == 'SBC_WEB'   Run Keyword And Continue On Failure  Send Notification Email for SBC
