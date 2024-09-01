*** Settings ***
Library  SeleniumLibrary
Resource  ../../Common.robot

*** Variables ***
################# General variables #################
${Confirm_Add}                       id=submit_field
${Peer_section}                      xpath=//*[@class='collapsible-header first-menu' and contains(text(),'Peer')]
${Peer_section_Peer}                 xpath=//*[@class='sub-menu' and contains(text(),'Peer')]
${Peer_section_PeerCfg}              xpath=//*[@class='sub-menu' and contains(text(),'Peer configuration')]
${Peer_section_Trusted}              xpath=//*[@class='sub-menu' and contains(text(),'Peer configuration')]/following::a
${Peer_section_NotTrusted}              xpath=//*[@class='sub-menu' and contains(text(),'Peer configuration')]/following::a[2]


###########################  PEER - PAGE  ###########################################
${Trusted_Preference_Global}         xpath=//label[@for='trusted_preference']/following::button[1]
${Trusted_Preference_Specific}       xpath=//label[@for='trusted_preference']/following::button[2]
${Trusted_Type_Trusted}              xpath=//label[@for='trusted_type']/following::button[1]
${Trusted_Type_NotTrusted}           xpath=//label[@for='trusted_type']/following::button[2]

${RPE_Portability_Button}           xpath=//button[@value='RPE Portability']
${Request_URI_Button}               xpath=//button[@value='Replace Request-URI']
${Calling_Number_Mani_Button}       xpath=//button[@value='Calling Number Manipulation']
${Anonymous_string_Field}           id=anonymous_str
${Number_Substitution_DropDown}      xpath=//label[@for='number_substitution']/preceding::div[1]/input
${Check_None}                        xpath=//li[@class='active']/span[contains(text(),'NONE')]
${Check_RqURI}                       xpath=//li[@class='active']/span[contains(text(),'RQ-URI')]
${Check_Rn}                          xpath=//li[@class='active']/span[contains(text(),'RN')]
${Check_To}                          xpath=//li[@class='active']/span[contains(text(),'TO')]
${Number_Substitution_None}          xpath=//span[contains(text(),'NONE')]
${Number_Substitution_RqURI}         xpath=//span[contains(text(),'RQ-URI')]
${Number_Substitution_Rn}            xpath=//span[contains(text(),'RN')]
${Number_Substitution_To}            xpath=//span[contains(text(),'TO')]

${History_info_True}                 xpath=//label[@for='history_info']/following::button[@value='True']
${History_info_False}                xpath=//label[@for='history_info']/following::button[@value='False']
${Add_RN_True}                       xpath=//label[@for='rn']/following::button[@value='True']
${Add_RN_False}                      xpath=//label[@for='rn']/following::button[@value='False']
${Add_NPDI_True}                     xpath=//label[@for='npdi']/following::button[@value='True']
${Add_NPDI_False}                    xpath=//label[@for='npdi']/following::button[@value='False']
${Portability_True}                  xpath=//label[@for='portability']/following::button[@value='True']
${Portability_False}                 xpath=//label[@for='portability']/following::button[@value='False']

${Diversion_Mapping_DropDown}        xpath=//label[@for='diversion_mapping']/preceding::div[1]/input
${Diversion_Mapping_None}            xpath=//span[contains(text(),'None')]
${Diversion_Mapping_History}         xpath=//span[contains(text(),'History-Info')]
${Diversion_Mapping_Diversion}       xpath=//span[contains(text(),'Diversion')]

${Max_Diversion_Field_click}         xpath=//label[contains(text(),'Max Diversion')]
${Max_Diversion_Field}               xpath=//input[@id='max_diversion']

${UUI_Mapping_True}                  xpath=//label[@for='uui']/following::button[@value='True']
${UUI_Mapping_False}                 xpath=//label[@for='uui']/following::button[@value='False']

${FCI_Mapping_True}                  xpath=//label[@for='fci_mapping']/following::button[@value='True']
${FCI_Mapping_False}                 xpath=//label[@for='fci_mapping']/following::button[@value='False']

