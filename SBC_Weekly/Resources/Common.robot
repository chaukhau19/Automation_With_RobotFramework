*** Settings ***
Library    SeleniumLibrary
Library   SSHLibrary
#Library   RequestsLibrary
Library   DatabaseLibrary
Library   JSONLibrary
Library   Collections
Library   OperatingSystem
Resource  ../Data/InputData.robot
Resource  ../Resources/DataManager.robot
Library  ../CustomLibs/sendEmail.py
Library    Process
Library    String
Library    XML

*** Variables ***
${Name_Field}           id=name
${IP_Field}             id=ip
${Port_Field}           id=port
${Weight_Field}         id=weight
${Domain_Field}         id=domain
${Priority_Field}       id=priority
${Protocol_Field}       id=protocol
${FQDN_Field}           id=fqdn
${Multi_Domain_Field}   id=domains-0-domain
${Multi_Domain_Field1}   id=domains-1-domain
${Multi_Domain_Field2}   id=domains-2-domain


${Add_Button}           xpath=//i[contains(text(),'add_circle')]
${Data_table}           xpath=//table[@id='data-table']
${BGCF_tab}             xpath=//*[@class='collapsible-header' and contains(text(),'Bgcf')]
${IBCF_tab}             xpath=//*[@class='collapsible-header' and contains(text(),'Ibcf')]
${PCSCF_tab}            xpath=//*[@class='collapsible-header' and contains(text(),'Pcscf')]
${Transcoding_tab}      xpath=//*[@class='collapsible-header' and contains(text(),'Transcoding')]
${MediaProxy_tab}       xpath=//*[@class='collapsible-header' and contains(text(),'Media proxy')]
${Admin_tab}            xpath=//*[@class='collapsible-header' and contains(text(),'Admin')]
${SCSCF_tab}            xpath=//*[@class='collapsible-header' and contains(text(),'Scscf')]
${ICSCF_tab}            xpath=//*[@class='collapsible-header' and contains(text(),'Icscf')]
${ECSCF_tab}            xpath=//*[@class='collapsible-header' and contains(text(),'Ecscf')]
${TAS_tab}              xpath=//*[@class='collapsible-header' and contains(text(),'TAS')]
${HSS_tab}              xpath=//*[@class='collapsible-header' and contains(text(),'HSS')]
${Cluster_Inf_tab}      xpath=//*[@class='collapsible-header' and contains(text(),'Cluster Information')]
${Supervision_tab}      xpath=//*[@class='collapsible-header' and contains(text(),'Supervision')]
${Configuration_file_tab}      xpath=//a[contains(text(),'Configuration file')]
${Reload_button}      	xpath=//input[@id='reload_button']
${ICSCF_section}        xpath=//*[@class='collapsible-header active']//following::a[contains(text(),'Icscf')]
${ECSCF_section}        xpath=//*[@class='collapsible-header active']//following::a[contains(text(),'Ecscf')]
${Add_Domain}           xpath=//*[@id="add_domain"]
${Remove_Domain}        xpath=//label[@for='domains-1-domain']//following::i[contains(text(),'remove_circle_outline')]
# Filter
${Filter_Button}        xpath=//*[@id="btn-filter"]
${Cancel_Filter}        xpath=//button[@class='waves-effect waves-light btn red']
${Filter_DropDown}     xpath=//fieldset/form/div[1]/div/div/input
#
${Filter_First_Value}   xpath=//fieldset//ul/li[1]
${Filter_Second_Value}  xpath=//fieldset//ul/li[2]
${Filter_Third_Value}   xpath=//fieldset//ul/li[3]
${Filter_Forth_Value}   xpath=//fieldset//ul/li[4]

#Next_Page
${Next_page}              	xpath=//a[contains(text(),'»')]
${Previous_page}        xpath=//a[contains(text(),'«')]
${Confirm_Filter}       xpath=//button[@name='submit-filter']
${Input_Filter}         id=value
#View
${Cancel_View}          xpath=//i[@class='material-icons right' and contains(text(),'cancel')]
# Delete
${Confirm_Del}          xpath=//*[@id="modal-confirm-delete"]/div[2]/a[1]
${Cancel_Del}           xpath=//*[@id="modal-confirm-delete"]/div[2]/a[2]
#Close
${Close_Button}         xpath=//*[@id="modal-show-error"]/div[2]/a[1]
# Sort
${Sort_IP}              xpath=//th[@class="sortable"]/a[contains(text(),'IP')]
${Sort_IP64}            xpath=//th[contains(text(),'IP')]
${Sort_Port64}          xpath=//th[contains(text(),'Port')]
${Sort_Name}            xpath=//th[@class="sortable"]/a[contains(text(),'Name')]
${Sort_Username}        xpath=//th[@class="sortable"]/a[contains(text(),'Username')]
${Sort_Name64}          xpath=//th[contains(text(),'Name')]
${Sort_Domain}          xpath=//th[@class="sortable"]/a[contains(text(),'Domain')]
${Sort_Domain64}        xpath=//th[contains(text(),'Domain')]
${Sort_Type}            xpath=//th[@class="sortable"]/a[contains(text(),'Type')]
${Sort_Type64}          xpath=//th[contains(text(),'Type')]
${Sort_Matching_Name}   xpath=//th[@class="sortable"]/a[contains(text(),'Matching rule name')]
${Sort_Matching_Name64}  xpath=//th[contains(text(),'Matching rule name')]
${Sort_Header}     xpath=//th[@class="sortable"]/a[contains(text(),'Header name')]
${Sort_Header64}     xpath=//th[contains(text(),'Header name')]
${Sort_Mani_Name}   xpath=//th[@class="sortable"]/a[contains(text(),'Manipulation rule name')]
${Sort_Policy}      xpath=//th[@class="sortable"]/a[contains(text(),'Policy')]
${Sort_Policy64}      xpath=//th[contains(text(),'Policy')]
${Sort_Method}      xpath=//th[@class="sortable"]/a[contains(text(),'Method type')]
${Sort_Method64}      xpath=//th[contains(text(),'Method type')]
${Sort_Index}       xpath=//th[@class="sortable"]/a[contains(text(),'Index')]
${Sort_Index64}       xpath=//th[contains(text(),'Index')]
${Sort_Default_Authorization}  xpath=//th[@class="sortable"]/a[contains(text(),'Default authorization')]
${Sort_Default_Authorization64}  xpath=//th[contains(text(),'Default authorization')]
${Sort_Default_Routing}        xpath=//th[@class="sortable"]/a[contains(text(),'Default routing')]
${Sort_Default_Routing64}      xpath=//th[contains(text(),'Default routing')]
${Sort_SIP_Manipulation}       xpath=//th[@class="sortable"]/a[contains(text(),'SIP manipulation rule')]
${Sort_SIP_Manipulation64}     xpath=//th[contains(text(),'SIP manipulation rule')]
${Sort_Processing_Order}       xpath=//th[@class="sortable"]/a[contains(text(),'Processing order')]
${Sort_Processing_Order64}     xpath=//th[contains(text(),'Processing order')]
${Sort_Media_Type}             xpath=//th[@class="sortable"]/a[contains(text(),'Media type')]
${Sort_Media_Type64}           xpath=//th[contains(text(),'Media type')]
${Sort_ID}                      xpath=//th[@class="sortable"]/a[contains(text(),'ID')]
${Sort_Session_Expire}          xpath=//th[@class="sortable"]/a[contains(text(),'Session Expire')]
${Sort_Session_Expire64}          xpath=//th[contains(text(),'Session Expire')]
${Sort_DTMF_Handling}           xpath=//th[@class="sortable"]/a[contains(text(),'DTMF handling')]
${Sort_DTMF_Handling64}         xpath=//th[contains(text(),'handling')]
${Sort_Transrating}             xpath=//th[@class="sortable"]/a[contains(text(),'Transrating')]
${Sort_Transrating64}           xpath=//th[contains(text(),'Transrating')]
${Sort_Peer}                    xpath=//th[@class="sortable"]/a[contains(text(),'Peer')]
${Sort_Peer64}                  xpath=//th[contains(text(),'Peer')]
${Sort_UA}                      xpath=//th[@class="sortable"]/a[contains(text(),'UA profile')]
${Sort_UA64}                    xpath=//th[contains(text(),'UA profile')]
${Sort_Object}                  xpath=//th[@class="sortable"]/a[contains(text(),'Object')]
${Sort_Object64}                xpath=//th[contains(text(),'Object')]
${Sort_Event}                   xpath=//th[@class="sortable"]/a[contains(text(),'Event')]
${Sort_Event64}                 xpath=//th[contains(text(),'Event')]
${Sort_Prefix}                  xpath=//th[@class="sortable"]/a[contains(text(),'Local area prefix')]
${Sort_Prefix}                  xpath=//th[contains(text(),'Local area prefix')]
${Sort_FQDN}                    xpath=//th[@class="sortable"]/a[contains(text(),'FQDN')]
${Sort_Protocol}                xpath=//th[@class="sortable"]/a[contains(text(),'Protocol')]
${Sort_Data}                    xpath=//th[@class="sortable"]/a[contains(text(),'Data Reference')]
${Sort_Service}                 xpath=//th[@class="sortable"]/a[contains(text(),'Service Indication')]
${Sort_Max}                     xpath=//th[@class="sortable"]/a[contains(text(),'Max Size')]
${Sort_PeerName}                     xpath=//th[@class="sortable"]/a[contains(text(),'Peer Name')]
${Sort_Priority}                     xpath=//th[@class="sortable"]/a[contains(text(),'Priority')]
${Sort_Protected Server Port}       xpath=//th[@class="sortable"]/a[contains(text(),'Protected Server Port')]

#profile PEER IBCF, PCSCF
${MatchingRule}                      xpath=//li[@class='active']//a[@class='sub-menu'][contains(text(),'Matching Rule')]
${ManiRule}                          xpath=//li[@class='active']//a[@class='sub-menu'][contains(text(),'Manipulation Rule')]
${Rule_Name_Field}                   id=rule_name
${Header_Field}                      id=header_name
${Element_Dropdown_List}             xpath=//label[contains(text(),'Element type')]//preceding::div[1]/input
${Action_Dropdown_List}              xpath=//*[@id="content-container"]//following::div//following::input[@class='select-dropdown']
${Action_Add}                        xpath=//*[@id="content-container"]//following::span[contains(.,'Add')]
${Action_Del}                        xpath=//*[@id="content-container"]//following::span[contains(.,'Del')]
${Action_Replace}                    xpath=//*[@id="content-container"]//following::span[contains(.,'Replace')]
${Action_Modify}                    xpath=//*[@id="content-container"]//following::span[contains(.,'Modify')]
${Action_Store}                     xpath=//*[@id="content-container"]//following::span[contains(.,'Store')]
${Action_Store_in_session}          xpath=//*[@id="content-container"]//following::span[contains(.,'Store_in_session')]
${Action_Add_quote}                 xpath=//*[@id="content-container"]//following::span[contains(.,'add_quote')]
${Action_Del_quote}                 xpath=//*[@id="content-container"]//following::span[contains(.,'del_quote')]
${Action_Set_sip_to_tel}            xpath=//*[@id="content-container"]//following::span[contains(.,'set_sip_to_tel')]
${Action_Set_tel_to_sip}            xpath=//*[@id="content-container"]//following::span[contains(.,'set_tel_to_sip')]

${Element_Header_Name}               xpath=//*[@id="content-container"]//following::span[contains(.,'HEADER-NAME')]
${Element_Header_Value}              xpath=//*[@id="content-container"]//following::span[contains(.,'HEADER-VALUE')]
${Element_Header_Param}              xpath=//*[@id="content-container"]//following::span[text()='HEADER-PARAM']
${Element_Param_Name}                xpath=//*[@id="content-container"]//following::span[contains(.,'HEADER-PARAM-NAME')]
${Element_Uri_Value}                xpath=//*[@id="content-container"]//following::span[contains(.,'URI-VALUE')]
${Element_Uri_Param}                xpath=//*[@id="content-container"]//following::span[text()='URI-PARAM']
${Element_Uri_Param_Name}           xpath=//*[@id="content-container"]//following::span[contains(.,'URI-PARAM-NAME')]
${Element_Uri_User}                 xpath=//*[@id="content-container"]//following::span[text()='URI-USER']
${Element_Uri_User_Param}           xpath=//*[@id="content-container"]//following::span[contains(.,'URI-USER-PARAM')]
${Element_Uri_Host}                 xpath=//*[@id="content-container"]//following::span[contains(.,'URI-HOST')]
${Element_Uri_Port}                 xpath=//*[@id="content-container"]//following::span[contains(.,'URI-PORT')]
${Element_Uri_Display}              xpath=//*[@id="content-container"]//following::span[contains(.,'URI-DISPLAY')]
${Element_Uri_Type}                 xpath=//*[@id="content-container"]//following::span[contains(.,'URI-TYPE')]
${Element_Uri_Tel}                  xpath=//*[@id="content-container"]//following::span[contains(.,'URI-TEL-NUM')]
${Element_Status_Code}              xpath=//*[@id="content-container"]//following::span[contains(.,'STATUS-CODE')]
${Element_Reason_Phrase}            xpath=//*[@id="content-container"]//following::span[contains(.,'REASON-PHRASE')]
${Element_Application_Name}         xpath=//*[@id="content-container"]//following::span[contains(.,'APPLICATION-NAME')]
${Element_Sdp_Media}                xpath=//*[@id="content-container"]//following::span[contains(.,'SDP-MEDIA')]
${Element_Sdp_Session}              xpath=//*[@id="content-container"]//following::span[contains(.,'SDP-SESSION')]
${Element_Message_Body}             xpath=//*[@id="content-container"]//following::span[contains(.,'MESSAGE-BODY')]
${Element_Name_Field}               id=element_name
${Matching_Value_Field}             id=matching_value
${Codec_Type_Field}                 id=ml_codec_type
${Attribute_Field}                  id=attribute
${Instance_Field}                   id=instance_
${Condition_Type_Dropdown}          xpath=//label[@for='condition_type']//preceding::div[1]/input
${Condition_Type_IP}                xpath=//label[@for='condition_type']//preceding::div[1]/ul/li[2]
${Condition_Type_IPV4}              xpath=//label[@for='condition_type']//preceding::div[1]/ul/li[3]
${Condition_Type_IPV6}              xpath=//label[@for='condition_type']//preceding::div[1]/ul/li[4]
${Condition_Type_FQDN}              xpath=//*[@id="content-container"]//following::span[contains(.,'FQDN')]
${Condition_Type_Case}              xpath=//*[@id="content-container"]//following::span[contains(.,'CASE_SENSITIVE')]
${Condition_Type_Strictly}          xpath=//*[@id="content-container"]//following::span[contains(.,'STRICTLY')]
${Condition_Type_None}              xpath=//*[@id="content-container"]//following::span[contains(.,'NONE')]
${Min_occ_Field}                    id=min_occ
${Max_occ_Field}                    id=max_occ
${New_Value_Field}                  id=new_value
${Rule_Value_New_Field}             id=rule_value_new
${Rule_Value_Original_Field}        id=rule_value_org
${Content_Type_Field}               id=content_type
${Sub_Type_Field}                   id=sub_type
${Boundary_Field}                   id=boundary
${Version_Field}                    id=version
${Base_Field}                       id=base
${Disposition_Field}                id=disposition
${Handling_Field}                   id=handling
${Content_Value_Field}              id=content_value
#Header authprofiles
${HAP_Field}                        xpath=//li[@class='active']//a[@class='sub-menu'][contains(text(),'Header Authorization Profile')]
${Method_Type_Field}                id=method_type
${Policy_Accept}                    xpath=//button[@value='Accept']
${Policy_Reject}                    xpath=//button[@value='Reject']
${Policy_Ignore}                    xpath=//button[@value='Ignore']
#${P_Policy_Accept}                  xpath=//button[@value='Accept']
#${P_Policy_Reject}                  xpath=//button[@value='Reject']
#${P_Policy_Ignore}                  xpath=//button[@value='Ignore']
#${Maching_Rules_Field}              id=matching_rules
${Maching_Rules_Field_HM}           xpath=//textarea[@id="matching_rules"]
${Maching_Rules_Field}              xpath=//input[@id="matching_rules"]
${Return_Code_Field}                xpath=//input[@id="return_code"]
${Reason_protocol_None}             xpath=//button[@value='None']
${Reason_protocol_SIP}              xpath=//button[@value='SIP']
${Reason_protocol_Q.850}            xpath=//button[@value='Q.850']
${Reason_cause_Field}               xpath=//input[@id="reason_cause"]
${Reason_text_Field}                xpath=//input[@id="reason_text"]

