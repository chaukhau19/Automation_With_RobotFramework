*** Settings ***
Library  SeleniumLibrary
Resource  ../../Common.robot
Resource  ../../../Data/InputData.robot

*** Variables ***
################# General variables #################
${Type_Network}              	xpath=//button[@value='Network']
${Type_User}              		xpath=//button[@value='User']
${Type_Management}              xpath=//button[@value='Management']
${Type_Protected}               xpath=//button[@value='Protected']
${Name_Field}                	id=name
${IP_Dropdown}               	xpath=//input[@value='127.0.0.1']
${IP_Network_Field}				xpath=//label[@for='ip']/preceding::div[1]/ul/li[2]
${IP_localhost_Field}			xpath=//label[@for='ip']/preceding::div[1]/ul/li[1]
${Port_Field}					id=port
${IP_Core_TPIP_Dropdown}		xpath=//label[@for='network']/preceding::div[1]/input
${IP_Core_TPIP_1}				xpath=//label[@for='network']/preceding::div[1]/ul/li[1]
${IP_Core_TPIP_2}				xpath=//label[@for='network']/preceding::div[1]/ul/li[2]
${SIP_None}						xpath=//label[@for='sip']/following::div[1]/button[contains(.,'None')]
${SIP_Compact}					xpath=//label[@for='sip']/following::div[1]/button[contains(.,'Compact')]
${NAT_True}						xpath=//label[@for='nat']/following::div[1]/button[contains(.,'True')]
${NAT_False}					xpath=//label[@for='nat']/following::div[1]/button[contains(.,'False')]
${DSCP_Field}					id=dscp
${PNUM_NONE}                    xpath=//button[@value='NONE']
${PNUM_TRUE}                    xpath=//button[@value='TRUE']
${PNUM_FALSE}                   xpath=//button[@value='FALSE']
${Mask_IPv6_True}				xpath=//label[@for='mask_v6']/following::div[1]/button[contains(.,'True')]
${Mask_IPv6_False}				xpath=//label[@for='mask_v6']/following::div[1]/button[contains(.,'False')]
${TPIP_Domain_Field}			id=domains-0-domain
${Add_Domains_Button}			id=add_domain
${TPIP_Domain_Field_1}			id=domains-1-domain
${Hiding_Dropdown}				xpath=//label[@for='hiding']/preceding::div[1]/input
${No_Hiding_Field}				xpath=//label[@for='hiding']/preceding::div[1]/ul/li[1]
${Hiding_Field}					xpath=//label[@for='hiding']/preceding::div[1]/ul/li[2]
${Total_Hiding_Field}			xpath=//label[@for='hiding']/preceding::div[1]/ul/li[3]
${Protocol_None}				xpath=//label[@for='protocol']/following::div[1]/button[contains(.,'None')]
${Protocol_TCP}					xpath=//label[@for='protocol']/following::div[1]/button[contains(.,'TCP')]
${Protocol_TLS}					xpath=//label[@for='protocol']/following::div[1]/button[contains(.,'TLS')]
${Max_in_TCP_Field}				id=tcp_in
${Max_out_TCP_Field}			id=tcp_out
${Connection_Clear_Timer_Field}		id=cnct_clear
${Lookup_Field_Dropdown}		xpath=//label[@for='lookup']/preceding::div[1]/input
${Lookup_Field_None}			xpath=//label[@for='lookup']/preceding::div[1]/ul/li[1]
${Lookup_Field_Preferred}		xpath=//span[contains(text(),'p-preferred')]
${Lookup_Field_Asserted}		xpath=//span[contains(text(),'p-asserted')]
${Lookup_Field_Proxy}			xpath=//span[contains(text(),'proxy-authorization')]
${Lookup_Field_From}            xpath=//span[contains(text(),'from')]
${Lookup_Field_Contact}         xpath=//span[contains(text(),'contact')]
${TLS_Profile_Dropdown}         xpath=//label[@for='tls']/preceding::div[1]/input
${TLS_Profile_1}                xpath=//label[@for='tls']/preceding::div[1]/ul/li[1]
${TPIP_Confirm_Button}       id=submit_field
${TPIP_Cancel_Button}        xpath=//a[contains(text(),'Cancel']
${AKAProfile_Dropdown}      xpath=//label[@for='ims_aka']/preceding::div[1]/input
${AKAProfile_None}          xpath=//label[@for='ims_aka']/preceding::div[1]/ul/li[contains(.,'NONE')]
${AKAProfile_1}             xpath=//label[@for='ims_aka']/preceding::div[1]/ul/li[contains(.,'1')]
${AKAProfile_2}             xpath=//label[@for='ims_aka']/preceding::div[1]/ul/li[contains(.,'2')]
${AKAProfile_3}             xpath=//label[@for='ims_aka']/preceding::div[1]/ul/li[contains(.,'3')]
${AKAProfile_4}             xpath=//label[@for='ims_aka']/preceding::div[1]/ul/li[contains(.,'4')]
${AKAProfile_5}             xpath=//label[@for='ims_aka']/preceding::div[1]/ul/li[contains(.,'5')]
#
${TPIP_section}              xpath=//*[@class='collapsible-header active' and contains(text(),'Pcscf')]/following::div//a[@class='first-menu' and contains(text(),'Tpip')]
${Filter_By_Name}            xpath=//span[contains(text(),'Name')]
${IF_Name_Field}             xpath=//input[@id='ifname']