${PANI_Location_Other}               xpath=//label[@for='use_pani_to_location']/following::button[@value='Other']
${PANI_Location_None}                xpath=//label[@for='use_pani_to_location']/following::button[@value='NONE']
${RexIn_PANI_Location}               id=pani_to_location-0-regex_in
${RexOut_PANI_Location}              id=pani_to_location-0-regex_out

${Location_PANI_Other}               xpath=//label[@for='use_location_to_pani']/following::button[@value='Other']
${Location_PANI_None}                xpath=//label[@for='use_location_to_pani']/following::button[@value='NONE']
${RexIn_Location_PANI}               id=location_to_pani-0-regex_in
${RexOut_Location_PANI}              id=location_to_pani-0-regex_out

${Block_Peer_True}                   xpath=//label[contains(text(),'Block peer')]/following::button[contains(text(),'True')]
${Block_Peer_False}                  xpath=//label[contains(text(),'Block peer')]/following::button[contains(text(),'False')]
${Block_Incoming_True}               xpath=//label[contains(text(),'Block incoming peer')]/following::button[contains(text(),'True')]
${Block_Incoming_False}              xpath=//label[contains(text(),'Block incoming peer')]/following::button[contains(text(),'False')]
${Block_Outgoing_True}               xpath=//label[contains(text(),'outgoing peer')]/following::button[contains(text(),'True')]
${Block_Outgoing_False}              xpath=//label[contains(text(),'outgoing peer')]/following::button[contains(text(),'False')]
##############################  Trusted  ####################

*** Keywords ***
Go to Peer in BGCF tab
    Click Element        ${BGCF_tab}
    Sleep  1s
    Click Element        ${Peer_section}
    Sleep   1s
Go to Peer section in BGCF PEER tab
    Click Element        ${Peer_section_Peer}

    Wait Until Page Contains Element    ${Data_table}         5

Go to Peer configuration section in BGCF tab
    Click Element        ${Peer_section_PeerCfg}
    Sleep  5s

Go to Trusted section in BGCF tab

    Click Element        ${Peer_section_Trusted}

    Wait Until Page Contains Element    ${Data_table}         5

Go to Not Trusted section in BGCF tab
    Click Element        ${Peer_section_NotTrusted}

    Wait Until Page Contains Element    ${Data_table}         5

Add Peer
    [Arguments]   ${Name}  ${Domain}   ${Trusted_Preference}   ${Trusted_Type}    ${Substitution_None}   ${Substitution_RqURI}
    ...  ${Substitution_Rn}   ${Substitution_To}   ${History_Info}     ${Add_RN}   ${Add_NPDI}     ${Portability}
    ...  ${Diversion_Mapping}  ${Max_Diversion}  ${UUI_Mapping}  ${PANI_Location}  ${Location_PANI}  ${RexIn}  ${RexOut}  ${RPE_Portability}   ${Request_URI}

    Click Element       ${Add_Button}
    Sleep  5s

    Run Keyword If  '${Name}' != '#BLANK'    input text       ${Name_Field}              ${Name}
    Sleep       1s

    Run Keyword If  '${Domain}' != '#BLANK'    input text       ${Multi_Domain_Field}              ${Domain}
    Sleep       1s

    Trusted Option                  ${Trusted_Preference}     ${Trusted_Type}

    Behavior Option                 ${RPE_Portability}          ${Request_URI}

    Number Substitution             ${Substitution_None}      ${Substitution_RqURI}       ${Substitution_Rn}   ${Substitution_To}

    Select True and False Option    ${History_Info}           ${Add_RN}    ${Add_NPDI}     ${Portability}        ${UUI_Mapping}

    Diversion Mapping               ${Diversion Mapping}

    Run Keyword If             '${Max_Diversion}' != '#BLANK'     input text          ${Max_Diversion_Field}        ${Max_Diversion}

    Select PANI and Location        ${PANI_Location}        ${Location_PANI}              ${RexIn}            ${RexOut}

    Click Element                   ${Confirm_Add}
    Sleep       3s