#Authoprofiles
${AP_Field}                         xpath=//li[@class='active']//a[@class='sub-menu'][contains(text(),'Header Authorization Profile')]//following::*[contains(text(),'Authorization Profile')]
${Index_Field}                      id=index
#${Default_Accept_Field}             id=btn-accept
${Default_Accept_Field}             xpath=//div[@class='row top-button'][1]/child::div//button[contains(.,'Accept')]
#${Default_Reject_Field}             id=btn-reject
${Default_Reject_Field}             xpath=//div[@class='row top-button'][1]/child::div//button[contains(.,'Reject')]
${HAP_Dropdown}                     xpath=//label[contains(text(),'Header authorization filter')]//following::div//following::input[@class='select-dropdown']
${HAP_1}                            xpath=//label[contains(text(),'Header authorization filter')]//following::div/ul/li[1]
${HAP_2}                            xpath=//label[contains(text(),'Header authorization filter')]//following::div/ul/li[2]
${HAP_3}                            xpath=//label[contains(text(),'Header authorization filter')]//following::div/ul/li[3]
${HAP_Label}                        xpath=//label[contains(text(),'Header authorization filter')]
#${Authorization_Accept_Field1}       xpath=//button[@type='submit'][contains(text(),'Accept')]
#${Authorization_Reject_Field1}       xpath=//button[@type='submit'][contains(text(),'Reject')]
${Authorization_Accept_Field1}      xpath=//fieldset[@class='optional-info']/fieldset[1]/child::div//button[contains(.,'Accept')]
${Authorization_Reject_Field1}      xpath=//fieldset[@class='optional-info']/fieldset[1]/child::div//button[contains(.,'Reject')]
${Authorization_Accept_Field2}      xpath=//fieldset[@class='optional-info']/fieldset[2]/child::div//button[contains(.,'Accept')]
${Authorization_Reject_Field2}      xpath=//fieldset[@class='optional-info']/fieldset[2]/child::div//button[contains(.,'Reject')]
${Authorization_Accept_Field3}      xpath=//fieldset[@class='optional-info']/fieldset[3]/child::div//button[contains(.,'Accept')]
${Authorization_Reject_Field3}      xpath=//fieldset[@class='optional-info']/fieldset[3]/child::div//button[contains(.,'Reject')]
${Add_Authprofile_Button}           xpath=//button[@value='add-more-auth']
${Remove_Authprofile_Button1}        xpath=//fieldset[@class='optional-info']/fieldset[1]/child::div//button[contains(.,'remove')]
${Remove_Authprofile_Button2}        xpath=//fieldset[@class='optional-info']/fieldset[2]/child::div//button[contains(.,'remove')]
${Remove_Authprofile_Button3}        xpath=//fieldset[@class='optional-info']/fieldset[3]/child::div//button[contains(.,'remove')]
${Method_Button1}                   xpath=//fieldset[@class='optional-info']/fieldset[1]/child::div//button[contains(.,'Method')]
${Method_Button2}                     xpath=//fieldset[@class='optional-info']/fieldset[2]/child::div//button[contains(.,'Method')]
${Method_Button3}                     xpath=//fieldset[@class='optional-info']/fieldset[2]/child::div//button[contains(.,'Method')]
${Subscribe_Button1}                   xpath=//fieldset[@class='optional-info']/fieldset[1]/child::div//button[contains(.,'Subscribe event')]
${Subscribe_Button2}                    xpath=//fieldset[@class='optional-info']/fieldset[2]/child::div//button[contains(.,'Subscribe event')]
${Subscribe_Button3}                    xpath=//fieldset[@class='optional-info']/fieldset[3]/child::div//button[contains(.,'Subscribe event')]
${Reject_Button1}                      xpath=//fieldset[@class='optional-info']/fieldset[1]/child::div//button[contains(.,'Reject')]
${Reject_Button2}                      xpath=//fieldset[@class='optional-info']/fieldset[2]/child::div//button[contains(.,'Reject')]
${Reject_Button3}                      xpath=//fieldset[@class='optional-info']/fieldset[3]/child::div//button[contains(.,'Reject')]

#Routingprofiles
${RP_Field}                         xpath=//a[@class='sub-menu'][contains(text(),'Routing Profile')]
${Index_RP_Field}                   id=index_
${Default_Routing_Field}            id=default
${Method_Name_Field1}                id=routing_profiles-0-method_name
${Forward_Address_Field1}            id=routing_profiles-0-forward_address
${Method_Name_Field2}                id=routing_profiles-1-method_name
${Forward_Address_Field2}            id=routing_profiles-1-forward_address
${Method_Name_Field3}                id=routing_profiles-2-method_name
${Forward_Address_Field3}            id=routing_profiles-2-forward_address
${Method_Name_Field4}                id=routing_profiles-3-method_name
${Forward_Address_Field4}            id=routing_profiles-3-forward_address
${Add_Method_Button}                 xpath=//button[@value='add-more-method']
${Remove_Method_Button1}              xpath=//fieldset[@class='optional-info']/fieldset[1]//button[contains(.,'remove')]
${Remove_Method_Button2}              xpath=//fieldset[@class='optional-info']/fieldset[2]//button[contains(.,'remove')]

#Header manipulation
${HM_Field}                         xpath=//li[@class='active']//a[@class='sub-menu'][contains(text(),'Header Manipulation')]
${Name_HM_Field}                    id=name_manipulation
${Processing_Dropdown_List}         xpath=//label[@for='processing_order']//preceding::div[1]//input
${Processing_Order_IN}              xpath=//label[@for='processing_order']//preceding::div[1]//span[contains(.,'IN')]
${Processing_Order_OUT}             xpath=//label[@for='processing_order']//preceding::div[1]//span[contains(.,'OUT')]
${Method_Dropdown_List}             xpath=//label[@for='method']//following::div[1]//input
${Method_INVITE}                    xpath=//*[@id="content-container"]//following::span[contains(.,'INVITE')]
${Method_REGISTER}                  xpath=//*[@id="content-container"]//following::span[contains(.,'REGISTER')]
${Method_MESSAGE}                   xpath=//*[@id="content-container"]//following::span[contains(.,'MESSAGE')]
${Method_INFO}                      xpath=//*[@id="content-container"]//following::span[contains(.,'INFO')]
${Method_PUBLISH}                   xpath=//*[@id="content-container"]//following::span[contains(.,'PUBLISH')]
${Method_NOTIFY}                    xpath=//*[@id="content-container"]//following::span[contains(.,'NOTIFY')]
${Method_PRACK}                     xpath=//*[@id="content-container"]//following::span[contains(.,'PRACK')]
${Method_SUBSCRIBE}                 xpath=//*[@id="content-container"]//following::span[contains(.,'SUBSCRIBE')]
${Method_REFER}                     xpath=//*[@id="content-container"]//following::span[contains(.,'REFER')]
${Method_UPDATE}                    xpath=//*[@id="content-container"]//following::span[contains(.,'UPDATE')]
${Method_CANCEL}                    xpath=//*[@id="content-container"]//following::span[contains(.,'CANCEL')]
${Method_BYE}                       xpath=//*[@id="content-container"]//following::span[contains(.,'BYE')]
${Method_OPTIONS}                   xpath=//*[@id="content-container"]//following::span[contains(.,'OPTIONS')]
${Method_ACK}                       xpath=//*[@id="content-container"]//following::span[contains(.,'ACK')]
${MR_Label}                         xpath=//label[@for='manipulation_rule']
${MR_Dropdown_List}                 xpath=//label[@for='manipulation_rule']//following::div[1]//input
${MR_1}                             xpath=//label[@for='manipulation_rule']//following::div[1]//ul/li[1]
${MR_2}                             xpath=//label[@for='manipulation_rule']//following::div[1]//ul/li[2]
${Message_Label}                   xpath=//label[@for='message_type']
${Message_Dropdown_List}           xpath=//label[@for='message_type']//preceding::div[1]//input
${Message_Type_Both}               xpath=//label[@for='message_type']//preceding::div[1]//span[contains(.,'BOTH')]
${Message_Type_Request}            xpath=//label[@for='message_type']//preceding::div[1]//span[contains(.,'REQUEST')]
${Message_Type_Response}           xpath=//label[@for='message_type']//preceding::div[1]//span[contains(.,'RESPONSE')]

${Direction_Dropdown_List}         xpath=//label[@for='direction']//preceding::div[1]//input
${Direction_Both}                  xpath=//label[@for='direction']//preceding::div[1]//span[contains(.,'BOTH')]
${Direction_Core_To_Peer}          xpath=//label[@for='direction']//preceding::div[1]//span[contains(.,'CORE_TO_PEER')]
${Direction_Peer_To_Core}          xpath=//label[@for='direction']//preceding::div[1]//span[contains(.,'PEER_TO_CORE')]

#SDP Profile
${Cancel_SDP}                        xpath=//a[@Class="button-cancel" and contains(text(),'Cancel')]
${SP_Field}                          xpath=//a[@class='sub-menu'][contains(text(),'Sdp Profile')]
${Media_Dropdown_List}               xpath=//label[contains(text(),'Media type')]//following::div//following::input[@class='select-dropdown']
${Media_Audio_Field}                 xpath=//label[contains(text(),'Media type')]//following::span[contains(.,'AUDIO')][1]
${Media_Video_Field}                 xpath=//label[contains(text(),'Media type')]//following::span[contains(.,'VIDEO')][1]
${Media_T38_Field}                   xpath=//label[contains(text(),'Media type')]//following::span[contains(.,'T38')]
${Max_ptime_lable}                  xpath=//label[contains(text(),'Max ptime')]
${Max_Ptime_Field}                  id=maxp_time
${Default_Priority_Field}           id=def_priority
${Default_Behavior_Dropdown_List}   xpath=//label[contains(text(),'Default behavior')]//preceding-sibling::div//following::input[@class='select-dropdown']
${Default_Behavior_None}            xpath=//label[contains(text(),'Default behavior')]//preceding-sibling::div//following::span[contains(.,'NONE')]
${Default_Behavior_Accept}          xpath=//label[contains(text(),'Default behavior')]//preceding-sibling::div//following::span[contains(.,'ACCEPT')]
${Default_Behavior_Reject}          xpath=//label[contains(text(),'Default behavior')]//preceding-sibling::div//following::span[contains(.,'REJECT')]
${Applicability_Dropdown_List}      xpath=//label[contains(text(),'Applicability')]//preceding-sibling::div//following::input[@class='select-dropdown']
${Applicability_None}               xpath=//label[contains(text(),'Applicability')]//preceding-sibling::div//following::span[contains(.,'NONE')]
#${Applicability_Home}               xpath=//label[contains(text(),'Applicability')]//preceding-sibling::div//following::span[contains(.,'HOME')]
#${Applicability_Extern}             xpath=//label[contains(text(),'Applicability')]//preceding-sibling::div//following::span[contains(.,'EXTERN')]
#${Applicability_Home}               xpath=//label[contains(text(),'Applicability')]//preceding-sibling::div//following::span[contains(.,'home')]
#${Applicability_Extern}             xpath=//label[contains(text(),'Applicability')]//preceding-sibling::div//following::span[contains(.,'extern')]
${Applicability_Home/Extern}        xpath=//label[contains(text(),'Applicability')]//preceding-sibling::div//following::span[contains(.,'home/extern')][1]
${Applicability_Home}               xpath=//label[contains(text(),'Applicability')]//preceding-sibling::div//following::span[contains(.,'home')][2]
${Applicability_Extern}             xpath=//label[contains(text(),'Applicability')]//preceding-sibling::div//following::span[contains(.,'extern')][2]
${Add_SDP_rule_button}               xpath=//button[@value='add-more-method']
${Remove_SDP_rule_button}            xpath=//button[@class='remove-button-control']
${Codec_Field}                      id=methods-0-codec
${Behavior_Dropdown_List}           xpath=//label[contains(text(),'Behavior')]//preceding-sibling::div//following::input[@class='select-dropdown']
${Behavior_label}                   xpath=//label[contains(text(),'Behavior')]
#${Behavior_Accept}                  xpath=//label[contains(text(),'Behavior')]//preceding-sibling::div//following::span[contains(.,'ACCEPT')]
#${Behavior_Reject}                  xpath=//label[contains(text(),'Behavior')]//preceding-sibling::div//following::span[contains(.,'REJECT')]
#${Behavior_Conreject}               xpath=//label[contains(text(),'Behavior')]//preceding-sibling::div//following::span[contains(.,'CONREJECT')]
${Behavior_Accept}                  xpath=//button[@name="ACCEPT"]
${Behavior_Reject}                  xpath=//button[@name="REJECT"]
${Behavior_Conreject}               xpath=//button[@name="CONREJECT"]
${Media_Type_Dropdown_List}         xpath=//label[contains(text(),'Media type')]//preceding-sibling::div//following::input[@class='select-dropdown']
${Media_Type_Audio}                 xpath=//label[contains(text(),'Media type')]//preceding-sibling::div//following::span[contains(.,'AUDIO')]
${Media_Type_Video}                 xpath=//label[contains(text(),'Media type')]//preceding-sibling::div//following::span[contains(.,'VIDEO')]
${Priority_SDP_Field}                   id=methods-0-priority
${Condition_Field}                  id=methods-0-condition
${Clockrate_Field}                  xpath=//input[@id="methods-0-clockrate"]
${Priority_cscf_Field}              id=priority

