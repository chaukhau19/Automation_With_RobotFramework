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
${Maxin_Field}			           id=max_in
${FDUD_True}						xpath=//button[@value='True']
${FDUD_False}						xpath=//button[@value='False']
${Session_control_dropdown}			xpath=//label[contains(text(),'Session control')]/preceding::div[1]/input
${Session_control_None}			    xpath=//label[contains(text(),'Session control')]/preceding::div[1]/ul/li[1]
${Session_control_1}			    xpath=//label[contains(text(),'Session control')]/preceding::div[1]/ul/li[2]
${Session_control_2}			    xpath=//label[contains(text(),'Session control')]/preceding::div[1]/ul/li[3]
${ASHM_dropdown}					xpath=//label[contains(text(),'SIP Header manipulation profile')]/preceding::div[1]/input
${ASHM_None}	    				xpath=//label[contains(text(),'SIP Header manipulation profile')]/preceding::div[1]/ul/li[1]
${ASHM_1st}   					    xpath=//label[contains(text(),'SIP Header manipulation profile')]/preceding::div[1]/ul/li[2]
${ASHM_2nd}   					    xpath=//label[contains(text(),'SIP Header manipulation profile')]/preceding::div[1]/ul/li[3]
${ASHM_label}						xpath=//label[contains(text(),'SIP Header manipulation profile')]
${Behavior_dropdown}			    xpath=//label[contains(text(),'Behavior')]/preceding::div[1]/input
${PCRF_dropdown}					xpath=//label[contains(text(),'Pcrf Subscription Profile')]/preceding::div[1]/input
${PCRF_None}						xpath=//label[contains(text(),'Pcrf Subscription Profile')]/preceding::div[1]/ul/li[1]
${PCRF_1}							xpath=//label[contains(text(),'Pcrf Subscription Profile')]/preceding::div[1]/ul/li[2]
${PCRF_2}							xpath=//label[contains(text(),'Pcrf Subscription Profile')]/preceding::div[1]/ul/li[3]
${Autho_dropdown}				    xpath=//label[contains(text(),'Authorization profile')]/preceding::div[1]/input
${Autho_index_1}                    xpath=//label[contains(text(),'Authorization profile')]/preceding::div[1]/ul/li[1]
${Autho_index_2}                    xpath=//label[contains(text(),'Authorization profile')]/preceding::div[1]/ul/li[2]
${Autho_index_3}                    xpath=//label[contains(text(),'Authorization profile')]/preceding::div[1]/ul/li[3]
${ATCF_Unchecked}					xpath=//label[contains(text(),'ATCF')]
${ATCF_Checked}						xpath=//label[contains(text(),'ATCF')]
${RFC6140_Checked}					xpath=//label[contains(text(),'RFC6140')]
${RFC6140_Unchecked}				xpath=//label[contains(text(),'RFC6140')]
${PHF_dropdown}						xpath=//label[contains(text(),'Pheader filtering profile')]/preceding::div[1]/input
${PHF_None}							xpath=//label[contains(text(),'Pheader filtering profile')]/preceding::div[1]/ul/li[1]
${PHF_1}							xpath=//label[contains(text(),'Pheader filtering profile')]/preceding::div[1]/ul/li[2]
${PHF_2}							xpath=//label[contains(text(),'Pheader filtering profile')]/preceding::div[1]/ul/li[3]
${Lac_stripping_TRUE}                        xpath=//label[contains(text(),'LAC Stripping')]/following::button[contains(text(),'True')]
${Lac_stripping_FALSE}                       xpath=//label[contains(text(),'LAC Stripping')]/following::button[contains(text(),'False')]
${Media_profile_dropdown}			xpath=//label[contains(text(),'Media profile')]/preceding::div[1]/input
${Media_profile_none}		    	xpath=//label[contains(text(),'Media profile')]/preceding::div[1]/ul/li[1]
${Media_profile_first}		    	xpath=//label[contains(text(),'Media profile')]/preceding::div[1]/ul/li[2]
${Media_profile_second}		    	xpath=//label[contains(text(),'Media profile')]/preceding::div[1]/ul/li[3]
${1st_SRTP_dropdown}				xpath=//label[contains(text(),'1st SRTP profile')]/preceding::div[1]/input
${1st_SRTP_none}	    			xpath=//label[contains(text(),'1st SRTP profile')]/preceding::div[1]/ul/li[1]
${1st_SRTP_first}   				xpath=//label[contains(text(),'1st SRTP profile')]/preceding::div[1]/ul/li[2]
${1st_SRTP_second}   				xpath=//label[contains(text(),'1st SRTP profile')]/preceding::div[1]/ul/li[3]
${2nd_SRTP_dropdown}				xpath=//label[contains(text(),'2nd SRTP profile')]/preceding::div[1]/input
${2nd_SRTP_none}	    			xpath=//label[contains(text(),'2nd SRTP profile')]/preceding::div[1]/ul/li[1]
${2nd_SRTP_first}   				xpath=//label[contains(text(),'2nd SRTP profile')]/preceding::div[1]/ul/li[2]
${2nd_SRTP_second}   				xpath=//label[contains(text(),'2nd SRTP profile')]/preceding::div[1]/ul/li[3]
${User2Net_dropdown}                xpath=//label[@for='user2network']/preceding::div[1]/input
${User2Net_2}                       xpath=//label[@for='user2network']/preceding::div[1]//span[contains(text(),'2')]
${User2Net_3}                       xpath=//label[@for='user2network']/preceding::div[1]//span[contains(text(),'3')]
${User2Net_None}                    xpath=//label[@for='user2network']/preceding::div[1]//span[contains(text(),'NONE')]

${Net2User_dropdown}                xpath=//label[@for='network2user']/preceding::div[1]/input
${Net2User_2}                       xpath=//label[@for='network2user']/preceding::div[1]//span[contains(text(),'2')]
${Net2User_3}                       xpath=//label[@for='network2user']/preceding::div[1]//span[contains(text(),'3')]
${Net2User_None}                    xpath=//label[@for='network2user']/preceding::div[1]//span[contains(text(),'NONE')]

${Peer_section}                      xpath=//*[@class='collapsible-header active' and contains(text(),'Pcscf')]/following::div//a[@class='collapsible-header first-menu' and contains(text(),'Peer')]
${Peer_Field}                        xpath=//*[@class='collapsible-header first-menu active' and contains(text(),'Peer')]/following::div//a[@class='sub-menu' and contains(text(),'Peer')]

