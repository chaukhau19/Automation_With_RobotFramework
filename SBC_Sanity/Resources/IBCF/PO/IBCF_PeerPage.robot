*** Settings ***
Library  SeleniumLibrary
Resource  ../../Common.robot
Resource  ../../../Data/InputData.robot

*** Variables ***
################# General variables #################
${Confirm_Add}                       id=submit_field
#${Peer_section}                      xpath=//*[@class='collapsible-header first-menu' and contains(text(),'Peer')]
#${Peer_section_Peer}                 xpath=//*[@class='sub-menu' and contains(text(),'Peer')]
#${Peer_section_PeerCfg}              xpath=//*[@class='sub-menu' and contains(text(),'Peer configuration')]
#${Peer_section_Trusted}              xpath=//*[@class='sub-menu' and contains(text(),'Peer configuration')]/following::a
#${Peer_section_NotTrusted}              xpath=//*[@class='sub-menu' and contains(text(),'Peer configuration')]/following::a[2]
${Cancel_View}                       xpath=//i[@class='material-icons right' and contains(text(),'cancel')]
###########################  PEER - PAGE  ###########################################
#${Routing_dropdown}				     xpath=//ul[@id='select-options-ce4618c3-f44e-5f09-74ee-f3e5376c04bb']//span[contains(text(),'0')]
${Maxin_field}			    id=max_in
${Maxout_field}			    id=max_out
${Optional_parameters_button}         xpath=//label[contains(text(),'Optional parameters')]/preceding::button
${Maxboth_field}		    id=max_both
${PBX_field}                id=pbxuri
${Trusted_Checkbox}         xpath=//label[@for='trusted']
${Privacy_Checkbox}         xpath=//label[@for='privacy']
${Filtering_Checkbox}       xpath=//label[@for='filtering']
${RTCP_Checkbox}            xpath=//label[@for='rtcp' and contains(text(),'RTCP')]
${Maskv6_field}             xpath=//*[@id='mask_v6']
${Reveal_checkbox}          xpath=//label[@for='reveal_v6']
${Session2BLimiter_True}    xpath=//label[@for='sessions2b_limiter']//following::button[contains(.,'True')]
${Session2BLimiter_False}    xpath=//label[@for='sessions2b_limiter']//following::button[contains(.,'False')]
${Keepalive_parameters_button}        xpath=//label[@for='use_keepalive_param' and contains(text(),'Keep Alive parameters')]/preceding::button[1]
${Add_Keepalive_button}                 id=add_global_keep_alive
${Remove_Keepalive_button}             xpath=//input[@id='add_global_keep_alive']//following::i[contains(text(),'indeterminate_check_box')]
${Add_Keepalive_Domain_Button}          id=add_keep_alive_domain
${Remove_Keepalive_Domain_Button}       xpath=//input[@id='add_keep_alive_domain']//following::i[contains(text(),'indeterminate_check_box')]
${1st_period_field1}                    xpath=//*[@id='lst_global_keep_alive-0-period_1']
${2nd_period_field1}                     xpath=//*[@id='lst_global_keep_alive-0-period_2']
${Max_forward_field1}                    xpath=//*[@id='lst_global_keep_alive-0-max_forwards']
${Keepalive_domain_button}              xpath=//*[@id='add_keep_alive_domain']
${1st_period_field2}                    xpath=//*[@id='lst_global_keep_alive-1-period_1']
${2nd_period_field2}                     xpath=//*[@id='lst_global_keep_alive-1-period_2']
${Max_forward_field2}                    xpath=//*[@id='lst_global_keep_alive-1-max_forwards']
${KA_Domain_Field1}                     id=lst_keep_alive_domain-0-ka_domain
${KA_Domain_Field2}                     id=lst_keep_alive_domain-1-ka_domain


#${Trusted_Checked}         xpath=//label[@for='trusted' and contains(text(),'Trusted')]/preceding::input[@checked]

${Routing_dropdown}				    xpath=//label[contains(text(),'Routing profile')]/preceding::div[1]/input
${Routing_index_1}                  xpath=//label[contains(text(),'Routing profile')]/preceding::div[1]/ul/li[1]/span
${Routing_index_2}                  xpath=//label[contains(text(),'Routing profile')]/preceding::div[1]/ul/li[2]/span

${Autho_dropdown}				    xpath=//label[contains(text(),'Authorization profile')]/preceding::div[1]/input
${Autho_index_1}                    xpath=//label[contains(text(),'Authorization profile')]/preceding::div[1]/ul/li[1]/span
${Autho_index_2}                    xpath=//label[contains(text(),'Authorization profile')]/preceding::div[1]/ul/li[2]/span

${Hiding_dropdown}				    xpath=//label[contains(text(),'Hiding')]/preceding::div[1]/input
${Hiding_Nohiding}				    xpath=//label[contains(text(),'Hiding')]/preceding::div[1]/ul/li[1]
${Hiding_Hiding}				    xpath=//label[contains(text(),'Hiding')]/preceding::div[1]/ul/li[2]
${Hiding_Totalhiding}				xpath=//label[contains(text(),'Hiding')]/preceding::div[1]/ul/li[3]

${Behavior_dropdown}			    xpath=//label[contains(text(),'Behavior')]/preceding::div[1]/input

${1st_protocol_dropdown}			xpath=//label[contains(text(),'1st Accepted protocol')]/preceding::div[1]/input
${1st_protocol_none}			    xpath=//label[contains(text(),'1st Accepted protocol')]/preceding::div[1]/ul/li[1]
${1st_protocol_udp}			        xpath=//label[contains(text(),'1st Accepted protocol')]/preceding::div[1]/ul/li[2]
${1st_protocol_tcp}			        xpath=//label[contains(text(),'1st Accepted protocol')]/preceding::div[1]/ul/li[3]

${2nd_protocol_dropdown}			xpath=//label[contains(text(),'2nd Accepted protocol')]/preceding::div[1]/input
${2nd_protocol_none}			    xpath=//label[contains(text(),'2nd Accepted protocol')]/preceding::div[1]/ul/li[1]
${2nd_protocol_udp}			        xpath=//label[contains(text(),'2nd Accepted protocol')]/preceding::div[1]/ul/li[2]
${2nd_protocol_tcp}			        xpath=//label[contains(text(),'2nd Accepted protocol')]/preceding::div[1]/ul/li[3]

${IBCF_TPIP_dropdown}				xpath=//label[contains(text(),'TPIP extern')]/preceding::div[1]/input
${TPIP_None}                        xpath=//label[contains(text(),'TPIP extern')]/preceding::div[1]/ul/li[1]/span
${TPIP_name1}                        xpath=//label[contains(text(),'TPIP extern')]/preceding::div[1]/ul/li[2]/span
${TPIP_name2}                        xpath=//label[contains(text(),'TPIP extern')]/preceding::div[1]/ul/li[3]/span
${Header_content}                    xpath=//div[@class='row col 12 header-content']
${TPIP_label}                       xpath=//label[contains(text(),'TPIP extern')]

${SDP_dropdown}						xpath=//label[contains(text(),'Sdp profile')]/preceding::div[1]/input
${SDP_profile_none}                 xpath=//label[contains(text(),'Sdp profile')]/preceding::div[1]/ul/li[1]
${SDP_profile_1}                    xpath=//label[contains(text(),'Sdp profile')]/preceding::div[1]/ul/li[2]
${SDP_profile_2}                    xpath=//label[contains(text(),'Sdp profile')]/preceding::div[1]/ul/li[3]

${RFC4028_dropdown}					xpath=//label[contains(text(),'RFC4028 Profile')]/preceding::div[1]/input
${RFC4028_None}					    xpath=//label[contains(text(),'RFC4028 Profile')]/preceding::div[1]/ul/li[1]
${RFC4028_1}				        xpath=//label[contains(text(),'RFC4028 Profile')]/preceding::div[1]/ul/li[2]
${RFC4028_2}				        xpath=//label[contains(text(),'RFC4028 Profile')]/preceding::div[1]/ul/li[3]

${Interworking_dropdown}			xpath=//label[contains(text(),'Interworking method')]/preceding::div[1]/input
${Interworking_None}		    	xpath=//label[contains(text(),'Interworking method')]/preceding::div[1]//span[contains(text(),'NONE')]
${Interworking_Update}		    	xpath=//label[contains(text(),'Interworking method')]/preceding::div[1]//span[contains(text(),'UPDATE')]
${Interworking_Invite}			    xpath=//label[contains(text(),'Interworking method')]/preceding::div[1]//span[contains(text(),'INVITE')]

${Prack_dropdown}					xpath=//label[contains(text(),'Prack support')]/preceding::div[1]/input
${Prack_None}				    	xpath=//label[contains(text(),'Prack support')]/preceding::div[1]//span[contains(text(),'NONE')]
${Prack_Forbid}				    	xpath=//label[contains(text(),'Prack support')]/preceding::div[1]//span[contains(text(),'FORBID_PRACK')]

${Session_control_dropdown}			xpath=//label[contains(text(),'Session control')]/preceding::div[1]/input
${Session_control_None}			    xpath=//label[contains(text(),'Session control')]/preceding::div[1]/ul/li[1]
${Session_control_1}			xpath=//label[contains(text(),'Session control')]/preceding::div[1]/ul/li[2]
${Session_control_2}			xpath=//label[contains(text(),'Session control')]/preceding::div[1]/ul/li[3]

${Session_limiter_dropdown}			xpath=//label[contains(text(),'Session Limiter Profile')]/preceding::div[1]/input
${Session_limiter_None}			    xpath=//label[contains(text(),'Session Limiter Profile')]/preceding::div[1]/ul/li[1]
${Session_limiter_1}			    xpath=//label[contains(text(),'Session Limiter Profile')]/preceding::div[1]/ul/li[2]
${Session_limiter_2}			    xpath=//label[contains(text(),'Session Limiter Profile')]/preceding::div[1]/ul/li[3]
${Session_limiter_label}            xpath=//label[contains(text(),'Session Limiter Profile')]

${PNUM_None}                        xpath=//label[contains(text(),'Use PNUM')]/following::button[contains(text(),'NONE)]
${PNUM_True}                        xpath=//label[contains(text(),'Use PNUM')]/following::button[contains(text(),'TRUE')]
${PNUM_False}                       xpath=//label[contains(text(),'Use PNUM')]/following::button[contains(text(),'FALSE')]

${ASHM_button}                      xpath=//button[@value='Sip manipulation profile']
${ASHM_dropdown}					xpath=//label[contains(text(),'SIP Header manipulation profile')]/preceding::div[1]/input
${ASHM_None}	    				xpath=//label[contains(text(),'SIP Header manipulation profile')]/preceding::div[1]/ul/li[1]
${ASHM_1st}   					    xpath=//label[contains(text(),'SIP Header manipulation profile')]/preceding::div[1]/ul/li[2]
${ASHM_2nd}   					    xpath=//label[contains(text(),'SIP Header manipulation profile')]/preceding::div[1]/ul/li[3]

${Check_source_dropdown}			xpath=//label[contains(text(),'Check source IP')]/preceding::div[1]/input
${Check_source_None}    			xpath=//label[contains(text(),'Check source IP')]/preceding::div[1]//span[contains(text(),'NONE')]
${Check_source_True}	    		xpath=//label[contains(text(),'Check source IP')]/preceding::div[1]//span[contains(text(),'TRUE')]
${Check_source_False}		    	xpath=//label[contains(text(),'Check source IP')]/preceding::div[1]//span[contains(text(),'FALSE    ')]

${Silent_dropdown}					xpath=//label[contains(text(),'Silent ignore')]/preceding::div[1]/input
${Silent_None}				    	xpath=//label[contains(text(),'Silent ignore')]/preceding::div[1]//span[contains(text(),'NONE')]
${Silent_True}				    	xpath=//label[contains(text(),'Silent ignore')]/preceding::div[1]//span[contains(text(),'TRUE')]
${Silent_False}					    xpath=//label[contains(text(),'Silent ignore')]/preceding::div[1]//span[contains(text(),'FALSE')]

${Home_domain_field}                xpath=//*[@id='home_domain']
${Not_ChangePAI_Checkbox}           xpath=//label[@for='not_change_pai']   #and contains(text(),'Not Change PAI')]
${Extern_domain_field}              xpath=//*[@id='extern_domain']

${FWD_mode_dropdown}				xpath=//label[contains(text(),'Forwarder mode')]/preceding::div[1]/input
${FWD_mode_None}		    		xpath=//label[contains(text(),'Forwarder mode')]/preceding::div[1]//span[contains(text(),'NONE')]
${FWD_mode_Off}			           	xpath=//label[contains(text(),'Forwarder mode')]/preceding::div[1]//span[contains(text(),'OFF')]
${FWD_mode_Standard}				xpath=//label[contains(text(),'Forwarder mode')]/preceding::div[1]//span[contains(text(),'STANDARD')]
${FWD_mode_Autolearn}				xpath=//label[contains(text(),'Forwarder mode')]/preceding::div[1]//span[contains(text(),'AUTOLEARN')]
${FWD_mode_Source}			    	xpath=//label[contains(text(),'Forwarder mode')]/preceding::div[1]//span[contains(text(),'SOURCE')]
${FWD_mode_Once}			    	xpath=//label[contains(text(),'Forwarder mode')]/preceding::div[1]//span[contains(text(),'ONCE')]
${FWD_mode_Auto_Secure}				xpath=//label[contains(text(),'Forwarder mode')]/preceding::div[1]//span[contains(text(),'AUTO_SECURE')]

${FWD_domain_dropdown}				xpath=//label[contains(text(),'Forwarder domain')]/preceding::div[1]/input
${FWD_domain_none}			    	xpath=//label[contains(text(),'Forwarder domain')]/preceding::div[1]//span[contains(text(),'NONE')]
${FWD_domain_extern}				xpath=//label[contains(text(),'Forwarder domain')]/preceding::div[1]//span[contains(text(),'extern')]
${FWD_domain_local}				    xpath=//label[contains(text(),'Forwarder domain')]/preceding::div[1]//span[contains(text(),'LOCAL')]

${Media_profile_dropdown}			xpath=//label[contains(text(),'Media profile')]/preceding::div[1]/input
${Media_profile_none}		    	xpath=//label[contains(text(),'Media profile')]/preceding::div[1]/ul/li[1]
${Media_profile_first}		    	xpath=//label[contains(text(),'Media profile')]/preceding::div[1]/ul/li[2]

${1st_SRTP_dropdown}				xpath=//label[contains(text(),'1st SRTP profile')]/preceding::div[1]/input
${1st_SRTP_none}	    			xpath=//label[contains(text(),'1st SRTP profile')]/preceding::div[1]/ul/li[1]
${1st_SRTP_first}   				xpath=//label[contains(text(),'1st SRTP profile')]/preceding::div[1]/ul/li[2]

${2nd_SRTP_dropdown}				xpath=//label[contains(text(),'2nd SRTP profile')]/preceding::div[1]/input
${2nd_SRTP_none}	    			xpath=//label[contains(text(),'2nd SRTP profile')]/preceding::div[1]/ul/li[1]
${2nd_SRTP_first}   				xpath=//label[contains(text(),'2nd SRTP profile')]/preceding::div[1]/ul/li[2]

${Global_TPIP_dropdown}				xpath=//label[contains(text(),'Keep alive TPIP')]/following::div[1]/input
${Global_KA_TPIP1}   				xpath=//label[contains(text(),'Keep alive TPIP')]/following::div[1]/ul/li[1]/span
${Global_KA_TPIP2}   				xpath=//label[contains(text(),'Keep alive TPIP')]/following::div[1]/ul/li[2]/span

${Keep_domain_field}                xpath=//*[@id='lst_keep_alive_domain-0-ka_domain']
${Keep_domain_TPIP_dropdown}		xpath=//label[contains(text(),'Keep alive domain TPIP')]/preceding::div[1]/input
${Keep_domain_first}                xpath=//label[contains(text(),'Keep alive domain TPIP')]/preceding::div[1]/ul/li[1]

${Global_TPIP_dropdown}				xpath=//label[@for='lst_global_keep_alive-0-global_ka_tpip']/following::div[1]/input
${Global_KA_TPIP1}   				xpath=//label[@for='lst_global_keep_alive-0-global_ka_tpip']/following::div[1]/ul/li[1]/span
${Global_KA_TPIP2}   				xpath=//label[@for='lst_global_keep_alive-0-global_ka_tpip']/following::div[1]/ul/li[2]/span

${Global_TPIP_dropdown1}			xpath=//label[@for='lst_global_keep_alive-1-global_ka_tpip']/following::div[1]/input
${Global_KA_TPIP3}   				xpath=//label[@for='lst_global_keep_alive-1-global_ka_tpip']/following::div[1]/ul/li[1]/span
${Global_KA_TPIP4}   				xpath=//label[@for='lst_global_keep_alive-1-global_ka_tpip']/following::div[1]/ul/li[2]/span

${Domain_KA_TPIP_Dropdown}          xpath=//label[@for='lst_keep_alive_domain-0-ka_domain_tpip']/preceding::div[1]/input
${Domain_KA_TPIP1}                  xpath=//label[@for='lst_keep_alive_domain-0-ka_domain_tpip']/preceding::div[1]/ul/li[1]/span
${Domain_KA_TPIP2}                  xpath=//label[@for='lst_keep_alive_domain-0-ka_domain_tpip']/preceding::div[1]/ul/li[2]/span

${Domain_KA_TPIP_Dropdown1}          xpath=//label[@for='lst_keep_alive_domain-1-ka_domain_tpip']/preceding::div[1]/input
${Domain_KA_TPIP3}                   xpath=//label[@for='lst_keep_alive_domain-1-ka_domain_tpip']/preceding::div[1]/ul/li[1]/span
${Domain_KA_TPIP4}                   xpath=//label[@for='lst_keep_alive_domain-1-ka_domain_tpip']/preceding::div[1]/ul/li[2]/span

${Peer_section}                      xpath=//*[@class='collapsible-header active' and contains(text(),'Ibcf')]/following::div//a[@class='collapsible-header first-menu' and contains(text(),'Peer')]
${Peer_Field}                        xpath=//*[@class='collapsible-header first-menu active' and contains(text(),'Peer')]/following::div//a[@class='sub-menu' and contains(text(),'Peer')]

${Block_Peer_True}                   xpath=//label[contains(text(),'Block peer')]/following::button[contains(text(),'True')]
${Block_Peer_False}                  xpath=//label[contains(text(),'Block peer')]/following::button[contains(text(),'False')]
${Block_Incoming_True}               xpath=//label[contains(text(),'Block incoming peer')]/following::button[contains(text(),'True')]
${Block_Incoming_False}              xpath=//label[contains(text(),'Block incoming peer')]/following::button[contains(text(),'False')]
${Block_Outgoing_True}               xpath=//label[contains(text(),'outgoing peer')]/following::button[contains(text(),'True')]
${Block_Outgoing_False}              xpath=//label[contains(text(),'outgoing peer')]/following::button[contains(text(),'False')]

${Lac_Stripping_True}               xpath=//label[contains(text(),'LAC Stripping')]/following::button[contains(text(),'True')]
${Lac_Stripping_False}              xpath=//label[contains(text(),'LAC Stripping')]/following::button[contains(text(),'False')]
${word_processing_button}           xpath=//button[@value='Word processor']
${word_processing_dropdown}         xpath=//label[@for='wp']/preceding::div[1]/input
${word_processing_file}             xpath=//label[@for='wp']/preceding::div[1]//span[contains(text(),'word_processing')]
${word_processing_none}             xpath=//label[@for='wp']/preceding::div[1]//span[contains(text(),'NONE')]
${User2Net_dropdown}                xpath=//label[@for='user2network']/preceding::div[1]/input
${User2Net_2}                       xpath=//label[@for='user2network']/preceding::div[1]//span[contains(text(),'2')]
${User2Net_3}                       xpath=//label[@for='user2network']/preceding::div[1]//span[contains(text(),'3')]
${User2Net_None}                    xpath=//label[@for='user2network']/preceding::div[1]//span[contains(text(),'NONE')]

${Net2User_dropdown}                xpath=//label[@for='network2user']/preceding::div[1]/input
${Net2User_2}                       xpath=//label[@for='network2user']/preceding::div[1]//span[contains(text(),'2')]
${Net2User_3}                       xpath=//label[@for='network2user']/preceding::div[1]//span[contains(text(),'3')]
${Net2User_None}                    xpath=//label[@for='network2user']/preceding::div[1]//span[contains(text(),'NONE')]