Add Peer multi domains
    [Arguments]   ${Name}  ${Domain}    ${Domain1}  ${Domain2}

    Click Element       ${Add_Button}
    Sleep  5s

    Run Keyword If  '${Name}' != '#BLANK'    input text       ${Name_Field}              ${Name}
    Sleep       1s

    Run Keyword If  '${Domain}' != '#BLANK'    input text       ${Multi_Domain_Field}              ${Domain}
    Sleep       1s

    Add 2 Domains to Peer     ${Domain1}       ${Domain2}

    Click Element       ${Confirm_Add}
    Sleep       10s

Add Peer 63
    [Arguments]   ${Name}  ${Domain}   ${Trusted_Preference}   ${Trusted_Type}    ${Substitution_None}   ${Substitution_RqURI}
    ...  ${Substitution_Rn}   ${Substitution_To}   ${History_Info}     ${Add_RN}   ${Add_NPDI}     ${Portability}
    ...  ${Diversion_Mapping}  ${Max_Diversion}  ${UUI_Mapping}  ${PANI_Location}  ${Location_PANI}  ${RexIn}  ${RexOut}  ${FCI_Mapping}

    Click Element       ${Add_Button}
    Sleep  5s

    Run Keyword If  '${Name}' != '#BLANK'    input text       ${Name_Field}              ${Name}
    Sleep       1s

    Run Keyword If  '${Domain}' != '#BLANK'    input text       ${Multi_Domain_Field}              ${Domain}
    Sleep       1s

    Trusted Option                  ${Trusted_Preference}     ${Trusted_Type}

    Number Substitution             ${Substitution_None}      ${Substitution_RqURI}       ${Substitution_Rn}   ${Substitution_To}

    Select True and False Option 63    ${History_Info}           ${Add_RN}   ${Add_NPDI}     ${Portability}        ${UUI_Mapping}  ${FCI_Mapping}

    Diversion Mapping               ${Diversion Mapping}

    Run Keyword If             '${Max_Diversion}' != '#BLANK'     input text          ${Max_Diversion_Field}        ${Max_Diversion}

    Select PANI and Location        ${PANI_Location}        ${Location_PANI}              ${RexIn}            ${RexOut}

    Click Element                   ${Confirm_Add}
    Sleep       3s

Add Peer 65
    [Arguments]   ${Name}  ${Domain}   ${Trusted_Preference}   ${Trusted_Type}    ${Substitution_None}   ${Substitution_RqURI}
    ...  ${Substitution_Rn}   ${Substitution_To}   ${History_Info}     ${Add_RN}   ${Add_NPDI}     ${Portability}
    ...  ${Diversion_Mapping}  ${Max_Diversion}  ${UUI_Mapping}  ${PANI_Location}  ${Location_PANI}  ${RexIn}  ${RexOut}  ${FCI_Mapping}
    ...  ${RPE_Portability}  ${Request_URI}  ${Calling_Number_Mani}  ${Anonymous_string}

    Click Element       ${Add_Button}
    Sleep  5s

    Run Keyword If  '${Name}' != '#BLANK'    input text       ${Name_Field}              ${Name}
    Sleep       1s

    Run Keyword If  '${Domain}' != '#BLANK'    input text       ${Multi_Domain_Field}              ${Domain}
    Sleep       1s

    Trusted Option                  ${Trusted_Preference}     ${Trusted_Type}
    #RFF17001 behavior 0x4
    Behavior Option                 ${RPE_Portability}          ${Request_URI}   ${Calling_Number_Mani}

    Run Keyword If  '${Calling_Number_Mani}' == 'True' and '${Anonymous_string}' != '#BLANK'     input text       ${Anonymous_string_Field}              ${Anonymous_string}
    Sleep       1s
    #########
    Number Substitution             ${Substitution_None}      ${Substitution_RqURI}       ${Substitution_Rn}   ${Substitution_To}

    Select True and False Option 63    ${History_Info}           ${Add_RN}   ${Add_NPDI}     ${Portability}        ${UUI_Mapping}  ${FCI_Mapping}

    Diversion Mapping               ${Diversion Mapping}

    Run Keyword If             '${Max_Diversion}' != '#BLANK'     input text          ${Max_Diversion_Field}        ${Max_Diversion}

    Select PANI and Location        ${PANI_Location}        ${Location_PANI}              ${RexIn}            ${RexOut}

    Click Element                   ${Confirm_Add}
    Sleep       3s

