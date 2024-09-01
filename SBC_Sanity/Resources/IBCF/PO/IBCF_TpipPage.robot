*** Settings ***
Library  SeleniumLibrary
Resource  ../../Common.robot
Resource  ../../../Data/InputData.robot

*** Variables ***
################# General variables #################
${Type_Visited}              id=visited_tpip
${Type_Home}                 id=home_tpip
${Name_Field}                id=name
${IP_Dropdown}				 xpath=//input[@value='127.0.0.1']
${IP_Visited_Field}			 xpath=//label[@for='ip']//preceding::div[1]//ul/li[2]
${IP_localhost_Field}		xpath=//label[@for='ip']//preceding::div[1]//ul/li[1]
${Port_Field}				id=port
${IP_Home_TPIP_Dropdown}	xpath=//label[@for='network']//preceding::div[1]//input
${IP_Home_TPIP_1}			xpath=//label[@for='network']//preceding::div[1]//span[contains(.,'Auto_TPIP1')]
${IP_Home_TPIP_2}			xpath=//label[@for='network']//preceding::div[1]//span[contains(.,'Auto_TPIP3')]
${IP_Home_TPIP_3}			xpath=//label[@for='network']//preceding::div[1]//span[contains(.,'Auto_TPIP5')]
${SIP_DropDown}				xpath=//label[contains(text(),'SIP')]/preceding-sibling::div
${SIP_Compact}				xpath=//label[contains(text(),'SIP')]/preceding-sibling::div//span[contains(text(),'compact')]
${DSCP_Field}				id=dscp
${PNUM_TRUE}                 xpath=//label[@for='use_pnum']/following::button[@value='TRUE']
${PNUM_FALSE}                xpath=//label[@for='use_pnum']/following::button[@value='FALSE']
${PNUM_NONE}                 xpath=//label[@for='use_pnum']/following::button[@value='NONE']
${TPIP_Domain_Field}         id=domains-0-domain_name
${TPIP_Domain_Field_1}       id=domains-1-domain_name
${TPIP_Domain_Field_2}       id=domains-2-domain_name
${Add_More_Domains}          xpath=//button[@name='btn-add-more-domain']
${TPIP_Nat}                  xpath=//label[contains(text(),'NAT')]
${Protocol_None}			id=ibcf_tpip_protocol_none
${Protocol_TCP}				id=ibcf_tpip_protocol_tcp
${Protocol_TLS}				id=ibcf_tpip_protocol_tls
${Max_in_TCP_Field}			id=tcp_in
${Max_out_TCP_Field}		id=tcp_out
${TCP_Preference_Dropdown}		xpath=//label[@for='tcp_pref']//preceding::div[1]//input
${TCP_Prefered}					xpath=//label[@for='tcp_pref']//preceding::span[text()='Preferred']
${TCP_Not_Prefered}				xpath=//label[@for='tcp_pref']//preceding::span[text()='Not Preferred']
${Connection_Clear_Timer_Field}		id=cnct_clear
${TLS_Profile_Dropdown}				xpath=//label[@for='tls']//preceding::div[1]//input
${TLS_Profile_1}					xpath=//label[@for='tls']//preceding::div[1]//ul/li[1]
${TPIP_Confirm_Button}        id=submit_field
${TPIP_Cancel_Button}        xpath=//a[contains(text(),'Cancel']
#
${TPIP_section}              xpath=//*[@class='collapsible-header active' and contains(text(),'Ibcf')]/following::div//a[@class='first-menu' and contains(text(),'Tpip')]
${Filter_By_Name}         xpath=//span[contains(text(),'Name')]


*** Keywords ***
Go to IBCF tab
    Click Element        ${IBCF_tab}
    Sleep  1s

Go to TPIP section in IBCF tab
    Click Element        ${TPIP_section}
    Sleep   4s

    Wait Until Page Contains Element    ${Data_table}         20

