*** Settings ***
Library  SeleniumLibrary
Resource  ../../Common.robot
Resource  ../../../Data/InputData.robot
*** Variables ***
${Forwarder_section}        xpath=//a[contains(text(),'Forwarder')]
${ICMP_section}             xpath=//a[contains(text(),'Icmp Check')]
${VNIC_section}             xpath=//a[contains(text(),'V-NIC')]
${IP_Field_0}               id=ips-0-ip
${IP_Field_1}               id=ips-1-ip
${IP_Field_2}               id=ips-2-ip
${IP_Field_3}               id=ips-3-ip
${Add_IP_Button}            id=add_ip

${Local_Button}             xpath=//button[@value='LOCAL']
${Other_Button}             xpath=//button[@value='other']
${Forwarder_Dropdown}       xpath=//label[@for='forwarder']//preceding::div[1]/input
${Forwarder_1}              xpath=//label[@for='forwarder']//preceding::div[1]/ul/li[1]
${Forwarder_2}              xpath=//label[@for='forwarder']//preceding::div[1]/ul/li[2]
${Forwarder_3}              xpath=//label[@for='forwarder']//preceding::div[1]/ul/li[3]
${Interface_Field}          id=interface_name
${Portmin_Field}            id=portmin
${IP_Nated_Field}           xpath=//input[@id='ip_nated']
${Behavior_Button_1}        xpath=//button[@value='Traffic Filtering']
${Behavior_Button_2}        xpath=//button[@value='Enable TOS']
${Behavior_Button_3}        xpath=//button[@value='Enlarge Port Range']
${ICMP_Dropdown}            xpath=//label[@for='icmp_check']//preceding::div[1]/input
#${ICMP_1}                   xpath=//label[@for='icmp_check']//preceding::div[1]/ul/li[1]
#${ICMP_2}                   xpath=//label[@for='icmp_check']//preceding::div[1]/ul/li[2]
#${ICMP_3}                   xpath=//label[@for='icmp_check']//preceding::div[1]/ul/li[3]
${ICMP_Null}                xpath=//label[contains(text(),'ICMP check')]//preceding-sibling::div//following::span[contains(.,'NULL')]
${ICMP_None}                xpath=//label[contains(text(),'ICMP check')]//preceding-sibling::div//following::span[contains(.,'NONE')]
${ICMP_1}                   xpath=//label[contains(text(),'ICMP check')]//preceding-sibling::div//following::span[contains(.,'ICMP1')]
${ICMP_2}                   xpath=//label[contains(text(),'ICMP check')]//preceding-sibling::div//following::span[contains(.,'ICMP2')]
${ICMP_3}                   xpath=//label[contains(text(),'ICMP check')]//preceding-sibling::div//following::span[contains(.,'ICMP3')]
${ICMP_4}                   xpath=//label[contains(text(),'ICMP check')]//preceding-sibling::div//following::span[contains(.,'ICMP4')]
${Period_Field}             id=period
${Timeout_Field}            id=timeout

*** Keywords ***
Go to Media Proxy tab
    Click Element        ${MediaProxy_tab}
    Sleep       3s

Go to Forwarder section in Media Proxy tab

    Click Element        ${Forwarder_section}
    Sleep   1s
    Wait Until Page Contains Element    ${Data_table}         20

Go to ICMP section in Media Proxy tab

    Click Element        ${ICMP_section}
    Sleep   1s
    Wait Until Page Contains Element    ${Data_table}         20

Go to VNIC section in Media Proxy tab

    Click Element        ${VNIC_section}
    Sleep       2s
    Wait Until Page Contains Element    ${Data_table}         20

Add MPForwarder
    [Arguments]  ${Name}  ${IP}

    Click Element       ${Add_Button}
    Sleep       1s
    Run Keyword If  '${Name}' != '#BLANK'           Input Text          ${Name_Field}           ${Name}
    Run Keyword If  '${IP}' != '#BLANK'             Input Text          ${IP_Field}             ${IP}

    Click Element       ${Confirm_Add_Type_Input_2}
    Sleep       3s