${Precondition_entry_dropdown}      xpath=//label[@for='precondition_entry']/preceding::div[1]/input
${Precondition_entry_0}             xpath=//label[@for='precondition_entry']/preceding::div[1]//span[contains(text(),'0')]
${Precondition_entry_1}             xpath=//label[@for='precondition_entry']/preceding::div[1]//span[contains(text(),'1')]
${Precondition_entry_2}             xpath=//label[@for='precondition_entry']/preceding::div[1]//span[contains(text(),'2')]
${Precondition_exit_dropdown}      xpath=//label[@for='precondition_exit']/preceding::div[1]/input
${Precondition_exit_0}             xpath=//label[@for='precondition_exit']/preceding::div[1]//span[contains(text(),'0')]
${Precondition_exit_1}             xpath=//label[@for='precondition_exit']/preceding::div[1]//span[contains(text(),'1')]
${Precondition_exit_2}             xpath=//label[@for='precondition_exit']/preceding::div[1]//span[contains(text(),'2')]

##############################  Trusted  ####################
${Confirm_Add_Trusted}               xpath=//button[@type='submit']
############################## Matching Rules #################

*** Keywords ***
Go to Peer section in IBCF tab
    Click Element        ${IBCF_tab}
    Sleep  1s
    Click Element        ${Peer_section}
    Sleep       3s


Add Matching
    [Arguments]     ${Name}  ${Header}	${Element_type}	  ${Element_name}	${Matching_value}    ${Codec_type}    ${Attribute}	  ${Instance}  	${Condition_type}   ${Min_occ}	  ${Max_occ}

    Click Element       ${MatchingRule}
    Sleep   1s
    Click Element       ${Add_Button}
    Sleep  2s
    Sleep  2s

    Run Keyword If  '${Name}' != '#BLANK'                           input text          ${Rule_Name_Field}              ${Name}
    Run Keyword If  '${Header}' != '#BLANK'                         input text          ${Header_Field}                 ${Header}
    Sleep       3s
    Add_Edit Matching       ${Element_type}	  ${Element_name}	${Matching_value}    ${Codec_type}    ${Attribute}	  ${Instance}  	${Condition_type}   ${Min_occ}	  ${Max_occ}

Edit Matching
    [Arguments]     ${Name}  ${Header}	${New_Header}     ${Element_type}	  ${Element_name}	${Matching_value}    ${Codec_type}    ${Attribute}	  ${Instance}  	${Condition_type}   ${Min_occ}	  ${Max_occ}

    Click Element       ${MatchingRule}
    Sleep   1s
    Click Edit Element With 2 Info      ${Name}    ${Header}

    Run Keyword If      '${New_Header}' != '#BLANK'                         input text          ${Header_Field}                 ${New_Header}
    Sleep       3s
    Add_Edit Matching       ${Element_type}	  ${Element_name}	${Matching_value}    ${Codec_type}    ${Attribute}	  ${Instance}  	${Condition_type}   ${Min_occ}	  ${Max_occ}

Add_Edit Matching
    [Arguments]     ${Element_type}	  ${Element_name}	${Matching_value}    ${Codec_type}    ${Attribute}	  ${Instance}  	${Condition_type}   ${Min_occ}	  ${Max_occ}
    Run Keyword If      '${Element_type}' != '#BLANK'                   Click Element       ${Element_Dropdown_List}
    Sleep  3s
    Run Keyword If      '${Element_type}' == 'HEADER-NAME'              Click Element       ${Element_Header_Name}
    ...     ELSE IF     '${Element_type}' == 'HEADER-VALUE'             Click Element       ${Element_Header_Value}
    ...     ELSE IF     '${Element_type}' == 'HEADER-PARAM'             Click Element       ${Element_Header_Param}
    ...     ELSE IF     '${Element_type}' == 'HEADER-PARAM-NAME'        Click Element       ${Element_Param_Name}
    ...     ELSE IF     '${Element_type}' == 'URI-VALUE'                Click Element       ${Element_Uri_Value}
    ...     ELSE IF     '${Element_type}' == 'URI-PARAM'                Click Element       ${Element_Uri_Param}
    ...     ELSE IF     '${Element_type}' == 'URI-PARAM-NAME'           Click Element       ${Element_Uri_Param_Name}
    ...     ELSE IF     '${Element_type}' == 'URI-USER'                 Click Element       ${Element_Uri_User}
    ...     ELSE IF     '${Element_type}' == 'URI-USER-PARAM'           Click Element       ${Element_Uri_User_Param}
    ...     ELSE IF     '${Element_type}' == 'URI-HOST'                 Click Element       ${Element_Uri_Host}
    ...     ELSE IF     '${Element_type}' == 'URI-PORT'                 Click Element       ${Element_Uri_Port}
    ...     ELSE IF     '${Element_type}' == 'URI-DISPLAY'              Click Element       ${Element_Uri_Display}
    ...     ELSE IF     '${Element_type}' == 'URI-TYPE'                 Click Element       ${Element_Uri_Type}
    ...     ELSE IF     '${Element_type}' == 'URI-TEL-NUM'              Click Element       ${Element_Uri_Tel}
    ...     ELSE IF     '${Element_type}' == 'STATUS-CODE'              Click Element       ${Element_Status_Code}
    ...     ELSE IF     '${Element_type}' == 'REASON-PHRASE'            Click Element       ${Element_Reason_Phrase}
    ...     ELSE IF     '${Element_type}' == 'APPLICATION-NAME'         Click Element       ${Element_Application_Name}
    ...     ELSE IF     '${Element_type}' == 'SDP-MEDIA'                Click Element       ${Element_Sdp_Media}
    ...     ELSE IF     '${Element_type}' == 'SDP-SESSION'              Click Element       ${Element_Sdp_Session}
    ...     ELSE IF     '${Element_type}' == 'MESSAGE-BODY'              Click Element      ${Element_Message_Body}
    ...     ELSE                                                        Click Element       ${Element_Header_Name}

    Run Keyword If  '${Element_name}' != '#BLANK'           input text          ${Element_Name_Field}                 ${Element_name}
    Run Keyword If  '${Matching_value}' != '#BLANK'         input text          ${Matching_Value_Field}               "${Matching_value}"
    Run Keyword If  '${Codec_type}' != '#BLANK'             input text          ${Codec_Type_Field}                   ${Codec_type}
    Run Keyword If  '${Attribute}' != '#BLANK'              input text          ${Attribute_Field}                    ${Attribute}
    Run Keyword If  '${Instance}' != '#BLANK'               input text          ${Instance_Field}                     ${Instance}
    Run Keyword If  '${Condition_type}' != '#BLANK'                 Click Element       ${Condition_Type_Dropdown}
    Sleep  1s
    Run Keyword If      '${Condition_type}' == 'IP'                     Click Element       ${Condition_Type_IP}
    ...     ELSE IF     '${Condition_type}' == 'IPV4'                   Click Element       ${Condition_Type_IPV4}
    ...     ELSE IF     '${Condition_type}' == 'IPV6'                   Click Element       ${Condition_Type_IPV6}
    ...     ELSE IF     '${Condition_type}' == 'FQDN'                   Click Element       ${Condition_Type_FQDN}
    ...     ELSE IF     '${Condition_type}' == 'CASE_SENSITIVE'         Click Element       ${Condition_Type_Case}
    ...     ELSE IF     '${Condition_type}' == 'STRICTLY'               Click Element       ${Condition_Type_Strictly}
    ...     ELSE                                                        Click Element       ${Condition_Type_None}

    Run Keyword If  '${Min_occ}' != '#BLANK'           input text          ${Min_occ_Field}                 ${Min_occ}
    Run Keyword If  '${Max_occ}' != '#BLANK'           input text          ${Max_occ_Field}                 ${Max_occ}

    Click Element       ${Confirm_Add_MatRul}
    Sleep       3s

View Matching
    [Arguments]     ${Matching_rule_name}  ${Header_name}	  ${Element_type}  ${Element_name}  ${Matching_value}  ${Instance}  ${Minocc}  ${Maxocc}  ${Condition_type}

    Click Element       ${MatchingRule}
    Sleep   1s
    Click View Element With 2 Info          ${Matching_rule_name}    ${Header_name}
    Sleep       3s

    Verify Page Contains 2 Expected Elements    Matching rule name                        ${Matching_rule_name}
    Verify Page Contains 2 Expected Elements    Header name                               ${Header_name}
    Run Keyword If  '${Element_type}' != '#BLANK'        Verify Page Contains 2 Expected Elements    Element type                              ${Element_type}
    Run Keyword If  '${Element_name}' != '#BLANK'        Verify Page Contains 2 Expected Elements    Element Name                              ${Element_name}
    Run Keyword If  '${Matching_value}' != '#BLANK'      Verify Page Contains 2 Expected Elements    Matching value                            ${Matching_value}
    Run Keyword If  '${Instance}' != '#BLANK'            Verify Page Contains 2 Expected Elements    Instance                                  ${Instance}
    Run Keyword If  '${Minocc}' != '#BLANK'              Verify Page Contains 2 Expected Elements    Min occurrence                            ${Minocc}
    Run Keyword If  '${Maxocc}' != '#BLANK'              Verify Page Contains 2 Expected Elements    Max occurrence                            ${Maxocc}
    Run Keyword If  '${Condition_type}' != '#BLANK'      Verify Page Contains 2 Expected Elements    Condition type                            ${Condition_type}


Add Manipulation Rules
    [Arguments]     ${Name}  ${Header}	  ${Action_type}     ${Element_type}	  ${Element_name}   ${Attribute}	  ${New_value}
    ...             ${Rule_value_new}    ${Rule_value_original}      ${Codec_type}    ${Instance}       ${Content_type}     ${Sub_type}     ${Boundary}
    ...             ${Version}      ${Base}     ${Disposition}      ${Handling}     ${Content_value}
    Click Element       ${ManiRule}
    Sleep   2s
    Click Element       ${Add_Button}
    Sleep  2s

    Run Keyword If  '${Name}' != '#BLANK'                           input text          ${Rule_Name_Field}              ${Name}
    Run Keyword If  '${Header}' != '#BLANK'                         input text          ${Header_Field}                 ${Header}
    Add_Edit ManipulationRules    ${Action_type}     ${Element_type}	  ${Element_name}   ${Attribute}	  ${New_value}
    ...             ${Rule_value_new}    ${Rule_value_original}      ${Codec_type}    ${Instance}       ${Content_type}     ${Sub_type}     ${Boundary}
    ...             ${Version}      ${Base}     ${Disposition}      ${Handling}     ${Content_value}

Edit Manipulation Rules
    [Arguments]     ${Name}  ${Header}	  ${New_Header}  ${Action_type}     ${Element_type}	  ${Element_name}   ${Attribute}	  ${New_value}
    ...             ${Rule_value_new}    ${Rule_value_original}      ${Codec_type}    ${Instance}       ${Content_type}     ${Sub_type}     ${Boundary}
    ...             ${Version}      ${Base}     ${Disposition}      ${Handling}     ${Content_value}
    Click Element       ${ManiRule}
    Sleep   1s
    Click Edit Element With 2 Info      ${Name}    ${Header}
    Sleep  1s

    Run Keyword If  '${New_Header}' != '#BLANK'                    input text          ${Header_Field}                 ${New_Header}
    Sleep   1s
    Add_Edit ManipulationRules     ${Action_type}     ${Element_type}	  ${Element_name}   ${Attribute}	  ${New_value}
    ...             ${Rule_value_new}    ${Rule_value_original}      ${Codec_type}    ${Instance}       ${Content_type}     ${Sub_type}     ${Boundary}
    ...             ${Version}      ${Base}     ${Disposition}      ${Handling}     ${Content_value}

Add_Edit ManipulationRules
    [Arguments]     ${Action_type}     ${Element_type}	  ${Element_name}   ${Attribute}	  ${New_value}
    ...             ${Rule_value_new}    ${Rule_value_original}      ${Codec_type}    ${Instance}       ${Content_type}     ${Sub_type}     ${Boundary}
    ...             ${Version}      ${Base}     ${Disposition}      ${Handling}     ${Content_value}
    Sleep       3s
    Run Keyword If  '${Action_type}' != '#BLANK'                   Click Element        ${Action_Dropdown_List}
    Sleep  2s
    Run Keyword If      '${Action_type}' == 'Add'                   Click Element       ${Action_Add}
    ...     ELSE IF     '${Action_type}' == 'Del'                   Click Element       ${Action_Del}
    ...     ELSE IF     '${Action_type}' == 'Replace'               Click Element       ${Action_Replace}
    ...     ELSE IF     '${Action_type}' == 'Modify'                Click Element       ${Action_Modify}
    ...     ELSE IF     '${Action_type}' == 'Store'                 Click Element       ${Action_Store}
    ...     ELSE IF     '${Action_type}' == 'Store_in_session'      Click Element       ${Action_Store_in_session}
    ...     ELSE IF     '${Action_type}' == 'Add_quote'             Click Element       ${Action_Add_quote}
    ...     ELSE IF     '${Action_type}' == 'Del_quotel'            Click Element       ${Action_Del_quote}
    ...     ELSE IF     '${Action_type}' == 'Set_sip_to_tel'        Click Element       ${Action_Set_sip_to_tel}
    ...     ELSE IF     '${Action_type}' == 'Set_tel_to_sip'        Click Element       ${Action_Set_tel_to_sip}
    ...     ELSE                                                    Click Element       ${Action_Add}
    Sleep       3s
    Run Keyword If      '${Element_type}' != '#BLANK'                   Click Element       ${Element_Dropdown_List}
    Sleep  5s
    Run Keyword If      '${Element_type}' == 'HEADER-NAME'              Click Element       ${Element_Header_Name}
    ...     ELSE IF     '${Element_type}' == 'HEADER-VALUE'             Click Element       ${Element_Header_Value}
    ...     ELSE IF     '${Element_type}' == 'HEADER-PARAM'             Click Element       ${Element_Header_Param}
    ...     ELSE IF     '${Element_type}' == 'HEADER-PARAM-NAME'        Click Element       ${Element_Param_Name}
    ...     ELSE IF     '${Element_type}' == 'URI-VALUE'                Click Element       ${Element_Uri_Value}
    ...     ELSE IF     '${Element_type}' == 'URI-PARAM'                Click Element       ${Element_Uri_Param}
    ...     ELSE IF     '${Element_type}' == 'URI-PARAM-NAME'           Click Element       ${Element_Uri_Param_Name}
    ...     ELSE IF     '${Element_type}' == 'URI-USER'                 Click Element       ${Element_Uri_User}
    ...     ELSE IF     '${Element_type}' == 'URI-USER-PARAM'           Click Element       ${Element_Uri_User_Param}
    ...     ELSE IF     '${Element_type}' == 'URI-HOST'                 Click Element       ${Element_Uri_Host}
    ...     ELSE IF     '${Element_type}' == 'URI-PORT'                 Click Element       ${Element_Uri_Port}
    ...     ELSE IF     '${Element_type}' == 'URI-DISPLAY'              Click Element       ${Element_Uri_Display}
    ...     ELSE IF     '${Element_type}' == 'URI-TYPE'                 Click Element       ${Element_Uri_Type}
    ...     ELSE IF     '${Element_type}' == 'URI-TEL-NUM'              Click Element       ${Element_Uri_Tel}
    ...     ELSE IF     '${Element_type}' == 'STATUS-CODE'              Click Element       ${Element_Status_Code}
    ...     ELSE IF     '${Element_type}' == 'REASON-PHRASE'            Click Element       ${Element_Reason_Phrase}
    ...     ELSE IF     '${Element_type}' == 'APPLICATION-NAME'         Click Element       ${Element_Application_Name}
    ...     ELSE IF     '${Element_type}' == 'SDP-MEDIA'                Click Element       ${Element_Sdp_Media}
    ...     ELSE IF     '${Element_type}' == 'SDP-SESSION'              Click Element       ${Element_Sdp_Session}
    ...     ELSE IF     '${Element_type}' == 'MESSAGE-BODY'              Click Element       ${Element_Message_Body}
    ...     ELSE                                                        Click Element       ${Element_Header_Name}
    Sleep  2s
    Run Keyword If  '${Element_name}' != '#BLANK'                   input text          ${Element_Name_Field}                 ${Element_name}
    Run Keyword If  '${Attribute}' != '#BLANK'                      input text          ${Attribute_Field}                    ${Attribute}
    Run Keyword If  '${New_value}' != '#BLANK'                      input text          ${New_Value_Field}                    "${New_value}"
    Run Keyword If  '${Rule_value_new}' != '#BLANK'                 input text          ${Rule_Value_New_Field}               "${Rule_value_new}"
    Run Keyword If  '${Rule_value_original}' != '#BLANK'            input text          ${Rule_Value_Original_Field}          "${Rule_value_original}"
    Run Keyword If  '${Codec_type}' != '#BLANK'                     input text          ${Codec_Type_Field}                   ${Codec_type}
    Run Keyword If  '${Instance}' != '#BLANK'                       input text          ${Instance_Field}                     "${Instance}"
    Run Keyword If  '${Content_type}' != '#BLANK'                   input text          ${Content_Type_Field}                 ${Content_type}
    Run Keyword If  '${Sub_type}' != '#BLANK'                       input text          ${Sub_Type_Field}                     ${Sub_type}
    Run Keyword If  '${Boundary}' != '#BLANK'                       input text          ${Boundary_Field}                     ${Boundary}
    Run Keyword If  '${Version}' != '#BLANK'                        input text          ${Version_Field}                      ${Version}
    Run Keyword If  '${Base}' != '#BLANK'                           input text          ${Base_Field}                         ${Base}
    Run Keyword If  '${Disposition}' != '#BLANK'                    input text          ${Disposition_Field}                  ${Disposition}
    Run Keyword If  '${Handling}' != '#BLANK'                       input text          ${Handling_Field}                     ${Handling}
    Run Keyword If  '${Content_value}' != '#BLANK'                  input text          ${Content_Value_Field}                ${Content_value}

    Click Element       ${Confirm_Add_MatRul}
    Sleep       3s

View Manipulation
    [Arguments]     ${Mani_rule_name}  ${Header_name}  ${Action_type}

    Click Element       ${ManiRule}
    Sleep   1s
    Click View Element With 2 Info          ${Mani_rule_name}    ${Header_name}
    Sleep       3s

    Verify Page Contains 2 Expected Elements    Manipulation rule name                        ${Mani_rule_name}
    Verify Page Contains 2 Expected Elements    Header name                               ${Header_name}
    Verify Page Contains 2 Expected Elements    Action type                               ${Action_type}

#Add Header Authorization Profiles
    #[Arguments]   ${Name}  ${Method_type}	${Policy}	 ${Return_code}   ${Matching_rule}

    #Click Element       ${HAP_Field}
    #Sleep   1s
    #Click Element       ${Add_Button}
    #Sleep       2s

    #Run Keyword If  '${Name}' != '#BLANK'                     input text          ${Name_Field}                     ${Name}
    #Sleep       1s
    #Run Keyword If  '${Method_type}' != '#BLANK'              input text          ${Method_Type_Field}              ${Method_type}
    #Sleep       1s
    #Run Keyword If      '${Policy}' == 'Accept'                   Click Element       ${Policy_Accept}
    #...     ELSE IF     '${Policy}' == 'Reject'                   run keywords          Click Element       id=PolicyReject    AND     input text      id=return_code      ${Return_code}
    #...     ELSE IF      '${Policy}' == 'Ignore'                  Click Element       ${Policy_Ignore}
    #...     ELSE                                                  Click Element       ${Policy_Accept}

    #Sleep       1s
    #Run Keyword If  '${Matching_rule}' != '#BLANK'            input text           ${Maching_Rules_Field}            ${Matching_rule}
    #Sleep       1s
    #Click Element       ${Confirm_Add_HAP}
    #Sleep       3s