Add TPIP
    [Arguments]     ${Type}    ${Name}    ${IP}   ${IP_Version}    ${Port}    ${Home_TPIP}  ${SIP}   ${DSCP}   ${PNUM}    ${Domain}    ${Domain_1}   ${Domain_2}   ${Nat}
    ...             ${Protocol}		${Max_in_TCP}  ${Max_out_TCP}  ${TCP_Preference}  ${Connection_clear_timer}  ${TLS_profile}  ${TPIP_Type}  ${IF_Name}

    Click Element       ${Add_Button}
    Sleep       3s

    Run Keyword If  '${Type}' == 'visited'      Click Element     ${Type_Visited}
    ...   ELSE IF   '${Type}' == 'home'         Click Element     ${Type_Home}
    Sleep  3s

    Run Keyword If  '${Name}' != '#BLANK'    input text       ${Name_Field}              ${Name}
    Sleep       1s

    Run Keyword If  '${Type}' == 'home'     Click Element       //input[@value='${IP}']
    Sleep  1s
    Run Keyword If  '${Type}' == 'home' and '${TPIP_Type}' == 'IP' and '${IP}' != '#BLANK'         Click Element       //span[contains(text(),'${IP}')]
    Run Keyword If  '${Type}' == 'home' and '${TPIP_Type}' == 'IP' and '${IP}' == '#BLANK'         Click Element       ${IP_localhost_Field}
    Run Keyword If  '${Type}' == 'home' and '${TPIP_Type}' != 'IP'    run keywords     Click Element       ${IF_Name_Button}  AND    input text       ${IF_Name_Field}              ${IF_Name}


    Run Keyword If  '${Type}' == 'visited' and '${IP_Version}' =='IPV4' and '${IP}' != '#BLANK'    run keywords     Click Element        id=ip_v4  AND  Click Element    xpath=//input[@value='127.0.0.1']  AND  Sleep  1s  AND  Click Element      xpath=//span[contains(text(),'${HOST_SBC}')]
    Run Keyword If  '${Type}' == 'visited' and '${IP_Version}' =='IPV4' and '${IP}' == '#BLANK'    run keywords     Click Element        id=ip_v4  AND  Click Element    xpath=//input[@value='127.0.0.1']  AND  Sleep  1s  AND  Click Element      xpath=//span[contains(text(),'127.0.0.1')]
    Sleep       3s

    #Run Keyword If  '${Type}' == 'visited' and '${IP_Version}' =='IPV6' and '${IP}' != '#BLANK'    run keywords     Click Element        id=ip_v6  AND  Click Element    xpath=//*[contains(.,'IP:')]//following-sibling::div//span//input  AND  Sleep  1s  AND  #Click Element      xpath=//span[contains(text(),"${SBC_IPV6}")]
    Run Keyword If  '${Type}' == 'visited' and '${IP_Version}' =='IPV6' and '${IP}' != '#BLANK'    run keywords     Click Element        id=ip_v6  AND  Click Element    xpath=//input[@value='${SBC_IPV6}']  AND  Sleep  1s  AND  Click Element      xpath=//span[contains(text(),"${SBC_IPV6}")]
    Run Keyword If  '${Type}' == 'visited' and '${IP_Version}' =='IPV6' and '${IP}' == '#BLANK'    run keywords     Click Element        id=ip_v6  AND  Click Element   xpath=//input[@value='${SBC_IPV6}']  AND  Sleep  1s  AND  Click Element      xpath=xpath=//span[contains(text(),"::1")]

    Run Keyword If  '${Type}' == 'visited' and '${TPIP_Type}' != 'IP'    run keywords     Click Element       ${IF_Name_Button}  AND    input text       ${IF_Name_Field}              ${IF_Name}
    Sleep       3s


    Run Keyword If  '${Port}' != '#BLANK'    input text     ${Port_Field}            ${Port}
    Sleep       1s

    Run Keyword If      '${Type}' =='visited' and '${Home_TPIP}' !='#BLANK'    Click Element       ${IP_Home_TPIP_Dropdown}
    Sleep  1s
    Run Keyword If      '${Type}' =='visited' and '${Home_TPIP}' =='1'    Click Element       ${IP_Home_TPIP_1}
    Run Keyword If      '${Type}' =='visited' and '${Home_TPIP}' =='2'    Click Element       ${IP_Home_TPIP_2}
    Run Keyword If      '${Type}' =='visited' and '${Home_TPIP}' =='3'    Click Element       ${IP_Home_TPIP_3}
    Sleep  1s


    Run Keyword If  '${SIP}' == 'compact'    Click Element   ${SIP_DropDown}
    Sleep       1s

    Run Keyword If  '${SIP}' == 'compact'    Click Element   ${SIP_Compact}
    Sleep       1s

    Run Keyword If  '${DSCP}' != '#BLANK'    input text      ${DSCP_Field}      ${DSCP}
    Sleep       1s

    Run Keyword If  '${PNUM}' == 'TRUE'    Click Element    ${PNUM_TRUE}
    Run Keyword If  '${PNUM}' == 'FALSE'    Click Element   ${PNUM_FALSE}
    Run Keyword If  '${PNUM}' == 'NONE'    Click Element    ${PNUM_NONE}
    Sleep       1s

    Run Keyword If  '${Domain}' != '#BLANK'    input text       ${TPIP_Domain_Field}          ${Domain}
    Sleep       1s

    Click Element       ${Add_More_Domains}
    Run Keyword If  '${Domain_1}' != '#BLANK'    input text       ${TPIP_Domain_Field_1}          ${Domain_1}
    Sleep       3s

    Click Element       ${Add_More_Domains}
    Run Keyword If  '${Domain_2}' != '#BLANK'    input text       ${TPIP_Domain_Field_2}          ${Domain_2}
    Sleep       3s

    Run Keyword If  '${Nat}' == 'TRUE'    Click Element   ${TPIP_Nat}
    Sleep       1s

    Run Keyword If      '${Type}' =='visited' and '${Protocol}' == 'None'   Click Element     ${Protocol_None}
    Run Keyword If      '${Type}' =='visited' and '${Protocol}' == 'TCP'   Click Element      ${Protocol_TCP}
    Run Keyword If      '${Type}' =='visited' and '${Protocol}' == 'TCP' and '${Max_in_TCP}' !='#BLANK'    input text               ${Max_in_TCP_Field}       ${Max_in_TCP}
    Run Keyword If      '${Type}' =='visited' and '${Protocol}' == 'TCP' and '${Max_out_TCP}' !='#BLANK'    input text              ${Max_out_TCP_Field}       ${Max_out_TCP}
    Run Keyword If      '${Type}' =='visited' and '${Protocol}' == 'TCP' and '${TCP_Preference}' !='#BLANK'    Click Element        ${TCP_Preference_Dropdown}
    Sleep  1s
    Run Keyword If      '${Type}' =='visited' and '${Protocol}' == 'TCP' and '${TCP_Preference}' =='Prefered'    Click Element              ${TCP_Prefered}
    Run Keyword If      '${Type}' =='visited' and '${Protocol}' == 'TCP' and '${TCP_Preference}' =='No_Prefered'    Click Element           ${TCP_Not_Prefered}
    Run Keyword If      '${Type}' =='visited' and '${Protocol}' == 'TCP' and '${Connection_clear_timer}' !='#BLANK'    input text        ${Connection_Clear_Timer_Field}       ${Connection_clear_timer}
    Run Keyword If      '${Type}' =='visited' and '${Protocol}' == 'TLS'   Click Element      ${Protocol_TLS}
    Run Keyword If      '${Type}' =='visited' and '${Protocol}' == 'TLS' and '${TLS_profile}' !='#BLANK'    Click Element               ${TLS_Profile_Dropdown}
    Sleep  1s
    Run Keyword If      '${Type}' =='visited' and '${Protocol}' == 'TLS' and '${TLS_profile}' =='1'         Click Element               ${TLS_Profile_1}
    Run Keyword If      '${Type}' =='visited' and '${Protocol}' == 'TLS' and '${Connection_clear_timer}' !='#BLANK'    input text        ${Connection_Clear_Timer_Field}       ${Connection_clear_timer}
    Sleep  2s

    Click Element       ${TPIP_Confirm_Button}
    Sleep       3s