Add ICMP
    [Arguments]  ${Name}  ${IP}  ${Add_IP1}  ${IP1}  ${Add_IP2}  ${IP2}  ${Add_IP3}  ${IP3}

    Click Element       ${Add_Button}
    Sleep       1s
    Run Keyword If  '${Name}' != '#BLANK'           Input Text          ${Name_Field}           ${Name}
    Run Keyword If  '${IP}' != '#BLANK'             Input Text          ${IP_Field_0}             ${IP}

    Run Keyword If      '${Add_IP1}' == 'add'           Click Element       ${Add_IP_Button}
    Run Keyword If  '${IP1}' != '#BLANK'             Input Text          ${IP_Field_1}             ${IP1}

    Run Keyword If      '${Add_IP2}' == 'add'           Click Element       ${Add_IP_Button}
    Run Keyword If  '${IP2}' != '#BLANK'             Input Text          ${IP_Field_2}             ${IP2}

    Run Keyword If      '${Add_IP3}' == 'add'           Click Element       ${Add_IP_Button}
    Run Keyword If  '${IP3}' != '#BLANK'             Input Text          ${IP_Field_3}             ${IP3}

    Click Element       ${Confirm_Add_Type_Input_2}
    Sleep       3s











Add MPVNIC 
    [Arguments]  ${Domain}  ${Forwarder}  ${Interface}  ${Portmin}  ${Behavior}  ${ICMP}  ${Period}  ${Timeout}  ${IP_Nated}  ${Button_Close}

    Click Element       ${Add_Button}
    Sleep       1s

    Run Keyword If      '${Domain}' == 'LOCAL'           Click Element          ${Local_Button}
    Run Keyword If      '${Domain}' != 'LOCAL'           Click Element          ${Other_Button}
    Sleep       1s
    Run Keyword If      '${Domain}' != 'LOCAL'           Input Text             ${Domain_Field}           ${Domain}

    Run Keyword If      '${Forwarder}' != '#BLANK'               Click Element          ${Forwarder_Dropdown}
    Sleep       1s
    Run Keyword If      '${Forwarder}' == 'MP1'                    Click Element          ${Forwarder_1}
    Run Keyword If      '${Forwarder}' == 'MP2'                    Click Element          ${Forwarder_2}
    Run Keyword If      '${Forwarder}' == 'MP3'                    Click Element          ${Forwarder_3}
    Sleep       1s

    Run Keyword If      '${Interface}' != '#BLANK'           Input Text             ${Interface_Field}          ${Interface}
    Run Keyword If      '${Portmin}' != '#BLANK'             Input Text             ${Portmin_Field}            ${Portmin}
    #$Behavior is 0x0 when no click Behavior button
    Run Keyword If       '${Behavior}' == '0x1'                            Click Element          ${Behavior_Button_1}
    ...     ELSE IF      '${Behavior}' == '0x2'                            Click Element          ${Behavior_Button_2}
    ...     ELSE IF      '${Behavior}' == '0x3'      Run Keywords          Click Element          ${Behavior_Button_1}    AND   Click Element      ${Behavior_Button_2}
    ...     ELSE IF      '${Behavior}' == '0x4'                            Click Element          ${Behavior_Button_3}
    ...     ELSE IF      '${Behavior}' == '0x5'      Run Keywords          Click Element          ${Behavior_Button_1}    AND   Click Element      ${Behavior_Button_3}
    ...     ELSE IF      '${Behavior}' == '0x6'      Run Keywords          Click Element          ${Behavior_Button_2}    AND   Click Element      ${Behavior_Button_3}
    ...     ELSE IF      '${Behavior}' == '0x7'      Run Keywords          Click Element          ${Behavior_Button_1}    AND   Click Element      ${Behavior_Button_2}   AND   Click Element      ${Behavior_Button_3}
    Sleep       1s

    Add_Edit MPVNIC  ${ICMP}  ${Period}  ${Timeout}  ${IP_Nated}  ${Button_Close}

    Sleep  20s
    Run Keyword If  '${IP_Nated}' != '#BLANK'           Input Text             ${IP_Nated_Field}          ${IP_Nated}
    Run Keyword If  '${IP_Nated}' != '#BLANK'           Click Element          ${Confirm_Add_IP_Nated}
    Sleep       2s
    Run Keyword If  '${IP_Nated}' != '#BLANK' and '${Button_Close}' == 'Valid'              Click Element            ${Close_Notify}
    Sleep       3s
    Run Keyword If  '${Button_Close}' == 'Valid'       Run Keyword        Click Element      ${VNIC_section}  
    Wait Until Page Contains Element    ${Add_Button}    30s
    Run Keyword If  '${Button_Close}' == 'Valid'          Wait Until Page Contains Element    ${Data_table}         20