Add Header Authorization Profiles
    [Arguments]   ${Name}  ${Method_type}	${Policy}	 ${Matching_rule}  ${Return_code}  ${Reason_protocol}   ${Reason_cause}  ${Reason_text}

    Click Element       ${HAP_Field}
    Sleep   1s
    Click Element       ${Add_Button}
    Sleep       2s

    Run Keyword If  '${Name}' != '#BLANK'                     input text          ${Name_Field}                     ${Name}
    Sleep       2s
    Run Keyword If  '${Method_type}' != '#BLANK'                  input text          ${Method_Type_Field}              ${Method_type}
    Sleep       2s

    Run Keyword If      '${Policy}' == 'Accept'                                  Click Element       ${Policy_Accept}
    #...     ELSE IF     '${Policy}' == 'Reject'            run keywords          Click Element       ${Policy_Reject}           AND     input text      ${Return_Code_Field}      ${Return_code}
    ...     ELSE IF     '${Policy}' == 'Reject'                                  Click Element       ${Policy_Reject}
    ...     ELSE IF     '${Policy}' == 'Ignore'                                  Click Element       ${Policy_Ignore}
    ...     ELSE                                                                 Click Element       ${Policy_Accept}

    Sleep       2s
    Run Keyword If  '${Matching_rule}' != '#BLANK'            input text           ${Maching_Rules_Field_HAP}            ${Matching_rule}
    Sleep       2s

    Run Keyword If  '${Policy}' == 'Reject' and '${Return_code}' != '#BLANK'     input text          ${Return_Code_Field}       ${Return_code}

    Run Keyword If      '${Reason_protocol}' == 'None'                           Click Element       ${Reason_protocol_None}
    ...     ELSE IF     '${Reason_protocol}' == 'SIP'      run keywords          Click Element       ${Reason_protocol_SIP}
    ...     AND     input text      ${Reason_cause_Field}      ${Reason_cause}   AND   input text    ${Reason_text_Field}       ${Reason_text}
    ...     ELSE IF     '${Reason_protocol}' == 'Q.850'    run keywords          Click Element       ${Reason_protocol_Q.850}   AND     input text   ${Reason_cause_Field}      ${Reason_cause}
    Sleep       2s
    Click Element       ${Confirm_Add_HAP1}
    Sleep       3s

Add And Then View Header Authorization Profiles
    [Arguments]     ${Name}    ${Method_type}  ${Policy}  ${Matching_rule}  ${Reason_protocol}   ${Reason_cause}  ${Reason_text}

    Click Element       ${HAP_Field}
    Sleep   1s

    Run Keyword If  '${Name}' == 'auto_HAP_12'      Click Element     ${Next_page}
    Run Keyword If  '${Name}' == 'auto_HAP_15'      Click Element     ${Next_page}
    Run Keyword If  '${Name}' == 'auto_HAP_17'      Click Element     ${Next_page}
    Sleep  5s

    Click View Element With 2 Info          ${Name}    ${Policy}
    Sleep       3s

    Verify Page Contains 2 Expected Elements    Name                                 ${Name}
    Verify Page Contains 2 Expected Elements    Policy                               ${Policy}
    Verify Page Contains 2 Expected Elements    Method type                          ${Method_type}

    Run Keyword If  '${Matching_rule}' != '#BLANK'                                          Verify Page Contains 2 Expected Elements    Matching rules                     ${Matching_rule}
    Run Keyword If  '${Reason_protocol}' != '#BLANK' and '${Reason_protocol}' !='None'      Verify Page Contains 2 Expected Elements    Reason protocol                    ${Reason_protocol}
    Run Keyword If  '${Reason_cause}' != '#BLANK'                                           Verify Page Contains 2 Expected Elements    Reason cause                       ${Reason_cause}
    Run Keyword If  '${Reason_text}' != '#BLANK'                                            Verify Page Contains 2 Expected Elements    Reason text                        ${Reason_text}

View Header Authorization Profiles
    [Arguments]     ${Name}    ${Method_type}  ${Policy}  ${Matching_rule}

    Click Element       ${HAP_Field}
    Sleep   1s
    Click View Element With 2 Info          ${Name}    ${Policy}
    Sleep       3s

    Verify Page Contains 2 Expected Elements    Name                                 ${Name}
    Verify Page Contains 2 Expected Elements    Policy                               ${Policy}
    Verify Page Contains 2 Expected Elements    Method type                          ${Method_type}

    Run Keyword If  '${Matching_rule}' != '#BLANK'          Verify Page Contains 2 Expected Elements    Matching rules                          ${Matching_rule}

Add Authorization Profiles
    [Arguments]   ${Index}  ${Default_authorization}	 ${Return_code}   ${Header_authorization_filter}    ${Method1}   ${Subscribe_event1}      ${Authorization1}    ${Return_code1}    ${less_more_authprofile}     ${Method2}   ${Subscribe_event2}      ${Authorization2}    ${Return_code2}

    Click Element       ${AP_Field}
    Sleep   1s
    Click Element       ${Add_Button}
    Sleep       2s

    Run Keyword If  '${Index}' != '#BLANK'                     input text          ${Index_Field}                     ${Index}
    Sleep       1s

    Run Keyword If      '${Default_authorization}' == 'accept'                   Click Element       ${Default_Accept_Field}
    ...     ELSE IF     '${Default_authorization}' == 'reject'        run keywords      Click Element       id=btn-reject   AND   input text      id=default    ${Return_code}

    Add_Edit Authorization Profiles     ${Default_authorization}	 ${Return_code}   ${Header_authorization_filter}    ${Method1}   ${Subscribe_event1}      ${Authorization1}    ${Return_code1}    ${less_more_authprofile}     ${Method2}   ${Subscribe_event2}      ${Authorization2}    ${Return_code2}

Edit Authorization Profiles
    [Arguments]   ${Index}      ${Default_authorization}	${New_Default_authorization}     ${Return_code}   ${Header_authorization_filter}    ${Method1}   ${Subscribe_event1}      ${Authorization1}    ${Return_code1}    ${less_more_authprofile}     ${Method2}   ${Subscribe_event2}      ${Authorization2}    ${Return_code2}

    Click Element       ${AP_Field}
    Sleep   1s
    Click Edit Element With 2 Info      ${Index}    ${Default_authorization}
    Sleep       2s

    Run Keyword If      '${New_Default_authorization}' == 'accept'                   Click Element       ${Default_Accept_Field}
    ...     ELSE IF     '${New_Default_authorization}' == 'reject'        run keywords      Click Element       id=btn-reject   AND   input text      id=default    ${Return_code}

    Add_Edit Authorization Profiles     ${Default_authorization}	 ${Return_code}   ${Header_authorization_filter}    ${Method1}   ${Subscribe_event1}      ${Authorization1}    ${Return_code1}    ${less_more_authprofile}     ${Method2}   ${Subscribe_event2}      ${Authorization2}    ${Return_code2}

Add_Edit Authorization Profiles
    [Arguments]   ${Default_authorization}	 ${Return_code}   ${Header_authorization_filter}    ${Method1}   ${Subscribe_event1}      ${Authorization1}    ${Return_code1}    ${less_more_authprofile}     ${Method2}   ${Subscribe_event2}      ${Authorization2}    ${Return_code2}



    Run Keyword If      '${Header_authorization_filter}' != '#BLANK'                   Click Element       ${HAP_Dropdown}
    Sleep   3s
    Run Keyword If      '${Header_authorization_filter}' == 'Sample_HAP1'                             Click Element       ${HAP_1}
    Sleep   1s
    Run Keyword If      '${Header_authorization_filter}' == 'Sample_HAP2'                              run keywords           Click Element       ${HAP_2}      AND     Click Element        ${HAP_1}
    Sleep   1s

    Click Element             ${HAP_Label}
    Sleep  1s
    Run Keyword If      '${Method1}' != '#BLANK'                   run keywords        Click Element       xpath=//button[contains(text(),'Method')]     AND     input text      id=auth_profiles-0-method_name      ${Method1}
    Run Keyword If      '${Subscribe_event1}' != '#BLANK'         run keywords        Click Element       xpath=//button[contains(text(),'Subscribe event')]     AND     input text      id=auth_profiles-0-method_name      ${Subscribe_event1}

    Run Keyword If      '${Authorization1}' == 'Accept'        Click Element       ${Authorization_Accept_Field1}
    ...     ELSE IF     '${Authorization1}' == 'Reject'        run keywords      Click Element      xpath=//div[@class='col s1.5']//button[@type='submit'][contains(text(),'Reject')]   AND     Sleep   2s   AND   input text        id=auth_profiles-0-code       ${Return_code1}
    Sleep  1s
#add the second authprofile
    Run Keyword If      '${less_more_authprofile}' == 'add'                   Click Element       ${Add_Authprofile_Button}
    Sleep  1s
#remove the second authprofile
    Run Keyword If      '${less_more_authprofile}' == 'remove'                   Click Element       ${Remove_Authprofile_Button}
    Sleep  1s

    Run Keyword If      '${Method2}' != '#BLANK'                   run keywords        Click Element       xpath=//fieldset[@class='optional-info']/fieldset[2]/child::div//button[contains(.,'Method')]     AND     input text      id=auth_profiles-1-method_name      ${Method2}
    Run Keyword If      '${Subscribe_event2}' != '#BLANK'         run keywords        Click Element       xpath=//fieldset[@class='optional-info']/fieldset[2]/child::div//button[contains(.,'Subscribe event')]     AND     input text      id=auth_profiles-1-method_name      ${Subscribe_event2}

    Run Keyword If      '${Authorization2}' == 'Accept'        Click Element       ${Authorization_Accept_Field2}
    ...     ELSE IF     '${Authorization2}' == 'Reject'        run keywords      Click Element      xpath=//fieldset[@class='optional-info']/fieldset[2]/child::div//button[contains(.,'Reject')]   AND     Sleep   2s   AND   input text        id=auth_profiles-1-code       ${Return_code2}
    Sleep  1s
    Click Element       ${Confirm_Add_HAP}
    Sleep       3s

View Authorization Profiles
    [Arguments]     ${Name}    ${Default_authorization}

    Click Element       ${AP_Field}
    Sleep   1s
    Click View Element With 2 Info          ${Name}    ${Default_authorization}
    Sleep       3s

    Verify Page Contains 2 Expected Elements    Index                                                ${Name}
    Verify Page Contains 2 Expected Elements    Default authorization                               ${Default_authorization}


Add Routing Profiles
    [Arguments]   ${Index}  ${Default_routing}	 ${Method_name1}   ${Forward_address1}      ${less_more_method}     ${Method_name2}   ${Forward_address2}

    Click Element       ${RP_Field}
    Sleep   1s
    Click Element       ${Add_Button}
    Sleep       2s

    Run Keyword If  '${Index}' != '#BLANK'                     input text          ${Index_RP_Field}                     ${Index}
    Sleep       1s

    Run Keyword If  '${Default_routing}' != '#BLANK'                     input text          ${Default_Routing_Field}                     ${Default_routing}

    Click Element         ${Add_Method_Button}
    Add_Edit Routing Profiles   ${Default_routing}	 ${Method_name1}   ${Forward_address1}      ${less_more_method}     ${Method_name2}   ${Forward_address2}

Edit Routing Profiles
    [Arguments]   ${Index}  ${Default_routing}	 ${New_Default_routing}      ${Method_name1}   ${Forward_address1}      ${less_more_method}     ${Method_name2}   ${Forward_address2}

    Click Element       ${RP_Field}
    Sleep   1s
    Click Edit Element With 2 Info      ${Index}    ${Default_routing}
    Sleep       2s

    Run Keyword If      '${New_Default_routing}' != '#BLANK'                     input text          ${Default_Routing_Field}                     ${New_Default_routing}

    Add_Edit Routing Profiles   ${New_Default_routing}	 ${Method_name1}   ${Forward_address1}      ${less_more_method}     ${Method_name2}   ${Forward_address2}

Add_Edit Routing Profiles
    [Arguments]   ${Default_routing}	 ${Method_name1}   ${Forward_address1}      ${less_more_method}     ${Method_name2}   ${Forward_address2}

    Run Keyword If  '${Method_name1}' != '#BLANK'                     input text          ${Method_Name_Field1}                     ${Method_name1}
    Run Keyword If  '${Forward_address1}' != '#BLANK'                     input text          ${Forward_Address_Field1}                     ${Forward_address1}
    Sleep       1s

    #Add more method
    Run Keyword If  '${less_more_method}' == 'add'                     Click Element         ${Add_Method_Button}
    #Remove method
    ...   ELSE IF  '${less_more_method}' == 'remove'                    Click Element         ${Remove_Method_Button}
    ...   ELSE                                                          Click Element         ${Add_Method_Button}

    Run Keyword If  '${Method_name2}' != '#BLANK'                     input text          ${Method_Name_Field2}                     ${Method_name2}
    Run Keyword If  '${Forward_address2}' != '#BLANK'                     input text          ${Forward_Address_Field2}                     ${Forward_address2}

    Click Element       ${Confirm_Add_HAP}
    Sleep       3s

Add Header Manipulation
    [Arguments]   ${Name}  ${Processing_order}  ${Method}  ${Method1}  ${Method2}  ${Method3}  ${Method4}  ${Method5}  ${Method6}  ${Method7}  ${Method8}  ${Method9}  ${Method10}  ${Method11}  ${Method12}  ${Method13}  ${Method14}   ${Manipulation_rule}  ${Manipulation_rule_1}  ${Manipulation_rule_2}   ${Message_type}     ${Direction}   ${Matching_rule}

    Click Element       ${HM_Field}
    Sleep   2s
    Click Element       ${Add_Button}
    Sleep       2s

    Run Keyword If  '${Name}' != '#BLANK'                     input text          ${Name_HM_Field}                     ${Name}
    Sleep       2s

    Run Keyword If  '${Processing_order}' != '#BLANK'                     Click Element          ${Processing_Dropdown_List}
    Sleep  3s
    Run Keyword If      '${Processing_order}' == 'IN'                           Click Element          ${Processing_Order_IN}
    ...  ELSE IF        '${Processing_order}' == 'OUT'                          Click Element          ${Processing_Order_OUT}
    ...  ELSE                                                                   Click Element          ${Processing_Order_IN}
    Sleep  2s

    Add_Edit Header Manipulation   ${Method}  ${Method1}  ${Method2}  ${Method3}  ${Method4}  ${Method5}  ${Method6}  ${Method7}  ${Method8}  ${Method9}  ${Method10}  ${Method11}  ${Method12}  ${Method13}  ${Method14}    ${Manipulation_rule}    ${Manipulation_rule_1}   ${Manipulation_rule_2}   ${Message_type}     ${Direction}   ${Matching_rule}

Edit Header Manipulation
    [Arguments]   ${Name}  ${Processing_order}  ${New_Processing_order}  ${Method}  ${Method1}  ${Method2}  ${Method3}  ${Method4}  ${Method5}  ${Method6}  ${Method7}  ${Method8}  ${Method9}  ${Method10}  ${Method11}  ${Method12}  ${Method13}  ${Method14}   ${Manipulation_rule}  ${Manipulation_rule_1}  ${Manipulation_rule_2}   ${Message_type}     ${Direction}   ${Matching_rule}

    Click Element       ${HM_Field}
    Sleep   1s
    Click Edit Element With 2 Info      ${Name}    ${Processing_order}
    Sleep       2s

    Run Keyword If  '${New_Processing_order}' != '#BLANK'                     Click Element          ${Processing_Dropdown_List}
    Sleep  3s
    Run Keyword If      '${New_Processing_order}' == 'IN'                           Click Element          ${Processing_Order_IN}
    ...  ELSE IF        '${New_Processing_order}' == 'OUT'                          Click Element          ${Processing_Order_OUT}
    ...  ELSE                                                                   Click Element          ${Processing_Order_IN}
    Sleep  1s

    Add_Edit Header Manipulation   ${Method}  ${Method1}  ${Method2}  ${Method3}  ${Method4}  ${Method5}  ${Method6}  ${Method7}  ${Method8}  ${Method9}  ${Method10}  ${Method11}  ${Method12}  ${Method13}  ${Method14}    ${Manipulation_rule}    ${Manipulation_rule_1}   ${Manipulation_rule_2}   ${Message_type}     ${Direction}   ${Matching_rule}

Add_Edit Header Manipulation
    [Arguments]    ${Method}   ${Method1}  ${Method2}  ${Method3}  ${Method4}  ${Method5}  ${Method6}  ${Method7}  ${Method8}  ${Method9}  ${Method10}  ${Method11}  ${Method12}  ${Method13}   ${Method14}   ${Manipulation_rule}   ${Manipulation_rule_1}   ${Manipulation_rule_2}   ${Message_type}     ${Direction}   ${Matching_rule}

    Run Keyword If  '${Method}' != '#BLANK'                         Click Element          ${Method_Dropdown_List}
    Sleep  5s
    Run Keyword If       '${Method1}' != '#BLANK'                           Click Element          ${Method_INVITE}
    Run Keyword If        '${Method2}' != '#BLANK'                         Click Element           ${Method_ACK}
    Run Keyword If        '${Method3}' != '#BLANK'                          Click Element          ${Method_OPTIONS}
    Run Keyword If        '${Method4}' != '#BLANK'                             Click Element       ${Method_BYE}
    Run Keyword If        '${Method5}' != '#BLANK'                          Click Element          ${Method_CANCEL}
    Run Keyword If        '${Method6}' != '#BLANK'                           Click Element         ${Method_REGISTER}
    Run Keyword If        '${Method7}' != '#BLANK'                            Click Element        ${Method_INFO}
    Run Keyword If        '${Method8}' != '#BLANK'                        Click Element            ${Method_PRACK}
    Run Keyword If        '${Method9}' != '#BLANK'                            Click Element        ${Method_SUBSCRIBE}
    Run Keyword If        '${Method10}' != '#BLANK'                           Click Element        ${Method_NOTIFY}
    Run Keyword If        '${Method11}' != '#BLANK'                           Click Element        ${Method_REFER}
    Run Keyword If       '${Method12}' != '#BLANK'                              Click Element      ${Method_UPDATE}
    Run Keyword If       '${Method13}' != '#BLANK'                          Click Element          ${Method_MESSAGE}
    Run Keyword If       '${Method14}' != '#BLANK'                              Click Element      ${Method_PUBLISH}

    Sleep       3s

    Click Element        ${MR_Label}
    Sleep  2s
    Run Keyword If      '${Manipulation_rule}' != '#BLANK'                Click Element          ${MR_Dropdown_List}
    Sleep  5s

    Run Keyword If      '${Manipulation_rule_1}' != '#BLANK'           Click Element          ${MR_1}

    Run Keyword If      '${Manipulation_rule_2}' != '#BLANK'           Click Element          ${MR_2}
    Sleep  2s
    Click Element           ${Message_Label}
    Sleep  2s
    Run Keyword If  '${Message_type}' != '#BLANK'                Click Element          ${Message_Dropdown_List}
    Sleep  3s
    Run Keyword If      '${Message_type}' == 'BOTH'           Click Element          ${Message_Type_Both}
    ...  ELSE IF        '${Message_type}' == 'REQUEST'        Click Element          ${Message_Type_Request}
    ...  ELSE IF        '${Message_type}' == 'RESPONSE'       Click Element          ${Message_Type_Response}
    Sleep  2s
    Run Keyword If  '${Direction}' != '#BLANK'         Click Element          ${Direction_Dropdown_List}
    Sleep  7s
    Run Keyword If      '${Direction}' == 'BOTH'                Click Element          ${Direction_Both}
    ...  ELSE IF        '${Direction}' == 'CORE_TO_PEER'        Click Element       ${Direction_Core_To_Peer}
    ...  ELSE IF        '${Direction}' == 'PEER_TO_CORE'       Click Element       ${Direction_Peer_To_Core}
    Sleep  2s
    Run Keyword If  '${Matching_rule}' != '#BLANK'          input text          ${Maching_Rules_Field}                     ${Matching_rule}
    Sleep  2s
    Click Element       ${Confirm_Add_MatRul}
    Sleep       3s

View Header Manipulation
    [Arguments]     ${Manipulation_profile}  ${Processing_order}  ${Message_type}  ${Direction}  ${Matching_rule}

    Click Element       ${HM_Field}
    Sleep   1s
    Click View Element With 2 Info          ${Manipulation_profile}  ${Processing_order}
    Sleep       3s

    Verify Page Contains 2 Expected Elements    SIP manipulation profile                                ${Manipulation_profile}
    Verify Page Contains 2 Expected Elements    Processing order                                        ${Processing_order}
    Verify Page Contains 2 Expected Elements    Message Type                                            ${Message_type}
    Verify Page Contains 2 Expected Elements    Direction                                               ${Direction}
    Run Keyword If  '${Matching_rule}' != '#BLANK'          Verify Page Contains 2 Expected Elements    Matching rule                          ${Matching_rule}

#Add SDP Profile
    #[Arguments]   ${Index}  ${Media}  ${Media_audio}    ${Media_video}  ${Media_t38}   ${Max_ptime}  ${Default_priority}      ${Default_behavior}     ${Applicability}
    #...             ${less_more_SDP_rule}     ${Codec}    ${Behavior}     ${Media_type}    ${Priority}    ${Condition}

   #Click Element       ${SP_Field}
   #Sleep   1s
   #Click Element       ${Add_Button}
   #Sleep       2s

   #Run Keyword If  '${Index}' != '#BLANK'                     input text          ${Index_Field}                   ${Index}
   #Sleep       1s

   #Add_Edit SDP Profile  ${Media}  ${Media_audio}    ${Media_video}      ${Media_t38}    ${Max_ptime}    ${Default_priority}      ${Default_behavior}     ${Applicability}
   #...           ${less_more_SDP_rule}     ${Codec}    ${Behavior}     ${Media_type}    ${Priority}    ${Condition}