${Block_Peer_True}                   xpath=//label[contains(text(),'Block peer')]/following::button[contains(text(),'True')]
${Block_Peer_False}                  xpath=//label[contains(text(),'Block peer')]/following::button[contains(text(),'False')]
${Block_Incoming_True}               xpath=//label[contains(text(),'Block incoming peer')]/following::button[contains(text(),'True')]
${Block_Incoming_False}              xpath=//label[contains(text(),'Block incoming peer')]/following::button[contains(text(),'False')]
${Block_Outgoing_True}               xpath=//label[contains(text(),'outgoing peer')]/following::button[contains(text(),'True')]
${Block_Outgoing_False}              xpath=//label[contains(text(),'outgoing peer')]/following::button[contains(text(),'False')]
##############################  Trusted  ####################
${Confirm_Add_Trusted}               xpath=//button[@type='submit']
############################## UA Profiles #################
${UA_Field}							xpath=//a[contains(text(),'User agent')]
${UA_Profile_Field}					id=ua_profile
${UA_Name_Field}					id=ua_names-0-ua_name
${Add_UA_Button}					id=add_ua_name
${Remove_UA_Button_1}               xpath=//label[@for='ua_names-1-ua_name']//following::*[contains(text(),'remove_circle_outline')]
${Remove_UA_Button_2}               xpath=//label[@for='ua_names-2-ua_name']//following::*[contains(text(),'remove_circle_outline')]
${UA_Name_1_Field}					id=ua_names-1-ua_name
${UA_Name_2_Field}					id=ua_names-2-ua_name
${Word_Processor_Button}			xpath=//button[@value='Word processor']
${SIP_Header_Button}				xpath=//button[@value='Sip manipulation profile']
${Word_Processor_Dropdown}			xpath=//label[@for='wp']/preceding::div[1]/input
${WP_File}				            xpath=//label[@for='wp']/preceding::span[contains(., 'word_processing.cfg')]
${SIP_Header_Dropdown}				xpath=//label[@for='header_manipulation']/preceding::div[1]/input
${SIP_Header_Profile}				xpath=//label[@for='header_manipulation']/preceding::div[1]/ul/li[2]/span
${Label_Select}                     xpath=//label[@for='wp_or_hm']
${Autho_Profile_Dropdown}			xpath=//label[@for='authorization']/preceding::div[1]/input
${Autho_Profile_1}					xpath=//label[@for='authorization']/preceding::div[1]/ul/li[1]/span
${Autho_Profile_2}					xpath=//label[@for='authorization']/preceding::div[1]/ul/li[2]/span
${SIP_Error_Code_Field}				id=NoneRegErrorCodeUE
${UA_Reason_Phrase_Field}		    id=NoneRegReasonPhraseUE
${Check_ATCF}	         			xpath=//label[@for='atcf']
##############################PCRF Profiles #################
${PCRF_Field}						xpath=//a[contains(text(),'Pcrf Subscription Profile')]
${Sig_path_True}					xpath=//label[@for='sig_path_status']//following::div[1]/button[@value='True']
${Sig_path_False}					xpath=//label[@for='sig_path_status']//following::div[1]/button[@value='False']
${Ip_can_True}						xpath=//label[@for='ip_can']//following::div[1]/button[@value='True']
${Ip_can_False}						xpath=//label[@for='ip_can']//following::div[1]/button[@value='False']
${Access_True}						xpath=//label[@for='access_charging']//following::div[1]/button[@value='True']
${Access_False}						xpath=//label[@for='access_charging']//following::div[1]/button[@value='False']
##############################Pheader Filter Profiles #################
${PHF_Field}						xpath=//a[contains(text(),'Pheaders Filtering Profile')]
${Pheader_Dropdown}					xpath=//label[@for='pheaders']//preceding::div[1]/input
${Pheader_PAI}						xpath=//label[@for='pheaders']//preceding::span[contains(.,'P-Asserted-Identity')]
${Pheader_PPI}						xpath=//label[@for='pheaders']//preceding::span[contains(.,'P-Preferred-Identity')]
${Pheader_PCV}						xpath=//label[@for='pheaders']//preceding::span[contains(.,'P-Charging-Vector')]
${Pheader_PCFA}						xpath=//label[@for='pheaders']//preceding::span[contains(.,'P-Charging-Function-Addresses')]
${Pheader_PCPI}						xpath=//label[@for='pheaders']//preceding::span[contains(.,'P-Called-Party-ID')]
${Pheader_PVNI}						xpath=//label[@for='pheaders']//preceding::span[contains(.,'P-Visited-Network-ID')]
${Pheader_PANI}						xpath=//label[@for='pheaders']//preceding::span[contains(.,'P-Access-Network-Info')]
${Pheader_PAU}                      xpath=//label[@for='pheaders']//preceding::span[contains(.,'P-Associated-Uri')]
${While_Label}                      xpath=//a[contains(text(),'White label')]
${Core_to_peer_Button}              xpath=//button[@value='CORE_TO_PEER']
${Peer_to_core_Button}              xpath=//button[@value='PEER_TO_CORE']
${Both_Button}                      xpath=//button[@value='BOTH']
*** Keywords ***
Go to Peer section in PCSCF tab
    Click Element        ${PCSCF_tab}
    Sleep  1s
    Click Element        ${Peer_section}
    Sleep   1s


Add Matching
    [Arguments]     ${Name}  ${Header}	${Element_type}	  ${Element_name}	${Matching_value}    ${Codec_type}    ${Attribute}	  ${Instance}  	${Condition_type}   ${Min_occ}	  ${Max_occ}

    Click Element       ${MatchingRule}
    Sleep   1s
    Click Element       ${Add_Button}
    Sleep  2s

    Run Keyword If  '${Name}' != '#BLANK'                           input text          ${Rule_Name_Field}              ${Name}
    Run Keyword If  '${Header}' != '#BLANK'                         input text          ${Header_Field}                 ${Header}
    Sleep   3s
    Add_Edit Matching       ${Element_type}	  ${Element_name}	${Matching_value}    ${Codec_type}    ${Attribute}	  ${Instance}  	${Condition_type}   ${Min_occ}	  ${Max_occ}

Edit Matching
    [Arguments]     ${Name}  ${Header}	${New_Header}     ${Element_type}	  ${Element_name}	${Matching_value}    ${Codec_type}    ${Attribute}	  ${Instance}  	${Condition_type}   ${Min_occ}	  ${Max_occ}

    Click Element       ${MatchingRule}
    Sleep   1s
    Click Edit Element With 2 Info      ${Name}    ${Header}

    Run Keyword If      '${New_Header}' != '#BLANK'                         input text          ${Header_Field}                 ${New_Header}
    Sleep   3s
    Add_Edit Matching       ${Element_type}	  ${Element_name}	${Matching_value}    ${Codec_type}    ${Attribute}	  ${Instance}  	${Condition_type}   ${Min_occ}	  ${Max_occ}

Add_Edit Matching
    [Arguments]     ${Element_type}	  ${Element_name}	${Matching_value}    ${Codec_type}    ${Attribute}	  ${Instance}  	${Condition_type}   ${Min_occ}	  ${Max_occ}
    Run Keyword If      '${Element_type}' != '#BLANK'                   Click Element       ${Element_Dropdown_List}
    Sleep  1s
    Run Keyword If      '${Element_type}' == 'HEADER-NAME'              Click Element       ${Element_Header_Name}
    ...     ELSE IF     '${Element_type}' == 'HEADER-VALUE'             Click Element       ${Element_Header_Value}
    ...     ELSE IF     '${Element_type}' == 'HEADER-PARAM'             Click Element       ${Element_Header_Param}
    ...     ELSE IF     '${Element_type}' == 'HEADER-PARAM-NAME'        Click Element       ${Element_Param_Name}
    ...     ELSE IF     '${Element_type}' == 'URI-VALUE'                Click Element       ${Element_Uri_Value}
    ...     ELSE IF     '${Element_type}' == 'URI-PARAM'                Click Element       ${Element_Uri_Param}
    ...     ELSE IF     '${Element_type}' == 'URI-PARAM-NAME'           Click Element       ${Element_Uri_Param_Name}
    ...     ELSE IF     '${Element_type}' == 'URI-USER'                 Click Element       ${Element_Uri_User}
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
    Sleep  3s

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
    Sleep   1s
    Click Element       ${Add_Button}
    Sleep  2s

    Run Keyword If  '${Name}' != '#BLANK'                           input text          ${Rule_Name_Field}              ${Name}
    Sleep  1s
    Run Keyword If  '${Header}' != '#BLANK'                         input text          ${Header_Field}                 ${Header}
    Sleep  10s
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
    Sleep   3s
    Add_Edit ManipulationRules     ${Action_type}     ${Element_type}	  ${Element_name}   ${Attribute}	  ${New_value}
    ...             ${Rule_value_new}    ${Rule_value_original}      ${Codec_type}    ${Instance}       ${Content_type}     ${Sub_type}     ${Boundary}
    ...             ${Version}      ${Base}     ${Disposition}      ${Handling}     ${Content_value}

Add_Edit ManipulationRules
    [Arguments]     ${Action_type}     ${Element_type}	  ${Element_name}   ${Attribute}	  ${New_value}
    ...             ${Rule_value_new}    ${Rule_value_original}      ${Codec_type}    ${Instance}       ${Content_type}     ${Sub_type}     ${Boundary}
    ...             ${Version}      ${Base}     ${Disposition}      ${Handling}     ${Content_value}
    Run Keyword If  '${Action_type}' != '#BLANK'                   Click Element        ${Action_Dropdown_List}
    Sleep  5s
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
    Sleep  10s
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
    ...     ELSE                                                        Click Element       ${Element_Header_Name}
    Sleep  1s
    Run Keyword If  '${Element_name}' != '#BLANK'                   input text          ${Element_Name_Field}                 ${Element_name}
    Run Keyword If  '${Attribute}' != '#BLANK'                      input text          ${Attribute_Field}                    ${Attribute}
    Run Keyword If  '${New_value}' != '#BLANK'                      input text          ${New_Value_Field}                    ${New_value}
    Run Keyword If  '${Rule_value_new}' != '#BLANK'                 input text          ${Rule_Value_New_Field}               ${Rule_value_new}
    Run Keyword If  '${Rule_value_original}' != '#BLANK'            input text          ${Rule_Value_Original_Field}          ${Rule_value_original}
    Run Keyword If  '${Codec_type}' != '#BLANK'                     input text          ${Codec_Type_Field}                   ${Codec_type}
    Run Keyword If  '${Instance}' != '#BLANK'                       input text          ${Instance_Field}                     ${Instance}
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
    Sleep  3s

    Verify Page Contains 2 Expected Elements    Manipulation rule name                    ${Mani_rule_name}
    Verify Page Contains 2 Expected Elements    Header name                               ${Header_name}
    Verify Page Contains 2 Expected Elements    Action type                               ${Action_type}