Edit MPVNIC 
    [Arguments]    ${ICMP}  ${Period}  ${Timeout}  ${IP_Nated}  ${Name}
    Click Edit Element With 1 Info     ${Name}
    Sleep       2s
    Edit MediaVNIC   ${ICMP}  ${Period}  ${Timeout}  ${IP_Nated}


Add_Edit MPVNIC 
    [Arguments]  ${ICMP}  ${Period}  ${Timeout}  ${IP_Nated}  ${Button_Close}
    #26516 The IMCP check should be displayed "None" when editing the V-NIC
    Run Keyword If  '${ICMP}' != '#BLANK'       Run Keywords        Click Element          ${ICMP_Dropdown}   AND  Sleep       2s  
    ...  AND  Page Should Not Contain Element    ${ICMP_Null}
    Sleep       1s
    IF               '${ICMP}' == 'None'                    Click Element          ${ICMP_None}
    ...    ELSE IF   '${ICMP}' == 'ICMP1'                   Click Element          ${ICMP_1}
    ...    ELSE IF   '${ICMP}' == 'ICMP2'                   Click Element          ${ICMP_2}
    ...    ELSE IF   '${ICMP}' == 'ICMP3'                   Click Element          ${ICMP_3}
    ...    ELSE IF   '${ICMP}' == 'ICMP4'                   Click Element          ${ICMP_4}
    Sleep       2s
    IF  '${Period}' != '#BLANK'           Input Text             ${Period_Field}          ${Period}
    IF  '${Timeout}' != '#BLANK'          Input Text             ${Timeout_Field}          ${Timeout}

    Sleep       1s

    Click Element       ${Confirm_Add_Type_Input_2}
    Sleep       3s
    Run Keyword If      '${Button_Close}' == 'Valid'         Click Element       ${Close_Notify}
    #Test Case Can't Add IP Nated but Can Add VNIC
    Run Keyword If      '${IP_Nated}' != '#BLANK'and '${Button_Close}' == 'Invalid'            Click Element            ${Close_Notify}
    Sleep       1s

Edit MediaVNIC 
    [Arguments]  ${ICMP}  ${Period}  ${Timeout}  ${IP_Nated}
    #26516 The IMCP check should be displayed "None" when editing the V-NIC
    Run Keyword If  '${ICMP}' != '#BLANK'    Run Keywords     Click Element     ${ICMP_Dropdown}  AND  Sleep       2s  AND  Page Should Not Contain Element    ${ICMP_Null}
    Sleep       1s
    IF     '${ICMP}' == 'None'                               Click Element           ${ICMP_None}
    ...    ELSE IF  '${ICMP}' == 'ICMP1'                     Click Element           ${ICMP_1}
    ...    ELSE IF  '${ICMP}' == 'ICMP2'                     Click Element           ${ICMP_2}
    ...    ELSE IF  '${ICMP}' == 'ICMP3'                     Click Element           ${ICMP_3}
    ...    ELSE IF  '${ICMP}' == 'ICMP4'                     Click Element           ${ICMP_4}

    Run Keyword If  '${Period}' != '#BLANK'           Input Text             ${Period_Field}           ${Period}
    Run Keyword If  '${Timeout}' != '#BLANK'          Input Text             ${Timeout_Field}          ${Timeout}
    Run Keyword If  '${IP_Nated}' != '#BLANK'         Input Text             ${IP_Nated_Field}         ${IP_Nated}
    Sleep       1s

    Click Element       ${Confirm_Add_Type_Input_2}
    Sleep       3s
    