#Session Limiter
${SLP_Field}                        xpath=//a[@class='sub-menu'][contains(text(),'Session Limiter Profile')]
${Max_In_Field}                     id=max_in
${Resume_In_Field}                  id=resume_in
${Max_Out_Field}                    id=max_out
${Resume_Out_Field}                 id=resume_out
${Max_Session_Field}                id=max_session
${Resume_Session_Field}             id=resume_session
${Safe_Threshold_Field}             id=safe
${Warn_Threshold_Field}             id=warning
${Error_Run_Code_Field}             id=return_code
${Reason_Phrase_Field}              id=reason_phrase
${Retry_After_Field}                id=retry
${Step_Value_Field}                 id=step_value
${Step_Number_Field}                id=step_number

#Session Control
${SC_Field}                         xpath=//li[@class='active']//a[@class='sub-menu'][contains(text(),'Session Control')]
${Incoming_Max_Session_Field}       id=in_session
${Outgoing_Max_Session_Field}       id=out_session
${Global_Max_Session_Field}         id=global_session
${Add_Limitation_Button}            xpath=//button[@value='add-more-limitation']
${Remove_Limitation_Button}         xpath=//button[@class='remove-button-control']
${P_Add_Limitation_Button}          xpath=//button[contains(.,'Add Limitation')]
${Limit_Media1_Dropdown_List}       xpath=//label[@for='limitations-0-media_type']//preceding::div[1]//input
${Limit_Media_Audio1}               xpath=//label[@for='limitations-0-media_type']//preceding::div[1]//span[contains(.,'AUDIO')]
${Limit_Media_Video1}               xpath=//label[@for='limitations-0-media_type']//preceding::div[1]//span[contains(.,'VIDEO')]
${Limit_Media_T381}                 xpath=//label[@for='limitations-0-media_type']//preceding::div[1]//span[contains(.,'T38')]
${Limit_In_Session1_Field}          id=limitations-0-max_in
${Limit_Out_Session1_Field}         id=limitations-0-max_out
${Limit_Glo_Session1_Field}         id=limitations-0-max_global
${Limit_Media2_Dropdown_List}       xpath=//label[@for='limitations-1-media_type']//preceding::div[1]//input
${Limit_Media_Audio2}               xpath=//label[@for='limitations-1-media_type']//preceding::div[1]//span[contains(.,'AUDIO')]
${Limit_Media_Video2}               xpath=//label[@for='limitations-1-media_type']//preceding::div[1]//span[contains(.,'VIDEO')]
${Limit_Media_T382}                 xpath=//label[@for='limitations-1-media_type']//preceding::div[1]//span[contains(.,'T38')]
${Limit_In_Session2_Field}          id=limitations-1-max_in
${Limit_Out_Session2_Field}         id=limitations-1-max_out
${Limit_Glo_Session2_Field}         id=limitations-1-max_global
${Audio_Other}                      xpath=//label[@for='use_audio']//following::div[1]//button[@name='Other']
${Audio_None}                       xpath=//label[@for='use_audio']//following::div[1]//button[@name='None']
${Video_Other}                      xpath=//label[@for='use_video']//following::div[1]//button[@name='Other']
${Video_None}                       xpath=//label[@for='use_video']//following::div[1]//button[@name='None']
${T38_Other}                        xpath=//label[@for='use_t38']//following::div[1]//button[@name='Other']
${T38_None}                         xpath=//label[@for='use_t38']//following::div[1]//button[@name='None']
${New_Limit_In_Session1_Field}      id=audio_max_in
${New_Limit_Out_Session1_Field}     id=audio_max_out
${New_Limit_Glo_Session1_Field}     id=audio_max_global
${New_Limit_In_Session2_Field}      id=video_max_in
${New_Limit_Out_Session2_Field}     id=video_max_out
${New_Limit_Glo_Session2_Field}     id=video_max_global
${New_Limit_In_Session3_Field}      id=t38_max_in
${New_Limit_Out_Session3_Field}     id=t38_max_out
${New_Limit_Glo_Session3_Field}     id=t38_max_global

#RFC4028
${RFC4028_Field}                    xpath=//a[@class='sub-menu'][contains(text(),'RFC4028')]
${RFC4028_Field_5}                   xpath=//a[@href="/pcscf/5/rfc4028/index"]
${RFC4028_Field_0}                   xpath=//a[@href="/pcscf/0/rfc4028/index"]
${Id_Field}                        id=id
${Min_Expire_Field}                id=min_expire
${Max_Expire_Field}                id=max_expire
${Session_Expire_Field}            id=session_expire
${Refresher_Dropdown_List}         xpath=//label[@for='refresher']//preceding-sibling::div//following::input[@class='select-dropdown']
${Refresher_Dropdown_List_1}       xpath=//label[@for='refresher']//preceding-sibling::div
${Refresher_Ibcf}                  xpath=//label[@for='refresher']//preceding-sibling::div//following::span[contains(.,'IBCF')]
${Refresher_Proxy}                 xpath=//label[@for='refresher']//preceding-sibling::div//following::span[contains(.,'PROXY')]
${Refresher_Peer}                  xpath=//label[@for='refresher']//preceding-sibling::div//following::span[contains(.,'PEER')]
${Refresher_Negotiate}             xpath=//label[@for='refresher']//preceding-sibling::div//following::span[contains(.,'NEGOTIATE')]
${Refresher_Method_Dropdown_List}       xpath=//label[@for='refresh_method']//preceding-sibling::div//following::input[@class='select-dropdown']
${Refresher_Method_UPDATE}              xpath=//label[@for='refresh_method']//preceding-sibling::div//following::span[contains(.,'UPDATE')]
${Refresher_Method_REINVITE}            xpath=//label[@for='refresh_method']//preceding-sibling::div//following::span[contains(.,'REINVITE')]

#Core Domain
${Core_Domain_Field}                xpath=//a[@class='sub-menu'][contains(text(),'Core Domain')]
${Domain_Core_Field}                     id=domain_name

#Media Profile
${MP_section}                       xpath=//a[@class='first-menu'][contains(text(),'Media Profile')]
${P_MP_section}                     xpath=//li[@class='no-padding active']//div[@class='collapsible-body']//ul//li//a[@class='first-menu'][contains(text(),'Media Profile')]
${2833_Mode_Dropdown}               xpath=//label[@for='mode_2833']/preceding::div[1]/input
${2833_Mode_Transparent}            xpath=//label[@for='mode_2833']/preceding::div[1]//span[contains(.,'transparent')]
${2833_Mode_Needed}                 xpath=//label[@for='mode_2833']/preceding::div[1]//span[text()='needed']
${2833_Mode_Removed}                xpath=//label[@for='mode_2833']/preceding::div[1]//span[contains(.,'removed')]
${2833_Mode_NotPCM}                 xpath=//label[@for='mode_2833']/preceding::div[1]//span[contains(.,'needed_when_not_pcm')]
${INFO_Mode_Dropdown}               xpath=//label[@for='mode_info']/preceding::div[1]/input
${INFO_Mode_Transparent}            xpath=//label[@for='mode_info']/preceding::div[1]//span[contains(.,'transparent')]
${INFO_Mode_Supported}              xpath=//label[@for='mode_info']/preceding::div[1]//span[contains(.,'supported')]
${INFO_Mode_Parallel}               xpath=//label[@for='mode_info']/preceding::div[1]//span[contains(.,'parallel')]
${INBAND_Mode_Dropdown}             xpath=//label[@for='mode_inband']/preceding::div[1]/input
${INBAND_Mode_Enabled}              xpath=//label[@for='mode_inband']/preceding::div[1]//span[contains(.,'enabled')]
${INBAND_Mode_Disabled}             xpath=//label[@for='mode_inband']/preceding::div[1]//span[contains(.,'disabled')]
${INFO_Variant_Dropdown}            xpath=//label[@for='info_var']/preceding::div[1]/input
${INFO_Variant_DTMF}                xpath=//label[@for='info_var']/preceding::div[1]//span[text()='dtmf']
${INFO_Variant_DTMF_Relay}          xpath=//label[@for='info_var']/preceding::div[1]//span[text()='dtmf relay']
${Ptime_Preferred_Field}            id=p_pref
${Ptime_Minimum_Field}              id=p_min
${Ptime_Maximum_Field}              id=p_max
${Fax_Mode_Dropdown}                xpath=//label[@for='fax_mode']/preceding::div[1]/input
${Fax_Mode_Transparent}             xpath=//label[@for='fax_mode']/preceding::div[1]//span[contains(.,'transparent')]
${2833_Mode_Audio}                  xpath=//label[@for='fax_mode']/preceding::div[1]//span[contains(.,'audio_only')]
${2833_Mode_T38}                    xpath=//label[@for='fax_mode']/preceding::div[1]//span[contains(.,'prefer_t38')]
${2833_Mode_Compressed}             xpath=//label[@for='fax_mode']/preceding::div[1]//span[contains(.,'compressed_codec_prevention')]
${Fax_Detection_Dropdown}           xpath=//label[@for='fax_detection']/preceding::div[1]/input
${Fax_Detection_Enabled}            xpath=//label[@for='fax_detection']/preceding::div[1]//span[contains(.,'enable')]
${Fax_Detection_Disabled}           xpath=//label[@for='fax_detection']/preceding::div[1]//span[contains(.,'disable')]
${Fax_Codec_Dropdown}               xpath=//label[@for='fax_codec']/preceding::div[1]/input
${Fax_Codec_PCMA}                   xpath=//label[@for='fax_codec']/preceding::div[1]//span[text()='PCMA_VBD']
${Fax_Codec_PCMU}                   xpath=//label[@for='fax_codec']/preceding::div[1]//span[contains(.,'PCMU_VBD')]
${Fax_Codec_PCMA_PCMU}              xpath=//label[@for='fax_codec']/preceding::div[1]//span[contains(.,'PCMA_VBD & PCMU_VBD')]
${Code_Adaptation_Dropdown}         xpath=//label[@for='codec_adaptation_mode']/preceding::div[1]/input
${Code_adaptation_0}                xpath=//label[@for='codec_adaptation_mode']/preceding::div[1]//span[contains(.,'0')]
${Code_adaptation_2}                xpath=//label[@for='codec_adaptation_mode']/preceding::div[1]//span[contains(.,'2')]

#SRTP
${Encryption_Dropdown}              xpath=//label[@for='enc_cipher']/preceding::div[1]/input
${AES_CM_128}                       xpath=//label[@for='enc_cipher']/preceding::div[1]//span[contains(.,'AES_CM_128')]
${Encryption_Null}                  xpath=//label[@for='enc_cipher']/preceding::div[1]//span[contains(.,'Null')]
${Authentication_Dropdown}          xpath=//label[@for='auth_cipher']/preceding::div[1]/input
${HMAC_SHA1_80}                     xpath=//label[@for='auth_cipher']/preceding::div[1]//span[contains(.,'HMAC_SHA1_80')]
${HMAC_SHA1_32}                     xpath=//label[@for='auth_cipher']/preceding::div[1]//span[contains(.,'HMAC_SHA1_32')]
${Authentication_Null}              xpath=//label[@for='auth_cipher']/preceding::div[1]//span[contains(.,'Null')]
${Window_Size_Field}                id=wsh
${Key_Derivation_Field}             id=kdr