Add Header Authorization Profiles
    [Arguments]   ${Name}  ${Method_type}	${Policy}	 ${Return_code}   ${Matching_rule}

    Click Element       ${HAP_Field}
    Sleep   1s
    Click Element       ${Add_Button}
    Sleep       2s

    Run Keyword If  '${Name}' != '#BLANK'                     input text          ${Name_Field}                     ${Name}
    Sleep       1s
    Run Keyword If  '${Method_type}' != '#BLANK'              input text          ${Method_Type_Field}              ${Method_type}
    Sleep       1s
    Run Keyword If      '${Policy}' == 'Accept'                   Click Element       ${P_Policy_Accept}
    ...     ELSE IF     '${Policy}' == 'Reject'                   run keywords          Click Element       xpath=//button[@value='Reject']    AND     input text      id=return_code      ${Return_code}
    ...     ELSE IF      '${Policy}' == 'Ignore'                  Click Element       ${P_Policy_Ignore}
    ...     ELSE                                                  Click Element       ${P_Policy_Accept}

    Sleep       1s
    Run Keyword If  '${Matching_rule}' != '#BLANK'            input text           ${Maching_Rules_Field}            ${Matching_rule}
    Sleep       1s
    Click Element       ${Confirm_Add}
    Sleep       3s

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
    Sleep   2s
    Add_Edit Authorization Profiles     ${Default_authorization}	 ${Return_code}   ${Header_authorization_filter}    ${Method1}   ${Subscribe_event1}      ${Authorization1}    ${Return_code1}    ${less_more_authprofile}     ${Method2}   ${Subscribe_event2}      ${Authorization2}    ${Return_code2}

View Header Authorization Profiles
    [Arguments]     ${Name}    ${Method_type}  ${Policy}  ${Matching_rule}

    Click Element       ${HAP_Field}
    Sleep   1s
    Click View Element With 2 Info          ${Name}    ${Policy}
    Sleep  3s

    Verify Page Contains 2 Expected Elements    Name                                 ${Name}
    Verify Page Contains 2 Expected Elements    Policy                               ${Policy}
    Verify Page Contains 2 Expected Elements    Method type                          ${Method_type}

    Run Keyword If  '${Matching_rule}' != '#BLANK'          Verify Page Contains 2 Expected Elements    Matching rules                          ${Matching_rule}

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
    Sleep   1s
    Run Keyword If      '${Header_authorization_filter}' == '1'                   Click Element       ${HAP_1}
    Sleep   1s
    Run Keyword If      '${Header_authorization_filter}' == '2'        run keywords           Click Element       ${HAP_2}      AND     Click Element        ${HAP_1}
    Sleep   1s
    Click Element   ${HAP_Label}
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
    Sleep  3s

    Verify Page Contains 2 Expected Elements    Index                                                ${Name}
    Verify Page Contains 2 Expected Elements    Default authorization                               ${Default_authorization}

Add Header Manipulation
    [Arguments]   ${Name}  ${Processing_order}  ${Method}  ${Method1}  ${Method2}  ${Method3}  ${Method4}  ${Method5}  ${Method6}  ${Method7}  ${Method8}  ${Method9}  ${Method10}  ${Method11}  ${Method12}  ${Method13}  ${Method14}   ${Manipulation_rule}  ${Manipulation_rule_1}  ${Manipulation_rule_2}   ${Message_type}     ${Direction}   ${Matching_rule}

    Click Element       ${HM_Field}
    Sleep   1s
    Click Element       ${Add_Button}
    Sleep       2s

    Run Keyword If  '${Name}' != '#BLANK'                     input text          ${Name_HM_Field}                     ${Name}
    Sleep       1s

    Run Keyword If  '${Processing_order}' != '#BLANK'                     Click Element          ${Processing_Dropdown_List}
    Sleep  1s
    Run Keyword If      '${Processing_order}' == 'IN'                           Click Element          ${Processing_Order_IN}
    ...  ELSE IF        '${Processing_order}' == 'OUT'                          Click Element          ${Processing_Order_OUT}
    ...  ELSE                                                                   Click Element          ${Processing_Order_IN}
    Sleep  1s

    Add_Edit Header Manipulation   ${Method}  ${Method1}  ${Method2}  ${Method3}  ${Method4}  ${Method5}  ${Method6}  ${Method7}  ${Method8}  ${Method9}  ${Method10}  ${Method11}  ${Method12}  ${Method13}  ${Method14}    ${Manipulation_rule}    ${Manipulation_rule_1}   ${Manipulation_rule_2}   ${Message_type}     ${Direction}   ${Matching_rule}

Edit Header Manipulation
    [Arguments]   ${Name}  ${Processing_order}  ${New_Processing_order}  ${Method}  ${Method1}  ${Method2}  ${Method3}  ${Method4}  ${Method5}  ${Method6}  ${Method7}  ${Method8}  ${Method9}  ${Method10}  ${Method11}  ${Method12}  ${Method13}  ${Method14}   ${Manipulation_rule}  ${Manipulation_rule_1}  ${Manipulation_rule_2}   ${Message_type}     ${Direction}   ${Matching_rule}

    Click Element       ${HM_Field}
    Sleep   1s
    Click Edit Element With 2 Info      ${Name}    ${Processing_order}
    Sleep       2s

    Run Keyword If  '${New_Processing_order}' != '#BLANK'                     Click Element          ${Processing_Dropdown_List}
    Sleep  1s
    Run Keyword If      '${New_Processing_order}' == 'IN'                           Click Element          ${Processing_Order_IN}
    ...  ELSE IF        '${New_Processing_order}' == 'OUT'                          Click Element          ${Processing_Order_OUT}
    ...  ELSE                                                                   Click Element          ${Processing_Order_IN}
    Sleep  1s

    Add_Edit Header Manipulation   ${Method}  ${Method1}  ${Method2}  ${Method3}  ${Method4}  ${Method5}  ${Method6}  ${Method7}  ${Method8}  ${Method9}  ${Method10}  ${Method11}  ${Method12}  ${Method13}  ${Method14}    ${Manipulation_rule}    ${Manipulation_rule_1}   ${Manipulation_rule_2}   ${Message_type}     ${Direction}   ${Matching_rule}

Add_Edit Header Manipulation
    [Arguments]    ${Method}   ${Method1}  ${Method2}  ${Method3}  ${Method4}  ${Method5}  ${Method6}  ${Method7}  ${Method8}  ${Method9}  ${Method10}  ${Method11}  ${Method12}  ${Method13}   ${Method14}   ${Manipulation_rule}   ${Manipulation_rule_1}   ${Manipulation_rule_2}   ${Message_type}     ${Direction}   ${Matching_rule}

    Run Keyword If  '${Method}' != '#BLANK'                         Click Element          ${Method_Dropdown_List}
    Sleep  1s
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

    Sleep  3s

    Click Element        ${MR_Label}
    Sleep  1s
    Run Keyword If      '${Manipulation_rule}' != '#BLANK'                Click Element          ${MR_Dropdown_List}
    Sleep  2s

    Run Keyword If      '${Manipulation_rule_1}' != '#BLANK'           Click Element          ${MR_1}

    Run Keyword If      '${Manipulation_rule_2}' != '#BLANK'           Click Element          ${MR_2}
    Sleep  2s
    Click Element           ${Message_Label}
    Sleep  1s
    Run Keyword If  '${Message_type}' != '#BLANK'                Click Element          ${Message_Dropdown_List}
    Sleep  1s
    Run Keyword If      '${Message_type}' == 'BOTH'           Click Element          ${Message_Type_Both}
    ...  ELSE IF        '${Message_type}' == 'REQUEST'        Click Element          ${Message_Type_Request}
    ...  ELSE IF        '${Message_type}' == 'RESPONSE'       Click Element          ${Message_Type_Response}
    Sleep  1s
    Run Keyword If  '${Direction}' != '#BLANK'         Click Element          ${Direction_Dropdown_List}
    Sleep  1s
    Run Keyword If      '${Direction}' == 'BOTH'                Click Element          ${Direction_Both}
    ...  ELSE IF        '${Direction}' == 'CORE_TO_PEER'        Click Element       ${Direction_Core_To_Peer}
    ...  ELSE IF        '${Direction}' == 'PEER_TO_CORE'       Click Element       ${Direction_Peer_To_Core}
    Sleep  1s
    Run Keyword If  '${Matching_rule}' != '#BLANK'          input text          ${Maching_Rules_Field}                     ${Matching_rule}
    Sleep  1s
    Click Element       ${Confirm_Add_MatRul}
    Sleep       3s