View MPVNIC 
    [Arguments]    ${Domain}   ${Forwarder}    ${Interface}    ${Port_min}    ${Behavior}   ${ICMP}    ${Period}    ${Timeout}    ${Ip_Nated}  ${Name}

    Click View Element With 1 Info     ${Name}
    Sleep       4s

    Verify Page Contains 2 Expected Elements    Name                              ${Name}       #${Forwarder}_${Interface}
    Verify Page Contains 2 Expected Elements    Forwarder                         ${Forwarder}
    Verify Page Contains 2 Expected Elements    Domain                            ${Domain}
    Verify Page Contains 2 Expected Elements    Port min                          ${Port_min}
    Verify Page Contains 2 Expected Elements    Behavior                          ${Behavior}
    Run Keyword If  '${ICMP}' != 'None'         Verify Page Contains 2 Expected Elements     ICMP Check                        ${ICMP}
    Verify Page Contains 2 Expected Elements    Period                            ${Period}
    Verify Page Contains 2 Expected Elements    Timeout                           ${Timeout}
    Run Keyword If  '${Ip_Nated}' != '#BLANK'    Verify Page Contains 2 Expected Elements    Near-End NAT, IP Nated            ${Ip_Nated}
    Sleep       2s

View MPVNIC Have Next Page 
    [Arguments]    ${Domain}   ${Forwarder}    ${Interface}    ${Port_min}    ${Behavior}   ${ICMP}    ${Period}    ${Timeout}    ${Ip_Nated}  ${Name}

    # Run Keyword If  '${Name}' == 'MP1_eth7'      Click Element     ${Next_page}
    # Run Keyword If  '${Name}' == 'MP2_eth2'      Click Element     ${Next_page}
    # Run Keyword If  '${Name}' == 'MP3_eth3'      Click Element     ${Next_page}
    # Run Keyword If  '${Name}' == 'MP3_eth4'      Click Element     ${Next_page}
    # Sleep  4s
    # Click View Element With 1 Info     ${Name}
    # Sleep  4s
    ${arg} =  Create List   ${Name}  
    Run Keyword N Times And Stop If Success   Click View Element With 1 Info   ${arg}    Click Element   ${Next_page}   3
    Sleep       2s

    Verify Page Contains 2 Expected Elements    Name                              ${Name}       #${Forwarder}_${Interface}
    Verify Page Contains 2 Expected Elements    Forwarder                         ${Forwarder}
    Verify Page Contains 2 Expected Elements    Domain                            ${Domain}
    Verify Page Contains 2 Expected Elements    Port min                          ${Port_min}
    Verify Page Contains 2 Expected Elements    Behavior                          ${Behavior}
    Run Keyword If  '${ICMP}' != 'None'         Verify Page Contains 2 Expected Elements     ICMP Check                        ${ICMP}
    Verify Page Contains 2 Expected Elements    Period                            ${Period}
    Verify Page Contains 2 Expected Elements    Timeout                           ${Timeout}
    Run Keyword If  '${Ip_Nated}' != '#BLANK'    Verify Page Contains 2 Expected Elements    Near-End NAT, IP Nated            ${Ip_Nated}
    Sleep       2s