*** Keywords ***
Go to PCSCF tab
    Click Element        ${PCSCF_tab}
    Sleep  1s

Go to TPIP section in PCSCF tab
    Click Element        ${TPIP_section}
    Sleep   1s

    Wait Until Page Contains Element    ${Data_table}         20

Add TPIP
    [Arguments]     ${Type}    ${Name}    ${IP}    ${IP_Version}   ${Port}      ${Core_TPIP}   ${SIP}   ${NAT}     ${DSCP}  ${PNUM}    ${Mask_ipv6}  ${Domain}	${Add_More_Domains}	  ${Domain1}   ${Hiding}
    ...             ${Protocol}     ${Max_in_TCP}     ${Max_out_TCP}     ${Connection_clear_timer}  ${TLS_profile}  ${AKAProfile}
    Click Element       ${Add_Button}
    Sleep  3s

    Run Keyword If   '${Type}' == 'network'      	Click Element     		${Type_Network}
	...    ELSE IF	 '${Type}' == 'user'			Click Element	  		${Type_User}
	...    ELSE IF	 '${Type}' == 'management'		Click Element	    	${Type_Management}
	...    ELSE IF	 '${Type}' == 'protected'		Click Element	    	${Type_Protected}
    Sleep  3s

    Run Keyword If  '${Name}' != '#BLANK'    input text       ${Name_Field}              ${Name}
    Sleep       1s

    Run Keyword If  '${Type}' == 'network' and '${IP_Version}' != 'ETH'     Click Element       ${IP_Dropdown}
    Sleep  1s
    Run Keyword If  '${Type}' == 'network' and '${IP_Version}' != 'ETH' and '${IP}' != '#BLANK'         Click Element       //span[contains(text(),'${IP}')]
    Run Keyword If  '${Type}' == 'network' and '${IP_Version}' != 'ETH' and '${IP}' == '#BLANK'         Click Element       //span[contains(text(),'127.0.0.1')]

    Run Keyword If  '${Type}' != 'network' and '${IP_Version}' =='IPV4' and '${IP}' != '#BLANK'   run keywords     Click Element        xpath=//button[@value='IP v4']  AND  Click Element        xpath=//label[@for='ip']/following-sibling::div[2]/input  AND   Click Element    xpath=//label[@for='ip']/following-sibling::div[2]//span[contains(.,'${HOST_SBC}')]
    Sleep  3s
    Run Keyword If  '${Type}' != 'network' and '${IP_Version}' =='IPV4' and '${IP}' == '#BLANK'   run keywords     Click Element        xpath=//button[@value='IP v4']  AND  Click Element        xpath=//label[@for='ip']/following-sibling::div[2]/input  AND   Click Element     xpath=//label[@for='ip']/following-sibling::div[2]//span[contains(.,'127.0.0.1')]
    Sleep  3s

    Run Keyword If  '${Type}' != 'network' and '${IP_Version}' =='IPV6' and '${IP}' != '#BLANK'   run keywords     Click Element        xpath=//button[@value='IP v6']  AND  Click Element        xpath=//label[@for='ip']/following-sibling::div[2]/input  AND  Sleep  1s  AND   Click Element    xpath=//label[@for='ip']/following-sibling::div[2]/ul/li[1]
    Sleep  3s
    Run Keyword If  '${Type}' != 'network' and '${IP_Version}' =='IPV6' and '${IP}' == '#BLANK'   run keywords     Click Element        xpath=//button[@value='IP v6']  AND  Click Element        xpath=//label[@for='ip']/following-sibling::div[2]/input  AND  Sleep  1s  AND   Click Element    xpath=//label[@for='ip']/following-sibling::div[2]/ul/li[2]
    Sleep  3s

    Run Keyword If  '${Type}' == 'network' and '${IP_Version}' == 'ETH'    run keywords     Click Element       ${IF_Name_Button}  AND    input text       ${IF_Name_Field}              ${IP}
    Run Keyword If  '${Type}' == 'user' and '${IP_Version}' == 'ETH'    run keywords     Click Element       ${IF_Name_Button}  AND    input text       ${IF_Name_Field}              ${IP}
    Run Keyword If  '${Type}' == 'protected' and '${IP_Version}' == 'ETH'    run keywords     Click Element       ${IF_Name_Button}  AND    input text       ${IF_Name_Field}              ${IP}

    Run Keyword If  '${Port}' != '#BLANK'    input text     ${Port_Field}            ${Port}
    Sleep       2s

    Run Keyword If      '${Type}' =='user' and '${Core_TPIP}' !='#BLANK'    Click Element       ${IP_Core_TPIP_Dropdown}
    Sleep  3s
    Run Keyword If      '${Type}' =='user' and '${Core_TPIP}' =='1'    Click Element       ${IP_Core_TPIP_1}
    Sleep  3s
    Run Keyword If      '${Type}' =='user' and '${Core_TPIP}' =='2'    Click Element       ${IP_Core_TPIP_2}
    Sleep  3s

    Run Keyword If  '${SIP}' == 'None'          Click Element   ${SIP_None}
    ...   ELSE IF   '${SIP}' == 'Compact'       Click Element   ${SIP_Compact}
    Sleep       3s

    Run Keyword If  '${NAT}' == 'YES'          Click Element   ${NAT_True}
    ...   ELSE IF   '${NAT}' == 'NO'           Click Element   ${NAT_False}
    Sleep       1s

    Run Keyword If  '${DSCP}' != '#BLANK'    input text      ${DSCP_Field}      ${DSCP}
    Sleep       1s

    Run Keyword If  '${PNUM}' == 'TRUE'    Click Element    ${PNUM_TRUE}
    Run Keyword If  '${PNUM}' == 'FALSE'    Click Element   ${PNUM_FALSE}
    Run Keyword If  '${PNUM}' == 'NONE'    Click Element    ${PNUM_NONE}
    Sleep       1s

    Run Keyword If  '${Type}' =='network' and '${Mask_ipv6}' == 'TRUE'          Click Element   ${Mask_IPv6_True}
    ...   ELSE IF   '${Type}' =='network' and '${Mask_ipv6}' == 'FALSE'           Click Element   ${Mask_IPv6_False}
    Sleep       1s

    Run Keyword If  '${Domain}' != '#BLANK'    input text       ${TPIP_Domain_Field}          ${Domain}
    Sleep       1s

    Run Keyword If      '${Add_More_Domains}' == 'add'       Click Element       ${Add_Domains_Button}

    Run Keyword If  '${Domain_1}' != '#BLANK'    input text       ${TPIP_Domain_Field_1}          ${Domain_1}
    Sleep       1s

    Run Keyword If      '${Type}' =='user' and '${Hiding}' != '#BLANK'     Click Element       ${Hiding_Dropdown}
    Sleep  3s
    Run Keyword If      '${Type}' =='user' and '${Hiding}' == 'No Hiding'     Click Element       ${No_Hiding_Field}
    Sleep  1s
    Run Keyword If      '${Type}' =='user' and '${Hiding}' == 'Hiding'     Click Element       ${Hiding_Field}
    Sleep  1s
    Run Keyword If      '${Type}' =='user' and '${Hiding}' == 'Total Hiding'     Click Element       ${Total_Hiding_Field}
    Sleep  1s