View Header Manipulation
    [Arguments]     ${Manipulation_profile}  ${Processing_order}  ${Message_type}  ${Direction}  ${Matching_rule}

    Click Element       ${HM_Field}
    Sleep   1s
    Click View Element With 2 Info          ${Manipulation_profile}  ${Processing_order}
    Sleep  3s

    Verify Page Contains 2 Expected Elements    SIP manipulation profile                                ${Manipulation_profile}
    Verify Page Contains 2 Expected Elements    Processing order                                        ${Processing_order}
    Verify Page Contains 2 Expected Elements    Message Type                                            ${Message_type}
    Verify Page Contains 2 Expected Elements    Direction                                               ${Direction}
    Run Keyword If  '${Matching_rule}' != '#BLANK'          Verify Page Contains 2 Expected Elements    Matching rule   ${Matching_rule}

Add Session Control
    [Arguments]   ${Name}  ${less_more_limitation1}
    ...            ${Limit_media_type1}     ${Limit_in_session1}      ${Limit_out_session1}     ${Limit_glo_session1}      ${less_more_limitation2}
    ...            ${Limit_media_type2}     ${Limit_in_session2}      ${Limit_out_session2}     ${Limit_glo_session2}

    Click Element       ${SC_Field}
    Sleep   1s
    Click Element       ${Add_Button}
    Sleep       2s

    Run Keyword If  '${Name}' != '#BLANK'                      input text          ${Name_Field}                      ${Name}

    Add_Edit Session Control  ${less_more_limitation1}
    ...            ${Limit_media_type1}     ${Limit_in_session1}      ${Limit_out_session1}     ${Limit_glo_session1}      ${less_more_limitation2}
    ...            ${Limit_media_type2}     ${Limit_in_session2}      ${Limit_out_session2}     ${Limit_glo_session2}

Edit Session Control
    [Arguments]   ${Name}  ${Limit_media_type1}  ${less_more_limitation1}
    ...            ${New_Limit_media_type1}     ${Limit_in_session1}      ${Limit_out_session1}     ${Limit_glo_session1}      ${less_more_limitation2}
    ...            ${Limit_media_type2}     ${Limit_in_session2}      ${Limit_out_session2}     ${Limit_glo_session2}

    Click Element       ${SC_Field}
    Sleep   1s
    Click Edit Element With 2 Info      ${Name}    ${Limit_media_type1}
    Sleep       2s

    Add_Edit Session Control   ${less_more_limitation1}
    ...            ${New_Limit_media_type1}     ${Limit_in_session1}      ${Limit_out_session1}     ${Limit_glo_session1}      ${less_more_limitation2}
    ...            ${Limit_media_type2}     ${Limit_in_session2}      ${Limit_out_session2}     ${Limit_glo_session2}

Add_Edit Session Control
    [Arguments]     ${less_more_limitation1}
    ...            ${Limit_media_type1}     ${Limit_in_session1}      ${Limit_out_session1}     ${Limit_glo_session1}      ${less_more_limitation2}
    ...            ${Limit_media_type2}     ${Limit_in_session2}      ${Limit_out_session2}     ${Limit_glo_session2}


    Run Keyword If      '${less_more_limitation1}' == 'add'          Click Element          ${P_Add_Limitation_Button}
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

    Run Keyword If      '${less_more_limitation2}' == 'add'          Click Element          ${P_Add_Limitation_Button}
    Sleep  3s

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
    [Arguments]     ${Name}  ${Media_type}  ${IncomingMaxSession}  ${OutgoingMaxSession}  ${GlobalMaxSession}

    Click Element       ${SC_Field}
    Sleep   1s
    Click View Element With 2 Info          ${Name}    ${IncomingMaxSession}
    Sleep  3s

    Verify Page Contains 2 Expected Elements    Name                                                ${Name}
    #Verify Page Contains 4 Expected Elements    Media type              IncomingMaxSession         OugoingMaxSession          GlobalMaxSession
    Verify Page Contains 4 Expected Elements    ${Media_type}           ${IncomingMaxSession}       ${OutgoingMaxSession}      ${GlobalMaxSession}

Add Session Control 65
    [Arguments]   ${Name}  ${Limit_media_audio}     ${Limit_in_session1}      ${Limit_out_session1}     ${Limit_glo_session1}
    ...            ${Limit_media_video}     ${Limit_in_session2}      ${Limit_out_session2}     ${Limit_glo_session2}
    ...            ${Limit_media_t38}       ${Limit_in_session3}      ${Limit_out_session3}     ${Limit_glo_session3}

    Click Element       ${SC_Field}
    Sleep   1s
    Click Element       ${Add_Button}
    Sleep       2s

    Run Keyword If  '${Name}' != '#BLANK'                      input text          ${Name_Field}                      ${Name}

    Add_Edit Session Control 65  ${Limit_media_audio}     ${Limit_in_session1}      ${Limit_out_session1}     ${Limit_glo_session1}
    ...            ${Limit_media_video}     ${Limit_in_session2}      ${Limit_out_session2}     ${Limit_glo_session2}
    ...            ${Limit_media_t38}       ${Limit_in_session3}      ${Limit_out_session3}     ${Limit_glo_session3}

Edit Session Control 65
    [Arguments]   ${Name}  ${Edit_Limit_media_audio}  ${Limit_media_audio}     ${Limit_in_session1}      ${Limit_out_session1}     ${Limit_glo_session1}
    ...            ${Limit_media_video}     ${Limit_in_session2}      ${Limit_out_session2}     ${Limit_glo_session2}
    ...            ${Limit_media_t38}       ${Limit_in_session3}      ${Limit_out_session3}     ${Limit_glo_session3}

    Click Element       ${SC_Field}
    Sleep   1s
    Click Edit Element With 2 Info      ${Name}    ${Edit_Limit_media_audio}
    Sleep       2s

    Add_Edit Session Control 65   ${Limit_media_audio}     ${Limit_in_session1}      ${Limit_out_session1}     ${Limit_glo_session1}
    ...            ${Limit_media_video}     ${Limit_in_session2}      ${Limit_out_session2}     ${Limit_glo_session2}
    ...            ${Limit_media_t38}       ${Limit_in_session3}      ${Limit_out_session3}     ${Limit_glo_session3}

Add_Edit Session Control 65
    [Arguments]    ${Limit_media_audio}     ${Limit_in_session1}      ${Limit_out_session1}     ${Limit_glo_session1}
    ...            ${Limit_media_video}     ${Limit_in_session2}      ${Limit_out_session2}     ${Limit_glo_session2}
    ...            ${Limit_media_t38}       ${Limit_in_session3}      ${Limit_out_session3}     ${Limit_glo_session3}


    Run Keyword If  '${Limit_media_audio}' == 'AUDIO'                     Click Element          ${Audio_Other}
    ...       ELSE                                                        Click Element          ${Audio_None}
    Sleep       1s


    Run Keyword If  '${Limit_in_session1}' != '#BLANK'                       input text          ${New_Limit_In_Session1_Field}                      ${Limit_in_session1}
    Run Keyword If  '${Limit_out_session1}' != '#BLANK'                      input text         ${New_Limit_Out_Session1_Field}                     ${Limit_out_session1}
    Run Keyword If  '${Limit_glo_session1}' != '#BLANK'                      input text         ${New_Limit_Glo_Session1_Field}                     ${Limit_glo_session1}
    Sleep  1s

    Run Keyword If  '${Limit_media_video}' == 'VIDEO'                     Click Element          ${Video_Other}
    ...         ELSE                                                   Click Element          ${Video_None}
    Sleep       2s

    Run Keyword If  '${Limit_in_session2}' != '#BLANK'                       input text          ${New_Limit_In_Session2_Field}                      ${Limit_in_session2}
    Run Keyword If  '${Limit_out_session2}' != '#BLANK'                      input text         ${New_Limit_Out_Session2_Field}                     ${Limit_out_session2}
    Run Keyword If  '${Limit_glo_session2}' != '#BLANK'                      input text         ${New_Limit_Glo_Session2_Field}                     ${Limit_glo_session2}

    Run Keyword If  '${Limit_media_t38}' == 'T38'                          Click Element        ${T38_Other}
    ...            ELSE                                                    Click Element        ${T38_None}
    Sleep       2s

    Run Keyword If  '${Limit_in_session3}' != '#BLANK'                       input text          ${New_Limit_In_Session3_Field}                      ${Limit_in_session3}
    Run Keyword If  '${Limit_out_session3}' != '#BLANK'                      input text         ${New_Limit_Out_Session3_Field}                     ${Limit_out_session3}
    Run Keyword If  '${Limit_glo_session3}' != '#BLANK'                      input text         ${New_Limit_Glo_Session3_Field}                     ${Limit_glo_session3}

    Click Element       ${Confirm_Add}
    Sleep       3s