Edit Peer
    [Arguments]  ${Name}  ${Domain_Old}     ${Domain_New}   ${Domain1}  ${Domain2}  ${Trusted_Preference}   ${Trusted_Type}    ${Substitution_None}   ${Substitution_RqURI}
    ...  ${Substitution_Rn}   ${Substitution_To}   ${History_Info}     ${Add_RN}   ${Add_NPDI}     ${Portability}
    ...  ${Diversion_Mapping}  ${Max_Diversion}  ${UUI_Mapping}  ${PANI_Location}  ${Location_PANI}  ${RexIn}  ${RexOut}   ${Block_peer}   ${Block_incoming}    ${Block_outgoing}

    Click Edit Element With 2 Info      ${Name}   ${Domain_Old}
    Sleep  5s

    Run Keyword If  '${Domain_New}' != '#BLANK'    input text       ${Multi_Domain_Field}              ${Domain_New}
    Sleep       1s

    Add 2 Domains to Peer     ${Domain1}       ${Domain2}

    Number Substitution     ${Substitution_None}    ${Substitution_RqURI}  ${Substitution_Rn}   ${Substitution_To}

    Select True and False Option    ${History_Info}     ${Add_RN}   ${Add_NPDI}     ${Portability}      ${UUI_Mapping}

    Diversion Mapping   ${Diversion Mapping}

    Run Keyword If   '${Max_Diversion}' != '#BLANK'    input text      ${Max_Diversion_Field}        ${Max_Diversion}

    Select PANI and Location    ${PANI_Location}  ${Location_PANI}  ${RexIn}  ${RexOut}

    Block peer      ${Block_peer}   ${Block_incoming}    ${Block_outgoing}
    Click Element       ${Confirm_Add}
    Sleep       10s
    reload page

Edit Peer 63
    [Arguments]  ${Name}  ${Domain_Old}     ${Domain_New}   ${Domain1}  ${Domain2}  ${Trusted_Preference}   ${Trusted_Type}    ${Substitution_None}   ${Substitution_RqURI}
    ...  ${Substitution_Rn}   ${Substitution_To}   ${History_Info}     ${Add_RN}   ${Add_NPDI}     ${Portability}
    ...  ${Diversion_Mapping}  ${Max_Diversion}  ${UUI_Mapping}  ${PANI_Location}  ${Location_PANI}  ${RexIn}  ${RexOut}   ${Block_peer}   ${Block_incoming}    ${Block_outgoing}  ${FCI_Mapping}

    Click Edit Element With 2 Info      ${Name}   ${Domain_Old}
    Sleep  5s

    Run Keyword If  '${Domain_New}' != '#BLANK'    input text       ${Multi_Domain_Field}              ${Domain_New}
    Sleep       1s

    Add 2 Domains to Peer     ${Domain1}       ${Domain2}

    Number Substitution     ${Substitution_None}    ${Substitution_RqURI}  ${Substitution_Rn}   ${Substitution_To}

    Select True and False Option 63   ${History_Info}     ${Add_RN}   ${Add_NPDI}     ${Portability}      ${UUI_Mapping}  ${FCI_Mapping}

    Diversion Mapping   ${Diversion Mapping}

    Run Keyword If   '${Max_Diversion}' != '#BLANK'    input text      ${Max_Diversion_Field}        ${Max_Diversion}

    Select PANI and Location    ${PANI_Location}  ${Location_PANI}  ${RexIn}  ${RexOut}

    Block peer      ${Block_peer}   ${Block_incoming}    ${Block_outgoing}
    Click Element       ${Confirm_Add}
    Sleep       10s
    reload page