Add SDP Profile
    [Arguments]   ${Index}  ${Media_Audio}  ${Media_Video}  ${Media_T38}  ${Max_ptime}  ${Default_priority}      ${Default_behavior}     ${Applicability}
    ...             ${less_more_SDP_rule}     ${Codec}    ${Behavior}     ${Media_type}    ${Priority}    ${Condition}   ${Clockrate}

    Click Element       ${SP_Field}
    Sleep   1s
    Click Element       ${Add_Button}
    Sleep       2s

    Run Keyword If  '${Index}' != '#BLANK'                     input text          ${Index_Field}                   ${Index}
    Sleep       1s

    Add_Edit SDP Profile  ${Index}  ${Media_Audio}  ${Media_Video}  ${Media_T38}   ${Max_ptime}    ${Default_priority}      ${Default_behavior}     ${Applicability}
    ...           ${less_more_SDP_rule}     ${Codec}    ${Behavior}     ${Media_type}    ${Priority}    ${Condition}   ${Clockrate}

#Edit SDP Profile
    #[Arguments]   ${Index}  ${Media}  ${Media_audio}    ${Media_video}  ${Media_t38}   ${Max_ptime}    ${Default_priority}      ${Default_behavior}   ${New_Default_behavior}   ${Applicability}
    #...             ${less_more_SDP_rule}     ${Codec}    ${Behavior}     ${Media_type}    ${Priority}    ${Condition}

   # #Click Element       ${SP_Field}
   # Sleep   1s
   # Click Edit Element With 2 Info      ${Index}    ${Default_behavior}
   # Sleep       2s

   # Add_Edit SDP Profile    ${Media}  ${Media_audio}    ${Media_video}      ${Media_t38}    ${Max_ptime}    ${Default_priority}      ${New_Default_behavior}     ${Applicability}
   # ...           ${less_more_SDP_rule}     ${Codec}    ${Behavior}     ${Media_type}    ${Priority}    ${Condition}

Edit Valid SDP Profile
    [Arguments]   ${Index}  ${Media_Audio}  ${Media_Video}  ${Media_T38}   ${Max_ptime}    ${Default_priority}     ${New_Default_behavior}   ${Applicability}
    ...             ${less_more_SDP_rule}     ${Codec}    ${Behavior}     ${Media_type}    ${Priority}    ${Condition}  ${Clockrate}  ${Xpath_Default_behavior_Edit_Button}

    Click Element       ${SP_Field}
    Sleep   1s

    Run Keyword If  '${Index}' == '31'      Click Element     ${Next_page}
    Sleep       2s

    Click Edit Element With 2 Info      ${Index}    ${Xpath_Default_behavior_Edit_Button}
    Sleep       2s

    Add_Edit SDP Profile  ${Index}   ${Media_Audio}  ${Media_Video}  ${Media_T38}    ${Max_ptime}    ${Default_priority}      ${New_Default_behavior}     ${Applicability}
    ...           ${less_more_SDP_rule}     ${Codec}    ${Behavior}     ${Media_type}    ${Priority}    ${Condition}  ${Clockrate}

#Add_Edit SDP Profile
   #[Arguments]   ${Media}  ${Media_audio}    ${Media_video}      ${Media_t38}    ${Max_ptime}    ${Default_priority}      ${Default_behavior}     ${Applicability}
   #...           ${less_more_SDP_rule}     ${Codec}    ${Behavior}     ${Media_type}    ${Priority}    ${Condition}

   #Run Keyword If    '${Media}' != '#BLANK'               Click Element       ${Media_Dropdown_List}
   #Sleep  1s

   #Run Keyword If    '${Media_audio}' == 'AUDIO'               Click Element       ${Media_Audio_Field}

   #Run Keyword If    '${Media_video}' == 'VIDEO'               Click Element       ${Media_Video_Field}

   #Run Keyword If    '${Media_t38}' == 'T38'                   Click Element       ${Media_T38_Field}

   #Click Element       ${Max_ptime_lable}

   #Run Keyword If  '${Max_ptime}' != '#BLANK'                     input text          ${Max_Ptime_Field}                   ${Max_ptime}
   #Sleep       1s

   #Run Keyword If  '${Default_priority}' != '#BLANK'                     input text          ${Default_Priority_Field}                   ${Default_priority}
   #Sleep       1s

   #Run Keyword If  '${Default_behavior}' != '#BLANK'                     Click Element          ${Default_Behavior_Dropdown_List}
   #Sleep       2s

   #Run Keyword If  '${Default_behavior}' == 'NONE'                         Click Element          ${Default_Behavior_None}
   #...   ELSE IF   '${Default_behavior}' == 'ACCEPT'                       Click Element          ${Default_Behavior_Accept}
   #...   ELSE IF   '${Default_behavior}' == 'REJECT'                       Click Element          ${Default_Behavior_Reject}
   #Sleep  3s

   #Run Keyword If  '${Applicability}' != '#BLANK'                     Click Element          ${Applicability_Dropdown_List}
   #Sleep       1s

   #Run Keyword If  '${Applicability}' == 'none'                         Click Element          ${Applicability_None}
   #...   ELSE IF   '${Applicability}' == 'home'                         Click Element          ${Applicability_Home}
   #...   ELSE IF   '${Applicability}' == 'extern'                       Click Element          ${Applicability_Extern}
   #Sleep  1s

   #Run Keyword If   '${less_more_SDP_rule}' == 'add'               Click Element               ${Add_SDP_rule_button}
   #Sleep       3s
   #Run Keyword If   '${less_more_SDP_rule}' == 'remove'               Click Element               ${Remove_SDP_rule_button}
   #Sleep  2s

   #Run Keyword If  '${Codec}' != '#BLANK'                     input text          ${Codec_Field}                   "${Codec}"
   #Sleep       1s

   #Run Keyword If  '${Behavior}' != '#BLANK'                     Click Element          ${Behavior_Dropdown_List}
   #Sleep       2s

   #Run Keyword If  '${Behavior}' == 'ACCEPT'                         Click Element          ${Behavior_Accept}
   #...   ELSE IF   '${Behavior}' == 'REJECT'                       Click Element          ${Behavior_Reject}
   #...   ELSE IF   '${Behavior}' == 'CONREJECT'                       Click Element          ${Behavior_Conreject}
   #Sleep  1s

   #Run Keyword If  '${Media_type}' != '#BLANK'                     Click Element          ${Media_Type_Dropdown_List}
   #Sleep       1s

   #Run Keyword If  '${Media_type}' == 'AUDIO'                         Click Element          ${Media_Type_Audio}
   #...   ELSE IF   '${Media_type}' == 'VIDEO'                       Click Element            ${Media_Type_Video}
   #Sleep  1s

   #Run Keyword If  '${Priority}' != '#BLANK'                     input text          ${Priority_SDP_Field}                   ${Priority}
   #Sleep       1s

   #Run Keyword If  '${Condition}' != '#BLANK'                     input text          ${Condition_Field}                   "${Condition}"
   #Sleep       1s

   #Click Element       ${Confirm_Add_HAP}
   #Sleep       3s

Add_Edit SDP Profile
    [Arguments]   ${Index}  ${Media_Audio}  ${Media_Video}  ${Media_T38}  ${Max_ptime}    ${Default_priority}      ${Default_behavior}     ${Applicability}
    ...           ${less_more_SDP_rule}     ${Codec}    ${Behavior}     ${Media_type_Rule}    ${Priority}    ${Condition}  ${Clockrate}

    Run Keyword If    '${Index}' != '#BLANK'               Click Element       ${Media_Dropdown_List}
    Sleep  5s

    Run Keyword If    '${Media_Audio}' == 'AUDIO'               Click Element       ${Media_Audio_Field}

    Run Keyword If    '${Media_Video}' == 'VIDEO'               Click Element       ${Media_Video_Field}

    Run Keyword If    '${Media_T38}' == 'T38'                   Click Element       ${Media_T38_Field}

    Sleep  1s
    Press Keys    None    ESC
    Sleep  2s

    Click Element       ${Max_ptime_lable}

    Run Keyword If  '${Max_ptime}' != '#BLANK'                     input text          ${Max_Ptime_Field}                   ${Max_ptime}
    Sleep       1s

    Run Keyword If  '${Default_priority}' != '#BLANK'                     input text          ${Default_Priority_Field}                   ${Default_priority}
    Sleep       2s

    Run Keyword If  '${Default_behavior}' != '#BLANK'        run keywords     Click Element     ${Default_Behavior_Dropdown_List}  AND  Sleep  2s  AND  Page Should not contain element    ${Default_Behavior_None}
    Sleep  2s
    #26143 Default Behavior field, the web don't display "None" value
    #Run Keyword If  '${Default_behavior}' == 'NONE'                         Click Element          ${Default_Behavior_None}
    Run Keyword If   '${Default_behavior}' == 'ACCEPT'                       Click Element          ${Default_Behavior_Accept}
    ...    ELSE IF   '${Default_behavior}' == 'REJECT'                       Click Element          ${Default_Behavior_Reject}
    Sleep  3s

    Run Keyword If  '${Applicability}' != '#BLANK'           run keywords            Click Element      ${Applicability_Dropdown_List}  AND  Sleep  2s  AND  Page Should not contain element    ${Applicability_None}
    Sleep       2s
    #26143 The web will update "Home/Extern" instead of "None" for Applicability field
    Run Keyword If  '${Applicability}' == 'home/extern'                  Click Element          ${Applicability_Home/Extern}
    ...   ELSE IF   '${Applicability}' == 'home'                         Click Element          ${Applicability_Home}
    ...   ELSE IF   '${Applicability}' == 'extern'                       Click Element          ${Applicability_Extern}
    Sleep  1s

    Run Keyword If   '${less_more_SDP_rule}' == 'add'               Click Element               ${Add_SDP_rule_button}
    Sleep       3s
    Run Keyword If   '${less_more_SDP_rule}' == 'remove'            Click Element               ${Remove_SDP_rule_button}
    Sleep  2s
    Run Keyword If   '${less_more_SDP_rule}' == 'cancel'            Click Element               ${Cancel_SDP}
    Sleep  2s

    Run Keyword If  '${Codec}' != '#BLANK'                     input text          ${Codec_Field}                   "${Codec}"
    Sleep       3s

    #Run Keyword If  '${Behavior}' != '#BLANK'                     Click Element          ${Behavior_Dropdown_List} --->Change Behavior #26157

    Run Keyword If  '${Behavior}' == 'ACCEPT'        Click Element    ${Behavior_Accept}
    ...   ELSE IF   '${Behavior}' == 'REJECT'        Click Element    ${Behavior_Reject}
    ...   ELSE IF   '${Behavior}' == 'CONREJECT'     Click Element    ${Behavior_Conreject}
    Sleep  2s

    Run Keyword If  '${Media_type_Rule}' != '#BLANK'                     Click Element          ${Media_Type_Dropdown_List}
    Sleep       2s

    Run Keyword If  '${Media_type_Rule}' == 'AUDIO'                       Click Element          ${Media_Type_Audio}
    ...   ELSE IF   '${Media_type_Rule}' == 'VIDEO'                       Click Element          ${Media_Type_Video}
    Sleep  2s

    Run Keyword If  '${Priority}' != '#BLANK'                 input text          ${Priority_SDP_Field}                ${Priority}
    Sleep       1s

    Run Keyword If  '${Condition}' != '#BLANK'                input text          ${Condition_Field}                 "${Condition}"
    Sleep       1s

    Run Keyword If  '${Behavior}' == 'REJECT'                     input text          ${Clockrate_Field}                   ${Clockrate}
    Sleep       1s

    Run Keyword If   '${less_more_SDP_rule}' != 'cancel'          Click Element       ${Confirm_Add_SDP}
    Sleep       3s

View SDP Profile
    [Arguments]     ${Index}    ${Media_type}   ${Max_ptime}  ${Default}  ${Applicability}  ${less_more_SDP_rule}  ${SDP_Rule}   ${Xpath_Media_type_View_Button}

    Click Element       ${SP_Field}
    Sleep   2s

    Run Keyword If  '${Index}' == '20'      Click Element     ${Next_page}
    Run Keyword If  '${Index}' == '21'      Click Element     ${Next_page}
    Run Keyword If  '${Index}' == '31'      Click Element     ${Next_page}
    Sleep  5s

    Run Keyword If   '${less_more_SDP_rule}' != 'cancel'          Click View Element With 2 Info       ${Index}    ${Xpath_Media_type__View_Button}
    Sleep       3s

    Run Keyword If   '${less_more_SDP_rule}' != 'cancel'                                          Verify Page Contains 2 Expected Elements           Index                 ${Index}
    Run Keyword If  '${Media_type}' != '#BLANK'                                                   Verify Page Contains 2 Expected Elements           Media type            ${Media_type}
    Run Keyword If   '${less_more_SDP_rule}' != 'cancel'                                          Verify Page Contains 2 Expected Elements           Default               ${Default}
    Run Keyword If   '${less_more_SDP_rule}' != 'cancel'                                          Verify Page Contains 2 Expected Elements           Applicability         ${Applicability}
    Run Keyword If   '${less_more_SDP_rule}' != 'cancel' and '${Max_ptime}' !='#BLANK'            Verify Page Contains 2 Expected Elements           Max ptime             ${Max_ptime}
    Run Keyword If   '${less_more_SDP_rule}' == 'cancel'          page should not contain element      //td[contains(.,"${Index}")]/following-sibling::td[contains(.,"${Media_type}")][2]
    Run Keyword If   '${less_more_SDP_rule}' != 'cancel'          Verify Page Contains 1 Expected Elements           SDP rule
    #26158 Remove SDP
    Run Keyword If  '${Index}' == '11'                                               page should not contain element   //table[@id="optionnal-items"]//following-sibling::td[contains(.,"Behavior = Accept, Media type = AUDIO, Codec = PCMA, Priority = None")]
    Run Keyword If  '${Index}' == '12' and '${SDP_Rule}' == '#BLANK'                 page should not contain element   //table[@id="optionnal-items"]//following-sibling::td[contains(.,"Behavior = Reject, Media type = VIDEO, Codec = PCMA, Priority = None")]
    Run Keyword If  '${Index}' == '13' and '${SDP_Rule}' == '#BLANK'                 page should not contain element   //table[@id="optionnal-items"]//following-sibling::td[contains(.,"clockrate=90000")]
    Run Keyword If  '${SDP_Rule}' != '#BLANK'          page should contain element      //table[@id="optionnal-items"]//following-sibling::td[contains(.,"${SDP_Rule}")]

Add Session Limiter
    [Arguments]   ${Index}  ${Max_in}  ${Resume_in}    ${Max_out}  ${Resume_out}   ${Max_session}  ${Resume_session}      ${Safe_threshold}     ${Warn_threshold}
    ...             ${Error_run_code}     ${Reason_phrase}    ${Retry_after}     ${Step_value}    ${Step_number}

    Click Element       ${SLP_Field}
    Sleep   1s
    Click Element       ${Add_Button}
    Sleep       2s

    Run Keyword If  '${Index}' != '#BLANK'                      input text          ${Index_Field}                      ${Index}
    Sleep       1s

    Add_Edit Session Limiter    ${Max_in}  ${Resume_in}    ${Max_out}  ${Resume_out}   ${Max_session}  ${Resume_session}      ${Safe_threshold}     ${Warn_threshold}
    ...        ${Error_run_code}     ${Reason_phrase}    ${Retry_after}     ${Step_value}    ${Step_number}

Edit Session Limiter
    [Arguments]   ${Index}  ${Max_in}  ${New_Max_in}   ${Resume_in}    ${Max_out}  ${Resume_out}   ${Max_session}  ${Resume_session}      ${Safe_threshold}     ${Warn_threshold}
    ...             ${Error_run_code}     ${Reason_phrase}    ${Retry_after}     ${Step_value}    ${Step_number}

    Click Element       ${SLP_Field}
    Sleep   1s
    Click Edit Element With 2 Info      ${Index}    ${Max_in}
    Sleep       2s

    Add_Edit Session Limiter    ${New_Max_in}  ${Resume_in}    ${Max_out}  ${Resume_out}   ${Max_session}  ${Resume_session}      ${Safe_threshold}     ${Warn_threshold}
    ...             ${Error_run_code}     ${Reason_phrase}    ${Retry_after}     ${Step_value}    ${Step_number}

Add_Edit Session Limiter
    [Arguments]  ${Max_in}  ${Resume_in}    ${Max_out}  ${Resume_out}   ${Max_session}  ${Resume_session}      ${Safe_threshold}     ${Warn_threshold}
    ...             ${Error_run_code}     ${Reason_phrase}    ${Retry_after}     ${Step_value}    ${Step_number}

    Run Keyword If  '${Max_in}' != '#BLANK'                     input text          ${Max_In_Field}                     ${Max_in}
    Run Keyword If  '${Resume_in}' != '#BLANK'                  input text          ${Resume_In_Field}                  ${Resume_in}
    Run Keyword If  '${Max_out}' != '#BLANK'                    input text          ${Max_Out_Field}                    ${Max_out}
    Run Keyword If  '${Resume_out}' != '#BLANK'                 input text          ${Resume_Out_Field}                 ${Resume_out}
    Run Keyword If  '${Max_session}' != '#BLANK'                input text          ${Max_Session_Field}                ${Max_session}
    Run Keyword If  '${Resume_session}' != '#BLANK'             input text          ${Resume_Session_Field}             ${Resume_session}
    Run Keyword If  '${Safe_threshold}' != '#BLANK'             input text          ${Safe_Threshold_Field}             ${Safe_threshold}
    Run Keyword If  '${Warn_threshold}' != '#BLANK'             input text          ${Warn_Threshold_Field}             ${Warn_threshold}
    Run Keyword If  '${Error_run_code}' != '#BLANK'             input text          ${Error_Run_Code_Field}             ${Error_run_code}
    Run Keyword If  '${Reason_phrase}' != '#BLANK'              input text          ${Reason_Phrase_Field}              ${Reason_phrase}
    Run Keyword If  '${Retry_after}' != '#BLANK'                input text          ${Retry_After_Field}                ${Retry_after}
    Run Keyword If  '${Step_value}' != '#BLANK'                 input text          ${Step_Value_Field}                 ${Step_value}
    Run Keyword If  '${Step_number}' != '#BLANK'                input text          ${Step_Number_Field}                ${Step_number}

    Click Element       ${Confirm_Add_HAP}
    Sleep       3s

View Session Limiter
    [Arguments]     ${Index}    ${Max_in}  ${Resume_in}    ${Max_out}  ${Resume_out}   ${Max_session}  ${Resume_session}      ${Safe_threshold}     ${Warn_threshold}
    ...             ${Error_run_code}     ${Reason_phrase}    ${Retry_after}     ${Step_value}    ${Step_number}

    Click Element       ${SLP_Field}
    Sleep   1s
    Click View Element With 2 Info          ${Index}    ${Max_in}
    Sleep       3s

    Verify Page Contains 2 Expected Elements    Index                                                           ${Index}
    Verify Page Contains 2 Expected Elements    Max in                                                          ${Max_in}
    Verify Page Contains 2 Expected Elements    Resume in                                                       ${Resume_in}
    Verify Page Contains 2 Expected Elements    Max out                                                         ${Max_out}
    Verify Page Contains 2 Expected Elements    Resume out                                                      ${Resume_out}
    Verify Page Contains 2 Expected Elements    Max session                                                     ${Max_session}
    Verify Page Contains 2 Expected Elements    Resume session                                                  ${Resume_session}
    Verify Page Contains 2 Expected Elements    Safe threshold                                                  ${Safe_threshold}
    Verify Page Contains 2 Expected Elements    Warning threshold                                               ${Warn_threshold}
    Verify Page Contains 2 Expected Elements    Error return code                                               ${Error_run_code}
    Verify Page Contains 2 Expected Elements    Reason phrase                                                   ${Reason_phrase}
    Verify Page Contains 2 Expected Elements    Retry after                                                     ${Retry_after}
    Verify Page Contains 2 Expected Elements    Step value                                                      ${Step_value}
    Verify Page Contains 2 Expected Elements    Step number                                                     ${Step_number}

