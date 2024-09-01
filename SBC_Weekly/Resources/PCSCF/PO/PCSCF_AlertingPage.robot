*** Settings ***
Library  SeleniumLibrary
Resource  ../../Common.robot

*** Variables ***
${Alerting_section}      xpath=//*[@class='collapsible-header active' and contains(text(),'Pcscf')]/following::div//a[@class='first-menu' and contains(text(),'Alerting')]
${Supervision}        xpath=
*** Keywords ***
Go to PCSCF tab
    Click Element        ${PCSCF_tab}
    Sleep       1s

Go to Alerting section in PCSCF tab

    Scroll Element Into View    ${Supervision}
    Sleep       1s
    Click Element        ${Alerting_section}
    Sleep       4s

    Wait Until Page Contains Element    ${Data_table}         20

Add Alerting
    [Arguments]     ${Object}  ${TPIP_Name}  ${Event}	${Min_Threshold}  ${Max_Threshold}  ${Step_Value}    ${Step_Number}

    Click Element       ${Add_Button}
    Sleep       1s

    Run Keyword If  '${Object}' == 'GLOBAL'                                     Click Element          ${Object_Global_Button}
    ...   ELSE IF   '${Object}' == 'TPIP'                                       Click Element          ${Object_TPIP_Button}
    Sleep   1s

    Run Keyword If  '${Object}' == 'TPIP' and '${TPIP_Name}' != '#BLANK'        Click Element           ${TPIP_Dropdown}
    Sleep       1s
    Run Keyword If  '${Object}' == 'TPIP' and '${TPIP_Name}' == 'home'              Click Element           ${TPIP_1}
    Run Keyword If  '${Object}' == 'TPIP' and '${TPIP_Name}' == 'extern'            Click Element           ${TPIP_2}
    Sleep       1s

    Run Keyword If      '${Event}' != '#BLANK'                              Click Element           ${Event_Dropdown}
    Sleep       1s

    Run Keyword If      '${Event}' == 'NUMBER_REGISTRATION_SESSION'             Click Element           ${NUMBER_REGISTRATION_SESSION}
    ...     ELSE IF     '${Event}' == 'PERCENT_FAILED_REGISTRATION_SESSION'     Click Element           ${PERCENT_FAILED_REGISTRATION_SESSION}
    ...     ELSE IF     '${Event}' == 'NUMBER_SIP_DIALOG'                       Click Element           ${NUMBER_SIP_DIALOG}
    ...     ELSE IF     '${Event}' == 'PERCENT_FAILED_SIP_DIALOG'               Click Element           ${PERCENT_FAILED_SIP_DIALOG}
    ...     ELSE IF     '${Event}' == 'AVERAGE_PERCENT_PACKET_LOST'             Click Element           ${AVERAGE_PERCENT_PACKET_LOST}
    ...     ELSE IF     '${Event}' == 'AVERAGE_JITTER'                          Click Element           ${AVERAGE_JITTER}
    Sleep       1s

    Run Keyword If  '${Min_Threshold}' != '#BLANK'                          Input Text              ${Min_Threshold_Field}             ${Min_Threshold}
    Run Keyword If  '${Max_Threshold}' != '#BLANK'                          Input Text              ${Max_Threshold_Field}             ${Max_Threshold}
    Run Keyword If  '${Step_Value}' != '#BLANK'                             Input Text              ${Step_Value_Field}                ${Step_Value}
    Run Keyword If  '${Step_Number}' != '#BLANK'                            Input Text              ${Step_Number_Field}               ${Step_Number}
    Sleep       1s

    Click Element       ${Confirm_Add_Type_Input_2}
    Sleep       3s


Edit Alerting
    [Arguments]     ${Object}  ${TPIP_Name}  ${Event}	${Min_Threshold}  ${Max_Threshold}  ${Step_Value}    ${Step_Number}

    Run Keyword If  '${Object}' == 'GLOBAL'        Click Edit Element With 2 Info      ${Object}   ${Event}
    Run Keyword If  '${Object}' == 'TPIP'          Click Edit Element With 3 Info      ${Object}   ${TPIP_Name}  ${Event}

    Run Keyword If  '${Min_Threshold}' != '#BLANK'                          Input Text              ${Min_Threshold_Field}             ${Min_Threshold}
    Run Keyword If  '${Max_Threshold}' != '#BLANK'                          Input Text              ${Max_Threshold_Field}             ${Max_Threshold}
    Run Keyword If  '${Step_Value}' != '#BLANK'                             Input Text              ${Step_Value_Field}                ${Step_Value}
    Run Keyword If  '${Step_Number}' != '#BLANK'                            Input Text              ${Step_Number_Field}               ${Step_Number}
    Sleep       1s

    Click Element       ${Confirm_Add_Type_Input_2}
    Sleep       3s

View Alerting
    [Arguments]     ${Object}  ${TPIP_Name}  ${Event}	${Min_Threshold}  ${Max_Threshold}  ${Step_Value}    ${Step_Number}

    Run Keyword If  '${Object}' == 'GLOBAL'        Click View Element With 2 Info      ${Object}   ${Event}
    Run Keyword If  '${Object}' == 'TPIP'          Click View Element With 3 Info      ${Object}   ${TPIP_Name}  ${Event}
    Sleep       3s

    Verify Page Contains 2 Expected Elements    Object                                          ${Object}
    Run Keyword If  '${Object}' == 'TPIP'       Verify Page Contains 2 Expected Elements    TPIP name                                       ${TPIP_Name}
    Verify Page Contains 2 Expected Elements    Event                                           ${Event}
    Run Keyword If  '${Min_Threshold}' != '#BLANK'  Verify Page Contains 2 Expected Elements    Threshold                                       [${Min_Threshold}, ${Max_Threshold}]
    Run Keyword If  '${Min_Threshold}' != '#BLANK'  Verify Page Contains 2 Expected Elements    Window                                          [${Step_Value}, ${Step_Number}]
