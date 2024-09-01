*** Settings ***
Documentation    Tool to send notification email
Library  SSHLibrary
Library   OperatingSystem
Resource  Data/InputData.robot
Resource  Resources/Common.robot

*** Variables ***


*** Tasks ***
Send Auto Result Notification Email
    [Tags]    SendEmail  sbc77   ims47

    #run keyword and continue on failure  Send Notification Email for SBC
    Run Keyword If  '${REPORT_MODE}' == 'SBC_WEB'   run keyword and continue on failure  Send Notification Email for SBC