#TLS
${Protocol_Version_Dropdown}        xpath=//label[@for='proto']/preceding::div[1]/input
${TLS_V11}                          xpath=//label[@for='proto']/preceding::div[1]//span[contains(.,'TLS v1.1')]
${TLS_V12}                          xpath=//label[@for='proto']/preceding::div[1]//span[contains(.,'TLS v1.2')]
${TLS_V1}                           xpath=//label[@for='proto']/preceding::div[1]//span[contains(.,'TLS v1')]
${SSL_V3}                           xpath=//label[@for='proto']/preceding::div[1]//span[contains(.,'SSL v3')]
${SSL_V23}                          xpath=//label[@for='proto']/preceding::div[1]//span[contains(.,'SSL v23')]
${Allow_Cipher_Dropdown}            xpath=//input[@id='cipher_type']/preceding::div[4]//input
${Allow_Cipher_Null}                xpath=//input[@id='cipher_type']/preceding::div[4]//span[text() = 'NULL']
${Allow_Cipher_aNull}               xpath=//input[@id='cipher_type']/preceding::div[4]//span[text() = 'aNULL']
${Allow_Cipher_ALL}                xpath=//input[@id='cipher_type']/preceding::div[4]//span[text() = 'ALL']
${Allow_Cipher_HIGH}                xpath=//input[@id='cipher_type']/preceding::div[4]//span[text() = 'HIGH']
${Allow_Cipher_LOW}                xpath=//input[@id='cipher_type']/preceding::div[4]//span[text() = 'LOS']
${Allow_Cipher_RSA}                xpath=//input[@id='cipher_type']/preceding::div[4]//span[text() = 'RSA']
${Allow_Cipher_kEDH}                xpath=//input[@id='cipher_type']/preceding::div[4]//span[text() = 'kEDH']
${Allow_Cipher_aRSA}                xpath=//input[@id='cipher_type']/preceding::div[4]//span[text() = 'aRSA']
${Allow_Cipher_aDSS}                xpath=//input[@id='cipher_type']/preceding::div[4]//span[text() = 'aDSS']
${Allow_Cipher_TLSv1}                xpath=//input[@id='cipher_type']/preceding::div[4]//span[text() = 'TLSv1']
${Allow_Cipher_SSLv3}                xpath=//input[@id='cipher_type']/preceding::div[4]//span[text() = 'SSLv3']
${Allow_Cipher_MD5}                xpath=//input[@id='cipher_type']/preceding::div[4]//span[text() = 'MD5']
${Allow_Cipher_SSLv2}                xpath=//input[@id='cipher_type']/preceding::div[4]//span[text() = 'SSLv2']
${Allow_Cipher_DH}                xpath=//input[@id='cipher_type']/preceding::div[4]//span[text() = 'DH']
${Allow_Cipher_ADH}                xpath=//input[@id='cipher_type']/preceding::div[4]//span[text() = 'ADH']
${Allow_Cipher_AES}                xpath=//input[@id='cipher_type']/preceding::div[4]//span[text() = 'AES']
${Allow_Cipher_3DES}                xpath=//input[@id='cipher_type']/preceding::div[4]//span[text() = '3DES']
${Allow_Cipher_DES}                xpath=//input[@id='cipher_type']/preceding::div[4]//span[text() = 'DES']
${Allow_Cipher_SHA1}                xpath=//input[@id='cipher_type']/preceding::div[4]//span[text() = 'SHA1']
${Allow_Cipher_Specific_Button}     xpath=//button[@id='cipher_specific']
${Specific_Field}                   xpath=//input[@id='cipher_specific']
${Verification_Dropdown}            xpath=//label[@for='mode']/preceding::div[1]/input
${Verification_none}                xpath=//label[@for='mode']/preceding::div[1]//span[contains(.,'none')]
${Verification_optional}            xpath=//label[@for='mode']/preceding::div[1]//span[contains(.,'optional')]
${Verification_mandatory}           xpath=//label[@for='mode']/preceding::div[1]//span[contains(.,'mandatory')]
${Max_Connection_Field}             id=max_co
${Certificate_Field}                id=max_depth
${Handshake_Field}                  id=handshake
${Renegotiation_Field}              id=timer
${CA_Browser}                       id=cafile
${Certificate_Browser}              id=certif
${Private_Browser}                  id=private
${Password_Field}                   id=password
#Bypass
${Peer1_Dropdown}                   xpath=//fieldset[contains(.,'Peers')]/div[1]//input
${Peer1_1}                           xpath=//fieldset[contains(.,'Peers')]/div[1]//ul/li[1]
${Peer1_2}                           xpath=//fieldset[contains(.,'Peers')]/div[1]//ul/li[2]
${Add_Peer_Button}                  xpath=//button[@value='add-more-peer']
${Remove_Peer_Button}               xpath=//i[@class='material-icons red-text']
${Peer2_Dropdown}                   xpath=//fieldset[contains(.,'Peers')]/div[2]//input
${Peer2_1}                           xpath=//fieldset[contains(.,'Peers')]/div[2]//ul/li[1]
${Peer2_2}                           xpath=//fieldset[contains(.,'Peers')]/div[2]//ul/li[2]
#Session Backup
${Drop_SessionBackup}               id=drop_session_backup
${Clean_SessionBackup}              id=clean_session_backup
${Reset_SessionBackup}              id=reset_on_standby
#Whitelabel
#Alerting
${Object_Global_Button}             xpath=//button[@value='Global']
${Object_Peer_Button}               xpath=//button[@value='Peer']
${Object_TPIP_Button}               xpath=//button[@value='TPIP']
${Peer_Dropdown}                    xpath=//label[@for='peer_name']//preceding::div[1]/input
${Peer_1}                           xpath=//label[@for='peer_name']//preceding::div[1]//span[contains(.,'PEER_SIPP_EXTERN')]
${Peer_2}                           xpath=//label[@for='peer_name']//preceding::div[1]//span[contains(.,'PEER_SIPP_CORE')]
${TPIP_Dropdown}                    xpath=//label[@for='tpip_name']//preceding::div[1]/input
${TPIP_1}                           xpath=//label[@for='tpip_name']//preceding::div[1]//span[text()='Auto_Edithome']
${TPIP_2}                           xpath=//label[@for='tpip_name']//preceding::div[1]//span[text()='Auto_Editextern']
${Event_Dropdown}                   xpath=//label[@for='event']//preceding::div[1]/input
${NUMBER_SIP_DIALOG}                xpath=//label[@for='event']//preceding::div[1]//span[contains(.,'NUMBER_SIP_DIALOG')]
${PERCENT_FAILED_SIP_DIALOG}        xpath=//label[@for='event']//preceding::div[1]//span[contains(.,'PERCENT_FAILED_SIP_DIALOG')]
${AVERAGE_PERCENT_PACKET_LOST}      xpath=//label[@for='event']//preceding::div[1]//span[contains(.,'AVERAGE_PERCENT_PACKET_LOST')]
${AVERAGE_JITTER}                   xpath=//label[@for='event']//preceding::div[1]//span[contains(.,'AVERAGE_JITTER')]
${NUMBER_REGISTRATION_SESSION}                   xpath=//label[@for='event']//preceding::div[1]//span[contains(.,'NUMBER_REGISTRATION_SESSION')]
${PERCENT_FAILED_REGISTRATION_SESSION}           xpath=//label[@for='event']//preceding::div[1]//span[contains(.,'PERCENT_FAILED_REGISTRATION_SESSION')]
${Min_Threshold_Field}              id=min_threshold
${Max_Threshold_Field}              id=max_threshold
${Step_Value_Field}                 id=step_value
${Step_Number_Field}                id=step_number
#${Supervision}                      xpath=//*[@class='collapsible-header' and contains(text(),'Supervision')]

#Pnum
${PNUM_section}                     xpath=//*[@class='collapsible-header active' and contains(text(),'Ibcf')]/following::div//a[@class='collapsible-header first-menu' and contains(text(),'Pnum')]
${PCSCF_PNUM_section}               xpath=//*[@class='collapsible-header active' and contains(text(),'Pcscf')]/following::div//a[@class='collapsible-header first-menu' and contains(text(),'Pnum')]
${U2N_section}                      xpath=//li[@class='active']//a[@class='sub-menu'][contains(text(),'User to Network')]
${N2U_section}                      xpath=//li[@class='active']//a[@class='sub-menu'][contains(text(),'Network to User')]
${Invite_Button}                    xpath=//button[@value='INVITE']
${Bye_Button}                       xpath=//button[@value='BYE']
${Ack_Button}                       xpath=//button[@value='ACK']
${Update_Button}                    xpath=//button[@value='UPDATE']
${Subscribe_Button}                 xpath=//button[@value='SUBSCRIBE']
${Register_Button}                  xpath=//button[@value='REGISTER']
${Prack_Button}                     xpath=//button[@value='PRACK']
${Refer_Button}                     xpath=//button[@value='REFER']
${Info_Button}                      xpath=//button[@value='INFO']
${Options_Button}                   xpath=//button[@value='OPTIONS']
${Calling_Button}                   xpath=//button[@value='Calling']
${Called_Button}                    xpath=//button[@value='Called']
${From_Button}                      xpath=//button[@value='From']
${PPI_Button}                       xpath=//button[@value='PPI (P-Preferred-Indentity)']
${To_Button}                        xpath=//button[@value='To']
${RQ_Button}                        xpath=//button[@value='RQ-URI (REQUEST-URI)']
${ReferTo_Button}                     xpath=//button[@value='Refer-To']
${Add_Calling_Rules}                id=add_item_calling_rule
${Remove_Calling_Rules_1}           xpath=//div[@class='row']//div[1]//fieldset[1]//div[1]//button[1]//i[1]
${Remove_Calling_Rules_2}           xpath=//div[@class='row']//div[1]//fieldset[1]//div[2]//button[1]//i[1]
${T_Reg_In_Field_1}                 id=lst_calling_rules-0-T_reg_in
${T_Reg_Out_Field_1}                id=lst_calling_rules-0-T_reg_out
${A_Reg_In_Field_1}                 id=lst_calling_rules-0-A_reg_in
${A_Reg_Out_Field_1}                id=lst_calling_rules-0-A_reg_out
${T_Reg_In_Field_2}                 id=lst_calling_rules-1-T_reg_in
${T_Reg_Out_Field_2}                id=lst_calling_rules-1-T_reg_out
${A_Reg_In_Field_2}                 id=lst_calling_rules-1-A_reg_in
${A_Reg_Out_Field_2}                id=lst_calling_rules-1-A_reg_out
${Add_Called_Rules}                 id=add_item_called_rule
${Remove_Called_Rules_1}            xpath=//div[@class='row']//div[2]//fieldset[1]//div[1]//button[1]//i[1]
${Remove_Called_Rules_2}            xpath=//div[@class='row']//div[2]//fieldset[1]//div[2]//button[1]//i[1]
${T_Reg_In_Field_3}                 id=lst_called_rules-0-T_reg_in
${T_Reg_Out_Field_3}                id=lst_called_rules-0-T_reg_out
${A_Reg_In_Field_3}                 id=lst_called_rules-0-A_reg_in
${A_Reg_Out_Field_3}                id=lst_called_rules-0-A_reg_out
${T_Reg_In_Field_4}                 id=lst_called_rules-1-T_reg_in
${T_Reg_Out_Field_4}                id=lst_called_rules-1-T_reg_out
${A_Reg_In_Field_4}                 id=lst_called_rules-1-A_reg_in
${A_Reg_Out_Field_4}                id=lst_called_rules-1-A_reg_out

#Extension
${Extension_section}                xpath=//li[@class='active']//a[@class='sub-menu'][contains(text(),'Extension')]
${Add_New_Ext_Button}               xpath=//button[@value='Add New Extension']
${Add_Existing_Ext_Button}          xpath=//button[@value='Add To Existing Extension']
${Ext_Id_Field}                     id=ext_new_index
${Ext_Id_Dropdown}                  xpath=//label[@for='ext_current_index']//preceding::div[1]/input
${Ext_Id_1}                         xpath=//label[@for='ext_current_index']//preceding::div[1]//span[contains(.,'4')]
${Add_Rule_Button}                  id=append_rule
${Rule1_Field}                      id=rules-0-rule_item
${Rule2_Field}                      id=rules-1-rule_item
${Rule3_Field}                      id=rules-2-rule_item

#Local area
${Localarea_section}                xpath=//li[@class='active']//a[@class='sub-menu'][contains(text(),'Local Area')]
${Prefix_Field}                     id=local_prefix
${Extension_Dropdown}               xpath=//label[contains(.,'Extensions')]//preceding::div[1]/input
${Extension_1}                      xpath=//label[contains(.,'Extensions')]//preceding::div[1]//span[contains(.,'Extension_1')]
${Extension_2}                      xpath=//label[contains(.,'Extensions')]//preceding::div[1]//span[contains(.,'Extension_2')]
${Delete_All_Button}                xpath=//th//i[contains(text(),'delete')]

#Capability
${Capability}                       xpath=//li[@class='active']//a[@class='sub-menu'][contains(text(),'Capability')]
${Name_Field}                       id=name
${Index_Field}                      id=index

#Capability
${Scscf}                            xpath=//li[@class='active']//a[@class='sub-menu'][contains(text(),'Scscf')]
${Orig_Field}                       id=orig_url
${Term_Field}                       id=term_url

#Confirm add          
${Confirm_Add_Type_1}                 id=submit_field
${Confirm_Add_Type_2}                 id=submit
${Confirm_Add_Type_3}                 xpath=//button[@type='submit']
${Confirm_Add_Type_Button}            xpath=//button[@value='submit']
${Confirm_Add_Type_Input_1}           xpath=//input[@value='submit']
${Confirm_Add_Type_Input_2}           xpath=//input[@value='Submit']
${Confirm_Add_IP_Nated}               xpath=//input[@id='submit_field_ipnated']

#Close
${Close_Notify}                     xpath=//*[@id="modal-show"]/div[2]/a
${Close_Notify_Not_Available}       xpath=//*[@id="modal-show-error"]/div[2]/a
${Cancel_Button}                    xpath=//*[@class='button-cancel' and contains(text(),'Cancel')]
#IFName
${IF_Name_Button}         xpath=//button[@id='ifname']
${IF_Name_Field}          xpath=//input[@id='ifname']

#Next page
${Page_2}                     xpath=//*[@id="content-container"]/div[2]/div/div/ul/li[3]/a
${TPIP_IP_DropDown_127}          xpath=//input[@value='${ifcfg-lo}']
${TPIP_IP_DropDown_eth0}          xpath=//input[@value='${eth0}']
${UPDATE_PCSCF_CMD}    pcs resource update pcscf cmd="/home/omni/bin/pcscf64 -i5 -noRegEvent -noV1compat -NoIpcBackup -NoSHMBackup -tpip=255 -na=1024 -connections=1024 -transactions=2768 -sendIK -NoDiameter"    
${UPDATE_PCSCF_CMD_1}    pcs resource update pcscf cmd="/home/omni/bin/pcscf64 -i5 -noRegEvent -noV1compat -NoIpcBackup -NoSHMBackup -tpip=255 -na=1024 -connections=1024 -transactions=2768 -sendIK"    


#Login_Logout
${LOGIN_BUTTON}         xpath=//button[@name="btnLogin"]
${LOGOUT_BUTTON}        xpath=//*[@id='container']/header/nav/div/span/a/i

#${LOGIN_SUBMIT_BUTTON} =  name=btnLogin
${LOG_FILE}    /home/httpd/Cirpack_web_admin/app/conf/CirpackWeb.cfg

${options} =    
...    add_argument("--ignore-certificate-errors");
...    add_argument("log-level=3");
...    add_argument("enable-automation");
...    add_argument("--no-sandbox");
...    add_argument("window-size=1920,1080");
...    add_argument("--disable-gpu");
...    add_argument("--page-load-strategy=EAGER");
...    add_argument("--dns-prefetch-disable");
...    add_argument("disable-features=NetworkService"); 
...    add_argument("--disable-extensions");
...    binary_location("C:\\Extra\\chrome-v123\\chrome.exe")    
#...    binary_location("C:\\Extra\\firefox\\Firefox Installer.exe")        

*** Keywords ***
Begin Web Test
    ${Mode} =    Run Keyword And Return Status    Should Contain    ${DATA_DIRECTORY}    ${HEADLESS_FOLDER}
    ${BROWSER} =     Set Variable If    ${Mode}    headlesschrome    Chrome
 #   ${BROWSER} =     Set Variable If    ${Mode}    headlessfirefox    Firefox
    Open Browser  ${BASE_URL}  ${BROWSER}  options=${options}
    Sleep       1s

End Web Test
    Close All Browsers

Verify Page Contains Error Message
    [Arguments]  ${Error_Message}
    Page Should Contain         ${Error_Message}
 
