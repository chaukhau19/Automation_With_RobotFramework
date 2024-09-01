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

${ICSCF_TPIP_dropdown}				xpath=//label[contains(text(),'TPIP extern')]/preceding::div[1]/input
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
${Check_source_True}	    		xpath=//label[contains(text(),'Check source IP')]/preceding::div[1]//span[contains(text(),'True')]
${Check_source_False}		    	xpath=//label[contains(text(),'Check source IP')]/preceding::div[1]//span[contains(text(),'False')]

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

${Peer_section}                      xpath=//*[@class='collapsible-header active' and contains(text(),'ICSCF')]/following::div//a[@class='collapsible-header first-menu' and contains(text(),'Peer')]
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

${Capabilities_Dropdown}         xpath=//label[contains(text(),'Capabilities')]//preceding::div[1]/input
${auto_Edit_Capa_1_Field}        xpath=//*[@id="content-container"]//following::span[contains(.,'auto_Edit_Capa_1')]
${auto_Edit_Capa_2_Field}        xpath=//*[@id="content-container"]//following::span[contains(.,'auto_Edit_Capa_2')]

##############################  Trusted  ####################
${Confirm_Add_Trusted}               xpath=//button[@type='submit']
############################## Matching Rules #################

############################## SCSCF #################
${SCSCF_section}                      xpath=//*[@class='collapsible-header active' and contains(text(),'Icscf')]/following::div//a[@class='collapsible-header first-menu' and contains(text(),'Scscf')]

*** Keywords ***
Go to SCSCF section in ICSCF tab
    Click Element        ${ICSCF_tab}
    Sleep  1s
    Click Element        ${SCSCF_section}
    Sleep       3s


Add Valid Capability
    [Arguments]     ${Name}  ${Index}

    Click Element       ${Capability}
    Sleep   1s
    Click Element       ${Add_Button}
    Sleep  2s

    Run Keyword If  '${Name}' != '#BLANK'                           input text          ${Name_Field}              ${Name}
    Run Keyword If  '${Index}' != '#BLANK'                         input text          ${Index_Field}                 ${Index}
    Click Element       ${Confirm_Add_Capa}
    Sleep       3s
    #Add_Edit Matching       ${Element_type}	  ${Element_name}	${Matching_value}    ${Codec_type}    ${Attribute}	  ${Instance}  	${Condition_type}   ${Min_occ}	  ${Max_occ}

Edit Valid Capability
    [Arguments]     ${Index}  ${New_index}

    Click Element       ${Capability}
    Sleep   1s
    Click Edit Element With 1 Info      ${Index}
    Run Keyword If      '${New_index}' != '#BLANK'                         input text          ${Index_Field}                 ${New_index}
    Click Element       ${Confirm_Add_Capa}
    Sleep       3s

View Capability
    [Arguments]     ${Index}  ${Name}

    Click Element       ${Capability}
    Sleep   1s
    Click View Element With 1 Info          ${Index}
    Sleep       3s

    Verify Page Contains 1 Expected Elements     ${Index}
    Verify Page Contains 1 Expected Elements     ${Name}

############################## Scscf #################################

Add Valid Scscf
    [Arguments]     ${Name}     ${Orig_Url}	  ${Term_Url}   ${Capa_1}	  ${Capa_2}

    Click Element       ${Scscf}
    Sleep   1s
    Click Element       ${Add_Button}
    Sleep  2s

    Run Keyword If  '${Name}' != '#BLANK'                           input text          ${Name_Field}              ${Name}
    Run Keyword If  '${Orig_Url}' != '#BLANK'                         input text          ${Orig_Field}                 ${Orig_Url}
    Run Keyword If  '${Term_Url}' != '#BLANK'                         input text          ${Term_Field}                 ${Term_Url}
    Run Keyword If  '${Capa_1}' != '#BLANK'                          Click Element             ${Capabilities_Dropdown}
    Sleep   1s
    Run Keyword If      '${Capa_1}' == 'auto_Edit_Capa_1'               Click Element             ${auto_Edit_Capa_1_Field}
    Run Keyword If      '${Capa_2}' == 'auto_Edit_Capa_2'                 Click Element             ${auto_Edit_Capa_2_Field}
    Click Element       ${Orig_Field}
    Sleep   1s
    Click Element       ${Confirm_Add_Capa}
    Sleep       3s

Edit Valid Scscf
    [Arguments]     ${Orig_URL}  ${Term_URL}   ${New_Orig_URL}  ${New_Term_URL}   ${Capa_1}

    Click Element       ${Scscf}
    Sleep   1s
    Click Edit Element With 3 Info      ${Orig_URL}      ${Term_URL}        ${Capa_1}
    Run Keyword If      '${Orig_URL}' != '#BLANK'                         input text          ${Orig_Field}                 ${New_Orig_URL}
    Run Keyword If      '${Term_URL}' != '#BLANK'                         input text          ${Term_Field}                 ${New_Term_URL }
    Run Keyword If  '${Capa_1}' != '#BLANK'                          Click Element             ${Capabilities_Dropdown}
    Sleep   2s
    Run Keyword If      '${Capa_1}' == 'auto_Edit_Capa_1'               Click Element             ${auto_Edit_Capa_1_Field}
    Click Element       ${Orig_Field}
    Sleep   2s
    Click Element       ${Confirm_Add_Capa}
    Sleep       3s

View Scscf
    [Arguments]     ${Orig_url}  ${Term_url}  ${Capa_view}

    Click Element       ${Scscf}
    Sleep   1s
    Click View Element With 1 Info          ${Orig_url}
    Sleep       3s

    Verify Page Contains 1 Expected Elements     ${Orig_url}
    Verify Page Contains 1 Expected Elements     ${Term_url}
    Verify Page Contains 1 Expected Elements     ${Capa_view}