Add Session Control
    [Arguments]   ${Name}  ${Incoming_max_session}  ${Outgoing_max_session}    ${Global_max_session}  ${less_more_limitation1}
    ...            ${Limit_media_type1}     ${Limit_in_session1}      ${Limit_out_session1}     ${Limit_glo_session1}      ${less_more_limitation2}
    ...            ${Limit_media_type2}     ${Limit_in_session2}      ${Limit_out_session2}     ${Limit_glo_session2}


    Scroll Element Into View    ${PCSCF_tab}
    Sleep  1s
    Click Element       ${SC_Field}
    Sleep   1s
    Click Element       ${Add_Button}
    Sleep       2s

    Run Keyword If  '${Name}' != '#BLANK'                      input text          ${Name_Field}                      ${Name}

    Add_Edit Session Control  ${Incoming_max_session}  ${Outgoing_max_session}    ${Global_max_session}  ${less_more_limitation1}
    ...            ${Limit_media_type1}     ${Limit_in_session1}      ${Limit_out_session1}     ${Limit_glo_session1}      ${less_more_limitation2}
    ...            ${Limit_media_type2}     ${Limit_in_session2}      ${Limit_out_session2}     ${Limit_glo_session2}

Edit Session Control
    [Arguments]   ${Name}  ${Incoming_max_session}  ${New_Incoming_max_session}   ${Outgoing_max_session}    ${Global_max_session}  ${less_more_limitation1}
    ...            ${Limit_media_type1}     ${Limit_in_session1}      ${Limit_out_session1}     ${Limit_glo_session1}      ${less_more_limitation2}
    ...            ${Limit_media_type2}     ${Limit_in_session2}      ${Limit_out_session2}     ${Limit_glo_session2}

    Scroll Element Into View    ${PCSCF_tab}

    Click Element       ${SC_Field}
    Sleep   1s
    Click Edit Element With 2 Info      ${Name}    ${Incoming_max_session}
    Sleep       2s

    Add_Edit Session Control  ${New_Incoming_max_session}  ${Outgoing_max_session}    ${Global_max_session}  ${less_more_limitation1}
    ...            ${Limit_media_type1}     ${Limit_in_session1}      ${Limit_out_session1}     ${Limit_glo_session1}      ${less_more_limitation2}
    ...            ${Limit_media_type2}     ${Limit_in_session2}      ${Limit_out_session2}     ${Limit_glo_session2}

Add_Edit Session Control
    [Arguments]   ${Incoming_max_session}  ${Outgoing_max_session}    ${Global_max_session}  ${less_more_limitation1}
    ...            ${Limit_media_type1}     ${Limit_in_session1}      ${Limit_out_session1}     ${Limit_glo_session1}      ${less_more_limitation2}
    ...            ${Limit_media_type2}     ${Limit_in_session2}      ${Limit_out_session2}     ${Limit_glo_session2}

    Run Keyword If  '${Incoming_max_session}' != '#BLANK'                      input text          ${Incoming_Max_Session_Field}                      ${Incoming_max_session}
    Run Keyword If  '${Outgoing_max_session}' != '#BLANK'                      input text          ${Outgoing_Max_Session_Field}                      ${Outgoing_max_session}
    Run Keyword If  '${Global_max_session}' != '#BLANK'                      input text            ${Global_Max_Session_Field}                        ${Global_max_session}
    Sleep  1s

    Run Keyword If      '${less_more_limitation1}' == 'add'          Click Element          ${Add_Limitation_Button}
    Sleep  2s

    Run Keyword If      '${less_more_limitation1}' == 'remove'      Click Element           ${Remove_Limitation_Button}
    Sleep  1s

    Run Keyword If  '${Limit_media_type1}' != '#BLANK'                     Click Element          ${Limit_Media1_Dropdown_List}
    Sleep       1s

    Run Keyword If  '${Limit_media_type1}' == 'AUDIO'                         Click Element          ${Limit_Media_Audio1}
    ...   ELSE IF   '${Limit_media_type1}' == 'VIDEO'                       Click Element            ${Limit_Media_Video1}
    ...   ELSE IF   '${Limit_media_type1}' == 'T38'                       Click Element              ${Limit_Media_T381}
    Sleep  1s

    Run Keyword If  '${Limit_in_session1}' != '#BLANK'                       input text          ${Limit_In_Session1_Field}                      ${Limit_in_session1}
    Run Keyword If  '${Limit_out_session1}' != '#BLANK'                      input text         ${Limit_Out_Session1_Field}                     ${Limit_out_session1}
    Run Keyword If  '${Limit_glo_session1}' != '#BLANK'                      input text         ${Limit_Glo_Session1_Field}                     ${Limit_glo_session1}

    Run Keyword If      '${less_more_limitation2}' == 'add'          Click Element          ${Add_Limitation_Button}
    Sleep       3s

    Run Keyword If      '${less_more_limitation2}' == 'remove'      Click Element           ${Remove_Limitation_Button}
    Sleep  2s

     Run Keyword If  '${Limit_media_type2}' != '#BLANK'                     Click Element          ${Limit_Media2_Dropdown_List}
    Sleep       1s

    Run Keyword If  '${Limit_media_type2}' == 'AUDIO'                         Click Element          ${Limit_Media_Audio2}
    ...   ELSE IF   '${Limit_media_type2}' == 'VIDEO'                       Click Element            ${Limit_Media_Video2}
    ...   ELSE IF   '${Limit_media_type2}' == 'T38'                       Click Element              ${Limit_Media_T382}
    Sleep  1s

    Run Keyword If  '${Limit_in_session2}' != '#BLANK'                       input text          ${Limit_In_Session2_Field}                      ${Limit_in_session2}
    Run Keyword If  '${Limit_out_session2}' != '#BLANK'                      input text         ${Limit_Out_Session2_Field}                     ${Limit_out_session2}
    Run Keyword If  '${Limit_glo_session2}' != '#BLANK'                      input text         ${Limit_Glo_Session2_Field}                     ${Limit_glo_session2}

    Click Element       ${Confirm_Add_HAP}
    Sleep       3s

View Session Control
    [Arguments]     ${Name}    ${IncomingMaxSession}  ${OutgoingMaxSession}  ${GlobalMaxSession}

    Scroll Element Into View    ${PCSCF_tab}
    Sleep  1s
    Click Element       ${SC_Field}
    Sleep   1s
    Click View Element With 2 Info          ${Name}    ${IncomingMaxSession}
    Sleep       3s

    Verify Page Contains 2 Expected Elements    Name                                                ${Name}
    Verify Page Contains 2 Expected Elements    IncomingMaxSession                                  ${IncomingMaxSession}
    Verify Page Contains 2 Expected Elements    OutgoingMaxSession                                  ${OutgoingMaxSession}
    Verify Page Contains 2 Expected Elements    GlobalMaxSession                                    ${GlobalMaxSession}

Add RFC4028
    [Arguments]   ${Index}  ${Min_expire}   ${Max_expire}    ${Session_expire}   ${Refresher}      ${Refresher_method}

    Scroll Element Into View    ${PCSCF_tab}
    Sleep  1s
    Click Element       ${RFC4028_Field}
    Sleep   1s
    Click Element       ${Add_Button}
    Sleep       2s

    Run Keyword If  '${Index}' != '#BLANK'                           input text               ${Id_Field}                      ${Index}
    Add_Edit RFC4028  ${Min_expire}  ${Max_expire}    ${Session_expire}  ${Refresher}      ${Refresher_method}

Edit RFC4028
    [Arguments]   ${Index}  ${Min_expire}   ${New_Min_expire}   ${Max_expire}    ${Session_expire}   ${Refresher}      ${Refresher_method}

    Scroll Element Into View    ${PCSCF_tab}
    Sleep  1s
    Click Element       ${RFC4028_Field}
    Sleep   1s
    Click Edit Element With 2 Info      ${Index}    ${Min_expire}
    Sleep       2s

    Add_Edit RFC4028  ${New_Min_expire}  ${Max_expire}    ${Session_expire}  ${Refresher}      ${Refresher_method}

Add_Edit RFC4028
    [Arguments]   ${Min_expire}  ${Max_expire}    ${Session_expire}  ${Refresher}      ${Refresher_method}

    Run Keyword If  '${Min_expire}' != '#BLANK'                      input text          ${Min_Expire_Field}                      ${Min_expire}
    Run Keyword If  '${Max_expire}' != '#BLANK'                      input text          ${Max_Expire_Field}                      ${Max_expire}
    Run Keyword If  '${Session_expire}' != '#BLANK'                  input text          ${Session_Expire_Field}                      ${Session_expire}

    Run Keyword If  '${Refresher}' != '#BLANK'                     Click Element          ${Refresher_Dropdown_List}
    Sleep       3s
    Run Keyword If  '${Refresher}' == 'PROXY'                      Click Element          ${Refresher_Proxy}
    ...   ELSE IF   '${Refresher}' == 'PEER'                       Click Element          ${Refresher_Peer}
    ...   ELSE IF   '${Refresher}' == 'NEGOTIATE'                  Click Element          ${Refresher_Negotiate}

    Sleep       2s
    Run Keyword If  '${Refresher_method}' != '#BLANK'                     Click Element          ${Refresher_Method_Dropdown_List}
    Sleep       3s
    Run Keyword If  '${Refresher_method}' == 'UPDATE'                       Click Element          ${Refresher_Method_UPDATE}
    ...   ELSE IF   '${Refresher_method}' == 'REINVITE'                       Click Element          ${Refresher_Method_REINVITE}

    Click Element  ${Confirm_Add_MatRul}
    Sleep       3s

View RFC4028
    [Arguments]     ${Index}    ${Session_expire}  ${Min_expire}  ${Max_expire}  ${Refresher_method}  ${Refresher}

    Scroll Element Into View    ${PCSCF_tab}
    Sleep  1s
    Click Element       ${RFC4028_Field}
    Sleep   1s
    Click View Element With 2 Info          ${Index}    ${Session_expire}
    Sleep       3s

    Verify Page Contains 2 Expected Elements    ID                                              ${Index}
    Verify Page Contains 2 Expected Elements    Session Expire                                  ${Session_expire}
    Verify Page Contains 2 Expected Elements    Min Expire                                      ${Min_expire}
    Verify Page Contains 2 Expected Elements    Max Expire                                      ${Max_expire}
    Verify Page Contains 2 Expected Elements    Refresh Method                                  ${Refresher_method}
    Verify Page Contains 2 Expected Elements    Refresher                                       ${Refresher}
Add Core Domain
    [Arguments]   ${Domain}

    Click Element       ${Core_Domain_Field}
    Sleep   1s
    Click Element       ${Add_Button}
    Sleep       2s

    Run Keyword If  '${Domain}' != '#BLANK'                           input text               ${Domain_Core_Field}                      ${Domain}

    Click Element  ${Confirm_Add_MatRul}
    Sleep       3s

Add Peer
    [Arguments]   ${Name}  ${Max_in}	${Max_out}	 ${Routing}	   ${Authorization}    ${Domain}    ${Less_more_domain}   ${Domain1}     ${Max_both}	  ${PBX}  	${Trusted}   ${Privacy}	  ${Filtering}
	...  ${RTCP}	  ${Hiding}   ${Behavior}   ${1st_protocol}	  ${2nd_protocol}   ${TPIP_extern}   ${SDP_profile}    ${Rfc4028}	${Interworking}		${Prack}	${Session_control}
	...  ${Session_limiter}    ${ASHM}      ${ASHM1}     ${ASHM2}     ${ASHM3}   ${Check_source}	${Silent}	${Home_domain}	  ${Not_ChangePAI}	 ${Extern_domain}	${Forwarder_mode}	${Forwarder_domain}
	...  ${Media_profile}	${1st_SRTP}		${2nd_SRTP}		${Maskv6}	${Reveal}	${Add_KA}  	${KA_TPIP1}      ${1st_Period1}	${2nd_Period1}	${Max_forward1}    #${less_more_Global_KA}   ${KA_TPIP2}  ${1st_Period2}	${2nd_Period2}	${Max_forward2}

    Sleep  1s
    Click Element       ${Peer_Field}
    Sleep  1s
    Click Element       ${Add_Button}
    Sleep  2s

    Run Keyword If  '${Name}' != '#BLANK'                   input text       ${Name_Field}              ${Name}
    Sleep       1s

    Run Keyword If   '${Max_in}' != '#BLANK'                input text      ${Maxin_field}      ${Max_in}
    Run Keyword If   '${Max_out}' != '#BLANK'               input text      ${Maxout_field}     ${Max_out}

    Run Keyword If   '${Routing}' != '#BLANK'               Click Element   ${Routing_dropdown}
    Sleep  1s
    #${Routing_index} =  get text                ${Routing_index_1}
    #set test variable                           ${Routing}     ${Routing_index}
    Run Keyword If     '${Routing}' == '0'      Click Element                               ${Routing_index_1}
    ...       ELSE                              Click Element                               ${Routing_index_2}
    Sleep  1s

    Add_Edit Peer   ${Authorization}    ${Domain}    ${Less_more_domain}   ${Domain1}     ${Max_both}	  ${PBX}  	${Trusted}    ${Privacy}	  ${Filtering}
	...  ${RTCP}	  ${Hiding}   ${Behavior}   ${1st_protocol}	  ${2nd_protocol}   ${TPIP_extern}   ${SDP_profile}    ${Rfc4028}	${Interworking}		${Prack}	${Session_control}
	...  ${Session_limiter}    ${ASHM}      ${ASHM1}     ${ASHM2}     ${ASHM3}   ${Check_source}	${Silent}	${Home_domain}	  ${Not_ChangePAI}	 ${Extern_domain}	${Forwarder_mode}	${Forwarder_domain}
	...  ${Media_profile}	${1st_SRTP}		${2nd_SRTP}		${Maskv6}	${Reveal}	${Add_KA}  	${KA_TPIP1}      ${1st_Period1}	${2nd_Period1}	${Max_forward1}    #${less_more_Global_KA}   ${KA_TPIP2}  ${1st_Period2}	${2nd_Period2}	${Max_forward2}

    Add Keep Alive parameters   ${Add_KA}	${KA_TPIP1}	 ${1st_Period1}     ${2nd_Period1}   ${Max_forward1}

    Click Element    ${Confirm_Add}

Add Peer64
    [Arguments]   ${Name}  ${Max_in}	${Max_out}	 ${Routing}	   ${Authorization}    ${Domain}    ${Less_more_domain}   ${Domain1}     ${Max_both}	  ${PBX}  	${Trusted}   ${Privacy}	  ${Filtering}
	...  ${RTCP}	  ${Hiding}   ${Behavior}   ${1st_protocol}	  ${2nd_protocol}   ${TPIP_extern}   ${SDP_profile}    ${Rfc4028}	${Interworking}		${Prack}	${Session_control}
	...  ${Session_limiter}    ${ASHM}      ${ASHM1}     ${ASHM2}     ${ASHM3}   ${Check_source}	${Silent}	${Home_domain}	  ${Not_ChangePAI}	 ${Extern_domain}	${Forwarder_mode}	${Forwarder_domain}
	...  ${Media_profile}	${1st_SRTP}		${2nd_SRTP}		${Maskv6}	${Reveal}	${Add_KA}  	${KA_TPIP1}      ${1st_Period1}	${2nd_Period1}	${Max_forward1}    ${Session2BLimiter}   ${Lac_stripping}   ${User2Net}  ${Net2User}
	...  ${word_processing}

    Sleep  1s
    Click Element       ${Peer_Field}
    Sleep  1s
    Click Element       ${Add_Button}
    Sleep  2s

    Run Keyword If  '${Name}' != '#BLANK'                   input text       ${Name_Field}              ${Name}
    Sleep       1s

    Run Keyword If   '${Max_in}' != '#BLANK'                input text      ${Maxin_field}      ${Max_in}
    Run Keyword If   '${Max_out}' != '#BLANK'               input text      ${Maxout_field}     ${Max_out}

    Run Keyword If   '${Routing}' != '#BLANK'               Click Element   ${Routing_dropdown}
    Sleep  1s
    #${Routing_index} =  get text                ${Routing_index_1}
    #set test variable                           ${Routing}     ${Routing_index}
    Run Keyword If     '${Routing}' == '0'      Click Element                               ${Routing_index_1}
    ...       ELSE                              Click Element                               ${Routing_index_2}
    Sleep  1s

    Add_Edit Peer   ${Authorization}    ${Domain}    ${Less_more_domain}   ${Domain1}     ${Max_both}	  ${PBX}  	${Trusted}    ${Privacy}	  ${Filtering}
	...  ${RTCP}	  ${Hiding}   ${Behavior}   ${1st_protocol}	  ${2nd_protocol}   ${TPIP_extern}   ${SDP_profile}    ${Rfc4028}	${Interworking}		${Prack}	${Session_control}
	...  ${Session_limiter}    ${ASHM}      ${ASHM1}     ${ASHM2}     ${ASHM3}   ${Check_source}	${Silent}	${Home_domain}	  ${Not_ChangePAI}	 ${Extern_domain}	${Forwarder_mode}	${Forwarder_domain}
	...  ${Media_profile}	${1st_SRTP}		${2nd_SRTP}		${Maskv6}	${Reveal}	${Add_KA}  	${KA_TPIP1}      ${1st_Period1}	${2nd_Period1}	${Max_forward1}     #${less_more_Global_KA}   ${KA_TPIP2}  ${1st_Period2}	${2nd_Period2}	${Max_forward2}

    #Imp 6.4 15001
    Run Keyword If       '${Max_both}' != '#BLANK'                      Scroll Element Into View  ${Session_limiter_label}
    Sleep  1s
    Run Keyword If   '${word_processing}' != '#BLANK'               Click Element   ${word_processing_button}
    Sleep  2s
    Run Keyword If   '${word_processing}' != '#BLANK'               Click Element   ${word_processing_dropdown}
    Sleep  1s
    Run Keyword If       '${word_processing}' == 'word_processor'       Click Element      ${word_processing_file}
    ...    ELSE IF        '${word_processing}' == 'NONE'                Click Element      ${word_processing_none}
    Sleep  2s
    #Feature 6.3 RFF14431
    Run Keyword If       '${Lac_stripping}' == 'TRUE'           Click Element      ${Lac_Stripping_True}
    ...         ELSE IF  '${Lac_stripping}' == 'FALSE'          Click Element      ${Lac_Stripping_False}

    Sleep  2s

    #Feature 6.3 Imp#14290
    Run Keyword If   '${User2Net}' != '#BLANK'               Click Element   ${User2Net_dropdown}
    Sleep  1s
    Run Keyword If       '${User2Net}' == '2'           Click Element      ${User2Net_2}
    ...         ELSE IF  '${User2Net}' == '3'           Click Element      ${User2Net_3}
    ...         ELSE IF  '${User2Net}' == 'NONE'        Click Element      ${User2Net_None}

    Sleep  2s

    Run Keyword If   '${Net2User}' != '#BLANK'               Click Element   ${Net2User_dropdown}
    Sleep  1s
    Run Keyword If       '${Net2User}' == '2'           Click Element      ${Net2User_2}
    ...         ELSE IF  '${Net2User}' == '3'           Click Element      ${Net2User_3}
    ...         ELSE IF  '${Net2User}' == 'NONE'        Click Element      ${Net2User_None}
    Sleep  2s
    #Feature 6.4 RFF15159
    Run Keyword If          '${Session2BLimiter}' == 'TRUE'        Click Element      ${Session2BLimiter_True}
    ...         ELSE IF     '${Session2BLimiter}' == 'FALSE'       Click Element      ${Session2BLimiter_False}

    Sleep  2s
    Add Keep Alive parameters   ${Add_KA}	${KA_TPIP1}	 ${1st_Period1}     ${2nd_Period1}   ${Max_forward1}

    Click Element    ${Confirm_Add}