Verify Page Contains 5 Expected Elements
    [Arguments]  ${First}  ${Second}     ${Third}   ${Forth}   ${Fifth}
    Sleep       1s
    Page Should Contain Element         xpath=//label[@for='file_']//following-sibling::input[@value="${First}"]
    Page Should Contain Element         xpath=//label[@for='filtering']//following-sibling::input[@value="${Second}"]
    Page Should Contain Element         xpath=//label[@for='domain']//following-sibling::input[@value="${Third}"]
    Page Should Contain Element         xpath=//label[@for='routing']//following-sibling::input[@value="${Forth}"]
    Page Should Contain Element         xpath=//label[@for='use_request_uri']//following-sibling::input[@value="${Fifth}"]

Verify Page Contains 1 Expected Elements 64
    [Arguments]  ${First}
    Sleep       1s
    Page Should Contain Element         xpath=//td[contains(text(),'${First}')]

Verify Page Contains 1 Expected Elements
    [Arguments]  ${First}
    Sleep       1s
    Page Should Contain Element         xpath=//td[contains(.,"${First}")]

Verify Page Contains 2 Expected Elements
    [Arguments]  ${First}      ${Second}
    Sleep       2s
    Page Should Contain Element         xpath=//td[normalize-space()="${First}"]/following-sibling::td[contains(.,'${Second}')]

Verify Page Contains 2 Expected Elements Registered
    [Arguments]  ${First}      ${Second}
    Sleep       1s
    Page Should Contain Element         xpath=//label[contains(.,"${First}")]/following-sibling::input[@value="${Second}"]

Verify Page Contains 2 Expected Elements Registered MainIPID
    [Arguments]  ${First}      ${Second}
    Sleep       1s
    Page Should Contain Element         xpath=//label[contains(.,"${First}")]/following-sibling::input[@value='${Second}']
	
Verify Page Contains 2 Expected Elements Pnum
    [Arguments]  ${First}      ${Second}
    Sleep       1s
    Page Should Contain Element         xpath=//div[contains(.,"${First}")]/following-sibling::div[contains(.,"${Second}")]

Verify Page Contains 2 Expected Elements LocalArea
    [Arguments]  ${First}      ${Second}
    Sleep       1s
    Page Should Contain Element         xpath=//td[contains(.,"${First}")]/following::td[contains(.,"${Second}")]

Verify Page Contains 2 Expected Elements DNS
    [Arguments]  ${First}      ${Second}
    Sleep       1s
    Page Should Contain Element         xpath=//label[contains(.,"${First}")]/following-sibling::input[@value="${Second}"]
	
Verify Page Contains 2 Expected Elements IP_NATed
    [Arguments]  ${First}      ${Second}
    Sleep       1s
    Page Should Contain Element         xpath=//td[contains(text(),'${First}')]/following-sibling::td[contains(text(),'${Second}')]

Verify Page Not Contains 1 Expect Elements
    [Arguments]  ${First}
    Sleep       1s
    Page Should Not Contain Element     xpath=//td[contains(.,"${First}")]

Verify Page Not Contains 2 Expect Elements
    [Arguments]  ${First}      ${Second}
    Sleep       1s
    Page Should Not Contain Element     xpath=//td[normalize-space(text()) = '${First}']/following-sibling::td[contains(.,"${Second}")]

Verify Page Not Contains 4 Expect Elements
    [Arguments]  ${First}      ${Second}      ${Third}  ${Forth}
    Sleep       1s
    Page Should Not Contain Element     xpath=//td[contains(.,"${First}")]/following-sibling::td[contains(.,"${Second}")]/following-sibling::td[contains(.,"${Third}")]/following-sibling::td[contains(.,"${Forth}")]

Verify Page Not Contains 3 Expect Elements
    [Arguments]  ${First}      ${Second}      ${Third}
    Sleep       1s
    Page Should Not Contain Element     xpath=//td[normalize-space()="${First}"]/following-sibling::td[contains(.,"${Second}")]/following-sibling::td[contains(.,"${Third}")]

Verify Page Contains 3 Expected Elements
    [Arguments]  ${First}      ${Second}     ${Third}
    Sleep       1s
    Page Should Contain Element         xpath=//td[normalize-space()="${First}"]/following-sibling::td[contains(.,"${Second}")]/following-sibling::td[contains(.,"${Third}")]

Verify Page Contains 3 Expected Elements PeerGroup
    [Arguments]  ${First}      ${Second}     ${Third}
    Sleep       1s
    Page Should Contain Element         xpath=//td[contains(.,"${First}")]/following::td[contains(.,"${Second}")]/following-sibling::td[contains(.,"${Third}")]

Verify Page Contains 4 Expected Elements
    [Arguments]  ${First}      ${Second}     ${Third}   ${Forth}
    Sleep       2s
    Page Should Contain Element         xpath=//td[contains(.,"${First}")]/following-sibling::td[contains(.,"${Second}")]/following-sibling::td[contains(.,"${Third}")]/following-sibling::td[contains(.,"${Forth}")]

Verify Page Contains 2 Expected Elements with 3 domains
    [Arguments]  ${First}      ${Second}     ${Third}   ${Forth}
    Sleep       1s
    Page Should Contain Element         xpath=//td[contains(.,"${First}")]/following-sibling::td[contains(.,"${Second}") and contains(.,"${Third}") and contains(.,"${Forth}")]

Verify Page Not Contains 3 Expected Elements
    [Arguments]  ${First}      ${Second}     ${Third}
    Sleep       1s
    Page Should Not Contain Element     xpath=//td[contains(.,"${First}")]/following-sibling::td[contains(.,"${Second}")]/following-sibling::td[contains(.,"${Third}")]

Verify Page Not Contains 1 Expected Elements
    [Arguments]  ${First}
    Sleep       1s
    Page Should Not Contain Element     xpath=//td[contains(.,"${First}")]

Verify Page Not Contains 2 Expected Elements
    [Arguments]  ${First}      ${Second}
    Sleep       1s
    Page Should Not Contain Element     xpath=//td[contains(.,"${First}")]/following-sibling::td[contains(.,"${Second}")]

Verify Page Contains 2 Expected Info
    [Arguments]     ${First}   ${Second}
    Page Should Contain     ${First}
    Page Should Contain     ${second}

Verify Page Contains 3 Expected Info
    [Arguments]     ${First}   ${Second}     ${Third}
    Page Should Contain     ${First}
    Page Should Contain     ${second}
    Page Should Contain     ${Third}

Filter 2 value User Manager
    [Arguments]  ${First}      ${Second}
    Reload Page
    Sleep       2s
    Click Element        ${Filter_Button}
    Sleep       3s

    Filter value       ${Filter_First_Value}   ${First}
    Verify Page Contains 2 Expected Elements       ${First}      ${Second}

    Filter value      ${Filter_Third_Value}   ${Second}
    Verify Page Contains 2 Expected Elements       ${First}      ${Second}

    Click Element  ${Cancel_Filter}
    Sleep       2s


Filter 1 value
    [Arguments]  ${First}
    Reload Page
    Sleep       2s
    Click Element        ${Filter_Button}
    Sleep  3.5s

    Filter value       ${Filter_First_Value}   ${First}
    Verify Page Contains 1 Expected Elements       ${First}

Filter 2 value
    [Arguments]  ${First}      ${Second}
    Reload Page
    Sleep       2s
    Click Element        ${Filter_Button}
    Sleep       3s

    Filter value       ${Filter_First_Value}   ${First}
    Verify Page Contains 2 Expected Elements       ${First}      ${Second}

    Filter value       ${Filter_Second_Value}   ${Second}
    Verify Page Contains 2 Expected Elements       ${First}      ${Second}

    Click Element  ${Cancel_Filter}
    Sleep       2s

Filter 2 value local area
    [Arguments]  ${First}      ${Second}  ${Third}        ${Forth}
    Reload Page
    Sleep       2s
    Click Element        ${Filter_Button}
    Sleep       3s

    Filter value       ${Filter_First_Value}   ${First}
    Verify Page Contains 2 Expected Elements LocalArea      ${Third}        ${Forth}

    Filter value       ${Filter_Second_Value}   ${Second}
    Verify Page Contains 2 Expected Elements LocalArea      ${Third}        ${Forth}

    Click Element  ${Cancel_Filter}
    Sleep       2s

Filter 3 value
    [Arguments]  ${First}      ${Second}        ${Third}
    Reload Page
    Sleep       2s
    Click Element        ${Filter_Button}
    Sleep       3s
    
    Filter value       ${Filter_First_Value}    ${First}
    Verify Page Contains 3 Expected Elements    ${First}      ${Second}        ${Third}

    Filter value       ${Filter_Second_Value}   ${Second}
    Verify Page Contains 3 Expected Elements       ${First}      ${Second}        ${Third}

    Filter value       ${Filter_Third_Value}    ${Third}
    Verify Page Contains 3 Expected Elements       ${First}      ${Second}        ${Third}

    Click Element  ${Cancel_Filter}
    Sleep       2s

Filter 4 value
    [Arguments]  ${First}      ${Second}        ${Third}        ${Forth}
    Reload Page
    Sleep       2s
    Click Element        ${Filter_Button}
    Sleep       3s

    Filter value       ${Filter_First_Value}    ${First}
    Verify Page Contains 4 Expected Elements    ${First}  ${Second}      ${Third}     ${Forth}

    Filter value       ${Filter_Second_Value}   ${Second}
    Verify Page Contains 4 Expected Elements    ${First}  ${Second}      ${Third}     ${Forth}

    Filter value       ${Filter_Third_Value}    ${Third}
    Verify Page Contains 4 Expected Elements    ${First}  ${Second}      ${Third}     ${Forth}

    Filter value       ${Filter_Forth_Value}    ${Forth}
    Verify Page Contains 4 Expected Elements     ${First}  ${Second}      ${Third}     ${Forth}

    Click Element  ${Cancel_Filter}
    Sleep       2s

Filter special character value
    [Arguments]  ${First}      ${Second}        ${Third}        ${Forth}
    Reload Page
    Sleep       2s
    Click Element        ${Filter_Button}
    Sleep       3s

    Filter value       ${Filter_First_Value}    ${First}
    Verify Page Not Contains 3 Expected Elements    ${Second}      ${Third}     ${Forth}


    
Filter special character 1 value
    [Arguments]  ${First}      ${Second}        ${Third}
    Reload Page
    Sleep       2s
    Click Element        ${Filter_Button}
    Sleep       3s

    Filter value       ${Filter_First_Value}    ${First}
    Verify Page Not Contains 2 Expected Elements    ${Second}      ${Third}

Filter special character 2 value
    [Arguments]  ${First}      ${Second}        ${Third}   ${Forth}
    Reload Page
    Sleep       2s
    Click Element        ${Filter_Button}
    Sleep       3s

    Filter value       ${Filter_First_Value}    ${First}
    Verify Page Not Contains 2 Expected Elements    ${Third}      ${Forth}

    Filter value       ${Filter_Second_Value}    ${Second}
    Verify Page Not Contains 2 Expected Elements    ${Third}      ${Forth}



Filter special character 3 value
    [Arguments]  ${First}      ${Second}        ${Third}   ${Forth}  ${Fifth}
    Reload Page
    Sleep       2s
    Click Element        ${Filter_Button}
    Sleep       3s
    Filter value       ${Filter_First_Value}    ${First}
    Verify Page Not Contains 2 Expected Elements    ${Forth}      ${Fifth}

    Filter value       ${Filter_Second_Value}    ${Second}
    Verify Page Not Contains 2 Expected Elements    ${Forth}      ${Fifth}

    Filter value       ${Filter_Third_Value}    ${Third}
    Verify Page Not Contains 2 Expected Elements    ${Forth}      ${Fifth}

Filter special character 4 value
    [Arguments]  ${First}   ${Second}   ${Third}   ${Forth}  ${Fifth}  ${Sixth}
    Reload Page
    Sleep       2s
    Click Element        ${Filter_Button}
    Sleep       3s

    Filter value       ${Filter_First_Value}    ${First}
    Verify Page Not Contains 2 Expected Elements    ${Fifth}  ${Sixth}

    Filter value       ${Filter_Second_Value}    ${Second}
    Verify Page Not Contains 2 Expected Elements    ${Fifth}  ${Sixth}

    Filter value       ${Filter_Third_Value}    ${Third}
    Verify Page Not Contains 2 Expected Elements    ${Fifth}  ${Sixth}

    Filter value       ${Filter_Forth_Value}    ${Forth}
    Verify Page Not Contains 2 Expected Elements    ${Fifth}  ${Sixth}


Filter value
    [Arguments]  ${By}  ${Info}
    Click Element       ${Filter_DropDown}
    Sleep  4s
    Click Element       ${By}
    Sleep       3s
    Input Text          ${Input_Filter}       ${Info}
    Sleep       3s
    Click Element       ${Confirm_Filter}
    Sleep       3s

Click Display Password For Login Page
    [Arguments]    ${click_count}
    FOR    ${index}    IN RANGE    ${click_count}
         Click Element    //*[@id='togglePassword']
    END

Click Display Password For User Manager Page
    [Arguments]    ${click_count}
    FOR    ${index}    IN RANGE    ${click_count}
         Click Element    //*[@id='togglePassword']
         Click Element    //*[@id='toggleConfirmPassword']
    END

Click Display Password For Update Password Page
    [Arguments]    ${click_count}
    FOR    ${index}    IN RANGE    ${click_count}
         Click Element    //*[@id='togglePassword']
         Click Element    //*[@id='toggleConfirmPassword']
    END

Click Display Password For User Preference Page
    [Arguments]    ${click_count}
    FOR    ${index}    IN RANGE    ${click_count}
         Click Element    //*[@id='toggleOldPassword']
         Click Element    //*[@id='togglePassword']
         Click Element    //*[@id='toggleConfirmPassword']
#Page login
    END

TogglePassword 1
    Page Should Contain Element       //*[@id='togglePassword']
#Page manager user
TogglePassword 2
    Page Should Contain Element       //*[@id='togglePassword']
    Page Should Contain Element       //*[@id='toggleConfirmPassword']
#Page preference user
TogglePassword 3
    Page Should Contain Element       //*[@id='toggleOldPassword']
    Page Should Contain Element       //*[@id='togglePassword']
    Page Should Contain Element       //*[@id='toggleConfirmPassword']

Log out
    Click Element  ${LOGOUT_BUTTON}
    Wait Until Page Does Not Contain Element    ${LOGOUT_BUTTON}    10s
#    Title Should Be  Login Page
    Page Should Contain   CIRPACK Web Admin
    