Edit Peer 65
    [Arguments]  ${Name}  ${Domain_Old}     ${Domain_New}   ${Domain1}  ${Domain2}  ${Trusted_Preference}   ${Trusted_Type}    ${Substitution_None}   ${Substitution_RqURI}
    ...  ${Substitution_Rn}   ${Substitution_To}   ${History_Info}     ${Add_RN}   ${Add_NPDI}     ${Portability}
    ...  ${Diversion_Mapping}  ${Max_Diversion}  ${UUI_Mapping}  ${PANI_Location}  ${Location_PANI}  ${RexIn}  ${RexOut}   ${Block_peer}   ${Block_incoming}    ${Block_outgoing}  ${FCI_Mapping}
    ...  ${RPE_Portability}  ${Request_URI}  ${Calling_Number_Mani}  ${Anonymous_string}

    Click Edit Element With 2 Info      ${Name}   ${Domain_Old}
    Sleep  5s

    Run Keyword If  '${Domain_New}' != '#BLANK'    input text       ${Multi_Domain_Field}              ${Domain_New}
    Sleep       1s

    Add 2 Domains to Peer     ${Domain1}       ${Domain2}

    #RFF17001 behavior 0x4
    Behavior Option                 ${RPE_Portability}      ${Request_URI}     ${Calling_Number_Mani}

    Run Keyword If  '${Calling_Number_Mani}' == 'True' and '${Anonymous_string}' != '#BLANK'     input text       ${Anonymous_string_Field}              ${Anonymous_string}
    Sleep       1s
    #########

    Number Substitution     ${Substitution_None}    ${Substitution_RqURI}  ${Substitution_Rn}   ${Substitution_To}

    Select True and False Option 63   ${History_Info}     ${Add_RN}   ${Add_NPDI}     ${Portability}      ${UUI_Mapping}  ${FCI_Mapping}

    Diversion Mapping   ${Diversion Mapping}

    Run Keyword If   '${Max_Diversion}' != '#BLANK'    input text      ${Max_Diversion_Field}        ${Max_Diversion}

    Select PANI and Location    ${PANI_Location}  ${Location_PANI}  ${RexIn}  ${RexOut}

    Block peer      ${Block_peer}   ${Block_incoming}    ${Block_outgoing}
    Click Element       ${Confirm_Add}
    Sleep       10s
    reload page


Block peer
    [Arguments]   ${Block_Peer}   ${Block_Incoming}    ${Block_Outgoing}
    Run Keyword If   '${Block_Peer}' == 'block_all'     Click Element    ${Block_Peer_True}
    ...         ELSE                                    Click Element    ${Block_Peer_False}
    Sleep   5s

    Run Keyword If  '${Block_Peer}' == 'block_all'       Run Keyword If   '${Block_Incoming}' != 'block_in'     Click Element    ${Block_Incoming_True}
    ...         ELSE                                       Click Element    ${Block_Incoming_False}
    Sleep  5s

    Run Keyword If  '${Block_Peer}' == 'block_all'       Run Keyword If   '${Block_Outgoing}' != 'block_out'     Click Element    ${Block_Outgoing_True}
    ...         ELSE                                        Click Element    ${Block_Outgoing_False}
    Sleep  5s