View Session Control 65
    [Arguments]     ${Name}  ${Media_type}  ${IncomingMaxSession}  ${OutgoingMaxSession}  ${GlobalMaxSession}

    Click Element       ${SC_Field}
    Sleep   1s
    Click View Element With 2 Info          ${Name}    ${IncomingMaxSession}
    Sleep  3s

    Verify Page Contains 2 Expected Elements    Name                                                ${Name}

    Verify Page Contains 4 Expected Elements    ${Media_type}           ${IncomingMaxSession}       ${OutgoingMaxSession}      ${GlobalMaxSession}

Add User Agent
    [Arguments]   ${UA_profile}   ${UA_name}   ${less_more_UA_1}     ${UA_name_1}      ${less_more_UA_2}     ${UA_name_2}   ${Select}   ${Word_processor_file}  ${Header_Mani_profile}
    ...           ${Authorization_profile}    ${SIP_error_code}      ${Reason_phrase}      ${ATCF}

    Click Element       ${UA_Field}
    Sleep   1s
    Click Element       ${Add_Button}
    Sleep       2s

    Run Keyword If  '${UA_profile}' != '#BLANK'                      input text          ${UA_Profile_Field}                      ${UA_profile}

    Add_Edit User Agent     ${UA_name}   ${less_more_UA_1}     ${UA_name_1}      ${less_more_UA_2}     ${UA_name_2}   ${Select}   ${Word_processor_file}  ${Header_Mani_profile}
    ...           ${Authorization_profile}    ${SIP_error_code}      ${Reason_phrase}      ${ATCF}

Edit User Agent
    [Arguments]   ${UA_profile}   ${UA_name}  ${New_UA_name}   ${less_more_UA_1}     ${UA_name_1}      ${less_more_UA_2}     ${UA_name_2}   ${Select}   ${Word_processor_file}  ${Header_Mani_profile}
    ...           ${Authorization_profile}    ${SIP_error_code}      ${Reason_phrase}      ${ATCF}

    Click Element       ${UA_Field}
    Sleep   1s
    Click Edit Element With 2 Info      ${UA_profile}    ${UA_name}
    Sleep       2s

    Add_Edit User Agent     ${New_UA_name}   ${less_more_UA_1}     ${UA_name_1}      ${less_more_UA_2}     ${UA_name_2}   ${Select}   ${Word_processor_file}  ${Header_Mani_profile}
    ...           ${Authorization_profile}    ${SIP_error_code}      ${Reason_phrase}      ${ATCF}

Add_Edit User Agent
    [Arguments]   ${UA_name}   ${less_more_UA_1}     ${UA_name_1}      ${less_more_UA_2}     ${UA_name_2}   ${Select}   ${Word_processor_file}  ${Header_Mani_profile}
    ...           ${Authorization_profile}    ${SIP_error_code}      ${Reason_phrase}      ${ATCF}

    Run Keyword If  '${UA_name}' != '#BLANK'                         input text          ${UA_Name_Field}                         ${UA_name}
    Run Keyword If      '${less_more_UA_1}' == 'add'                    Click Element        ${Add_UA_Button}
    Run Keyword If      '${less_more_UA_1}' == 'remove'                 Click Element        ${Remove_UA_Button_1}
    Run Keyword If  '${UA_name_1}' != '#BLANK'                       input text          ${UA_Name_1_Field}                       ${UA_name_1}
    Run Keyword If      '${less_more_UA_2}' == 'add'                    Click Element        ${Add_UA_Button}
    Run Keyword If      '${less_more_UA_2}' == 'remove'                 Click Element        ${Remove_UA_Button_2}
    Run Keyword If  '${UA_name_2}' != '#BLANK'                       input text          ${UA_Name_2_Field}                       ${UA_name_2}
    Sleep  1s

    Run Keyword If  '${Select}' == 'word_processor'                     Click Element   ${Word_Processor_Button}
    Sleep  3s
    Run Keyword If  '${Select}' == 'word_processor'                     Click Element   ${Word_Processor_Dropdown}
    Sleep  2s
    Run Keyword If  '${Word_processor_file}' != '#BLANK'                     Click Element    ${WP_File}
    Sleep  2s
    Run Keyword If  '${Select}' == 'header_mani_profile'                Click Element   ${SIP_Header_Button}
    Sleep  2s
    Run Keyword If  '${Select}' == 'header_mani_profile'                Click Element   ${SIP_Header_Dropdown}
    Sleep  2s
    Run Keyword If  '${Header_Mani_profile}' != '#BLANK'                Click Element   ${SIP_Header_Profile}
    Sleep  2s
    Click Element       ${UA_Profile_Field}
    Sleep  2s
    Run Keyword If  '${Authorization_profile}' != '#BLANK'          Click Element   ${Autho_Profile_Dropdown}
    Sleep  2s
    Run Keyword If  '${Authorization_profile}' != '1'               Click Element   ${Autho_Profile_1}
    Run Keyword If  '${Authorization_profile}' != '2'               Click Element   ${Autho_Profile_2}
    Sleep  2s
    Run Keyword If  '${SIP_error_code}' != '#BLANK'                 input text          ${SIP_Error_Code_Field}                          ${SIP_error_code}
    Run Keyword If  '${Reason_phrase}' != '#BLANK'                  input text          ${UA_Reason_Phrase_Field}                        ${Reason_phrase}
    Sleep  2s
    Run Keyword If  '${ATCF}' == 'TRUE'                                 Click Element   ${Check_ATCF}
    ...  ELSE IF    '${ATCF}' == 'FALSE'                                Click Element   ${Check_ATCF}
    Sleep  2s

    Click Element       ${Confirm_Add}
    Sleep       3s

View UA
    [Arguments]     ${Profile}    ${Name}

    Click Element       ${UA_Field}
    Sleep   1s
    Click View Element With 1 Info          ${Profile}
    Sleep  3s

    Verify Page Contains 2 Expected Elements    UA profile                                                ${Profile}
    Verify Page Contains 2 Expected Elements    UA name                                                   ${Name}

Add PCRF
    [Arguments]   ${ID}   ${Subscription_sig_path_status}  ${Subscription_ip_can_type_change}     ${Access_network_charging}

    Scroll Element Into View    ${While_Label}
    Sleep  1s
    Click Element       ${PCRF_Field}
    Sleep   1s
    Click Element       ${Add_Button}
    Sleep       2s

    Run Keyword If  '${ID}' != '#BLANK'                                 input text          ${Id_Field}                      ${ID}

    Add_Edit PCRF       ${Subscription_sig_path_status}  ${Subscription_ip_can_type_change}     ${Access_network_charging}

Edit PCRF
    [Arguments]   ${ID}   ${Subscription_sig_path_status}  ${New_Subscription_sig_path_status}  ${Subscription_ip_can_type_change}     ${Access_network_charging}

    #Zoom In Window      300  300
    Scroll Element Into View    ${While_Label}
    Sleep  1s
    Click Element       ${PCRF_Field}
    Sleep   1s
    Click Edit Element With 1 Info      ${ID}

    Add_Edit PCRF       ${New_Subscription_sig_path_status}  ${Subscription_ip_can_type_change}     ${Access_network_charging}