Sort Element
    [Arguments]  ${By}
    IF    '${By}' == 'IP'                         Click Element         ${Sort_IP}

    IF    '${By}' == 'Name'                       Click Element         ${Sort_Name}
    IF    '${By}' == 'UserName'                   Click Element         ${Sort_UserName}

    IF    '${By}' == 'Domain'                     Click Element         ${Sort_Domain}

    IF    '${By}' == 'Type'                       Click Element         ${Sort_Type}

    IF    '${By}' == 'Matching rule name'         Click Element         ${Sort_Matching_Name}

    IF    '${By}' == 'Header name'                Click Element         ${Sort_Header}

    IF    '${By}' == 'Manipulation rule name'     Click Element         ${Sort_Mani_Name}
    IF    '${By}' == 'Policy'                     Click Element         ${Sort_Policy}

    IF    '${By}' == 'Method type'                Click Element         ${Sort_Method}

    IF    '${By}' == 'Index'                      Click Element         ${Sort_Index}
   
    IF    '${By}' == 'Default authorization'      Click Element         ${Sort_Default_Authorization}
    IF    '${By}' == 'Default routing'            Click Element         ${Sort_Default_Routing}

    IF    '${By}' == 'SIP manipulation rule'      Click Element         ${Sort_SIP_Manipulation}

    IF    '${By}' == 'Processing order'           Click Element         ${Sort_Processing_Order}

    IF    '${By}' == 'Media type'                 Click Element         ${Sort_Media_Type}

    IF    '${By}' == 'ID'                         Click Element         ${Sort_ID}
    IF    '${By}' == 'Session Expire'             Click Element         ${Sort_Session_Expire}

    IF    '${By}' == 'DTMF Handling'              Click Element         ${Sort_DTMF_Handling}

    IF    '${By}' == 'Transrating'                Click Element         ${Sort_Transrating}

    IF    '${By}' == 'Peer'                       Click Element         ${Sort_Peer}
   
    IF    '${By}' == 'UA profile'                 Click Element         ${Sort_UA}

    IF    '${By}' == 'Object'                     Click Element         ${Sort_Object}
    IF    '${By}' == 'Event'                      Click Element         ${Sort_Event}

    IF    '${By}' == 'Local area prefix'          Click Element         ${Sort_Prefix}

    IF    '${By}' == 'FQDN'                       Click Element         ${Sort_FQDN}
    IF    '${By}' == 'Protocol'                   Click Element         ${Sort_Protocol}
    IF    '${By}' == 'Data Reference'             Click Element         ${Sort_Data}
    IF    '${By}' == 'Service Indication'         Click Element         ${Sort_Service}
    IF    '${By}' == 'Max Size'                   Click Element         ${Sort_Max}
    IF    '${By}' == 'Peer Name'                  Click Element         ${Sort_PeerName}
    IF    '${By}' == 'Priority'                   Click Element         ${Sort_Priority}
    IF    '${By}' == 'Protected Server Port'      Click Element         ${Sort_Protected Server Port}
    IF    '${By}' == 'Protected Server Port'      Click Element         ${Sort_Protected Server Port}
    Sleep       3s

Add 2 Domains to Peer
    [Arguments]   ${Domain1}     ${Domain2}
    Click Element       ${Add_Domain}
    Run Keyword If  '${Domain1}' != '#BLANK'    Input Text       ${Multi_Domain_Field1}              ${Domain1}
    Sleep       1s
    Click Element       ${Add_Domain}
    Run Keyword If  '${Domain2}' != '#BLANK'    Input Text       ${Multi_Domain_Field2}              ${Domain2}
    Sleep       1s

Delete with 1 info  
    [Arguments]  ${First}
    Click Delete Element With 1 Info    ${First}
    Sleep  7s
    Click Element       ${Cancel_Del}
    Sleep       3s
    Click Delete Element With 1 Info    ${First}
    Sleep  7s
    Click Element       ${Confirm_Del}
    Sleep       3s
    Reload Page

Delete with 1 info Local_area 
    [Arguments]  ${First}
    Click Delete Element With 1 Info Local_area     ${First}
    Sleep  7s
    Click Element       ${Cancel_Del}
    Sleep       3s
    Click Delete Element With 1 Info Local_area     ${First}
    Sleep  7s
    Click Element       ${Confirm_Del}
    Sleep       3s
    Reload Page

Delete with 2 info
    [Arguments]  ${First}      ${Second}
    Click Delete Element With 2 Info    ${First}      ${Second}
    Sleep  7s
    Click Element       ${Cancel_Del}
    Sleep       2s
    Click Delete Element With 2 Info    ${First}      ${Second}
    Sleep  7s
    Click Element       ${Confirm_Del}
    Sleep       2s
    Reload Page

Delete with 1 info for Media
    [Arguments]  ${First}
    Click Delete Element With 1 Info    ${First}
    Sleep  15s
    Click Element       ${Cancel_Del}
    Sleep       2s
    Click Delete Element With 1 Info    ${First}
    Sleep  15s
    Click Element       ${Confirm_Del}
    Sleep       2s
    Reload Page

Delete with 3 info
    [Arguments]  ${First}      ${Second}        ${Third}
    Click Delete Element With 3 Info    ${First}      ${Second}        ${Third}
    Sleep  7s
    Click Element       ${Cancel_Del}
    Sleep       2s
    Click Delete Element With 3 Info    ${First}      ${Second}        ${Third}
    Sleep  7s
    Click Element       ${Confirm_Del}
    Sleep       2s
    Reload Page

Click Edit Element With 3 Info
    [Arguments]  ${First}      ${Second}        ${Third}
    Click Element       xpath=//td[contains(.,"${First}")]/following-sibling::td[contains(.,"${Second}")]/following-sibling::td[contains(.,"${Third}")]/following-sibling::td[last()]//i[contains(text(),'edit')]

Click Edit Element With 4 Info
    [Arguments]  ${First}      ${Second}        ${Third}        ${Forth}
    Click Element       xpath=//td[contains(.,"${First}")]/following-sibling::td[contains(.,"${Second}")]/following-sibling::td[contains(.,"${Third}")]/following-sibling::td[last()]//i[contains(text(),'edit')]/following-sibling::td[contains(.,"${Forth}")]/following-sibling::td[last()]//i[contains(text(),'edit')]

Click Delete Element With 3 Info
    [Arguments]  ${First}      ${Second}        ${Third}
    Click Element       xpath=//td[contains(.,"${First}")]/following-sibling::td[contains(.,"${Second}")]/following-sibling::td[contains(.,"${Third}")]/following-sibling::td[last()]//i[contains(text(),'delete')]

Click View Element With 3 Info
    [Arguments]  ${First}      ${Second}        ${Third}
    Click Element       xpath=//td[contains(.,"${First}")]/following-sibling::td[contains(.,"${Second}")]/following-sibling::td[contains(.,"${Third}")]/following-sibling::td[last()]//i[contains(text(),'info')]

Click View Element With 2 Info
    [Arguments]  ${First}      ${Second}
    Click Element       xpath=//td[normalize-space()="${First}"]/following-sibling::td[contains(.,"${Second}")]/following-sibling::td[last()]//i[contains(text(),'info')]

Click View Element With 1 Info
    [Arguments]  ${First}
    Click Element       xpath=//td[normalize-space()="${First}"]/following-sibling::td[last()]//i[contains(text(),'info')]

Click Edit Element With 1 Info
    [Arguments]  ${First}
    Click Element       xpath=//td[contains(.,"${First}")]//following-sibling::td[last()]//i[contains(text(),'edit')]

Click Edit Element With 2 Info
    [Arguments]  ${First}      ${Second}
    Click Element       xpath=//td[contains(.,"${First}")]/following-sibling::td[contains(.,"${Second}")]/following-sibling::td[last()]//i[contains(text(),'edit')]

Click Edit Element With 2 Info LocalArea
    [Arguments]  ${First}      ${Second}
    Click Element       xpath=//td[contains(.,"${First}")]/following-sibling::td[contains(.,"${Second}")]//i[contains(text(),'edit')]

Click Delete Element With 2 Info
    [Arguments]  ${First}      ${Second}
    Click Element       xpath=//td[normalize-space(text())='${First}']/following-sibling::td[contains(.,"${Second}")]/following-sibling::td[last()]//i[contains(text(),'delete')]

Click Delete Element With 1 Info
    [Arguments]  ${First}
    Click Element       xpath=//td[normalize-space()="${First}"]/following-sibling::td[last()]//i[contains(text(),'delete')]

Click Delete Element With 1 Info Local_area 
    [Arguments]  ${First}
    # Click Element       xpath=//td[normalize-space()='"${First}"']/following-sibling::td[last()]//i[contains(text(),'delete')]
    Click Element       xpath=//tr[@class="odd-row"]/td[contains(text(), '\+85')]/following-sibling::td[@class="last"]//a[@data-tooltip="Delete"]/i[contains(@class, 'delete-i')]

Click Detach Element with 2 Info
    [Arguments]  ${First}  ${Second}
    Click Element       xpath=//td[contains(.,"${First}")]/following-sibling::td[contains(.,"${Second}")]//following-sibling::td/a[1]/i[contains(text(),'delete')]

Click Close Error Panel
    Click Element       xpath=//a[contains(text(),'Close')]

Session Backup
    [Arguments]  ${Action}

    Run Keyword If  '${Action}' == 'Drop'               Click Element   ${Drop_SessionBackup}
    ...   ELSE IF   '${Action}' == 'Clean'              Click Element   ${Clean_SessionBackup}
    ...   ELSE IF   '${Action}' == 'Reset On Standby'   Click Element   ${Reset_SessionBackup}
    Sleep       1s

Back from View Page
    Click Element       ${Cancel_View}
    Sleep       2s


Get Remote RPM
    [Arguments]   ${SSH_HOST}   ${SSH_USERNAME}     ${SSH_PASSWORD}   ${RPM_NAME}

    Open Connection   ${SSH_HOST}
    Login   ${SSH_USERNAME}   ${SSH_PASSWORD}
    ${RPM_REVISION}=   Execute Command   ${RPM_NAME}
    Close All Connections
    Log    ${RPM_REVISION}
    RETURN  ${RPM_REVISION}

Send Notification Email
    [Arguments]   ${EMAIL_SUBJECT}    ${LOG_HTML}   ${REPORT_HTML}   ${OUTPUT_DIR}  ${MODE}

    ${TOTAL}    ${PASS}    ${FAIL}   ${VALIDATIONFILES}  ${DURATION} =    Send Count TCs   ${OUTPUT_DIR}
    #log    ${EMAIL_SENDER} + ${EMAIL_PWD} + ${EMAIL_RECEIVER}
    send mail with attachment    ${EMAIL_SENDER}   ${EMAIL_PWD}    ${EMAIL_RECEIVER}   ${EMAIL_SUBJECT}    ${EMAIL_CONTENT}   ${TOTAL}    ${PASS}    ${FAIL}   ${VALIDATIONFILES}   ${DURATION}   ${EMAIL_CONTENT2}    ${LOG_HTML}   ${REPORT_HTML}  ${MODE}

Send Notification Email for SBC
    ${WEB_SBC_RPM_REVISION}=   Get Remote RPM   ${IP_WEB_SBC}   ${WEB_SSH_USERNAME}   ${WEB_SSH_PASSWORD}   ${WEB_SBC_RPM_REVISION}
    ${SUBJECT_WEB_SBC} =   set variable   [ SBC WEB TRUNK] AUTO NON REG TEST - RPM REVISION ${WEB_SBC_RPM_REVISION}
    Log    ${SUBJECT_WEB_SBC}
    Send Notification Email    ${SUBJECT_WEB_SBC}    result/log.html   result/report.html  result/output.xml  SBC_WEB


Send Count TCs
    [Arguments]   ${OUTPUT_DIR}

    ${value}    ${value2}   ${value3}  ${value4}  ${value5} =   count_test_cases   ${OUTPUT_DIR}
    RETURN    ${value}    ${value2}   ${value3}   ${value4}  ${value5}
	
Register By SIPP
    [Arguments]   ${DESTINATION_IP_PORT}   ${XML_REGISTER}   ${CSV_FILE}    ${SIPP_PORT}
    Common.Open SSH Connection To Remote Server  ${SIPP}   ${USER_SIPP}    ${PASS_SIPP}
    #Execute Command  killall sipp
    ${output}=   Execute Command  sipp -sf ${SIPP_XML_FD}/${XML_REGISTER} ${DESTINATION_IP_PORT} -aa -inf ${SIPP_CSV_FD}/${CSV_FILE} -i ${SIPP_IP} -p ${SIPP_PORT} -trace_err -trace_msg -trace_screen -m 1     timeout=120s
    Log     ${output}
    Close All Connections

Open SSH Connection To Remote Server
    [Arguments]  ${HOST}  ${USER_NAME}  ${PSW}
    Open Connection   ${HOST}
    Login   ${USER_NAME}   ${PSW}


Cluster lab Node1 Active and Node2 Standby
    Execute Command    pcs node standby node1
    Sleep  10s
    Execute Command    Sleep  20s
    Sleep  10s
    Execute Command    pcs node standby node2
    Sleep  10s
    Execute Command    Sleep  20s
    Sleep  10s
    Execute Command    pcs node unstandby node1
    Sleep  10s
    Execute Command    Sleep  20s
    Sleep  10s
    Execute Command    pcs node unstandby node2
    Sleep  10s
    Execute Command    Sleep  20s
    Sleep  10s

Cluster lab Node1 Standby and Node2 Active
    Execute Command    pcs node standby node1
    Sleep  10s
    Execute Command    Sleep  20s
    Sleep  10s
    Execute Command    pcs node standby node2
    Sleep  10s
    Execute Command    Sleep  20s
    Sleep  10s
    Execute Command    pcs node unstandby node2
    Sleep  10s
    Execute Command    Sleep  20s
    Sleep  10s
    Execute Command    pcs node unstandby node1
    Sleep  10s
    Execute Command    Sleep  20s


Cluster lab Node1 Active and Node2 Inactive
    Execute Command    pcs node standby node1
    Sleep  10s
    Execute Command    Sleep  20s
    Sleep  10s
    Execute Command    pcs node standby node2
    Sleep  10s
    Execute Command    Sleep  20s
    Sleep  10s
    Execute Command    pcs node unstandby node1
    Sleep  10s
    Execute Command    Sleep  20s

Cluster lab Node1 Inactive and Node2 Active
    Execute Command    pcs node standby node1
    Sleep  10s
    Execute Command    Sleep  20s
    Sleep  10s
    Execute Command    pcs node standby node2
    Sleep  10s
    Execute Command    Sleep  20s
    Sleep  10s
    Execute Command    pcs node unstandby node2
    Sleep  10s
    Execute Command    Sleep  20s

