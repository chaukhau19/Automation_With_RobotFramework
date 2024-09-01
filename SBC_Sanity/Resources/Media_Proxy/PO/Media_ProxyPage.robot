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
${Interface_Field}          id=interface_name
${Portmin_Field}            id=portmin
${IP_Nated_Field}           xpath=//input[@id='ip_nated']
${Behavior_Button_1}        xpath=//button[@value='Traffic Filtering']
${Behavior_Button_2}        xpath=//button[@value='Enable TOS']
${Behavior_Button_3}        xpath=//button[@value='Enlarge Port Range']
${ICMP_Dropdown}            xpath=//label[@for='icmp_check']//preceding::div[1]/input
${ICMP_1}                   xpath=//label[@for='icmp_check']//preceding::div[1]/ul/li[1]
${ICMP_2}                   xpath=//label[@for='icmp_check']//preceding::div[1]/ul/li[2]
${ICMP_3}                   xpath=//label[@for='icmp_check']//preceding::div[1]/ul/li[3]
${Period_Field}             id=period
${Timeout_Field}            id=timeout

*** Keywords ***
Go to Media Proxy tab
    Click Element        ${MediaProxy_tab}
    Sleep  3s

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
    Sleep   2s
    Wait Until Page Contains Element    ${Data_table}         20

Add MPForwarder
    [Arguments]  ${Name}  ${IP}

    Click Element       ${Add_Button}
    Sleep  1s
    Run Keyword If  '${Name}' != '#BLANK'           input text          ${Name_Field}           ${Name}
    Run Keyword If  '${IP}' != '#BLANK'             input text          ${IP_Field}             ${IP}

    Click Element       ${Confirm_Add}
    Sleep       3s

Add ICMP
    [Arguments]  ${Name}  ${IP}  ${Add_IP1}  ${IP1}  ${Add_IP2}  ${IP2}  ${Add_IP3}  ${IP3}

    Click Element       ${Add_Button}
    Sleep  1s
    Run Keyword If  '${Name}' != '#BLANK'           input text          ${Name_Field}           ${Name}
    Run Keyword If  '${IP}' != '#BLANK'             input text          ${IP_Field_0}             ${IP}

    Run Keyword If      '${Add_IP1}' == 'add'           Click Element       ${Add_IP_Button}
    Run Keyword If  '${IP1}' != '#BLANK'             input text          ${IP_Field_1}             ${IP1}

    Run Keyword If      '${Add_IP2}' == 'add'           Click Element       ${Add_IP_Button}
    Run Keyword If  '${IP2}' != '#BLANK'             input text          ${IP_Field_2}             ${IP2}

    Run Keyword If      '${Add_IP3}' == 'add'           Click Element       ${Add_IP_Button}
    Run Keyword If  '${IP3}' != '#BLANK'             input text          ${IP_Field_3}             ${IP3}

    Click Element       ${Confirm_Add}
    Sleep       3s

Add MPVNIC

    [Arguments]  ${Domain}  ${Forwarder}  ${Interface}  ${Portmin}  ${Behavior_1}  ${Behavior_2}  ${Behavior_3}  ${ICMP}  ${Period}  ${Timeout}

    Click Element       ${Add_Button}
    Sleep  1s

    Run Keyword If      '${Domain}' == 'LOCAL'           Click Element          ${Local_Button}
    Run Keyword If  '${Domain}' != 'LOCAL'           Click Element          ${Other_Button}
    Sleep  1s
    Run Keyword If  '${Domain}' != 'LOCAL'           input text             ${Domain_Field}           ${Domain}

    Run Keyword If  '${Forwarder}' != '#BLANK'               Click Element          ${Forwarder_Dropdown}
    Sleep  1s
    Run Keyword If      '${Forwarder}' == 'MP1'                    Click Element          ${Forwarder_1}
    Run Keyword If      '${Forwarder}' == 'MP2'                    Click Element          ${Forwarder_2}
    Sleep  1s

    Run Keyword If  '${Interface}' != '#BLANK'           input text             ${Interface_Field}          ${Interface}
    Run Keyword If  '${Portmin}' != '#BLANK'             input text             ${Portmin_Field}            ${Portmin}

    Run Keyword If      '${Behavior_1}' == '0x1'                Click Element          ${Behavior_Button_1}
    Run Keyword If      '${Behavior_2}' == '0x2'                Click Element          ${Behavior_Button_2}
    Run Keyword If      '${Behavior_3}' == '0x4'                Click Element          ${Behavior_Button_3}
    Sleep  1s

    Add_Edit MPVNIC  ${ICMP}  ${Period}  ${Timeout}