#New feature AKA #16780
    Run Keyword If      '${Type}' == 'protected' and '${AKAProfile}' != '#BLANK'    Click Element       ${AKAProfile_Dropdown}
    Sleep  5s
    Run Keyword If      '${Type}' == 'protected' and '${AKAProfile}' == 'None'    Click Element       ${AKAProfile_None}
    ...  ELSE IF        '${Type}' == 'protected' and '${AKAProfile}' == '2'       Click Element       ${AKAProfile_2}
    ...  ELSE IF        '${Type}' == 'protected' and '${AKAProfile}' == '3'       Click Element       ${AKAProfile_3}
    ...  ELSE IF        '${Type}' == 'protected' and '${AKAProfile}' == '4'       Click Element       ${AKAProfile_4}
    ...  ELSE IF        '${Type}' == 'protected' and '${AKAProfile}' == '5'       Click Element       ${AKAProfile_5}
    Sleep  2s
##############
    Run Keyword If      '${Type}' =='user' and '${Protocol}' == 'None'     Click Element       ${Protocol_None}
    Run Keyword If      '${Type}' =='user' and '${Protocol}' == 'TCP'     Click Element        ${Protocol_TCP}
    Run Keyword If      '${Type}' =='user' and '${Protocol}' == 'TCP' and '${Max_in_TCP}' !='#BLANK'    input text        ${Max_in_TCP_Field}       ${Max_in_TCP}
    Run Keyword If      '${Type}' =='user' and '${Protocol}' == 'TCP' and '${Max_out_TCP}' !='#BLANK'    input text        ${Max_out_TCP_Field}       ${Max_out_TCP}
    Run Keyword If      '${Type}' =='user' and '${Protocol}' == 'TCP' and '${Connection_clear_timer}' !='#BLANK'    input text        ${Connection_Clear_Timer_Field}       ${Connection_clear_timer}

    Run Keyword If      '${Type}' =='user' and '${Protocol}' == 'TLS'     Click Element        ${Protocol_TLS}
    Run Keyword If      '${Type}' =='user' and '${Protocol}' == 'TLS' and '${TLS_profile}' !='#BLANK'    Click Element              ${TLS_Profile_Dropdown}
    Run Keyword If      '${Type}' =='user' and '${Protocol}' == 'TLS' and '${TLS_profile}' =='1'         Click Element              ${TLS_Profile_1}
    Run Keyword If      '${Type}' =='user' and '${Protocol}' == 'TLS' and '${Connection_clear_timer}' !='#BLANK'    input text        ${Connection_Clear_Timer_Field}       ${Connection_clear_timer}
    Sleep  1s

    Run Keyword If      '${Type}' =='protected' and '${Protocol}' == 'TLS'     Click Element        ${Protocol_TLS}
    Run Keyword If      '${Type}' =='protected' and '${Protocol}' == 'TLS' and '${TLS_profile}' !='#BLANK'    Click Element              ${TLS_Profile_Dropdown}
    Run Keyword If      '${Type}' =='protected' and '${Protocol}' == 'TLS' and '${TLS_profile}' =='1'         Click Element              ${TLS_Profile_1}
    Run Keyword If      '${Type}' =='protected' and '${Protocol}' == 'TLS' and '${Connection_clear_timer}' !='#BLANK'    input text        ${Connection_Clear_Timer_Field}       ${Connection_clear_timer}
    Sleep  1s

    Click Element       ${TPIP_Confirm_Button}
    Sleep       3s