Add Peer71
    [Arguments]   ${Name}  ${Max_in}	${Max_out}	 ${Routing}	   ${Authorization}    ${Domain}    ${Less_more_domain}   ${Domain1}     ${Max_both}	  ${PBX}  	${Trusted}   ${Privacy}	  ${Filtering}
	...  ${RTCP}	  ${Hiding}   ${Behavior}   ${1st_protocol}	  ${2nd_protocol}   ${TPIP_extern}   ${SDP_profile}    ${Rfc4028}	${Interworking}		${Prack}	${Session_control}
	...  ${Session_limiter}    ${ASHM}      ${ASHM1}     ${ASHM2}     ${ASHM3}   ${Check_source}	${Silent}	${Home_domain}	  ${Not_ChangePAI}	 ${Extern_domain}	${Forwarder_mode}	${Forwarder_domain}
	...  ${Media_profile}	${1st_SRTP}		${2nd_SRTP}		${Maskv6}	${Reveal}	${Add_KA}  	${KA_TPIP1}      ${1st_Period1}	${2nd_Period1}	${Max_forward1}    ${Session2BLimiter}   ${Lac_stripping}   ${User2Net}  ${Net2User}
	...  ${word_processing}		${Precondition_entry}		${Precondition_exit}

    Sleep  1s
    Click Element       ${Peer_Field}
    Sleep  1s
    Click Element       ${Add_Button}
    Sleep  2s

    Run Keyword If  '${Name}' != '#BLANK'                   input text       ${Name_Field}              ${Name}
    Sleep       1s

    Run Keyword If   '${Max_in}' != '#BLANK'                input text      ${Maxin_field}      ${Max_in}
    Run Keyword If   '${Max_out}' != '#BLANK'               input text      ${Maxout_field}     ${Max_out}

    Run Keyword If   '${Routing}' != '#BLANK'               Click Element   ${Routing_dropdown}
    Sleep  1s
    #${Routing_index} =  get text                ${Routing_index_1}
    #set test variable                           ${Routing}     ${Routing_index}
    Run Keyword If     '${Routing}' == '0'      Click Element                               ${Routing_index_1}
    ...       ELSE                              Click Element                               ${Routing_index_2}
    Sleep  1s

    Add_Edit Peer   ${Authorization}    ${Domain}    ${Less_more_domain}   ${Domain1}     ${Max_both}	  ${PBX}  	${Trusted}    ${Privacy}	  ${Filtering}
	...  ${RTCP}	  ${Hiding}   ${Behavior}   ${1st_protocol}	  ${2nd_protocol}   ${TPIP_extern}   ${SDP_profile}    ${Rfc4028}	${Interworking}		${Prack}	${Session_control}
	...  ${Session_limiter}    ${ASHM}      ${ASHM1}     ${ASHM2}     ${ASHM3}   ${Check_source}	${Silent}	${Home_domain}	  ${Not_ChangePAI}	 ${Extern_domain}	${Forwarder_mode}	${Forwarder_domain}
	...  ${Media_profile}	${1st_SRTP}		${2nd_SRTP}		${Maskv6}	${Reveal}	${Add_KA}  	${KA_TPIP1}      ${1st_Period1}	${2nd_Period1}	${Max_forward1}     #${less_more_Global_KA}   ${KA_TPIP2}  ${1st_Period2}	${2nd_Period2}	${Max_forward2}

    #Imp 6.4 15001
    Run Keyword If       '${Max_both}' != '#BLANK'                      Scroll Element Into View  ${Session_limiter_label}
    Sleep  1s
    Run Keyword If   '${word_processing}' != '#BLANK'               Click Element   ${word_processing_button}
    Sleep  2s
    Run Keyword If   '${word_processing}' != '#BLANK'               Click Element   ${word_processing_dropdown}
    Sleep  1s
    Run Keyword If       '${word_processing}' == 'word_processor'       Click Element      ${word_processing_file}
    ...    ELSE IF        '${word_processing}' == 'NONE'                Click Element      ${word_processing_none}
    Sleep  2s
    #Feature 6.3 RFF14431
    Run Keyword If       '${Lac_stripping}' == 'TRUE'           Click Element      ${Lac_Stripping_True}
    ...         ELSE IF  '${Lac_stripping}' == 'FALSE'          Click Element      ${Lac_Stripping_False}

    Sleep  2s

    #Feature 6.3 Imp#14290
    Run Keyword If   '${User2Net}' != '#BLANK'               Click Element   ${User2Net_dropdown}
    Sleep  1s
    Run Keyword If       '${User2Net}' == '2'           Click Element      ${User2Net_2}
    ...         ELSE IF  '${User2Net}' == '3'           Click Element      ${User2Net_3}
    ...         ELSE IF  '${User2Net}' == 'NONE'        Click Element      ${User2Net_None}

    Sleep  2s

    Run Keyword If   '${Net2User}' != '#BLANK'               Click Element   ${Net2User_dropdown}
    Sleep  1s
    Run Keyword If       '${Net2User}' == '2'           Click Element      ${Net2User_2}
    ...         ELSE IF  '${Net2User}' == '3'           Click Element      ${Net2User_3}
    ...         ELSE IF  '${Net2User}' == 'NONE'        Click Element      ${Net2User_None}
    Sleep  2s
    #Feature 6.4 RFF15159
    Run Keyword If          '${Session2BLimiter}' == 'TRUE'        Click Element      ${Session2BLimiter_True}
    ...         ELSE IF     '${Session2BLimiter}' == 'FALSE'       Click Element      ${Session2BLimiter_False}

    Sleep  2s
    Add Keep Alive parameters   ${Add_KA}	${KA_TPIP1}	 ${1st_Period1}     ${2nd_Period1}   ${Max_forward1}

    Run Keyword If   '${Precondition_entry}' != '#BLANK'               Click Element   ${Precondition_entry_dropdown}
    Sleep  2s

    Run Keyword If       '${Precondition_entry}' == '0'           Click Element      ${Precondition_entry_0}
    ...         ELSE IF  '${Precondition_entry}' == '1'           Click Element      ${Precondition_entry_1}
    ...         ELSE IF  '${Precondition_entry}' == '2'           Click Element      ${Precondition_entry_2}
    Sleep  1s

    Run Keyword If   '${Precondition_exit}' != '#BLANK'               Click Element   ${Precondition_exit_dropdown}
    Sleep  2s

    Run Keyword If       '${Precondition_exit}' == '0'           Click Element      ${Precondition_exit_0}
    ...         ELSE IF  '${Precondition_exit}' == '1'           Click Element      ${Precondition_exit_1}
    ...         ELSE IF  '${Precondition_exit}' == '2'           Click Element      ${Precondition_exit_2}
    Sleep  1s

    Click Element    ${Confirm_Add}

Add Peer63
    [Arguments]   ${Name}  ${Max_in}	${Max_out}	 ${Routing}	   ${Authorization}    ${Domain}    ${Less_more_domain}   ${Domain1}     ${Max_both}	  ${PBX}  	${Trusted}   ${Privacy}	  ${Filtering}
	...  ${RTCP}	  ${Hiding}   ${Behavior}   ${1st_protocol}	  ${2nd_protocol}   ${TPIP_extern}   ${SDP_profile}    ${Rfc4028}	${Interworking}		${Prack}	${Session_control}
	...  ${Session_limiter}    ${ASHM}      ${ASHM1}     ${ASHM2}     ${ASHM3}   ${Check_source}	${Silent}	${Home_domain}	  ${Not_ChangePAI}	 ${Extern_domain}	${Forwarder_mode}	${Forwarder_domain}
	...  ${Media_profile}	${1st_SRTP}		${2nd_SRTP}		${Maskv6}	${Reveal}	${Add_KA}  	${KA_TPIP1}      ${1st_Period1}	${2nd_Period1}	${Max_forward1}   ${Lac_stripping}   ${User2Net}  ${Net2User}

    Sleep  1s
    Click Element       ${Peer_Field}
    Sleep  1s
    Click Element       ${Add_Button}
    Sleep  2s

    Run Keyword If  '${Name}' != '#BLANK'                   input text       ${Name_Field}              ${Name}
    Sleep       1s

    Run Keyword If   '${Max_in}' != '#BLANK'                input text      ${Maxin_field}      ${Max_in}
    Run Keyword If   '${Max_out}' != '#BLANK'               input text      ${Maxout_field}     ${Max_out}

    Run Keyword If   '${Routing}' != '#BLANK'               Click Element   ${Routing_dropdown}
    Sleep  1s
    #${Routing_index} =  get text                ${Routing_index_1}
    #set test variable                           ${Routing}     ${Routing_index}
    Run Keyword If     '${Routing}' == '0'      Click Element                               ${Routing_index_1}
    ...       ELSE                              Click Element                               ${Routing_index_2}
    Sleep  1s

    Add_Edit Peer   ${Authorization}    ${Domain}    ${Less_more_domain}   ${Domain1}     ${Max_both}	  ${PBX}  	${Trusted}    ${Privacy}	  ${Filtering}
	...  ${RTCP}	  ${Hiding}   ${Behavior}   ${1st_protocol}	  ${2nd_protocol}   ${TPIP_extern}   ${SDP_profile}    ${Rfc4028}	${Interworking}		${Prack}	${Session_control}
	...  ${Session_limiter}    ${ASHM}      ${ASHM1}     ${ASHM2}     ${ASHM3}   ${Check_source}	${Silent}	${Home_domain}	  ${Not_ChangePAI}	 ${Extern_domain}	${Forwarder_mode}	${Forwarder_domain}
	...  ${Media_profile}	${1st_SRTP}		${2nd_SRTP}		${Maskv6}	${Reveal}	${Add_KA}  	${KA_TPIP1}      ${1st_Period1}	${2nd_Period1}	${Max_forward1}     #${less_more_Global_KA}   ${KA_TPIP2}  ${1st_Period2}	${2nd_Period2}	${Max_forward2}

    #Feature 6.3 RFF14431
    Run Keyword If       '${Max_both}' != '#BLANK'                      Scroll Element Into View  ${Session_limiter_label}
    Sleep  1s
    Run Keyword If       '${Lac_stripping}' == 'TRUE'           Click Element      ${Lac_Stripping_True}
    ...         ELSE IF  '${Lac_stripping}' == 'FALSE'          Click Element      ${Lac_Stripping_False}

    #Feature 6.3 Imp#14290
    Run Keyword If   '${User2Net}' != '#BLANK'               Click Element   ${User2Net_dropdown}
    Sleep  1s
    Run Keyword If       '${User2Net}' == '2'           Click Element      ${User2Net_2}
    ...         ELSE IF  '${User2Net}' == '3'           Click Element      ${User2Net_3}
    ...         ELSE                                    Click Element      ${User2Net_None}

    Run Keyword If   '${Net2User}' != '#BLANK'               Click Element   ${Net2User_dropdown}
    Sleep  1s
    Run Keyword If       '${Net2User}' == '2'           Click Element      ${Net2User_2}
    ...         ELSE IF  '${Net2User}' == '3'           Click Element      ${Net2User_3}
    ...         ELSE                                    Click Element      ${Net2User_None}

    Add Keep Alive parameters   ${Add_KA}	${KA_TPIP1}	 ${1st_Period1}     ${2nd_Period1}   ${Max_forward1}

    Click Element    ${Confirm_Add}

Edit Peer
    [Arguments]   ${Name}  ${Authorization}    ${Domain}   ${New_Domain}   ${Less_more_domain}   ${Domain1}      ${Max_both}	  ${PBX}  	${Trusted}   ${Privacy}	  ${Filtering}
	...  ${RTCP}	  ${Hiding}   ${Behavior}   ${1st_protocol}	  ${2nd_protocol}   ${TPIP_extern}   ${SDP_profile}    ${Rfc4028}	${Interworking}		${Prack}	${Session_control}
	...  ${Session_limiter}    ${ASHM}      ${ASHM1}     ${ASHM2}     ${ASHM3}   ${Check_source}	${Silent}	${Home_domain}	  ${Not_ChangePAI}	 ${Extern_domain}	${Forwarder_mode}	${Forwarder_domain}
	...  ${Media_profile}	${1st_SRTP}		${2nd_SRTP}		${Maskv6}	${Reveal}	${Add_KA}  	${KA_TPIP1}      ${1st_Period1}	${2nd_Period1}	${Max_forward1}    ${less_more_Global_KA}  ${KA_TPIP2}
	...  ${1st_Period2}     ${2nd_Period2}   ${Max_forward2}   ${less_more_KA_Domain1}  ${Keep_alive_domain1}  ${Keep_alive_domain_TPIP1}   ${less_more_KA_Domain2}  ${Keep_alive_domain2}  ${Keep_alive_domain_TPIP2}

    Click Element       ${Peer_Field}
    Sleep   1s
    Click Edit Element With 2 Info      ${Name}    ${Domain}
    Sleep   2s

    Add_Edit Peer   ${Authorization}    ${New_Domain}    ${Less_more_domain}     ${Domain1}   ${Max_both}	  ${PBX}  	${Trusted}   ${Privacy}	  ${Filtering}
	...  ${RTCP}	  ${Hiding}   ${Behavior}   ${1st_protocol}	  ${2nd_protocol}   ${TPIP_extern}   ${SDP_profile}    ${Rfc4028}	${Interworking}		${Prack}	${Session_control}
	...  ${Session_limiter}    ${ASHM}      ${ASHM1}     ${ASHM2}     ${ASHM3}   ${Check_source}	${Silent}	${Home_domain}	  ${Not_ChangePAI}	 ${Extern_domain}	${Forwarder_mode}	${Forwarder_domain}
	...  ${Media_profile}	${1st_SRTP}		${2nd_SRTP}		${Maskv6}	${Reveal}	${Add_KA}  	${KA_TPIP1}      ${1st_Period1}	${2nd_Period1}	${Max_forward1}

    Edit Keep Alive parameters    ${less_more_Global_KA}   ${KA_TPIP2}     ${1st_Period2}     ${2nd_Period2}   ${Max_forward2}   ${less_more_KA_Domain1}  ${Keep_alive_domain1}  ${Keep_alive_domain_TPIP1}   ${less_more_KA_Domain2}  ${Keep_alive_domain2}  ${Keep_alive_domain_TPIP2}

    Click Element    ${Confirm_Add}

Edit Peer71
    [Arguments]   ${Name}  ${Authorization}    ${Domain}  ${New_Domain}   ${Less_more_domain}   ${Domain1}     ${Max_both}	  ${PBX}  	${Trusted}   ${Privacy}	  ${Filtering}
	...  ${RTCP}	  ${Hiding}   ${Behavior}   ${1st_protocol}	  ${2nd_protocol}   ${TPIP_extern}   ${SDP_profile}    ${Rfc4028}	${Interworking}		${Prack}	${Session_control}
	...  ${Session_limiter}    ${ASHM}      ${ASHM1}     ${ASHM2}     ${ASHM3}   ${Check_source}	${Silent}	${Home_domain}	  ${Not_ChangePAI}	 ${Extern_domain}	${Forwarder_mode}	${Forwarder_domain}
	...  ${Media_profile}	${1st_SRTP}		${2nd_SRTP}		${Maskv6}	${Reveal}	${Add_KA}  	${KA_TPIP1}      ${1st_Period1}	${2nd_Period1}	${Max_forward1}    ${less_more_Global_KA}  ${KA_TPIP2}
	...  ${1st_Period2}     ${2nd_Period2}   ${Max_forward2}   ${less_more_KA_Domain1}  ${Keep_alive_domain1}  ${Keep_alive_domain_TPIP1}   ${less_more_KA_Domain2}  ${Keep_alive_domain2}  ${Keep_alive_domain_TPIP2}  ${Session2BLimiter}
	...  ${Lac_stripping}   ${User2Net}  ${Net2User}   ${Precondition_entry}  ${Precondition_exit}

    Click Element       ${Peer_Field}
    Sleep   1s
    Click Edit Element With 2 Info      ${Name}    ${Domain}
    Sleep   2s

    Add_Edit Peer 71   ${Authorization}    ${New_Domain}    ${Less_more_domain}     ${Domain1}   ${Max_both}	  ${PBX}  	${Trusted}   ${Privacy}	  ${Filtering}
	...  ${RTCP}	  ${Hiding}   ${Behavior}   ${1st_protocol}	  ${2nd_protocol}   ${TPIP_extern}   ${SDP_profile}    ${Rfc4028}	${Interworking}		${Prack}	${Session_control}
	...  ${Session_limiter}    ${ASHM}      ${ASHM1}     ${ASHM2}     ${ASHM3}   ${Check_source}	${Silent}	${Home_domain}	  ${Not_ChangePAI}	 ${Extern_domain}	${Forwarder_mode}	${Forwarder_domain}
	...  ${Media_profile}	${1st_SRTP}		${2nd_SRTP}		${Maskv6}	${Reveal}	${Add_KA}  	${KA_TPIP1}      ${1st_Period1}	${2nd_Period1}	${Max_forward1}   ${Precondition_entry}  ${Precondition_exit}

    #Feature 6.3 RFF14431
    Run Keyword If       '${PBX}' != '#BLANK'                      Scroll Element Into View  ${Session_limiter_label}
    Sleep  2s
    Run Keyword If       '${Lac_stripping}' == 'TRUE'           Click Element      ${Lac_Stripping_True}
    ...         ELSE IF  '${Lac_stripping}' == 'FALSE'          Click Element      ${Lac_Stripping_False}
    Sleep  2s
    #Feature 6.3 Imp#14290

    Press Keys    None    ESC
    Sleep  1s

    Run Keyword If   '${User2Net}' != '#BLANK'               Click Element   ${User2Net_dropdown}
    Sleep  2s

    Run Keyword If       '${User2Net}' == '2'           Click Element      ${User2Net_2}
    ...         ELSE IF  '${User2Net}' == '3'           Click Element      ${User2Net_3}
    ...         ELSE IF  '${User2Net}' == 'NONE'        Click Element      ${User2Net_None}
    Sleep  2s

    Press Keys    None    ESC
    Sleep  1s

    Run Keyword If   '${Net2User}' != '#BLANK'               Click Element   ${Net2User_dropdown}
    Sleep  2s
    Run Keyword If       '${Net2User}' == '2'           Click Element      ${Net2User_2}
    ...         ELSE IF  '${Net2User}' == '3'           Click Element      ${Net2User_3}
    ...         ELSE IF  '${Net2User}' == 'NONE'        Click Element      ${Net2User_None}
    #Feature 6.4 RFF15159
    Run Keyword If          '${Session2BLimiter}' == 'TRUE'        Click Element      ${Session2BLimiter_True}
    ...         ELSE IF     '${Session2BLimiter}' == 'FALSE'       Click Element      ${Session2BLimiter_False}

    Edit Keep Alive parameters    ${less_more_Global_KA}   ${KA_TPIP2}     ${1st_Period2}     ${2nd_Period2}   ${Max_forward2}   ${less_more_KA_Domain1}  ${Keep_alive_domain1}  ${Keep_alive_domain_TPIP1}   ${less_more_KA_Domain2}  ${Keep_alive_domain2}  ${Keep_alive_domain_TPIP2}

    Click Element    ${Confirm_Add}

Edit Peer63
    [Arguments]   ${Name}  ${Authorization}    ${Domain}  ${New_Domain}   ${Less_more_domain}   ${Domain1}     ${Max_both}	  ${PBX}  	${Trusted}   ${Privacy}	  ${Filtering}
	...  ${RTCP}	  ${Hiding}   ${Behavior}   ${1st_protocol}	  ${2nd_protocol}   ${TPIP_extern}   ${SDP_profile}    ${Rfc4028}	${Interworking}		${Prack}	${Session_control}
	...  ${Session_limiter}    ${ASHM}      ${ASHM1}     ${ASHM2}     ${ASHM3}   ${Check_source}	${Silent}	${Home_domain}	  ${Not_ChangePAI}	 ${Extern_domain}	${Forwarder_mode}	${Forwarder_domain}
	...  ${Media_profile}	${1st_SRTP}		${2nd_SRTP}		${Maskv6}	${Reveal}	${Add_KA}  	${KA_TPIP1}      ${1st_Period1}	${2nd_Period1}	${Max_forward1}    ${less_more_Global_KA}  ${KA_TPIP2}
	...  ${1st_Period2}     ${2nd_Period2}   ${Max_forward2}   ${less_more_KA_Domain1}  ${Keep_alive_domain1}  ${Keep_alive_domain_TPIP1}   ${less_more_KA_Domain2}  ${Keep_alive_domain2}  ${Keep_alive_domain_TPIP2}  ${Lac_stripping}   ${User2Net}  ${Net2User}

    Click Element       ${Peer_Field}
    Sleep   1s
    Click Edit Element With 2 Info      ${Name}    ${Domain}
    Sleep   2s

    Add_Edit Peer   ${Authorization}    ${New_Domain}    ${Less_more_domain}     ${Domain1}   ${Max_both}	  ${PBX}  	${Trusted}   ${Privacy}	  ${Filtering}
	...  ${RTCP}	  ${Hiding}   ${Behavior}   ${1st_protocol}	  ${2nd_protocol}   ${TPIP_extern}   ${SDP_profile}    ${Rfc4028}	${Interworking}		${Prack}	${Session_control}
	...  ${Session_limiter}    ${ASHM}      ${ASHM1}     ${ASHM2}     ${ASHM3}   ${Check_source}	${Silent}	${Home_domain}	  ${Not_ChangePAI}	 ${Extern_domain}	${Forwarder_mode}	${Forwarder_domain}
	...  ${Media_profile}	${1st_SRTP}		${2nd_SRTP}		${Maskv6}	${Reveal}	${Add_KA}  	${KA_TPIP1}      ${1st_Period1}	${2nd_Period1}	${Max_forward1}

    #Feature 6.3 RFF14431
    Run Keyword If       '${PBX}' != '#BLANK'                      Scroll Element Into View  ${Session_limiter_label}
    Sleep  1s
    Run Keyword If       '${Lac_stripping}' == 'TRUE'           Click Element      ${Lac_Stripping_True}
    ...         ELSE IF  '${Lac_stripping}' == 'FALSE'          Click Element      ${Lac_Stripping_False}

    #Feature 6.3 Imp#14290
    Run Keyword If   '${User2Net}' != '#BLANK'               Click Element   ${User2Net_dropdown}
    Sleep  1s
    Run Keyword If       '${User2Net}' == '2'           Click Element      ${User2Net_2}
    ...         ELSE IF  '${User2Net}' == '3'           Click Element      ${User2Net_3}
    ...         ELSE                                    Click Element      ${User2Net_None}

    Run Keyword If   '${Net2User}' != '#BLANK'               Click Element   ${Net2User_dropdown}
    Sleep  1s
    Run Keyword If       '${Net2User}' == '2'           Click Element      ${Net2User_2}
    ...         ELSE IF  '${Net2User}' == '3'           Click Element      ${Net2User_3}
    ...         ELSE                                    Click Element      ${Net2User_None}
    Edit Keep Alive parameters    ${less_more_Global_KA}   ${KA_TPIP2}     ${1st_Period2}     ${2nd_Period2}   ${Max_forward2}   ${less_more_KA_Domain1}  ${Keep_alive_domain1}  ${Keep_alive_domain_TPIP1}   ${less_more_KA_Domain2}  ${Keep_alive_domain2}  ${Keep_alive_domain_TPIP2}

    Click Element    ${Confirm_Add}