Add_Edit PCRF
    [Arguments]   ${Subscription_sig_path_status}  ${Subscription_ip_can_type_change}     ${Access_network_charging}

    Run Keyword If      '${Subscription_sig_path_status}' == 'True'           Click Element   ${Sig_path_True}
    Run Keyword If      '${Subscription_sig_path_status}' == 'False'          Click Element   ${Sig_path_False}
    Sleep  1s
    Run Keyword If      '${Subscription_ip_can_type_change}' == 'True'        Click Element   ${Ip_can_True}
    Run Keyword If      '${Subscription_ip_can_type_change}' == 'False'       Click Element   ${Ip_can_False}
    Sleep  1s
    Run Keyword If      '${Access_network_charging}' == 'True'                Click Element   ${Access_True}
    Run Keyword If      '${Access_network_charging}' == 'False'               Click Element   ${Access_False}
    Sleep  1s
    Click Element       ${Confirm_Add}
    Sleep       3s

View PCRF
    [Arguments]     ${ID}    ${Subscription_sig_path_status}  ${Subscription_ip_can_type_change}  ${Access_network_charging}

    Scroll Element Into View    ${While_Label}
    Sleep  1s
    Click Element       ${PCRF_Field}
    Sleep   1s
    Click View Element With 1 Info          ${ID}
    Sleep  1s

    Verify Page Contains 2 Expected Elements    ID                                                                          ${ID}
    Verify Page Contains 2 Expected Elements    Subscription sig path status                                                ${Subscription_sig_path_status}
    Verify Page Contains 2 Expected Elements    Subscription ip can type change                                             ${Subscription_ip_can_type_change}
    Verify Page Contains 2 Expected Elements    Access network charging                                                     ${Access_network_charging}

Add PHF
    [Arguments]   ${Name}   ${Pheader}  ${Pheader1}   ${Pheader2}  ${Pheader3}  ${Pheader4}  ${Pheader5}   ${Pheader6}  ${Pheader7}


    Scroll Element Into View    ${While_Label}
    Sleep  1s
    Click Element       ${PHF_Field}
    Sleep   1s
    Click Element       ${Add_Button}
    Sleep       2s

    Run Keyword If  '${Name}' != '#BLANK'                                           input text          ${Name_Field}                      ${Name}
    Add_Edit PHF      ${Pheader}  ${Pheader1}   ${Pheader2}  ${Pheader3}  ${Pheader4}  ${Pheader5}   ${Pheader6}  ${Pheader7}

    Click Element       ${Name_Field}
    Sleep  1s
    Click Element       ${Confirm_Add_HAP}
    Sleep  3s

Add PHF 63
    [Arguments]   ${Name}   ${Pheader}  ${Pheader1}   ${Pheader2}  ${Pheader3}  ${Pheader4}  ${Pheader5}   ${Pheader6}  ${Pheader7}  ${Pheader8}  ${Direction}


    Scroll Element Into View    ${While_Label}
    Sleep  1s
    Click Element       ${PHF_Field}
    Sleep   1s
    Click Element       ${Add_Button}
    Sleep       2s

    Run Keyword If  '${Name}' != '#BLANK'                                           input text          ${Name_Field}                      ${Name}
    Sleep  2s
    Add_Edit PHF      ${Pheader}  ${Pheader1}   ${Pheader2}  ${Pheader3}  ${Pheader4}  ${Pheader5}   ${Pheader6}  ${Pheader7}  ${Pheader8}

    Click Element       ${Name_Field}
    Sleep  1s

    #IMP#14163
    Run Keyword If    '${Direction}' == 'CORE_TO_PEER'  Click Element  ${Core_to_peer_Button}
    ...    ELSE IF    '${Direction}' == 'PEER_TO_CORE'  Click Element  ${Peer_to_core_Button}
    ...    ELSE                                         Click Element  ${Both_Button}

    Click Element       ${Confirm_Add_HAP}
    Sleep  3s


Edit PHF
    [Arguments]   ${Name}   ${Pheader}  ${Pheader1}   ${Pheader2}  ${Pheader3}  ${Pheader4}  ${Pheader5}   ${Pheader6}  ${Pheader7}  ${Pheader8}

    Scroll Element Into View    ${While_Label}
    Sleep  1s
    Click Element       ${PHF_Field}
    Sleep   1s
    Click Edit Element With 1 Info      ${Name}
    Add_Edit PHF      ${Pheader}  ${Pheader1}   ${Pheader2}  ${Pheader3}   ${Pheader4}   ${Pheader5}   ${Pheader6}  ${Pheader7}  ${Pheader8}

    Click Element       ${Name_Field}
    Sleep  1s
    Click Element       ${Confirm_Add_HAP}
    Sleep  3s

Edit PHF 63
    [Arguments]   ${Name}   ${Pheader}  ${Pheader1}   ${Pheader2}  ${Pheader3}  ${Pheader4}  ${Pheader5}   ${Pheader6}  ${Pheader7}  ${Pheader8}  ${Direction}

    Scroll Element Into View    ${While_Label}
    Sleep  1s
    Click Element       ${PHF_Field}
    Sleep   1s
    Click Edit Element With 1 Info      ${Name}
    Sleep  3s
    Add_Edit PHF      ${Pheader}  ${Pheader1}   ${Pheader2}  ${Pheader3}   ${Pheader4}   ${Pheader5}   ${Pheader6}  ${Pheader7}  ${Pheader8}

    Click Element       ${Name_Field}
    Sleep  1s

    #IMP#14163
    Run Keyword If    '${Direction}' == 'CORE_TO_PEER'  Click Element  ${Core_to_peer_Button}
    ...    ELSE IF    '${Direction}' == 'PEER_TO_CORE'  Click Element  ${Peer_to_core_Button}
    ...    ELSE                                         Click Element  ${Both_Button}

    Click Element       ${Confirm_Add_HAP}
    Sleep  3s


Add_Edit PHF
    [Arguments]  ${Pheader}  ${Pheader1}   ${Pheader2}  ${Pheader3}  ${Pheader4}  ${Pheader5}   ${Pheader6}  ${Pheader7}  ${Pheader8}
    Run Keyword If   '${Pheader}' != '#BLANK'                                       Click Element       ${Pheader_Dropdown}
    Sleep  3s
    Run Keyword If        '${Pheader1}' == 'P-Asserted-Identity'                          Click Element       ${Pheader_PAI}
    Run Keyword If        '${Pheader2}' == 'P-Preferred-Identity'                         Click Element       ${Pheader_PPI}

    Run Keyword If        '${Pheader3}' == 'P-Charging-Vector'                            Click Element       ${Pheader_PCV}

    Run Keyword If        '${Pheader4}' == 'P-Charging-Function-Addresses'                Click Element       ${Pheader_PCFA}

    Run Keyword If        '${Pheader5}' == 'P-Called-Party-ID'                            Click Element       ${Pheader_PCPI}

    Run Keyword If        '${Pheader6}' == 'P-Visited-Network-ID'                         Click Element       ${Pheader_PVNI}

    Run Keyword If        '${Pheader7}' == 'P-Access-Network-Info'                        Click Element       ${Pheader_PANI}

    #6.5 IMP 16917 add PAU to Pheader profile
    Run Keyword If        '${Pheader8}' == 'P-Associated-Uri'                             Click Element       ${Pheader_PAU}
    Sleep  3s


View PHF
    [Arguments]     ${Name}    ${Pheader1}  ${Pheader2}  ${Pheader3}  ${Pheader4}  ${Pheader5}   ${Pheader6}  ${Pheader7}

    Scroll Element Into View    ${While_Label}
    Sleep  1s
    Click Element       ${PHF_Field}
    Sleep   1s
    Click View Element With 1 Info          ${Name}
    Sleep  3s

    Verify Page Contains 2 Expected Elements    Name                                                     ${Name}
    Run Keyword If  '${Pheader1}' != '#BLANK'   Verify Page Contains 2 Expected Elements    P-Headers                                                ${Pheader1}
    Run Keyword If  '${Pheader2}' != '#BLANK'   Verify Page Contains 2 Expected Elements    P-Headers                                                ${Pheader2}
    Run Keyword If  '${Pheader3}' != '#BLANK'   Verify Page Contains 2 Expected Elements    P-Headers                                                ${Pheader3}
    Run Keyword If  '${Pheader4}' != '#BLANK'   Verify Page Contains 2 Expected Elements    P-Headers                                                ${Pheader4}
    Run Keyword If  '${Pheader5}' != '#BLANK'   Verify Page Contains 2 Expected Elements    P-Headers                                                ${Pheader5}
    Run Keyword If  '${Pheader6}' != '#BLANK'   Verify Page Contains 2 Expected Elements    P-Headers                                                ${Pheader6}
    Run Keyword If  '${Pheader7}' != '#BLANK'   Verify Page Contains 2 Expected Elements    P-Headers                                                ${Pheader7}