Cluster lab Node1 Inactive and Node2 Inactive
    Execute Command    pcs node standby node1
    Sleep  10s
    Execute Command    Sleep  20s
    Sleep  10s
    Execute Command    pcs node standby node2
    Sleep  10s
    Execute Command    Sleep  20s
    Sleep  10s

Cirpack Web Node1 Active and No Node2
    Execute Command    pcs node standby
    Execute Command    Sleep  20s
    Execute Command    pcs node unstandby
    Execute Command    Sleep  20s

Cirpack Web Node1 Inactive and No Node2
    Execute Command    pcs node standby
    Execute Command    Sleep  20s




############################################################################################################################
Change The Owner File To Omni
    [Arguments]   ${HOST}
    Common.Open SSH Connection To Remote Server   ${HOST}    ${USER_SIPP}    ${PASS_SIPP}
    Execute Command    chown omni:exploit /home/etc/ibcf.cfg
    Execute Command    chmod 664 /home/etc/ibcf.cfg
    Execute Command    chown omni:exploit /home/etc/pcscf.cfg
    Execute Command    chmod 664 /home/etc/pcscf.cfg
    Execute Command    chown omni:exploit /home/etc/bgcf.cfg
    Execute Command    chmod 664 /home/etc/bgcf.cfg
    Execute Command    chown omni:exploit /home/etc/hss.cfg
    Execute Command    chmod 664 /home/etc/hss.cfg
    Execute Command    chown omni:exploit /home/etc/icscf.cfg
    Execute Command    chmod 664 /home/etc/icscf.cfg
    Execute Command    chown omni:exploit /home/etc/icscf_dyn.cfg
    Execute Command    chmod 664 /home/etc/icscf_dyn.cfg
    Execute Command    chown omni:exploit /home/etc/scscf.cfg
    Execute Command    chmod 664 /home/etc/scscf.cfg
    Execute Command    chown omni:exploit /home/etc/hss_diameter.cfg
    Execute Command    chmod 664 /home/etc/hss_diameter.cfg
    Execute Command    chown omni:exploit /home/etc/1_test_config_file_omni.cfg
    Close All Connections

Change The Owner File To Root
   [Arguments]   ${HOST}
    Common.Open SSH Connection To Remote Server   ${HOST}     ${USER_SIPP}    ${PASS_SIPP}
    Execute Command    chown root:root /home/etc/2_test_config_file_root.cfg
    Execute Command    chmod 664 /home/etc/2_test_config_file_root.cfg
    Execute Command    chown root:root /home/etc/bgcf.cfg
    Execute Command    chmod 664 /home/etc/bgcf.cfg
    Execute Command    chown root:root /home/etc/hss.cfg
    Execute Command    chmod 664 /home/etc/hss.cfg
    Execute Command    chown root:root /home/etc/pcscf.cfg
    Execute Command    chmod 664 /home/etc/pcscf.cfg
    Close All Connections

Remove Configuration File In /home/etc
   [Arguments]   ${HOST}
   Common.Open SSH Connection To Remote Server   ${HOST}   ${USER_SIPP}    ${PASS_SIPP}
   Execute Command     rm -f /home/etc/1_test_config_file_omni.cfg
   Execute Command     rm -f /home/etc/2_test_config_file_root.cfg
   Execute Command     rm -f /home/etc/Dpanh
   Execute Command     rm -f /home/etc/Dpanh.cfg
   Close All Connections

Verify Page Contains Error Message Has Special Character
    [Arguments]   ${First}   ${Second}
    ${Pattern} =  Set Variable    This value <${Second}> is contain characters not allowed.
    Should Match Regexp    ${First}    ${Pattern}


############################### LOG ###############################
Tail CWA Log In Remote Machine
    #Tail WS log in remote web machine
    ${LOG_SUFFIX_PID}=   Execute Command  /home/omni/bin/tail_log_cwa.sh
    Log   web services file named "/tmp/cirpack_web_admin_log_xxx.log" and pid: ${LOG_SUFFIX_PID}
    RETURN  ${LOG_SUFFIX_PID}

Stop And Validate CWA Log In Remote Machine
    [Arguments]  ${LOG_SUFFIX_PID}  ${EXPECTED_SBC_LOG}
    #Stop log WS log and Display WS log and verify the logs if need
    ${SBC_Log}=   Execute Command  /home/omni/bin/stop_log_cwa.sh ${LOG_SUFFIX_PID}
    Log    ${SBC_Log}
    Verify more log  ${SBC_Log}      ${EXPECTED_SBC_LOG}