Add_Edit Peer
    [Arguments]    ${Authorization}    ${Domain}    ${Less_more_domain}   ${Domain1}     ${Max_both}	  ${PBX}  	${Trusted}    ${Privacy}	  ${Filtering}
	...  ${RTCP}	  ${Hiding}   ${Behavior}   ${1st_protocol}	  ${2nd_protocol}   ${TPIP_extern}   ${SDP_profile}    ${Rfc4028}	${Interworking}		${Prack}	${Session_control}
	...  ${Session_limiter}    ${ASHM}      ${ASHM1}     ${ASHM2}     ${ASHM3}   ${Check_source}	${Silent}	${Home_domain}	  ${Not_ChangePAI}	 ${Extern_domain}	${Forwarder_mode}	${Forwarder_domain}
	...  ${Media_profile}	${1st_SRTP}		${2nd_SRTP}		${Maskv6}	${Reveal}	${Add_KA}  	${KA_TPIP1}      ${1st_Period1}	${2nd_Period1}	${Max_forward1}    #${less_more_Global_KA}   ${KA_TPIP2}  ${1st_Period2}	${2nd_Period2}	${Max_forward2}



    Press Keys    None    ESC
    Sleep  1s

    Run Keyword If   '${Authorization}' != '#BLANK'         Click Element   ${Autho_dropdown}
    Sleep  1s
    #${Autho_index} =  get text                  ${Autho_index_selected}
    #set suite variable                          ${Autho_profile_index}     ${Autho_index}
    Run Keyword If     '${Authorization}' == '0'      Click Element                               ${Autho_index_1}
    ...       ELSE IF  '${Authorization}' == '1'      Click Element                               ${Autho_index_2}
    Sleep  1s

    Run Keyword If  '${Domain}' != '#BLANK'                 input text       ${Multi_Domain_Field}              ${Domain}
    Sleep  1s

    Run Keyword If  '${Less_more_domain}' == 'add'                 Click Element       ${Add_Domain}
    Sleep   1s

    Run Keyword If  '${Less_more_domain}' == 'remove'                 Click Element       ${Remove_Domain}
    Sleep   1s
    Run Keyword If  '${Less_more_domain}' == 'add'   Run Keyword If  '${Domain1}' != '#BLANK'                      input text       ${Multi_Domain_Field1}              ${Domain1}
    Sleep  1

    #Sleep       1s

    Run Keyword If   '${PBX}' != '#BLANK'               Click Element       ${Optional_parameters_button}
    Sleep  1s

    Run Keyword If   '${Max_both}' != '#BLANK'                  input text      ${Maxboth_field}      ${Max_both}

    Run Keyword If   '${PBX}' != '#BLANK'                       input text      ${PBX_field}      ${PBX}


    log     trusted value is ${Trusted}
    Run Keyword If       '${Trusted}' == 'YES'                  Click Element      ${Trusted_Checkbox}
    log     Privacy value is ${Privacy}
    Run Keyword If       '${Privacy}' == 'YES'                  Click Element      ${Privacy_Checkbox}
    log     Filtering value is ${Filtering}
    Run Keyword If       '${Filtering}' == 'YES'              Click Element        ${Filtering_Checkbox}
    log     RTCP value is ${RTCP}
    Run Keyword If       '${RTCP}' == 'YES'                   Click Element        ${RTCP_Checkbox}
    Log    HIDING is ${Hiding}

    Run Keyword If     '${Hiding}' != '#BLANK'                  Click Element   ${Hiding_dropdown}
    Sleep  1s
    Run Keyword If          '${Hiding}' == 'No_hiding'              Click Element    ${Hiding_Nohiding}
    ...         ELSE IF     '${Hiding}' == 'Hiding'                 Click Element    ${Hiding_Hiding}
    ...         ELSE IF     '${Hiding}' == 'Total_hiding'           Click Element    ${Hiding_Totalhiding}
    Sleep  2s

    Run Keyword If   '${Behavior}' != '#BLANK'                  Click Element    ${Behavior_dropdown}
    Sleep  2s
    Run Keyword If   '${Behavior}' != '#BLANK'                  Click Element   xpath=//label[contains(text(),'Behavior')]/preceding::div[1]/ul//span[contains(text(),'${Behavior}')]
    Sleep  2s

    Run Keyword If   '${1st_protocol}' != '#BLANK'              Click Element   ${1st_protocol_dropdown}
    Sleep  2s
    Run Keyword If          '${1st_protocol}' == 'UDP'        Click Element      ${1st_protocol_udp}
    ...        ELSE IF     '${1st_protocol}' == 'TCP'         Click Element      ${1st_protocol_tcp}
    ...        ELSE IF       '${1st_protocol}' == 'NONE'      Click Element      ${1st_protocol_none}
    Sleep  2s

    Run Keyword If      '${2nd_protocol}' != '#BLANK'              Click Element   ${2nd_protocol_dropdown}
    Sleep  2s
    Run Keyword If          '${2nd_protocol}' == 'UDP'        Click Element      ${2nd_protocol_udp}
    ...         ELSE IF     '${2nd_protocol}' == 'TCP'        Click Element      ${2nd_protocol_tcp}
    ...         ELSE IF      '${2nd_protocol}' == 'NONE'                                   Click Element      ${2nd_protocol_none}
    Sleep  2s

    Run Keyword If      '${TPIP_extern}' != '#BLANK'              Click Element   ${IBCF_TPIP_dropdown}
    Sleep  1s
    #${TPIP_extern_name} =       get text       ${TPIP_Name}
    #set test variable           ${TPIP_extern_selected}            ${TPIP_extern_name}
    #${TPIP_Checked} =           run keyword and return status       page should contain element   	xpath=//label[contains(text(),'TPIP extern')]/preceding::div[1]/ul/li[@class='active']/span[contains(text(),'${TPIP_extern_name}')]
    Run Keyword If      '${TPIP_extern}' == '1'      Click Element    ${TPIP_Name1}
    ...       ELSE IF      '${TPIP_extern}' == '2'                    Click Element    ${TPIP_Name2}
    ...       ELSE IF      '${TPIP_extern}' == 'NONE'                 Click Element    ${TPIP_None}
	Sleep  1s
	run keyword and ignore error           Press Keys    None    ESC
    Sleep  1s
    #Run Keyword If      '${TPIP_extern}' != '#BLANK'              Click Element   ${PBX_field}
    #Sleep  1s

    Run Keyword If      '${SDP_profile}' != '#BLANK'              Click Element   ${SDP_dropdown}
    Sleep  1s
    #${SDP_profile_exist} =      run keyword and return status       page should contain element    ${SDP_profile_1}
    #Run Keyword If          '${SDP_profile_exist}' == 'True'        Click Element                  ${SDP_profile_1}

    #${SDP_profile_get} =       get text       ${SDP_profile_1}
    #set test variable           ${SDP_profile_index}            ${SDP_profile_get}
    Run Keyword If      '${SDP_profile}' == 'NONE'      Click Element  ${SDP_profile_None}
    ...         ELSE IF  '${SDP_profile}' == '1'      Click Element    ${SDP_profile_1}
    ...         ELSE IF      '${SDP_profile}' == '2'     Click Element    ${SDP_profile_2}
    Sleep  2s

    Run Keyword If      '${Rfc4028}' != '#BLANK'       Click Element       ${RFC4028_dropdown}
    Sleep  1s
    #${RFC4028_get} =      run keyword and ignore error    get text       ${RFC4028_First}
    #run keyword and ignore error        set test variable           ${RFC4028_index}            ${RFC4028_get}
    Run Keyword If      '${Rfc4028}' == 'NONE'      Click Element    ${RFC4028_None}
    ...      ELSE IF   '${Rfc4028}' == '1'         Click Element    ${RFC4028_1}
    ...      ELSE IF   '${Rfc4028}' == '2'          Click Element    ${RFC4028_2}
    Sleep  2s

    Run Keyword If      '${Interworking}' != '#BLANK'       Click Element       ${Interworking_dropdown}
    Sleep  1s
    Run Keyword If          '${Interworking}' == 'UPDATE'        Click Element      ${Interworking_Update}
    ...         ELSE IF     '${Interworking}' == 'INVITE'        Click Element      ${Interworking_Invite}
    ...         ELSE IF      '${Interworking}' == 'NONE'      Click Element      ${Interworking_None}
    Sleep  2s


    Run Keyword If      '${Prack}' != '#BLANK'              Click Element   ${Prack_dropdown}
    Sleep  1s
    Run Keyword If          '${Prack}' == 'FORBID_PRACK'        Click Element      ${Prack_Forbid}
    ...         ELSE IF     '${Prack}' == 'NONE'                                      Click Element      ${Prack_None}
    Sleep  2s


    Run Keyword If      '${Session_control}' != '#BLANK'              Click Element   ${Session_control_dropdown}
    Sleep  1s
    #${Session_control_get} =       get text       ${Session_control_First}
    #set test variable           ${Session_control_index}            ${Session_control_get}
    Run Keyword If      '${Session_control}' == 'NONE'      Click Element    ${Session_control_None}
    ...     ELSE IF     '${Session_control}' == '1'        Click Element    ${Session_control_1}
    ...     ELSE IF     '${Session_control}' == '2'        Click Element    ${Session_control_2}
    Sleep  2s

    Run Keyword If      '${Session_control}' != '#BLANK'        Click Element     ${Session_limiter_dropdown}
    Sleep  1s
    #${Session_limiter_get} =       get text       ${Session_limiter_First}
    #set test variable           ${Session_limiter_index}            ${Session_limiter_get}
    Run Keyword If             '${Session_limiter}' == 'NONE'      Click Element    ${Session_limiter_None}
    ...         ELSE IF          '${Session_limiter}' == '1'       Click Element    ${Session_limiter_1}
    ...         ELSE IF          '${Session_limiter}' == '2'       Click Element    ${Session_limiter_2}
    Sleep  2s

    Run Keyword If      '${ASHM}' != '#BLANK'        Click Element   ${ASHM_button}
    Sleep  2s
    Run Keyword If      '${ASHM}' != '#BLANK'        Click Element   ${ASHM_dropdown}
    Sleep  1s
    #${ASHM_get} =       get text       ${ASHM_First}
    #set test variable           ${ASHM_index}            ${ASHM_get}
    Run Keyword If             '${ASHM1}' == 'NONE'      Click Element    ${ASHM_None}
    Sleep  1s
    Run Keyword If             '${ASHM2}' == '1'         Click Element    ${ASHM_1st}
    Sleep  1s
    Run Keyword If             '${ASHM3}' == '2'         Click Element    ${ASHM_2nd}
    Sleep  2s

    Run Keyword If      '${Check_source}' != '#BLANK'      Click Element   ${Check_source_dropdown}
    Sleep  1s
    Run Keyword If          '${Check_source}' == 'TRUE'        Click Element      ${Check_source_True}
    ...         ELSE IF     '${Check_source}' == 'FALSE'       Click Element      ${Check_source_False}
    ...         ELSE IF     '${Check_source}' == 'NONE'       Click Element      ${Check_source_None}
    Sleep       3s


    Run Keyword If      '${Silent}' != '#BLANK'      Click Element   ${Silent_dropdown}
    Sleep  2s
    Run Keyword If          '${Silent}' == 'TRUE'        Click Element      ${Silent_True}
    ...         ELSE IF     '${Silent}' == 'FALSE'       Click Element      ${Silent_False}
    ...         ELSE IF     '${Silent}' == 'NONE'        Click Element      ${Silent_None}
    Sleep  2s

    Run Keyword If   '${Home_domain}' != '#BLANK'      input text         ${Home_domain_field}    ${Home_domain}
    Sleep  1s
    Run Keyword If       '${Not_ChangePAI}' == 'TRUE'    Click Element      ${Not_ChangePAI_Checkbox}
    Run Keyword If   '${Extern_domain}' != '#BLANK'    input text         ${Extern_domain_field}    ${Extern_domain}
    Sleep  2s

    Run Keyword If      '${Forwarder_mode}' != '#BLANK'      Click Element   ${FWD_mode_dropdown}
    Sleep  1s
    Run Keyword If       '${Forwarder_mode}' == 'OFF'           Click Element      ${FWD_mode_Off}
    ...         ELSE IF  '${Forwarder_mode}' == 'STANDARD'      Click Element      ${FWD_mode_Standard}
    ...         ELSE IF  '${Forwarder_mode}' == 'AUTOLEARN'     Click Element      ${FWD_mode_AUTOLEARN}
    ...         ELSE IF  '${Forwarder_mode}' == 'SOURCE'        Click Element      ${FWD_mode_SOURCE}
    ...         ELSE IF  '${Forwarder_mode}' == 'ONCE'          Click Element      ${FWD_mode_Once}
    ...         ELSE IF  '${Forwarder_mode}' == 'AUTO_SECURE'   Click Element      ${FWD_mode_AUTO_SECURE}
    ...         ELSE IF  '${Forwarder_mode}' == 'NONE'          Click Element      ${FWD_mode_None}
    Sleep  2s

    Run Keyword If      '${Forwarder_domain}' != '#BLANK'     Click Element   ${FWD_domain_dropdown}
    Sleep  1s
    Run Keyword If       '${Forwarder_domain}' == 'extern'           Click Element      ${FWD_domain_extern}
    ...         ELSE IF  '${Forwarder_domain}' == 'LOCAL'             Click Element      ${FWD_domain_local}
    ...         ELSE IF  '${Forwarder_domain}' == 'NONE'             Click Element      ${FWD_domain_none}
    Sleep  2s

    Run Keyword If      '${Media_profile}' != '#BLANK'     Click Element   ${Media_profile_dropdown}
    Sleep  1s
    #${Media_profile_get} =       get text       ${Media_profile_first}
    #set test variable    ${Media_profile_index}             ${Media_profile_get}
    Run Keyword If      '${Media_profile}' == 'TRUE'        Click Element    ${Media_profile_first}
    ...         ELSE IF     '${Media_profile}' == 'NONE'      Click Element    ${Media_profile_none}
    Sleep  2s

    Press Keys    None    ESC
    Sleep  1s

    Run Keyword If      '${1st_SRTP}' != '#BLANK'     Click Element   ${1st_SRTP_dropdown}
    Sleep  1s
    #${1st_SRTP_get} =       get text       ${1st_SRTP_first}
    #set test variable    ${1st_SRTP_index}             ${1st_SRTP_get}
    Run Keyword If      '${1st_SRTP}' == 'TRUE'        Click Element    ${1st_SRTP_first}
    ...         ELSE IF    '${1st_SRTP}' == 'NONE'      Click Element    ${1st_SRTP_none}

    Sleep  2s
    Run Keyword If      '${2nd_SRTP}' != '#BLANK'     Click Element   ${2nd_SRTP_dropdown}
    Sleep  1s
    #${2nd_SRTP_get} =       get text       ${2nd_SRTP_first}
    #set test variable    ${2nd_SRTP_index}             ${2nd_SRTP_get}
    Run Keyword If      '${2nd_SRTP}' == 'TRUE'        Click Element    ${2nd_SRTP_first}
    ...         ELSE IF     '${2nd_SRTP}' == 'NONE'     Click Element    ${2nd_SRTP_none}
    Sleep  2s

    Run Keyword If   '${Maskv6}' != '#BLANK'      input text         ${Maskv6_field}    ${Maskv6}
    Sleep  1s
    Run Keyword If       '${Reveal}' == 'TRUE'        Click Element    ${Reveal_checkbox}
    Sleep  1s