Add Peer
    [Arguments]   ${Name}  ${Max_Reg}  ${Domain}    ${Less_more_domain}   ${Domain1}  ${FDUD}  ${Session_control}
    ...           ${ASHM}  ${ASHM1}    ${ASHM2}     ${ASHM3}  ${Behavior}  ${PCRF}   ${Authorization}  ${ATCF}
    ...           ${RFC6140}  ${PHF}    ${Media_profile}  ${1st_SRTP}  ${2nd_SRTP}

    Sleep  1s
    Click Element       ${Peer_Field}
    Sleep  1s
    Click Element       ${Add_Button}
    Sleep  2s

    Run Keyword If  '${Name}' != '#BLANK'                   input text       ${Name_Field}              ${Name}
    Sleep       1s

    Run Keyword If  '${Max_Reg}' != '#BLANK'               input text        ${Maxin_Field}           ${Max_Reg}


    Add_Edit Peer   ${Domain}    ${Less_more_domain}   ${Domain1}  ${FDUD}  ${Session_control}
    ...             ${ASHM}      ${ASHM1}     ${ASHM2}     ${ASHM3}  ${Behavior}  ${PCRF}   ${Authorization}  ${ATCF}  ${RFC6140}  ${PHF}
    ...             ${Media_profile}	${1st_SRTP}		${2nd_SRTP}

    Click Element    ${Confirm_Add}

Add Peer 63
    [Arguments]   ${Name}  ${Max_Reg}  ${Domain}    ${Less_more_domain}   ${Domain1}  ${FDUD}  ${Session_control}
    ...           ${ASHM}  ${ASHM1}    ${ASHM2}     ${ASHM3}  ${Behavior}  ${PCRF}   ${Authorization}  ${ATCF}
    ...           ${RFC6140}  ${PHF}    ${Media_profile}  ${1st_SRTP}  ${2nd_SRTP}   ${Lac_stripping}
    ...           ${User2Net}  ${Net2User}

    Sleep  1s
    Click Element       ${Peer_Field}
    Sleep  1s
    Click Element       ${Add_Button}
    Sleep  2s

    Run Keyword If  '${Name}' != '#BLANK'                   input text       ${Name_Field}              ${Name}
    Sleep       1s

    Run Keyword If  '${Max_Reg}' != '#BLANK'               input text        ${Maxin_Field}           ${Max_Reg}


    Add_Edit Peer   ${Domain}    ${Less_more_domain}   ${Domain1}  ${FDUD}  ${Session_control}
    ...             ${ASHM}      ${ASHM1}     ${ASHM2}     ${ASHM3}  ${Behavior}  ${PCRF}   ${Authorization}  ${ATCF}  ${RFC6140}  ${PHF}
    ...             ${Media_profile}	${1st_SRTP}		${2nd_SRTP}

    Sleep  3s
    #Feature 6.3 Imp#14290
    Run Keyword If   '${User2Net}' != '#BLANK'               Click Element   ${User2Net_dropdown}
    Sleep  1s
    Run Keyword If       '${User2Net}' == '2'           Click Element      ${User2Net_2}
    ...         ELSE IF  '${User2Net}' == '3'           Click Element      ${User2Net_3}
    ...         ELSE                                    Click Element      ${User2Net_None}
    Sleep  1s
    Run Keyword If   '${Net2User}' != '#BLANK'               Click Element   ${Net2User_dropdown}
    Sleep  1s
    Run Keyword If       '${Net2User}' == '2'           Click Element      ${Net2User_2}
    ...         ELSE IF  '${Net2User}' == '3'           Click Element      ${Net2User_3}
    ...         ELSE                                    Click Element      ${Net2User_None}
    Sleep  1s

    #Feature 6.3 RFF14431
    Run Keyword If       '${Lac_stripping}' == 'TRUE'           Click Element      ${Lac_Stripping_True}
    ...         ELSE IF  '${Lac_stripping}' == 'FALSE'          Click Element      ${Lac_Stripping_False}
    Sleep  2s

    Click Element    ${Confirm_Add}
    Sleep  3s
Edit Peer
    [Arguments]   ${Name}  ${Domain}  ${New_Domain}  ${Less_more_domain}   ${Domain1}  ${FDUD}  ${Session_control}
    ...           ${ASHM}  ${ASHM1}    ${ASHM2}     ${ASHM3}  ${Behavior}  ${PCRF}   ${Authorization}  ${ATCF}
    ...           ${RFC6140}  ${PHF}  ${Media_profile}  ${1st_SRTP}  ${2nd_SRTP}

    Click Element       ${Peer_Field}
    Sleep   1s
    Click Edit Element With 2 Info      ${Name}    ${Domain}
    Sleep   2s

    Add_Edit Peer   ${New_Domain}    ${Less_more_domain}   ${Domain1}    ${FDUD}  ${Session_control}
    ...             ${ASHM}      ${ASHM1}     ${ASHM2}     ${ASHM3}  ${Behavior}  ${PCRF}   ${Authorization}  ${ATCF}  ${RFC6140}  ${PHF}
    ...             ${Media_profile}	${1st_SRTP}		${2nd_SRTP}

    Click Element    ${Confirm_Add}

Edit Peer 63
    [Arguments]   ${Name}  ${Domain}  ${New_Domain}  ${Less_more_domain}   ${Domain1}  ${FDUD}  ${Session_control}
    ...           ${ASHM}  ${ASHM1}    ${ASHM2}     ${ASHM3}  ${Behavior}  ${PCRF}   ${Authorization}  ${ATCF}
    ...           ${RFC6140}  ${PHF}   ${Media_profile}  ${1st_SRTP}  ${2nd_SRTP}  ${Lac_stripping}
    ...           ${User2Net}  ${Net2User}

    Click Element       ${Peer_Field}
    Sleep   1s
    Click Edit Element With 2 Info      ${Name}    ${Domain}
    Sleep   2s

    Add_Edit Peer   ${New_Domain}    ${Less_more_domain}   ${Domain1}  ${FDUD}  ${Session_control}
    ...             ${ASHM}      ${ASHM1}     ${ASHM2}     ${ASHM3}  ${Behavior}  ${PCRF}   ${Authorization}  ${ATCF}  ${RFC6140}  ${PHF}
    ...             ${Media_profile}	${1st_SRTP}		${2nd_SRTP}

    Sleep  2s

    #Feature 6.3 Imp#14290
    Run Keyword If   '${User2Net}' != '#BLANK'               Click Element   ${User2Net_dropdown}
    Sleep  1s
    Run Keyword If       '${User2Net}' == '2'           Click Element      ${User2Net_2}
    ...         ELSE IF  '${User2Net}' == '3'           Click Element      ${User2Net_3}
    ...         ELSE                                    Click Element      ${User2Net_None}
    Sleep  2s
    Run Keyword If   '${Net2User}' != '#BLANK'               Click Element   ${Net2User_dropdown}
    Sleep  1s
    Run Keyword If       '${Net2User}' == '2'           Click Element      ${Net2User_2}
    ...         ELSE IF  '${Net2User}' == '3'           Click Element      ${Net2User_3}
    ...         ELSE                                    Click Element      ${Net2User_None}
    Sleep  1s
        #Feature 6.3 RFF14431
    Run Keyword If       '${Lac_stripping}' == 'TRUE'           Click Element      ${Lac_Stripping_True}
    ...         ELSE IF  '${Lac_stripping}' == 'FALSE'          Click Element      ${Lac_Stripping_False}

    Click Element    ${Confirm_Add}
    Sleep  3s