Number Substitution
    [Arguments]     ${Substitution_None}    ${Substitution_RqURI}  ${Substitution_Rn}   ${Substitution_To}
    Click Element     ${Number_Substitution_DropDown}
    Sleep  3s

    ${Checkbox_None_Selected} =  run keyword and return status   page should contain element    ${Check_None}
    Run Keyword If   '${Substitution_None}' == 'NONE'    Run Keyword If  '${Checkbox_None_Selected}' == 'False'   Click Element       ${Number_Substitution_None}
    Sleep  3s
    Run Keyword If   '${Substitution_None}' == '#BLANK'    Run Keyword If  '${Checkbox_None_Selected}' == 'True'   Click Element       ${Number_Substitution_None}
    Sleep  3s

    ${Checkbox_RqURI_Selected} =  run keyword and return status   page should contain element    ${Check_RqURI}
    Run Keyword If   '${Substitution_RqURI}' == 'RQ-URI'    Run Keyword If  '${Checkbox_RqURI_Selected}' == 'False'   Click Element       ${Number_Substitution_RqURI}
    Sleep  3s
    Run Keyword If   '${Substitution_RqURI}' == '#BLANK'    Run Keyword If  '${Checkbox_RqURI_Selected}' == 'True'   Click Element       ${Number_Substitution_RqURI}
    Sleep  3s

    ${Checkbox_Rn_Selected} =  run keyword and return status   page should contain element    ${Check_Rn}
    Run Keyword If   '${Substitution_Rn}' == 'RN'    Run Keyword If  '${Checkbox_Rn_Selected}' == 'False'   Click Element       ${Number_Substitution_Rn}
    Sleep  3s
    Run Keyword If   '${Substitution_Rn}' == '#BLANK'    Run Keyword If  '${Checkbox_Rn_Selected}' == 'True'   Click Element       ${Number_Substitution_Rn}
    Sleep  3s

    ${Checkbox_To} =  run keyword and return status   page should contain element    ${Check_To}
    Run Keyword If   '${Substitution_To}' == 'TO'    Run Keyword If  '${Checkbox_To}' == 'False'   Click Element       ${Number_Substitution_To}
    Sleep  3s
	Run Keyword If   '${Substitution_To}' == '#BLANK'    Run Keyword If  '${Checkbox_To}' == 'True'   Click Element       ${Number_Substitution_To}
    Sleep  3s

    Click Element   ${Max_Diversion_Field_click}
    Sleep  1s


Diversion Mapping
    [Arguments]   ${Diversion_Mapping}
    Click Element     ${Diversion_Mapping_DropDown}
    Sleep  1s

    Run Keyword If        '${Diversion_Mapping}' == 'HISTORY-INFO'      Click Element       ${Diversion_Mapping_History}

    ...         ELSE IF   '${Diversion_Mapping}' == 'DIVERSION'    Click Element       ${Diversion_Mapping_Diversion}

    ...         ELSE                                               Click Element       ${Diversion_Mapping_None}
    Sleep  1s


Trusted Option
    [Arguments]     ${Trusted_Preference}     ${Trusted_Type}
    Run Keyword If  '${Trusted_Preference}' == 'Specifec'    Click Element        ${Trusted_Preference_Specific}
    Sleep       3s

    Run Keyword If  '${Trusted_Preference}' == 'Global'    Click Element        ${Trusted_Preference_Global}
    Sleep       3s

    Run Keyword If  '${Trusted_Type}' == 'NotTrusted'    Click Element        ${Trusted_Type_NotTrusted}
    Sleep       3s

    Run Keyword If  '${Trusted_Type}' == 'Trusted'    Click Element        ${Trusted_Type_Trusted}
    Sleep       3s

Behavior Option
    [Arguments]     ${RPE_Portability}     ${Request_URI}  ${Calling_Number_Mani}

    Run Keyword If  '${RPE_Portability}' == 'True'      Click Element        ${RPE_Portability_Button}
    Sleep       1s

    Run Keyword If  '${Request_URI}' == 'True'          Click Element        ${Request_URI_Button}
    Sleep       1s
    Run Keyword If  '${Calling_Number_Mani}' == 'True'          Click Element        ${Calling_Number_Mani_Button}
    Sleep       1s