Add MPVNIC 71

    [Arguments]  ${Domain}  ${Forwarder}  ${Interface}  ${Portmin}  ${Behavior_1}  ${Behavior_2}  ${Behavior_3}  ${ICMP}  ${Period}  ${Timeout}  ${IP_Nated}

    Click Element       ${Add_Button}
    Sleep  1s

    Run Keyword If      '${Domain}' == 'LOCAL'           Click Element          ${Local_Button}
    Run Keyword If  '${Domain}' != 'LOCAL'           Click Element          ${Other_Button}
    Sleep  1s
    Run Keyword If  '${Domain}' != 'LOCAL'           input text             ${Domain_Field}           ${Domain}

    Run Keyword If  '${Forwarder}' != '#BLANK'               Click Element          ${Forwarder_Dropdown}
    Sleep  1s
    Run Keyword If      '${Forwarder}' == 'MP1'                    Click Element          ${Forwarder_1}
    Run Keyword If      '${Forwarder}' == 'MP2'                    Click Element          ${Forwarder_2}
    Sleep  1s

    Run Keyword If  '${Interface}' != '#BLANK'           input text             ${Interface_Field}          ${Interface}
    Run Keyword If  '${Portmin}' != '#BLANK'             input text             ${Portmin_Field}            ${Portmin}

    Run Keyword If      '${Behavior_1}' == '0x1'                Click Element          ${Behavior_Button_1}
    Run Keyword If      '${Behavior_2}' == '0x2'                Click Element          ${Behavior_Button_2}
    Run Keyword If      '${Behavior_3}' == '0x4'                Click Element          ${Behavior_Button_3}
    Sleep  1s

    Add_Edit MPVNIC 71  ${ICMP}  ${Period}  ${Timeout}

    Sleep  20s
    Run Keyword If  '${IP_Nated}' != '#BLANK'           input text             ${IP_Nated_Field}          ${IP_Nated}
    Run Keyword If  '${IP_Nated}' != '#BLANK'           Click Element       ${Confirm_Add_IP_Nated}
    Sleep  2s
    Run Keyword If  '${IP_Nated}' != '#BLANK'           Click Element       ${Close_Notify}
    Sleep  1s
    Click Element        ${VNIC_section}
    Sleep   1s
    Wait Until Page Contains Element    ${Data_table}         20


Edit MPVNIC
    [Arguments]    ${Domain}  ${Forwarder}   ${ICMP}  ${Period}  ${Timeout}
    Click Edit Element With 2 Info      ${Forwarder}       ${Domain}
    Sleep  2s

    Add_Edit MPVNIC  ${ICMP}  ${Period}  ${Timeout}

Edit MPVNIC 71
    [Arguments]    ${Domain}  ${Forwarder}   ${ICMP}  ${Period}  ${Timeout}  ${IP_Nated}
    Click Edit Element With 2 Info      ${Forwarder}       ${Domain}
    Sleep  2s

    Edit MediaVNIC 71  ${ICMP}  ${Period}  ${Timeout}  ${IP_Nated}