Edit TPIP
    [Arguments]     ${Name}    ${Port}      ${DSCP}    ${PNUM}  ${Maskv6}
    Click Edit Element With 2 Info      ${Name}    ${Port}

    Run Keyword If  '${DSCP}' != '#BLANK'    input text      ${DSCP_Field}      ${DSCP}
    Sleep       1s

    Run Keyword If  '${PNUM}' == 'TRUE'    Click Element   ${PNUM_TRUE}
    Run Keyword If  '${PNUM}' == 'FALSE'    Click Element   ${PNUM_FALSE}
    Run Keyword If  '${PNUM}' == 'NONE'    Click Element   ${PNUM_NONE}
    Sleep       1s

    Run Keyword If  '${Maskv6}' == 'TRUE'   Click Element   ${Maskv6}

    Click Element   ${TPIP_Confirm_Button}
    Sleep       3s



View TPIP
    [Arguments]    ${Type}    ${Name}    ${IP}    ${Port}   #${Nat}   ${Maskv6}    ${Domain}    ${DSCP}  ${PNUM}  ${SIP}  ${MaxinTCP}  ${MaxoutTCP}  ${TCPPref}  ${HomeTPIP}  ${ConnectTimer}

    Run Keyword If      '${Name}' =='Auto_TPIP5'         Click Element     ${Page_2}
    Run Keyword If      '${Name}' =='Auto_TPIP6'         Click Element     ${Page_2}
    Click View Element With 2 Info    ${Name}     ${Port}
    Sleep       3s
    Verify Page Contains 2 Expected Elements    Type                        ${Type}
    Verify Page Contains 2 Expected Elements    Name                        ${Name}
    Verify Page Contains 2 Expected Elements    IP/Ifname                   ${IP}
    Verify Page Contains 2 Expected Elements    Port                        ${Port}
    #Verify Page Contains 2 Expected Elements    NAT                         ${Nat}
    #Verify Page Contains 2 Expected Elements    Mask IPv6                   ${Maskv6}
    #Verify Page Contains 2 Expected Elements    Domain                      ${Domain}
    #Verify Page Contains 2 Expected Elements    DSCP                        ${DSCP}
    #Verify Page Contains 2 Expected Elements    Use PNUM                    ${PNUM}

    #Run Keyword If  '${Type} == 'home'       Verify Page Contains 2 Expected Elements    sip                         ${SIP}

    #Run Keyword If  '${Type} == 'visited'       Verify Page Contains 2 Expected Elements    Max incoming TCP                         ${MaxinTCP}
    #Run Keyword If  '${Type} == 'visited'       Verify Page Contains 2 Expected Elements    Max outgoing TCP                         ${MaxoutTCP}
    #Run Keyword If  '${Type} == 'visited'       Verify Page Contains 2 Expected Elements    TCP preference                           ${TCPPref}
    #Run Keyword If  '${Type} == 'visited'       Verify Page Contains 2 Expected Elements    Home TPIP                                ${HomeTPIP}
    #Run Keyword If  '${Type} == 'visited'       Verify Page Contains 2 Expected Elements    Connection clear timer                   ${ConnectTimer}