Select True and False Option
    [Arguments]   ${History_Info}     ${Add_RN}   ${Add_NPDI}     ${Portability}    ${UUI_Mapping}

    Run Keyword If   '${History_Info}' == 'TRUE'    Click Element       ${History_Info_True}
    ...         ELSE                                Click Element       ${History_Info_False}
    Sleep  5s

    Run Keyword If   '${Add_RN}' == 'TRUE'          Click Element       ${Add_RN_True}
    ...         ELSE                                Click Element       ${Add_RN_False}
    Sleep  5s

    Run Keyword If   '${Add_NPDI}' == 'TRUE'        Click Element       ${Add_NPDI_True}
    ...         ELSE                                Click Element       ${Add_NPDI_False}
    Sleep  5s

    Run Keyword If   '${Portability}' == 'TRUE'     Click Element       ${Portability_True}
    ...         ELSE                                Click Element       ${Portability_False}
    Sleep  5s

    Run Keyword If   '${UUI_Mapping}' == 'TRUE'     Click Element       ${UUI_Mapping_True}
    ...         ELSE                                Click Element       ${UUI_Mapping_False}
    Sleep  5s


Select True and False Option 63
    [Arguments]   ${History_Info}     ${Add_RN}   ${Add_NPDI}     ${Portability}    ${UUI_Mapping}  ${FCI_Mapping}

    Run Keyword If   '${History_Info}' == 'TRUE'    Click Element       ${History_Info_True}
    ...         ELSE                                Click Element       ${History_Info_False}
    Sleep  5s

    Run Keyword If   '${Add_RN}' == 'TRUE'          Click Element       ${Add_RN_True}
    ...         ELSE                                Click Element       ${Add_RN_False}
    Sleep  5s

    Run Keyword If   '${Add_NPDI}' == 'TRUE'        Click Element       ${Add_NPDI_True}
    ...         ELSE                                Click Element       ${Add_NPDI_False}
    Sleep  5s

    Run Keyword If   '${Portability}' == 'TRUE'     Click Element       ${Portability_True}
    ...         ELSE                                Click Element       ${Portability_False}
    Sleep  5s

    Run Keyword If   '${UUI_Mapping}' == 'TRUE'     Click Element       ${UUI_Mapping_True}
    ...         ELSE                                Click Element       ${UUI_Mapping_False}
    Sleep  5s

    Run Keyword If   '${FCI_Mapping}' == 'TRUE'     Click Element       ${FCI_Mapping_True}
    ...         ELSE                                Click Element       ${FCI_Mapping_False}
    Sleep  2s

Select PANI and Location
    [Arguments]     ${PANI_Location}    ${Location_PANI}        ${RexIn}        ${RexOut}

    Run Keyword If   '${PANI_Location}' == 'None'     Click Element       ${PANI_Location_None}
    Sleep  5s

    Run Keyword If   '${PANI_Location}' == 'Other'     Click Element       ${PANI_Location_Other}
    Sleep  5s

    Run Keyword If   '${PANI_Location}' == 'Other'     Run Keyword If   "${RexIn}" != "#BLANK"      input text   ${RexIn_PANI_Location}      "${RexIn}"
    Sleep  1s

    Run Keyword If   '${PANI_Location}' == 'Other'     Run Keyword If   "${RexOut}" != "#BLANK"     input text       ${RexOut_PANI_Location}      "${RexOut}"
    Sleep  1s


    Run Keyword If   '${Location_PANI}' == 'None'     Click Element         ${Location_PANI_None}
    Sleep  5s

    Run Keyword If   '${Location_PANI}' == 'Other'     Click Element         ${Location_PANI_Other}
    Sleep  5s

    Run Keyword If   '${Location_PANI}' == 'Other'     Run Keyword If   "${RexOut}" != '#BLANK'      input text       ${RexIn_Location_PANI}      "${RexOut}"
    Sleep  1s

    Run Keyword If   '${Location_PANI}' == 'Other'     Run Keyword If   "${RexIn}" != '#BLANK'     input text       ${RexOut_Location_PANI}      "${RexIn}"
    Sleep  1s