Add_Edit Peer 71
    [Arguments]    ${Authorization}    ${Domain}    ${Less_more_domain}   ${Domain1}     ${Max_both}	  ${PBX}  	${Trusted}    ${Privacy}	  ${Filtering}
	...  ${RTCP}	  ${Hiding}   ${Behavior}   ${1st_protocol}	  ${2nd_protocol}   ${TPIP_extern}   ${SDP_profile}    ${Rfc4028}	${Interworking}		${Prack}	${Session_control}
	...  ${Session_limiter}    ${ASHM}      ${ASHM1}     ${ASHM2}     ${ASHM3}   ${Check_source}	${Silent}	${Home_domain}	  ${Not_ChangePAI}	 ${Extern_domain}	${Forwarder_mode}	${Forwarder_domain}
	...  ${Media_profile}	${1st_SRTP}		${2nd_SRTP}		${Maskv6}	${Reveal}	${Add_KA}  	${KA_TPIP1}      ${1st_Period1}	${2nd_Period1}	${Max_forward1}   ${Precondition_entry}  ${Precondition_exit}    #${less_more_Global_KA}   ${KA_TPIP2}  ${1st_Period2}	${2nd_Period2}	${Max_forward2}



    Press Keys    None    ESC
    Sleep  1s

    Run Keyword If   '${Authorization}' != '#BLANK'         Click Element   ${Autho_dropdown}
    Sleep  3s
    #${Autho_index} =  get text                  ${Autho_index_selected}
    #set suite variable                          ${Autho_profile_index}     ${Autho_index}
    Run Keyword If     '${Authorization}' == '0'      Click Element                               ${Autho_index_1}
    ...       ELSE IF  '${Authorization}' == '1'      Click Element                               ${Autho_index_2}
    Sleep  1s

    Run Keyword If  '${Domain}' != '#BLANK'                 input text       ${Multi_Domain_Field}              ${Domain}
    Sleep  1s

    Run Keyword If  '${Less_more_domain}' == 'add'                 Click Element       ${Add_Domain}
    Sleep   1s

    Run Keyword If  '${Less_more_domain}' == 'remove'                 Click Element       ${Remove_Domain}
    Sleep   1s
    Run Keyword If  '${Less_more_domain}' == 'add'   Run Keyword If  '${Domain1}' != '#BLANK'                      input text       ${Multi_Domain_Field1}              ${Domain1}
    Sleep  1

    #Sleep       1s

    Run Keyword If   '${PBX}' != '#BLANK'               Click Element       ${Optional_parameters_button}
    Sleep  1s

    Run Keyword If   '${Max_both}' != '#BLANK'                  input text      ${Maxboth_field}      ${Max_both}

    Run Keyword If   '${PBX}' != '#BLANK'                       input text      ${PBX_field}      ${PBX}


    log     trusted value is ${Trusted}
    Run Keyword If       '${Trusted}' == 'YES'                  Click Element      ${Trusted_Checkbox}
    log     Privacy value is ${Privacy}
    Run Keyword If       '${Privacy}' == 'YES'                  Click Element      ${Privacy_Checkbox}
    log     Filtering value is ${Filtering}
    Run Keyword If       '${Filtering}' == 'YES'              Click Element        ${Filtering_Checkbox}
    log     RTCP value is ${RTCP}
    Run Keyword If       '${RTCP}' == 'YES'                   Click Element        ${RTCP_Checkbox}
    Log    HIDING is ${Hiding}

    Run Keyword If     '${Hiding}' != '#BLANK'                  Click Element   ${Hiding_dropdown}
    Sleep  3s
    Run Keyword If          '${Hiding}' == 'No_hiding'              Click Element    ${Hiding_Nohiding}
    ...         ELSE IF     '${Hiding}' == 'Hiding'                 Click Element    ${Hiding_Hiding}
    ...         ELSE IF     '${Hiding}' == 'Total_hiding'           Click Element    ${Hiding_Totalhiding}
    Sleep  2s

    Run Keyword If   '${Behavior}' != '#BLANK'                  Click Element    ${Behavior_dropdown}
    Sleep  3s
    Run Keyword If   '${Behavior}' != '#BLANK'                  Click Element   xpath=//label[contains(text(),'Behavior')]/preceding::div[1]/ul//span[contains(text(),'${Behavior}')]
    Sleep  2s

    Run Keyword If   '${1st_protocol}' != '#BLANK'              Click Element             ${1st_protocol_dropdown}
    Sleep  3s
    Run Keyword If       '${1st_protocol}' == 'UDP'                 Click Element             ${1st_protocol_udp}
    ...        ELSE IF   '${1st_protocol}' == 'TCP'                 Click Element             ${1st_protocol_tcp}
    ...        ELSE IF   '${1st_protocol}' == 'NONE'                Click Element             ${1st_protocol_none}
    Sleep  2s

    Run Keyword If      '${2nd_protocol}' != '#BLANK'              Click Element   ${2nd_protocol_dropdown}
    Sleep  3s
    Run Keyword If          '${2nd_protocol}' == 'UDP'        Click Element      ${2nd_protocol_udp}
    ...         ELSE IF     '${2nd_protocol}' == 'TCP'        Click Element      ${2nd_protocol_tcp}
    ...         ELSE IF      '${2nd_protocol}' == 'NONE'                                   Click Element      ${2nd_protocol_none}
    Sleep  2s

    Run Keyword If      '${TPIP_extern}' != '#BLANK'              Click Element   ${IBCF_TPIP_dropdown}
    Sleep  3s
    #${TPIP_extern_name} =       get text       ${TPIP_Name}
    #set test variable           ${TPIP_extern_selected}            ${TPIP_extern_name}
    #${TPIP_Checked} =           run keyword and return status       page should contain element   	xpath=//label[contains(text(),'TPIP extern')]/preceding::div[1]/ul/li[@class='active']/span[contains(text(),'${TPIP_extern_name}')]
    Run Keyword If         '${TPIP_extern}' == '1'                    Click Element    ${TPIP_Name1}
    ...       ELSE IF      '${TPIP_extern}' == '2'                    Click Element    ${TPIP_Name2}
    ...       ELSE IF      '${TPIP_extern}' == 'NONE'                 Click Element    ${TPIP_None}
	Sleep  1s
	run keyword and ignore error           Press Keys    None    ESC
    Sleep  1s
    #Run Keyword If      '${TPIP_extern}' != '#BLANK'              Click Element   ${PBX_field}
    #Sleep  1s

    Run Keyword If      '${SDP_profile}' != '#BLANK'              Click Element   ${SDP_dropdown}
    Sleep  3s
    #${SDP_profile_exist} =      run keyword and return status       page should contain element    ${SDP_profile_1}
    #Run Keyword If          '${SDP_profile_exist}' == 'True'        Click Element                  ${SDP_profile_1}

    #${SDP_profile_get} =       get text       ${SDP_profile_1}
    #set test variable           ${SDP_profile_index}            ${SDP_profile_get}
    Run Keyword If          '${SDP_profile}' == 'NONE'               Click Element  ${SDP_profile_None}
    ...         ELSE IF     '${SDP_profile}' == '1'                  Click Element    ${SDP_profile_1}
    ...         ELSE IF     '${SDP_profile}' == '2'                  Click Element    ${SDP_profile_2}
    Sleep  2s

    Run Keyword If      '${Rfc4028}' != '#BLANK'       Click Element       ${RFC4028_dropdown}
    Sleep  3s
    #${RFC4028_get} =      run keyword and ignore error    get text       ${RFC4028_First}
    #run keyword and ignore error        set test variable           ${RFC4028_index}            ${RFC4028_get}
    Run Keyword If     '${Rfc4028}' == 'NONE'       Click Element    ${RFC4028_None}
    ...      ELSE IF   '${Rfc4028}' == '1'          Click Element    ${RFC4028_1}
    ...      ELSE IF   '${Rfc4028}' == '2'          Click Element    ${RFC4028_2}
    Sleep  2s

    Run Keyword If      '${Interworking}' != '#BLANK'        Click Element       ${Interworking_dropdown}
    Sleep  3s
    Run Keyword If          '${Interworking}' == 'UPDATE'        Click Element       ${Interworking_Update}
    ...         ELSE IF     '${Interworking}' == 'INVITE'        Click Element       ${Interworking_Invite}
    ...         ELSE IF     '${Interworking}' == 'NONE'         Click Element        ${Interworking_None}
    Sleep  2s


    Run Keyword If      '${Prack}' != '#BLANK'              Click Element   ${Prack_dropdown}
    Sleep  3s
    Run Keyword If          '${Prack}' == 'FORBID_PRACK'        Click Element      ${Prack_Forbid}
    ...         ELSE IF     '${Prack}' == 'NONE'                                      Click Element      ${Prack_None}
    Sleep  2s


    Run Keyword If      '${Session_control}' != '#BLANK'              Click Element   ${Session_control_dropdown}
    Sleep  3s
    #${Session_control_get} =       get text       ${Session_control_First}
    #set test variable           ${Session_control_index}            ${Session_control_get}
    Run Keyword If      '${Session_control}' == 'NONE'      Click Element    ${Session_control_None}
    ...     ELSE IF     '${Session_control}' == '1'         Click Element    ${Session_control_1}
    ...     ELSE IF     '${Session_control}' == '2'         Click Element    ${Session_control_2}
    Sleep  2s

    Run Keyword If      '${Session_control}' != '#BLANK'        Click Element     ${Session_limiter_dropdown}
    Sleep  3s
    #${Session_limiter_get} =       get text       ${Session_limiter_First}
    #set test variable           ${Session_limiter_index}            ${Session_limiter_get}
    Run Keyword If               '${Session_limiter}' == 'NONE'      Click Element    ${Session_limiter_None}
    ...         ELSE IF          '${Session_limiter}' == '1'         Click Element    ${Session_limiter_1}
    ...         ELSE IF          '${Session_limiter}' == '2'         Click Element    ${Session_limiter_2}
    Sleep  2s

    Run Keyword If      '${ASHM}' != '#BLANK'        Click Element   ${ASHM_button}
    Sleep  2s
    Run Keyword If      '${ASHM}' != '#BLANK'        Click Element   ${ASHM_dropdown}
    Sleep  3s
    #${ASHM_get} =       get text       ${ASHM_First}
    #set test variable           ${ASHM_index}            ${ASHM_get}
    Run Keyword If             '${ASHM1}' == 'NONE'      Click Element    ${ASHM_None}
    Sleep  1s
    Run Keyword If             '${ASHM2}' == '1'         Click Element    ${ASHM_1st}
    Sleep  1s
    Run Keyword If             '${ASHM3}' == '2'         Click Element    ${ASHM_2nd}
    Sleep  2s

    Run Keyword If      '${Check_source}' != '#BLANK'      Click Element   ${Check_source_dropdown}
    Sleep  3s
    Run Keyword If          '${Check_source}' == 'TRUE'        Click Element      ${Check_source_True}
    ...         ELSE IF     '${Check_source}' == 'FALSE'       Click Element      ${Check_source_False}
    ...         ELSE IF     '${Check_source}' == 'NONE'        Click Element      ${Check_source_None}
    Sleep       3s


    Run Keyword If      '${Silent}' != '#BLANK'      Click Element   ${Silent_dropdown}
    Sleep  3s
    Run Keyword If          '${Silent}' == 'TRUE'        Click Element      ${Silent_True}
    ...         ELSE IF     '${Silent}' == 'FALSE'       Click Element      ${Silent_False}
    ...         ELSE IF     '${Silent}' == 'NONE'        Click Element      ${Silent_None}
    Sleep  2s

    Run Keyword If   '${Home_domain}' != '#BLANK'      input text         ${Home_domain_field}    ${Home_domain}
    Sleep  1s
    Run Keyword If       '${Not_ChangePAI}' == 'TRUE'    Click Element      ${Not_ChangePAI_Checkbox}
    Run Keyword If   '${Extern_domain}' != '#BLANK'    input text         ${Extern_domain_field}    ${Extern_domain}
    Sleep  2s

    Run Keyword If      '${Forwarder_mode}' != '#BLANK'      Click Element   ${FWD_mode_dropdown}
    Sleep  3s
    Run Keyword If       '${Forwarder_mode}' == 'OFF'           Click Element      ${FWD_mode_Off}
    ...         ELSE IF  '${Forwarder_mode}' == 'STANDARD'      Click Element      ${FWD_mode_Standard}
    ...         ELSE IF  '${Forwarder_mode}' == 'AUTOLEARN'     Click Element      ${FWD_mode_AUTOLEARN}
    ...         ELSE IF  '${Forwarder_mode}' == 'SOURCE'        Click Element      ${FWD_mode_SOURCE}
    ...         ELSE IF  '${Forwarder_mode}' == 'ONCE'          Click Element      ${FWD_mode_Once}
    ...         ELSE IF  '${Forwarder_mode}' == 'AUTO_SECURE'   Click Element      ${FWD_mode_AUTO_SECURE}
    ...         ELSE IF  '${Forwarder_mode}' == 'NONE'          Click Element      ${FWD_mode_None}
    Sleep  2s

    Run Keyword If      '${Forwarder_domain}' != '#BLANK'     Click Element   ${FWD_domain_dropdown}
    Sleep  3s
    Run Keyword If       '${Forwarder_domain}' == 'extern'           Click Element      ${FWD_domain_extern}
    ...         ELSE IF  '${Forwarder_domain}' == 'LOCAL'            Click Element      ${FWD_domain_local}
    ...         ELSE IF  '${Forwarder_domain}' == 'NONE'             Click Element      ${FWD_domain_none}
    Sleep  2s

    Run Keyword If      '${Media_profile}' != '#BLANK'     Click Element   ${Media_profile_dropdown}
    Sleep  3s
    #${Media_profile_get} =       get text       ${Media_profile_first}
    #set test variable    ${Media_profile_index}             ${Media_profile_get}
    Run Keyword If          '${Media_profile}' == 'TRUE'        Click Element    ${Media_profile_first}
    ...         ELSE IF     '${Media_profile}' == 'NONE'        Click Element    ${Media_profile_none}
    Sleep  2s

    Press Keys    None    ESC
    Sleep  1s

    Run Keyword If      '${1st_SRTP}' != '#BLANK'     Click Element   ${1st_SRTP_dropdown}
    Sleep  3s
    #${1st_SRTP_get} =       get text       ${1st_SRTP_first}
    #set test variable    ${1st_SRTP_index}             ${1st_SRTP_get}
    Run Keyword If         '${1st_SRTP}' == 'TRUE'        Click Element    ${1st_SRTP_first}
    ...         ELSE IF    '${1st_SRTP}' == 'NONE'        Click Element    ${1st_SRTP_none}

    Sleep  2s
    Run Keyword If      '${2nd_SRTP}' != '#BLANK'     Click Element   ${2nd_SRTP_dropdown}
    Sleep  3s
    #${2nd_SRTP_get} =       get text       ${2nd_SRTP_first}
    #set test variable    ${2nd_SRTP_index}             ${2nd_SRTP_get}
    Run Keyword If      '${2nd_SRTP}' == 'TRUE'        Click Element    ${2nd_SRTP_first}
    ...         ELSE IF     '${2nd_SRTP}' == 'NONE'     Click Element    ${2nd_SRTP_none}
    Sleep  2s

    Run Keyword If   '${Maskv6}' != '#BLANK'      input text         ${Maskv6_field}    ${Maskv6}
    Sleep  1s
    Run Keyword If       '${Reveal}' == 'TRUE'        Click Element    ${Reveal_checkbox}
    Sleep  1s

    Run Keyword If   '${Precondition_entry}' != '#BLANK'               Click Element   ${Precondition_entry_dropdown}
    Sleep  3s

    Run Keyword If       '${Precondition_entry}' == '0'           Click Element      ${Precondition_entry_0}
    ...         ELSE IF  '${Precondition_entry}' == '1'           Click Element      ${Precondition_entry_1}
    ...         ELSE IF  '${Precondition_entry}' == '2'           Click Element      ${Precondition_entry_2}
    Sleep  1s

    Run Keyword If   '${Precondition_exit}' != '#BLANK'               Click Element   ${Precondition_exit_dropdown}
    Sleep  3s

    Run Keyword If       '${Precondition_exit}' == '0'           Click Element      ${Precondition_exit_0}
    ...         ELSE IF  '${Precondition_exit}' == '1'           Click Element      ${Precondition_exit_1}
    ...         ELSE IF  '${Precondition_exit}' == '2'           Click Element      ${Precondition_exit_2}
    Sleep  1s

Add Keep Alive parameters
     [Arguments]   ${Add_KA}	${KA_TPIP1}	 ${1st_Period1}     ${2nd_Period1}   ${Max_forward1}

    Run Keyword If   '${Add_KA}' == 'add'     Click Element         ${Keepalive_parameters_button}
    Sleep  1s
    Run Keyword If   '${Add_KA}' == 'add'       wait until page contains      Global Keep Alive      3s

    Run Keyword If      '${Add_KA}' != '#BLANK'       Click Element         ${Global_TPIP_dropdown}
    Sleep  3s
    Run Keyword If        '${KA_TPIP1}' == '1'       Click Element    ${Global_KA_TPIP1}
    ...     ELSE IF       '${KA_TPIP1}' == '2'       Click Element    ${Global_KA_TPIP2}
    Run Keyword If    '${1st_Period1}' != '#BLANK'     input text      ${1st_period_field1}     ${1st_Period1}
    Run Keyword If    '${2nd_Period1}' != '#BLANK'     input text      ${2nd_period_field1}     ${2nd_Period1}
    Run Keyword If    '${Max_forward1}' != '#BLANK'     input text      ${Max_forward_field1}    ${Max_forward1}

Edit Keep Alive parameters
     [Arguments]   ${less_more_Global_KA}  ${KA_TPIP2}     ${1st_Period2}     ${2nd_Period2}   ${Max_forward2}   ${less_more_KA_Domain1}  ${Keep_alive_domain1}  ${Keep_alive_domain_TPIP1}   ${less_more_KA_Domain2}  ${Keep_alive_domain2}  ${Keep_alive_domain_TPIP2}

    #Run Keyword If   '${less_more_Global_KA}' == 'add'     Click Element         ${Keepalive_parameters_button}
    #Sleep  1s

    Run Keyword If   '${less_more_Global_KA}' == 'add'          Click Element         ${Add_Keepalive_button}
    Sleep  1s
    Run Keyword If   '${less_more_Global_KA}' == 'remove'       Click Element         ${Remove_Keepalive_button}
    Sleep  1s

    Scroll Element Into View        ${Confirm_Add}
    Sleep       3s


    Run Keyword If      '${less_more_Global_KA}' == 'add'       Click Element         ${Global_TPIP_dropdown1}
    Sleep  2s
    Run Keyword If        '${KA_TPIP2}' == '1'       Click Element    ${Global_KA_TPIP3}
    ...     ELSE IF       '${KA_TPIP2}' == '2'       Click Element    ${Global_KA_TPIP4}
    Sleep  1s
    Run Keyword If    '${1st_Period2}' != '#BLANK'     input text      ${1st_period_field2}     ${1st_Period2}
    Run Keyword If    '${2nd_Period2}' != '#BLANK'     input text      ${2nd_period_field2}     ${2nd_Period2}
    Run Keyword If    '${Max_forward2}' != '#BLANK'     input text     ${Max_forward_field2}    ${Max_forward2}
    #KA Domain

    Run Keyword If   '${less_more_KA_Domain1}' == 'add'     Click Element         ${Add_Keepalive_Domain_Button}
    Run Keyword If   '${less_more_KA_Domain1}' == 'add'     wait until page contains     Keep alive domain     3s
    Run Keyword If   '${less_more_KA_Domain1}' == 'remove'     Click Element       ${Remove_Keepalive_Domain_Button}

    Scroll Element Into View        ${Confirm_Add}
    Sleep       3s
    Run Keyword If    '${Keep_alive_domain1}' != '#BLANK'     input text            ${KA_Domain_Field1}         ${Keep_alive_domain1}
    Run Keyword If      '${less_more_KA_Domain1}' == 'add'       Click Element         ${Domain_KA_TPIP_Dropdown}
    Sleep  1s
    Run Keyword If        '${Keep_alive_domain_TPIP1}' == '1'       Click Element    ${Domain_KA_TPIP1}
    ...     ELSE IF       '${Keep_alive_domain_TPIP1}' == '2'       Click Element    ${Domain_KA_TPIP2}
    Sleep  2s
    Run Keyword If   '${less_more_KA_Domain2}' == 'add'     Click Element           ${Add_Keepalive_Domain_Button}
    Sleep  1s
    Run Keyword If   '${less_more_KA_Domain2}' == 'remove'     Click Element         ${Remove_Keepalive_Domain_Button}
    Sleep  1s

    Scroll Element Into View        ${Confirm_Add}
    Sleep       3s

    Run Keyword If    '${Keep_alive_domain2}' != '#BLANK'     input text           ${KA_Domain_Field2}          ${Keep_alive_domain2}
    Run Keyword If      '${less_more_KA_Domain2}' == 'add'       Click Element         ${Domain_KA_TPIP_Dropdown1}
    Sleep  1s


    Run Keyword If        '${Keep_alive_domain_TPIP2}' == '1'       Click Element    ${Domain_KA_TPIP3}
    ...     ELSE IF       '${Keep_alive_domain_TPIP2}' == '2'       Click Element    ${Domain_KA_TPIP4}


View Peer
    [Arguments]    ${Name}  ${Max_in}	${Max_out}	 ${Routing}	   ${Authorization}   ${Domain}

    Click Element       ${Peer_Field}
    Sleep   1s

    Click View Element With 2 Info      ${Name}    ${Domain}
    Sleep       3s

    Verify Page Contains 2 Expected Elements    Name                                            ${Name}
    Verify Page Contains 2 Expected Elements    Domain                                          ${Domain}
    Verify Page Contains 2 Expected Elements    Maximum incoming                                ${Max_in}
    Verify Page Contains 2 Expected Elements    Maximum outgoing                                ${Max_out}
    Verify Page Contains 2 Expected Elements    Routing profile                                 ${Routing}
    Verify Page Contains 2 Expected Elements    Authorization profile                           ${Authorization}

View Peer 71
    [Arguments]    ${Name}  ${Max_in}	${Max_out}	 ${Routing}	   ${Authorization}   ${Domain}   ${Precondition_entry}   ${Precondition_exit}

    Click Element       ${Peer_Field}
    Sleep   1s

    Click View Element With 2 Info      ${Name}    ${Domain}
    Sleep       3s

    Verify Page Contains 2 Expected Elements    Name                                            ${Name}
    Verify Page Contains 2 Expected Elements    Domain                                          ${Domain}
    Verify Page Contains 2 Expected Elements    Maximum incoming                                ${Max_in}
    Verify Page Contains 2 Expected Elements    Maximum outgoing                                ${Max_out}
    Verify Page Contains 2 Expected Elements    Routing profile                                 ${Routing}
    Run Keyword If    '${Precondition_entry}' != '#BLANK'      Verify Page Contains 2 Expected Elements    Precondition Entry                               ${Precondition_entry}
    Run Keyword If    '${Precondition_exit}' != '#BLANK'      Verify Page Contains 2 Expected Elements    Precondition Exit                              ${Precondition_exit}

Add Invalid Peer
    [Arguments]   ${Name}  ${Domain}   ${Max_Diversion}

    Click Element       ${Add_Button}
    Sleep       3s

    Run Keyword If  '${Name}' != '#BLANK'    input text       ${Name_Field}              ${Name}
    Sleep       1s

    Run Keyword If  '${Domain}' != '#BLANK'    input text       ${Multi_Domain_Field}              ${Domain}
    Sleep       1s

    Run Keyword If   '${Max_Diversion}' != '#BLANK'    input text      ${Max_Diversion_Field}        ${Max_Diversion}

    Click Element       ${Confirm_Add}
    Sleep       7s


#########################  Trusted  #########################
Add Trusted
    [Arguments]  ${IP}  ${Port}
    Click Element       ${Add_Button}
    Sleep       3s

    Run Keyword If  '${IP}' != '#BLANK'    input text       ${IP_Field}              ${IP}
    Sleep       1s

    Run Keyword If  '${Port}' != '#BLANK'    input text       ${Port_Field}              ${Port}

    Click Element       ${Confirm_Add_Trusted}
    Sleep       7s