Edit TPIP
    [Arguments]     ${Type}     ${Name}    ${Port}      ${DSCP}   ${Mask_ipv6}  ${Hiding}  ${Lookup_field}

    Run Keyword If  '${Name}' == 'auto_extern_eth'      Click Element     ${Next_page}

    Click Edit Element With 3 Info      ${Name}    ${Port}  ${Type}

    Run Keyword If  '${DSCP}' != '#BLANK'    input text      ${DSCP_Field}      ${DSCP}
    Sleep       1s

    Run Keyword If  '${Type}' =='network' and '${Mask_ipv6}' == 'TRUE'          Click Element   ${Mask_IPv6_True}
    ...   ELSE IF   '${Type}' =='network' and '${Mask_ipv6}' == 'FALSE'           Click Element   ${Mask_IPv6_False}
    Sleep       1s

    Run Keyword If      '${Type}' =='user' and '${Hiding}' != '#BLANK'     Click Element       ${Hiding_Dropdown}
    Sleep  1s
    Run Keyword If      '${Type}' =='user' and '${Hiding}' == 'No Hiding'     Click Element       ${No_Hiding_Field}
    Sleep  1s
    Run Keyword If      '${Type}' =='user' and '${Hiding}' == 'Hiding'     Click Element       ${Hiding_Field}
    Sleep  1s
    Run Keyword If      '${Type}' =='user' and '${Hiding}' == 'Total Hiding'     Click Element       ${Total_Hiding_Field}
    Sleep  1s

    Run Keyword If      '${Type}' =='user' and '${Lookup_field}' != '#BLANK'     Click Element       ${Lookup_Field_Dropdown}
    Sleep  1s
    Run Keyword If      '${Type}' =='user' and '${Lookup_field}' == 'None'     Click Element       ${Lookup_Field_None}
    Sleep  1s
    Run Keyword If      '${Type}' =='user' and '${Lookup_field}' == 'P-preferred'     Click Element       ${Lookup_Field_Preferred}
    Sleep  1s
    Run Keyword If      '${Type}' =='user' and '${Lookup_field}' == 'P-asserted'     Click Element       ${Lookup_Field_Asserted}
    Sleep  1s
    Run Keyword If      '${Type}' =='user' and '${Lookup_field}' == 'Proxy-authorization'     Click Element       ${Lookup_Field_Proxy}
    Run Keyword If      '${Type}' =='user' and '${Lookup_field}' == 'From'     Click Element       ${Lookup_Field_From}
    Run Keyword If      '${Type}' =='user' and '${Lookup_field}' == 'Contact'     Click Element       ${Lookup_Field_Contact}
    Sleep  1s

    Click Element   ${TPIP_Confirm_Button}
    Sleep  3s


View TPIP
    [Arguments]    ${Type}    ${Name}    ${IP}    ${Port}   #${Nat}   ${Maskv6}    ${Domain}    ${DSCP}  ${PNUM}  ${SIP}  ${MaxinTCP}  ${MaxoutTCP}  ${TCPPref}  ${HomeTPIP}  ${ConnectTimer}

    Click View Element With 2 Info    ${Name}     ${Port}
    Sleep  3s
    Verify Page Contains 2 Expected Elements    Type                        ${Type}
    Verify Page Contains 2 Expected Elements    Name                        ${Name}
    Verify Page Contains 2 Expected Elements    IP                          ${IP}
    Verify Page Contains 2 Expected Elements    Port                        ${Port}