Create tail_log_cwa.sh
    Common.Open SSH Connection To Remote Server   ${IP_WEB_SBC}   ${WEB_SSH_USERNAME}    ${WEB_SSH_PASSWORD}
    ${Path_Of_Config_Tail_Log}    Set Variable      /home/omni/bin/tail_log_cwa.sh
    ${script_content}=    Catenate
    ...    #!/bin/sh
    ...    DATE=\`date +'%Y%m%d%H%M%S'\`
    ...    nohup tail -n 0 -f /home/log/httpd/cirpack_web_admin_log > /tmp/cirpack_web_admin_log_\$DATE.log 2>&1 &
    ...    PID=\$!
    ...    echo \$DATE \$PID
    Execute Command    echo "${script_content}" > ${Path_Of_Config_Tail_Log}
    Execute Command    chown omni:exploit ${Path_Of_Config_Tail_Log} 
    Execute Command    chmod 755 ${Path_Of_Config_Tail_Log} 
    Close All Connections

Create stop_log_cwa.sh
    Common.Open SSH Connection To Remote Server   ${IP_WEB_SBC}   ${WEB_SSH_USERNAME}    ${WEB_SSH_PASSWORD}
    ${Path_Of_Config_Stop_Log}    Set Variable      /home/omni/bin/stop_log_cwa.sh 
    ${script_content}=    Catenate
    ...    #!/bin/sh
    ...    PID=\$(ps -ef | grep "tail -n 0 -f" | awk '{print \$2}' | tr '\n' ' ')
    ...    PID_LIST=(\${PID})
    ...    MAX_INDEX=\${#PID_LIST[*]}
    ...    for ((X=0; X < \$MAX_INDEX -1; X++))
    ...    do
    ...            KILL_PID="\${PID_LIST[\$X]}"
    ...            kill -15 \$KILL_PID
    ...            echo \$KILL_PID
    ...            wait \$KILL_PID 2>/dev/null
    ...    done
    ...    file_name=\$(ls -1rt /tmp/cirpack_web_admin_log_* | tail -n1)
    ...    echo \$file_name
    ...    cat \$file_name
    ...    #rm -f /tmp/cirpack_web_admin_log_*
    Execute Command    echo "${script_content}" > ${Path_Of_Config_Stop_Log}
    Execute Command    chown omni:exploit ${Path_Of_Config_Stop_Log} 
    Execute Command    chmod 755 ${Path_Of_Config_Stop_Log} 
    Close All Connections


Verify more log
    [Arguments]  ${output}  ${EXPECTED_WS_LOG}
    @{list_logs}=  split string  ${EXPECTED_WS_LOG}  \n
    FOR    ${List}  IN  @{list_logs}
       Run Keyword And Continue On Failure   should contain  ${output}  ${list}
    END

Run Keyword N Times And Stop If Success
    [Arguments]    ${KW_PASS}    ${ARGS_KW_PASS}    ${KW_FAIL}    ${ARGS_KW_FAIL}    ${N}
    Log    ${ARGS_KW_PASS}
    Log    ${ARGS_KW_FAIL}
    FOR    ${i}    IN RANGE    ${N}
        TRY
            Sleep    2s
            Run Keyword    ${KW_PASS}    @{ARGS_KW_PASS}
            RETURN
        EXCEPT
            Run Keyword    ${KW_FAIL}    ${ARGS_KW_FAIL}    # argument of KW Fail only Scalar variable
            Sleep    3s
        END     
    END
    Run Keyword And Continue On Failure    Fail    *HTML* <h1>Keyword failed after running ${N} times. Please check your data.</h1>

############################################################################################################################
Create file with Empty File
    Common.Open SSH Connection To Remote Server  ${IP_WEB_SBC}   ${WEB_SSH_USERNAME}    ${WEB_SSH_PASSWORD}
    ${File_Dpanh}    Set Variable    /home/etc/Dpanh.cfg      
    Execute Command    touch ${File_Dpanh}
    Execute Command    chown omni:exploit ${File_Dpanh} 
    Execute Command    chmod 664 ${File_Dpanh}

Create file with Empty Folder
    Common.Open SSH Connection To Remote Server  ${IP_WEB_SBC}   ${WEB_SSH_USERNAME}    ${WEB_SSH_PASSWORD}
    ${Folder_Dpanh}    Set Variable    /home/etc/Dpanh     
    Execute Command    mkdir ${Folder_Dpanh}
    Execute Command    chown omni:exploit ${Folder_Dpanh} 
    Execute Command    chmod 664 ${Folder_Dpanh}

Create file with permission Omni
    Common.Open SSH Connection To Remote Server  ${IP_WEB_SBC}   ${WEB_SSH_USERNAME}    ${WEB_SSH_PASSWORD}
    ${Path_Of_Config_File_Omni}    Set Variable      /home/etc/1_test_config_file_omni.cfg
    Execute Command    echo test.omni.tma.com.vn > ${Path_Of_Config_File_Omni}
    Execute Command    chown omni:exploit ${Path_Of_Config_File_Omni} 
    Execute Command    chmod 664 ${Path_Of_Config_File_Omni} 
    Close All Connections

Create file with permission Root
    Common.Open SSH Connection To Remote Server  ${IP_WEB_SBC}   ${WEB_SSH_USERNAME}    ${WEB_SSH_PASSWORD}
    ${Path_Of_Config_File_Root}    Set Variable      /home/etc/2_test_config_file_root.cfg
    Execute Command    echo test.root.tma.com.vn > ${Path_Of_Config_File_Root}
    Execute Command    chown root:root ${Path_Of_Config_File_Root} 
    Execute Command    chmod 664 ${Path_Of_Config_File_Root} 
    Close All Connections

Create file with permission Exploit
    Common.Open SSH Connection To Remote Server  ${IP_WEB_SBC}   ${WEB_SSH_USERNAME}    ${WEB_SSH_PASSWORD}
    ${Path_Of_Config_File_Exploit}    Set Variable      /home/etc/3_test_config_file_exploit.cfg
    Execute Command    echo test.exploit.tma.com.vn > ${Path_Of_Config_File_Exploit}
    Execute Command    chown exploit:exploit ${Path_Of_Config_File_Exploit} 
    Execute Command    chmod 664 ${Path_Of_Config_File_Exploit} 
    Close All Connections

Remote Cluster_Lab
    Common.Open SSH Connection To Remote Server  ${IP_WEB_SBC}   ${WEB_SSH_USERNAME}    ${WEB_SSH_PASSWORD}
    Execute Command    echo omni | /home/httpd/Cirpack_web_admin/install_server.sh install_remote 192.168.33.123


############################################################################################################################

Get Getenforce Restore DB
    Run Keyword If    '${TC_PRIORITY}' == 'MEDIUM' and '${Lab_Value}' == 'SBC_Normal'         Restore DB 7.6 Normal
    ...    ELSE IF    '${TC_PRIORITY}' == 'MEDIUM' and '${Lab_Value}' == 'SBC_Secure'         Restore DB Secure
    ...    ELSE IF    '${TC_PRIORITY}' == 'MEDIUM' and '${Lab_Value}' == 'SBC_7.5_Normal'     Restore DB 7.5 Normal
          
    
     
Get Getenforce Update Password
   Run Keyword If     '${TC_PRIORITY}' == 'MEDIUM' and '${Lab_Value}' == 'SBC_Normal'     Update Default Passwords Normal
    ...    ELSE IF    '${TC_PRIORITY}' == 'MEDIUM' and '${Lab_Value}' == 'SBC_Secure'     Update Default Passwords Secure



##################################### Config Log #####################################
Get Version Update Config Log
   Run Keyword If      '${Version_Log}' == 'Yes'     Modify CirpackWeb.cfg

Modify CirpackWeb.cfg
    Common.Open SSH Connection To Remote Server   ${IP_WEB_SBC}   ${WEB_SSH_USERNAME}    ${WEB_SSH_PASSWORD}
    Execute Command    sed -i "s/LEVEL = 'WARNING'/LEVEL = 'DEBUG'/g" ${LOG_FILE}
    Execute Command    sed -i "s/BACK_UP_COUNT = 7/BACK_UP_COUNT = 1/g" ${LOG_FILE}
    ${output}=    Execute Command    cat ${LOG_FILE}
    Log    ${output}
    Should Contain    ${output}    LEVEL = 'DEBUG'
    Should Contain    ${output}    BACK_UP_COUNT = 1
    Execute Command    systemctl restart httpd
    Close All Connections 

# Update Config And Restart Server
#     ${config_files}=    Set Variable    /home/httpd/Cirpack_web_admin/app/conf/CirpackWeb.cfg
#     Check And Replace Config    ${config_files}

# Check And Replace Config
#     [Arguments]    ${file_path}
#     Open SSH Connection To Remote Server    ${IP_WEB_SBC}    ${WEB_SSH_USERNAME}    ${WEB_SSH_PASSWORD}

#     ${content}=    Set Variable    "#Configuration for Flask APPLICATION\nSECRET_KEY = '/s\xff5\xd3Uz\xc1\x14\xf6\xf2\#NR\x0b0\x98V\x80H\xe5\x00\xec%'\nSQLALCHEMY_DATABASE_URI = 'sqlite:///conf/CirpackWebAdmin.db'\nSQLALCHEMY_TRACK_MODIFICATIONS = True\nTEMPLATES_AUTO_RELOAD = True\n\n# Configuration for internationalization\n# Default locale is en (English)\nBABEL_DEFAULT_LOCALE = 'en'\nLANGUAGES = {\n    'en': 'English',\n    'fr': 'France',\n    'de': 'German'\n}\n\n# Configuration for logger\nLEVEL = 'DEBUG'\nLOGGING_FORMAT = '%(asctime)s - %(levelname)s - %(message)s'\nLOG_FILE = 'cirpack_web_admin_log'\nBACK_UP_COUNT = 1\nRETENTION_DAYS = 1\n\n# Third-party authorization\n# Please refer to the documentation to add configurations for THIRD_PARTY_AUTH.\nTHIRD_PARTY_AUTH = {\n    \"keycloak 1\": {\n        \"name\": 'OIDC_33.61',\n        \"protocol\": 'OIDC',   \# OIDC/SAML\n        \"logo\": 'https://www.svgrepo.com/show/331455/keycloak.svg',\n        \"saml\": {},\n        \"oidc\": {\n            \"oidc_auth_uri\": 'https://192.168.33.61:8181/realms/cwa/protocol/openid-connect/auth',\n            \"oidc_token_uri\": 'https://192.168.33.61:8181/realms/cwa/protocol/openid-connect/token',\n            \"oidc_logout_uri\": 'https://192.168.33.61:8181/realms/cwa/protocol/openid-connect/logout',\n            \"issuer_uri\": 'https://192.168.33.61:8181/realms/cwa',\n            \"client_id\": 'OIDC_33.105',\n            \"client_secret\": '3WvREaxu7fauwES1j8rwKBGHeZVKWc52',\n            \"redirect_uri\": 'https://192.168.33.105:443/oidc/oidc_callback',\n        }\n    },\n\n    \"keycloak 2\": {\n        \"name\": 'SAML_33.61',\n        \"protocol\": 'SAML',   \# OIDC/SAML\n        \"logo\": 'https://www.svgrepo.com/show/331455/keycloak.svg',\n        \"saml\": {\n            \"entityid\": 'SAML_33.105',\n            \"cwa_base_url\": 'https://192.168.33.105:443',\n            \"idp_metadata\": '/home/httpd/33.61/idp.xml',\n            \"key_file\": '/home/httpd/33.61/saml2/saml2.key',\n            \"cert_file\": '/home/httpd/33.61/saml2/saml2.crt'\n        }\n    },\n\n    \"keycloak 3\": {\n        \"name\": 'OIDC_37.129',\n        \"protocol\": 'OIDC',   \# OIDC/SAML\n        \"logo\": 'https://www.svgrepo.com/show/331455/keycloak.svg',\n        \"oidc\": {\n            \"oidc_auth_uri\": 'https://192.168.37.129:8000/realms/cwa/protocol/openid-connect/auth',\n            \"oidc_token_uri\": 'https://192.168.37.129:8000/realms/cwa/protocol/openid-connect/token',\n            \"oidc_logout_uri\": 'https://192.168.37.129:8000/realms/cwa/protocol/openid-connect/logout',\n            \"issuer_uri\": 'https://192.168.37.129:8000/realms/cwa',\n            \"client_id\": 'OIDC_33.105',\n            \"client_secret\": 'EsQptOn7nKc2s8VNIb7fZV5eI46AGRpo',\n            \"redirect_uri\": 'https://192.168.33.105:443/oidc/oidc_callback',\n        }\n    },\n\n    \"keycloak 4\": {\n        \"name\": 'SAML_37.129',\n        \"protocol\": 'SAML',   \# OIDC/SAML\n        \"logo\": 'https://www.svgrepo.com/show/331455/keycloak.svg',\n        \"saml\": {\n            \"entityid\": 'SAML_33.105',\n            \"cwa_base_url\": 'https://192.168.33.105:443',\n            \"idp_metadata\": '/home/httpd/37.129/idp.xml',\n            \"key_file\": '/home/httpd/37.129/saml2/saml2.key',\n            \"cert_file\": '/home/httpd/37.129/saml2/saml2.crt'\n        }\n    }\n}"
#     Log  ${content}
#     # Create a temporary file and write content to it
#     Run Process    bash    -c    "printf '%s' '${content}' > /home/httpd/Cirpack_web_admin/app/conf/CirpackWeb.cfg"
    
#     # Move the temporary file to the desired location
#     Run Process    bash    -c    "mv /home/httpd/Cirpack_web_admin/app/conf/CirpackWeb.cfg ${file_path}"
    
#     Execute Command    systemctl restart httpd
#     Close All Connections





##################################### Restore DB #####################################
Restore DB 
    Execute Command    yes | cp -R /home/httpd/DB_CWA_Backup/{passwords,CirpackWebAdmin.db} /home/httpd/Cirpack_web_admin/app/{cirpack/admin/,conf/}
    Execute Command    rsync -r --delete /home/httpd/DB_CWA_Backup/passwords/ /home/httpd/Cirpack_web_admin/app/cirpack/admin/passwords

    Execute Command    rm -rf /home/httpd/Cirpack_web_admin/app/cirpack/admin/passwords/{User*,user*,dpanh*,admin1.txt}
    ${output}=    Execute Command    cd /home/httpd/Cirpack_web_admin/app/conf/ && sqlite3 CirpackWebAdmin.db "SELECT * FROM User; DELETE FROM User WHERE username IN ('User1', 'User2', 'User3', 'User4', 'User5', 'User6', 'User7', 'User8', 'User9', 'User13', 'User14', 'User15', 'User16', 'User17', 'User25', 'Dpanh');"
    Log    ${output}


Restore DB 7.5 Normal
    Common.Open SSH Connection To Remote Server  ${IP_WEB_SBC}   ${SSH_USER_ROOT}    ${SSH_PASS_ROOT}
    Restore DB 
    Execute Command    chmod 774 /home/httpd/Cirpack_web_admin/app/{conf/*,cirpack/admin/passwords/*.txt}
    Execute Command    chown -R nobody:exploit /home/httpd/Cirpack_web_admin/app/{conf/*,cirpack/admin/passwords}
    Close All Connections

Restore DB Secure 
    Common.Open SSH Connection To Remote Server  ${IP_WEB_SBC}   ${SSH_USER_EXPLOIT}    ${SSH_PASS_EXPLOIT}
    Restore DB 
    Execute Command    chmod 670 /home/httpd/Cirpack_web_admin/app/conf/*
    Execute Command    chown -R omni:exploit /home/httpd/Cirpack_web_admin/app/conf/*
    Execute Command    chmod 700 /home/httpd/Cirpack_web_admin/app/cirpack/admin/passwords/*.txt
    Execute Command    chown -R exploit:exploit /home/httpd/Cirpack_web_admin/app/cirpack/admin/passwords
    Close All Connections

Restore DB 7.6 Normal
    Common.Open SSH Connection To Remote Server  ${IP_WEB_SBC}   ${SSH_USER_ROOT}    ${SSH_PASS_ROOT}
    Restore DB 
    Execute Command    chmod 774 /home/httpd/Cirpack_web_admin/app/conf/*
    Execute Command    chown -R nobody:exploit /home/httpd/Cirpack_web_admin/app/conf/*
    Execute Command    chmod 700 /home/httpd/Cirpack_web_admin/app/cirpack/admin/passwords/*.txt
    Execute Command    chown -R exploit:exploit /home/httpd/Cirpack_web_admin/app/cirpack/admin/passwords
    Close All Connections
















##################################### Update Default Passwords #####################################
Update Default Passwords Normal
    Common.Open SSH Connection To Remote Server   ${IP_WEB_SBC}   ${SSH_USER_ROOT}    ${SSH_PASS_ROOT}

    ${admin_sql}    Set Variable    sqlite3 /home/httpd/Cirpack_web_admin/app/conf/CirpackWebAdmin.db "update user set password = '3c8f50e427e3f83dcbd88237f3deee12f312ae0e32fcf46505f1cc181558d9ea', salt = 'a0af9bebed111116bdd204c77ea610f7' where username = 'admin';"
    ${statistics_user_sql}    Set Variable    sqlite3 /home/httpd/Cirpack_web_admin/app/conf/CirpackWebAdmin.db "update user set password = '2710dce509bdb857a9a64c3a70b3ab3bb2823dc65199d5c5a1e1f23aa5574ed8', salt = '890525991a88d42d39724ae565557f77' where username = 'statistics_user';"

    Execute Command    ${admin_sql}
    Execute Command    ${statistics_user_sql}
    Close All Connections

Update Default Passwords Secure
    Common.Open SSH Connection To Remote Server   ${IP_WEB_SBC}   ${SSH_USER_EXPLOIT}    ${SSH_PASS_EXPLOIT}

    ${admin_sql}    Set Variable    sqlite3 /home/httpd/Cirpack_web_admin/app/conf/CirpackWebAdmin.db "update user set password = '3c8f50e427e3f83dcbd88237f3deee12f312ae0e32fcf46505f1cc181558d9ea', salt = 'a0af9bebed111116bdd204c77ea610f7' where username = 'admin';"
    ${statistics_user_sql}    Set Variable    sqlite3 /home/httpd/Cirpack_web_admin/app/conf/CirpackWebAdmin.db "update user set password = '2710dce509bdb857a9a64c3a70b3ab3bb2823dc65199d5c5a1e1f23aa5574ed8', salt = '890525991a88d42d39724ae565557f77' where username = 'statistics_user';"

    Execute Command    ${admin_sql}
    Execute Command    ${statistics_user_sql}
    Close All Connections
















############################################### Statistics ###############################################

Statistics Proxy
    Common.Open SSH Connection To Remote Server   ${IP_WEB_SBC}   ${WEB_SSH_USERNAME}    ${WEB_SSH_PASSWORD}
     ${output}    Execute Command    cd /home/omni/autoweb && ./auto.sh -test=/home/omni/autoweb/Scripts/Proxy_Run_Flash.txt -debug -report
    Log    ${output}
     ${output}    Execute Command    cd /home/omni/autoweb && ./auto.sh -test=/home/omni/autoweb/Scripts/Proxy_Run_Flash.txt -debug -report
    Log    ${output}
     ${output}    Execute Command    cd /home/omni/autoweb && ./auto.sh -test=/home/omni/autoweb/Scripts/Proxy_Run_Flash.txt -debug -report
    Log    ${output}
     ${output}    Execute Command    cd /home/omni/autoweb && ./auto.sh -test=/home/omni/autoweb/Scripts/Proxy_Run_Flash.txt -debug -report
    Log    ${output}
    Close All Connections 
    
Statistics Limiter
    Common.Open SSH Connection To Remote Server   ${IP_WEB_SBC}   ${WEB_SSH_USERNAME}    ${WEB_SSH_PASSWORD}
    ${update_output}    Execute Command    ${UPDATE_PCSCF_CMD}
    Log    ${update_output}
     ${output}    Execute Command    cd /home/omni/autoweb && ./auto.sh -test=/home/omni/autoweb/Scripts/Limiter_Run_Flash.txt -debug -report 
    Log    ${output}
     ${output}    Execute Command    cd /home/omni/autoweb && ./auto.sh -test=/home/omni/autoweb/Scripts/Limiter_Run_Flash.txt -debug -report 
    Log    ${output}
     ${output}    Execute Command    cd /home/omni/autoweb && ./auto.sh -test=/home/omni/autoweb/Scripts/Limiter_Run_Flash.txt -debug -report 
    Log    ${output}
     ${output}    Execute Command    cd /home/omni/autoweb && ./auto.sh -test=/home/omni/autoweb/Scripts/Limiter_Run_Flash.txt -debug -report 
    Log    ${output}
    #  ${output}    Execute Command    cd /home/omni/autoweb && ./auto.sh -test=/home/omni/autoweb/Scripts/Limiter_Run_Flash.txt -debug -report -step=1
    # Log    ${output}
    #  ${output}    Execute Command    cd /home/omni/autoweb && ./auto.sh -test=/home/omni/autoweb/Scripts/Limiter_Run_Flash.txt -debug -report -step=2-18
    # Log    ${output}
    #  ${output}    Execute Command    cd /home/omni/autoweb && ./auto.sh -test=/home/omni/autoweb/Scripts/Limiter_Run_Flash.txt -debug -report -step=19-33
    # Log    ${output}
    #  ${output}    Execute Command    cd /home/omni/autoweb && ./auto.sh -test=/home/omni/autoweb/Scripts/Limiter_Run_Flash.txt -debug -report -step=34-49
    # Log    ${output}
    #  ${output}    Execute Command    cd /home/omni/autoweb && ./auto.sh -test=/home/omni/autoweb/Scripts/Limiter_Run_Flash.txt -debug -report -step=19-33
    # Log    ${output}
    #  ${output}    Execute Command    cd /home/omni/autoweb && ./auto.sh -test=/home/omni/autoweb/Scripts/Limiter_Run_Flash.txt -debug -report -step=34-49
    # Log    ${output}

   ${update_output_1}    Execute Command    ${UPDATE_PCSCF_CMD_1}
    Log    ${update_output_1}
    Close All Connections 

Statistics Annsrv
    Common.Open SSH Connection To Remote Server   ${IP_WEB_SBC}   ${WEB_SSH_USERNAME}    ${WEB_SSH_PASSWORD}
     ${output}    Execute Command    cd /home/omni/autoweb && ./auto.sh -test=/home/omni/autoweb/Scripts/Annsrv_Run_Flash.txt -debug -report   
    Log    ${output}
     ${output}    Execute Command    cd /home/omni/autoweb && ./auto.sh -test=/home/omni/autoweb/Scripts/Annsrv_Run_Flash.txt -debug -report   
    Log    ${output}
     ${output}    Execute Command    cd /home/omni/autoweb && ./auto.sh -test=/home/omni/autoweb/Scripts/Annsrv_Run_Flash.txt -debug -report   
    Log    ${output}
     ${output}    Execute Command    cd /home/omni/autoweb && ./auto.sh -test=/home/omni/autoweb/Scripts/Annsrv_Run_Flash.txt -debug -report   
    Log    ${output}
        
    Close All Connections 

Statistics Media
    Common.Open SSH Connection To Remote Server   ${IP_WEB_SBC}   ${WEB_SSH_USERNAME}    ${WEB_SSH_PASSWORD}
     ${output}    Execute Command    cd /home/omni/autoweb && ./auto.sh -test=/home/omni/autoweb/Scripts/Media_Run_Flash.txt -debug -report  
    Log    ${output}
     ${output}    Execute Command    cd /home/omni/autoweb && ./auto.sh -test=/home/omni/autoweb/Scripts/Media_Run_Flash.txt -debug -report
    Log    ${output}
     ${output}    Execute Command    cd /home/omni/autoweb && ./auto.sh -test=/home/omni/autoweb/Scripts/Media_Run_Flash.txt -debug -report  
    Log    ${output}
     ${output}    Execute Command    cd /home/omni/autoweb && ./auto.sh -test=/home/omni/autoweb/Scripts/Media_Run_Flash.txt -debug -report
    Log    ${output}
     ${output}    Execute Command    cd /home/omni/autoweb && ./auto.sh -test=/home/omni/autoweb/Scripts/Media_Run_Flash.txt -debug -report  
    Log    ${output}

    Close All Connections 