Add_Edit MPVNIC
    [Arguments]  ${ICMP}  ${Period}  ${Timeout}
    Run Keyword If  '${ICMP}' != '#BLANK'               Click Element          ${ICMP_Dropdown}
    Sleep  1s
    Run Keyword If      '${ICMP}' == '1'                    Click Element          ${ICMP_1}
    Run Keyword If      '${ICMP}' == '2'                    Click Element          ${ICMP_2}
    Run Keyword If      '${ICMP}' == '3'                    Click Element          ${ICMP_3}

    Run Keyword If  '${Period}' != '#BLANK'           input text             ${Period_Field}          ${Period}
    Run Keyword If  '${Timeout}' != '#BLANK'           input text             ${Timeout_Field}          ${Timeout}

    Sleep  1s

    Click Element       ${Confirm_Add}
    Sleep       3s

Add_Edit MPVNIC 71
    [Arguments]  ${ICMP}  ${Period}  ${Timeout}
    Run Keyword If  '${ICMP}' != '#BLANK'               Click Element          ${ICMP_Dropdown}
    Sleep  1s
    Run Keyword If      '${ICMP}' == '1'                    Click Element          ${ICMP_1}
    Run Keyword If      '${ICMP}' == '2'                    Click Element          ${ICMP_2}
    Run Keyword If      '${ICMP}' == '3'                    Click Element          ${ICMP_3}

    Run Keyword If  '${Period}' != '#BLANK'           input text             ${Period_Field}          ${Period}
    Run Keyword If  '${Timeout}' != '#BLANK'           input text             ${Timeout_Field}          ${Timeout}

    Sleep  1s

    Click Element       ${Confirm_Add}
    Sleep       3s
    Click Element       ${Close_Notify}
    Sleep  1s

Edit MediaVNIC 71
    [Arguments]  ${ICMP}  ${Period}  ${Timeout}  ${IP_Nated}
    Run Keyword If  '${ICMP}' != '#BLANK'               Click Element          ${ICMP_Dropdown}
    Sleep  1s
    Run Keyword If      '${ICMP}' == '1'                    Click Element          ${ICMP_1}
    Run Keyword If      '${ICMP}' == '2'                    Click Element          ${ICMP_2}
    Run Keyword If      '${ICMP}' == '3'                    Click Element          ${ICMP_3}

    Run Keyword If  '${Period}' != '#BLANK'           input text             ${Period_Field}          ${Period}
    Run Keyword If  '${Timeout}' != '#BLANK'           input text             ${Timeout_Field}          ${Timeout}
    Run Keyword If  '${IP_Nated}' != '#BLANK'           input text             ${IP_Nated_Field}          ${IP_Nated}
    Sleep  1s

    Click Element       ${Confirm_Add}
    Sleep       3s
View MPVNIC
    [Arguments]    ${Domain}  ${Forwarder}     ${Interface}         ${Port_min}   ${Behavior}
    Click View Element With 2 Info      ${Forwarder}       ${Domain}
    Sleep       3s

    Verify Page Contains 2 Expected Elements    Domain                            ${Domain}
    Verify Page Contains 2 Expected Elements    Name                              ${Forwarder}_${Interface}
    Verify Page Contains 2 Expected Elements    Forwarder                         ${Forwarder}
    Verify Page Contains 2 Expected Elements    Port min                          ${Port_min}
    Verify Page Contains 2 Expected Elements    Behavior                          ${Behavior}
    Sleep  2s

View MPVNIC 71
    [Arguments]    ${Domain}  ${Forwarder}     ${Interface}         ${Port_min}   ${Behavior}   ${Ip_Nated}
    Click View Element With 2 Info      ${Forwarder}       ${Domain}
    Sleep       3s

    Verify Page Contains 2 Expected Elements    Domain                            ${Domain}
    Verify Page Contains 2 Expected Elements    Name                              ${Forwarder}_${Interface}
    Verify Page Contains 2 Expected Elements    Forwarder                         ${Forwarder}
    Verify Page Contains 2 Expected Elements    Port min                          ${Port_min}
    Verify Page Contains 2 Expected Elements    Behavior                          ${Behavior}
    Run Keyword If  '${Ip_Nated}' != '#BLANK'    Verify Page Contains 2 Expected Elements    Near-End NAT, IP Nated            ${Ip_Nated}
    Sleep  2s