Add_Edit Peer
    [Arguments]   ${Domain}    ${Less_more_domain}   ${Domain1}   ${FDUD}      ${Session_control}
    ...           ${ASHM}      ${ASHM1}     ${ASHM2}     ${ASHM3}  ${Behavior}  ${PCRF}   ${Authorization}  ${ATCF}  ${RFC6140}  ${PHF}
    ...           ${Media_profile}	${1st_SRTP}		${2nd_SRTP}


    Run Keyword If              '${Domain}' != '#BLANK'                         input text       ${Multi_Domain_Field}              ${Domain}
    Sleep  1s

    Run Keyword If                   '${Less_more_domain}' == 'add'                 Click Element     ${Add_Domain}
    Sleep   1s

    Run Keyword If                  '${Less_more_domain}' == 'remove'               Click Element     ${Remove_Domain}
    Sleep   1s
    Run Keyword If              '${Domain1}' != '#BLANK'                        input text        ${Multi_Domain_Field1}              ${Domain1}
    Sleep  1

    Run Keyword If                  '${FDUD}' == 'TRUE'                             Click Element       ${FDUD_True}
    ...   ELSE IF                   '${FDUD}' == 'FALSE'                            Click Element       ${FDUD_False}
    ...   ELSE                                                                      Click Element       ${FDUD_True}
    Sleep  1s

    Run Keyword If              '${Media_profile}' != '#BLANK'              Click Element   ${Media_profile_dropdown}
    Sleep  3s
    Run Keyword If                  '${Media_profile}' == 'NONE'                Click Element    ${Media_profile_none}
    ...         ELSE IF             '${Media_profile}' == '1'                   Click Element    ${Media_profile_first}
    ...         ELSE IF             '${Media_profile}' == '2'                   Click Element    ${Media_profile_second}
    Sleep  1s

    Run Keyword If              '${1st_SRTP}' != '#BLANK'                   Click Element   ${1st_SRTP_dropdown}
    Sleep  2s
    Run Keyword If                  '${1st_SRTP}' == 'NONE'                     Click Element    ${1st_SRTP_none}
    ...         ELSE IF             '${1st_SRTP}' == '1'                        Click Element    ${1st_SRTP_first}
    ...         ELSE IF             '${1st_SRTP}' == '2'                        Click Element    ${1st_SRTP_second}
    Sleep  1s

    Run Keyword If              '${2nd_SRTP}' != '#BLANK'                   Click Element   ${2nd_SRTP_dropdown}
    Sleep  2s
    Run Keyword If                  '${2nd_SRTP}' == 'NONE'                     Click Element    ${2nd_SRTP_none}
    ...         ELSE IF             '${2nd_SRTP}' == '1'                        Click Element    ${2nd_SRTP_first}
    ...         ELSE IF             '${2nd_SRTP}' == '2'                        Click Element    ${2nd_SRTP_second}
    Sleep  1s

    Run Keyword If              '${ASHM}' != '#BLANK'                           Click Element   ${ASHM_dropdown}
    Sleep  1s
    Run Keyword If                  '${ASHM1}' == 'NONE'                            Click Element    ${ASHM_None}
    Sleep  1s
    Run Keyword If                   '${ASHM2}' == '1'                              Click Element    ${ASHM_1st}
    Sleep  1s
    Run Keyword If                   '${ASHM3}' == '2'                              Click Element    ${ASHM_2nd}
    Sleep  1s
    Click Element                     ${Behavior_label}
    Sleep  1s

    Run Keyword If             '${Session_control}' != '#BLANK'                 Click Element       ${Session_control_dropdown}
    Sleep  3s
    Run Keyword If                  '${Session_control}' == 'NONE'                  Click Element       ${Session_control_None}
    ...     ELSE IF                 '${Session_control}' == '1'                     Click Element       ${Session_control_1}
    ...     ELSE IF                 '${Session_control}' == '2'                     Click Element       ${Session_control_2}
    Sleep  7s


    Click Element                     ${Name_Field}
    Sleep  3s

    Run Keyword If               '${Behavior}' != '#BLANK'                      Click Element    ${Behavior_dropdown}
    Sleep  1s
    Run Keyword If               '${Behavior}' != '#BLANK'                      Click Element   xpath=//label[contains(text(),'Behavior')]/preceding::div[1]/ul//span[contains(text(),'${Behavior}')]
    Sleep  1s

    Run Keyword If               '${PCRF}' != '#BLANK'                          Click Element   ${PCRF_dropdown}
    Sleep  1s
    Run Keyword If                  '${PCRF}' == 'NONE'                             Click Element    ${PCRF_None}
    ...     ELSE IF                 '${PCRF}' == '1'                                Click Element    ${PCRF_1}
    ...     ELSE IF                 '${PCRF}' == '2'                                Click Element    ${PCRF_2}
    Sleep  1s

    Run Keyword If              '${Authorization}' != '#BLANK'                  Click Element   ${Autho_dropdown}
    Sleep  2s
    Run Keyword If                  '${Authorization}' == 'NONE'                    Click Element   ${Autho_index_1}
    ...     ELSE IF                 '${Authorization}' == '1'                       Click Element   ${Autho_index_2}
    ...     ELSE IF                 '${Authorization}' == '2'                       Click Element   ${Autho_index_3}
    Sleep  1s

    Run Keyword If                  '${ATCF}' == 'Unchecked'                        Click Element   ${ATCF_Unchecked}
    Run Keyword If                  '${ATCF}' == 'Checked'                          Click Element   ${ATCF_Checked}
    Sleep  1s

    Run Keyword If                  '${RFC6140}' == 'Checked'                       Click Element   ${RFC6140_Checked}
    Run Keyword If                  '${RFC6140}' == 'Unchecked'                     Click Element   ${RFC6140_Unchecked}
    Sleep  1s


    Run Keyword If               '${PHF}' != '#BLANK'                          Click Element   ${PHF_dropdown}
    Sleep  1s
    Run Keyword If                  '${PHF}' == 'NONE'                             Click Element    ${PHF_None}
    ...     ELSE IF                 '${PHF}' == '1'                                Click Element    ${PHF_1}
    ...     ELSE IF                 '${PHF}' == '2'                                Click Element    ${PHF_2}
    Sleep  1s

	Click Element  ${ASHM_label}
	Sleep  1s

View Peer
    [Arguments]   ${Name}  ${Max_Reg}  ${Domain}  #${FDUD}  ${Session_control}
    #...           ${Behavior}  ${PCRF}   ${Authorization}  ${ATCF}
    #...           ${RFC6140}  ${PHF}   ${Media_profile}  ${1st_SRTP}  ${SIP_manipulation_profile}

    Click Element       ${Peer_Field}
    Sleep   1s
    Click View Element With 2 Info      ${Name}    ${Max_Reg}
    Sleep  3s

    Verify Page Contains 2 Expected Elements    Name                                            ${Name}
    Verify Page Contains 2 Expected Elements    Maximum Regdata                                          ${Max_Reg}
    Verify Page Contains 2 Expected Elements    Domain                                          ${Domain}
    #Run Keyword If  '${Media_profile}' != '#BLANK'      Verify Page Contains 2 Expected Elements    Media profile                           ${Media_profile}
    #Run Keyword If  '${FDUD}' != '#BLANK'   Verify Page Contains 2 Expected Elements    Domain                                              ${FDUD}
    #Run Keyword If  '${1st_SRTP}' != '#BLANK'      Verify Page Contains 2 Expected Elements    1st STRP profile                             ${1st_SRTP}
    #Run Keyword If  '${SIP_manipulation_profile}' != '#BLANK'      Verify Page Contains 2 Expected Elements    SIP manipulation profile     ${SIP_manipulation_profile}
    #Run Keyword If  '${PHF}' != '#BLANK'      Verify Page Contains 2 Expected Elements    Pheader filtering profile                         ${PHF}
    #Run Keyword If  '${ATCF}' != '#BLANK'      Verify Page Contains 2 Expected Elements    ATCF                                             ${ATCF}
    #Run Keyword If  '${RFC6140}' != '#BLANK'      Verify Page Contains 2 Expected Elements    RFC6140                                       ${RFC6140}
    #Run Keyword If  '${Session_control}' != '#BLANK'      Verify Page Contains 2 Expected Elements    Session control                       ${Session_control}
    #Run Keyword If  '${Behavior}' != '#BLANK'      Verify Page Contains 2 Expected Elements    Behavior                                     ${Behavior}
    #Run Keyword If  '${PCRF}' != '#BLANK'      Verify Page Contains 2 Expected Elements    Pcrf Subscription Profile                        ${PCRF}
    #Run Keyword If  '${Authorization}' != '#BLANK'      Verify Page Contains 2 Expected Elements    Authorization profile                   ${Authorization}



Add Invalid Peer
    [Arguments]   ${Name}  ${Domain}   ${Max_Diversion}

    Click Element       ${Add_Button}
    Sleep  3s

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
    Sleep  3s

    Run Keyword If  '${IP}' != '#BLANK'    input text       ${IP_Field}              ${IP}
    Sleep       1s

    Run Keyword If  '${Port}' != '#BLANK'    input text       ${Port_Field}              ${Port}

    Click Element       ${Confirm_Add_Trusted}
    Sleep       7s