View Peer
    [Arguments]    ${Name}    ${Domain}    ${History_Info}     ${Add_RN}   ${Add_NPDI}   ${Portability}  ${Max_Diversion}  ${Diversion_Mapping}   ${UUI_Mapping}
    Click View Element With 2 Info      ${Name}    ${Domain}
    Sleep  5s
    Verify Page Contains 2 Expected Elements    Name                        ${Name}
    Verify Page Contains 2 Expected Elements    Domain                      ${Domain}
    Verify Page Contains 2 Expected Elements    Add history info            ${History_Info}
    Verify Page Contains 2 Expected Elements    Add RN                      ${Add_RN}
    Verify Page Contains 2 Expected Elements    Add NPDI                    ${Add_NPDI}
    Verify Page Contains 2 Expected Elements    Portability                 ${Portability}
    Verify Page Contains 2 Expected Elements    Max diversion               ${Max_Diversion}
    Verify Page Contains 2 Expected Elements    Diversion Mapping           ${Diversion_Mapping}
    Verify Page Contains 2 Expected Elements    UUI Mapping                 ${UUI_Mapping}
    Verify Page Contains 1 Expected Elements    PANIToLocation
    Verify Page Contains 1 Expected Elements    LocationToPANI


Add Invalid Peer
    [Arguments]   ${Name}  ${Domain}   ${Max_Diversion}  ${Calling_Number_Mani}  ${Anonymous_string}

    Click Element       ${Add_Button}
    Sleep  5s

    Run Keyword If  '${Name}' != '#BLANK'    input text       ${Name_Field}              ${Name}
    Sleep       1s

    Run Keyword If  '${Domain}' != '#BLANK'    input text       ${Multi_Domain_Field}              ${Domain}
    Sleep       1s

    Run Keyword If   '${Max_Diversion}' != '#BLANK'    input text      ${Max_Diversion_Field}        ${Max_Diversion}

    Run Keyword If  '${Calling_Number_Mani}' == 'True'  Click Element      ${Calling_Number_Mani_Button}
    Sleep  1s
    Run Keyword If  '${Calling_Number_Mani}' == 'True' and '${Anonymous_string}' != '#BLANK'     input text       ${Anonymous_string_Field}              ${Anonymous_string}
    Sleep       1s

    Click Element       ${Confirm_Add}
    Sleep       2s

Edit Invalid Peer
    [Arguments]   ${Name}  ${Domain}   ${Max_Diversion}  ${Calling_Number_Mani}  ${Anonymous_string}

    Click Edit Element With 1 Info      ${Name}
    Sleep  5s
    Run Keyword If  '${Domain}' != '#BLANK'    input text               ${Multi_Domain_Field}              ${Domain}
    Sleep       1s

    Run Keyword If   '${Max_Diversion}' != '#BLANK'    input text      ${Max_Diversion_Field}        ${Max_Diversion}

    Run Keyword If  '${Calling_Number_Mani}' == 'True'  Click Element      ${Calling_Number_Mani_Button}
    Sleep  1s
    Run Keyword If  '${Calling_Number_Mani}' == 'True' and '${Anonymous_string}' != '#BLANK'     input text       ${Anonymous_string_Field}              ${Anonymous_string}
    Sleep       1s

    Click Element       ${Confirm_Add}
    Sleep       2s


#########################  Peer Configuration ###############

Check Trusted
    ${Check_Trusted_Value} =  run keyword and return status  checkbox should not be selected  id=check_trusted

    Run Keyword If  '${Check_Trusted_Value}' == 'True'        run keywords  Click Element       xpath=//label[@for='check_trusted']  AND  Click Element  xpath=//button[@type='submit']
    Run Keyword If  '${Check_Trusted_Value}' == 'False'       Click Element       ${Confirm_Add_MatRul}
    Sleep  5s
    Page should contain  Not Trusted

#########################  Trusted  #########################
Add Trusted Peer
    [Arguments]     ${IP}   ${Port}
    Click Element       ${Add_Button}
    Sleep  5s
    Run Keyword If  '${IP}' != '#BLANK'    input text       ${IP_Field}              ${IP}
    Sleep       1s
    Run Keyword If  '${Port}' != '#BLANK'    input text      ${Port_Field}          ${Port}

    Click Element       ${Confirm_Add_MatRul}
    Sleep       3s

