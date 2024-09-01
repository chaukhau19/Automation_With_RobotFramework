*** Settings ***
Library  SeleniumLibrary
Resource  ../../Common.robot
Resource  ../../../Data/InputData.robot

*** Variables ***

*** Keywords ***
Go to IBCF tab
    Click Element        ${IBCF_tab}
    Sleep       1s

Go to PNUM section in IBCF tab

    Click Element        ${PNUM_section}
    Sleep       2s

Go to UserToNet section in Pnum tab

    Click Element        ${U2N_section}
    Sleep       2s

Go to NetToUser section in Pnum tab

    Click Element        ${N2U_section}
    Sleep       2s

Go to Extension section in Pnum tab
    Click Element        ${Extension_section}
    Sleep       2s

Go to Local_area section in Pnum tab
    Click Element        ${Localarea_section}
    Sleep       2s

Add UserToNet
    [Arguments]     ${Index}  ${Message_invite}  ${Message_bye}  ${Message_ack}  ${Message_update}  ${Message_subscribe}  ${Message_register}  ${Message_prack}  ${Message_refer}  ${Message_info}  ${Message_options}
    ...    ${Calling}  ${Called}  ${From}  ${PPI}  ${To}  ${RQ-URI}  ${Refer_To}  ${Calling_rules_1}  ${T_reg_in_1}  ${T_reg_out_1}  ${A_reg_in_1}  ${A_reg_out_1}  ${Calling_rules_2}  ${T_reg_in_2}  ${T_reg_out_2}  ${A_reg_in_2}  ${A_reg_out_2}
    ...    ${Called_rules_1}  ${T_reg_in_3}  ${T_reg_out_3}  ${A_reg_in_3}  ${A_reg_out_3}  ${Called_rules_2}  ${T_reg_in_4}  ${T_reg_out_4}  ${A_reg_in_4}  ${A_reg_out_4}

    Click Element       ${Add_Button}
    Sleep       1s
    Run Keyword If      '${Index}' != 'Default'                          Input Text          ${Index_RP_Field}              ${Index}
    Add_Edit UserToNet  ${Message_invite}  ${Message_bye}  ${Message_ack}  ${Message_update}  ${Message_subscribe}  ${Message_register}  ${Message_prack}  ${Message_refer}  ${Message_info}  ${Message_options}
    ...    ${Calling}  ${Called}  ${From}  ${PPI}  ${To}  ${RQ-URI}  ${Refer_To}  ${Calling_rules_1}  ${T_reg_in_1}  ${T_reg_out_1}  ${A_reg_in_1}  ${A_reg_out_1}  ${Calling_rules_2}  ${T_reg_in_2}  ${T_reg_out_2}  ${A_reg_in_2}  ${A_reg_out_2}
    ...    ${Called_rules_1}  ${T_reg_in_3}  ${T_reg_out_3}  ${A_reg_in_3}  ${A_reg_out_3}  ${Called_rules_2}  ${T_reg_in_4}  ${T_reg_out_4}  ${A_reg_in_4}  ${A_reg_out_4}

Edit UserToNet
    [Arguments]     ${Index}  ${Message_invite}  ${New_Message_invite}  ${Message_bye}  ${Message_ack}  ${Message_update}  ${Message_subscribe}  ${Message_register}  ${Message_prack}  ${Message_refer}  ${Message_info}  ${Message_options}
    ...    ${Calling}  ${Called}  ${From}  ${PPI}  ${To}  ${RQ-URI}  ${Refer_To}  ${Calling_rules_1}  ${T_reg_in_1}  ${T_reg_out_1}  ${A_reg_in_1}  ${A_reg_out_1}  ${Calling_rules_2}  ${T_reg_in_2}  ${T_reg_out_2}  ${A_reg_in_2}  ${A_reg_out_2}
    ...    ${Called_rules_1}  ${T_reg_in_3}  ${T_reg_out_3}  ${A_reg_in_3}  ${A_reg_out_3}  ${Called_rules_2}  ${T_reg_in_4}  ${T_reg_out_4}  ${A_reg_in_4}  ${A_reg_out_4}

    Click Edit Element With 2 Info      ${Index}   ${Message_invite}
    Add_Edit UserToNet  ${New_Message_invite}  ${Message_bye}  ${Message_ack}  ${Message_update}  ${Message_subscribe}  ${Message_register}  ${Message_prack}  ${Message_refer}  ${Message_info}  ${Message_options}
    ...    ${Calling}  ${Called}  ${From}  ${PPI}  ${To}  ${RQ-URI}  ${Refer_To}  ${Calling_rules_1}  ${T_reg_in_1}  ${T_reg_out_1}  ${A_reg_in_1}  ${A_reg_out_1}  ${Calling_rules_2}  ${T_reg_in_2}  ${T_reg_out_2}  ${A_reg_in_2}  ${A_reg_out_2}
    ...    ${Called_rules_1}  ${T_reg_in_3}  ${T_reg_out_3}  ${A_reg_in_3}  ${A_reg_out_3}  ${Called_rules_2}  ${T_reg_in_4}  ${T_reg_out_4}  ${A_reg_in_4}  ${A_reg_out_4}

Add_Edit UserToNet
    [Arguments]     ${Message_invite}  ${Message_bye}  ${Message_ack}  ${Message_update}  ${Message_subscribe}  ${Message_register}  ${Message_prack}  ${Message_refer}  ${Message_info}  ${Message_options}
    ...    ${Calling}  ${Called}  ${From}  ${PPI}  ${To}  ${RQ-URI}  ${Refer_To}  ${Calling_rules_1}  ${T_reg_in_1}  ${T_reg_out_1}  ${A_reg_in_1}  ${A_reg_out_1}  ${Calling_rules_2}  ${T_reg_in_2}  ${T_reg_out_2}  ${A_reg_in_2}  ${A_reg_out_2}
    ...    ${Called_rules_1}  ${T_reg_in_3}  ${T_reg_out_3}  ${A_reg_in_3}  ${A_reg_out_3}  ${Called_rules_2}  ${T_reg_in_4}  ${T_reg_out_4}  ${A_reg_in_4}  ${A_reg_out_4}

    Run Keyword If      '${Message_invite}' != '#BLANK'                 Click Element       ${Invite_Button}
    Run Keyword If      '${Message_bye}' != '#BLANK'                    Click Element       ${Bye_Button}
    Run Keyword If      '${Message_ack}' != '#BLANK'                    Click Element       ${Ack_Button}
    Run Keyword If      '${Message_update}' != '#BLANK'                 Click Element       ${Update_Button}
    Run Keyword If      '${Message_subscribe}' != '#BLANK'              Click Element       ${Subscribe_Button}
    Run Keyword If      '${Message_register}' != '#BLANK'               Click Element       ${Register_Button}
    Run Keyword If      '${Message_prack}' != '#BLANK'                  Click Element       ${Prack_Button}
    Run Keyword If      '${Message_refer}' != '#BLANK'                  Click Element       ${Refer_Button}
    Run Keyword If      '${Message_info}' != '#BLANK'                   Click Element       ${Info_Button}
    Run Keyword If      '${Message_options}' != '#BLANK'                Click Element       ${Options_Button}
    Sleep       1s

    Run Keyword If      '${Calling}' == 'Calling'                           Click Element       ${Calling_Button}
    Run Keyword If      '${Called}' == 'Called'                             Click Element       ${Called_Button}
    Sleep       1s
    Run Keyword If      '${From}' == 'From'                                 Click Element       ${From_Button}
    Run Keyword If      '${PPI}' == 'PPI'                                   Click Element       ${PPI_Button}

    Run Keyword If      '${To}' == 'To'                                     Click Element       ${To_Button}
    Run Keyword If      '${RQ-URI}' == 'RQ-URI'                             Click Element       ${RQ_Button}
    Run Keyword If      '${Refer_To}' == 'Refer-To'                         Click Element       ${ReferTo_Button}
    Sleep       1s

    Run Keyword If      '${Calling_rules_1}' == 'add'                       Click Element       ${Add_Calling_Rules}
    Run Keyword If      '${Calling_rules_1}' == 'remove'                    Click Element       ${Remove_Calling_Rules_1}
    Sleep       1s
    Run Keyword If  '${T_reg_in_1}' != '#BLANK'                          Input Text          ${T_Reg_In_Field_1}              ${T_reg_in_1}
    Run Keyword If  '${T_reg_out_1}' != '#BLANK'                         Input Text          ${T_Reg_Out_Field_1}              ${T_reg_out_1}
    Run Keyword If  '${A_reg_in_1}' != '#BLANK'                          Input Text          ${A_Reg_In_Field_1}              ${A_reg_in_1}
    Run Keyword If  '${A_reg_out_1}' != '#BLANK'                         Input Text          ${A_Reg_Out_Field_1}              ${A_reg_out_1}
    Sleep       1s
    Run Keyword If      '${Calling_rules_2}' == 'add'                        Click Element       ${Add_Calling_Rules}
    Run Keyword If      '${Calling_rules_2}' == 'remove'                     Click Element       ${Remove_Calling_Rules_2}
    Sleep       1s
    Run Keyword If  '${T_reg_in_2}' != '#BLANK'                           Input Text          ${T_Reg_In_Field_2}              ${T_reg_in_2}
    Run Keyword If  '${T_reg_out_2}' != '#BLANK'                          Input Text          ${T_Reg_Out_Field_2}              ${T_reg_out_2}
    Run Keyword If  '${A_reg_in_2}' != '#BLANK'                           Input Text          ${A_Reg_In_Field_2}              ${A_reg_in_2}
    Run Keyword If  '${A_reg_out_2}' != '#BLANK'                          Input Text          ${A_Reg_Out_Field_2}              ${A_reg_out_2}

    Run Keyword If      '${Called_rules_1}' == 'add'                          Click Element       ${Add_Called_Rules}
    Run Keyword If      '${Called_rules_1}' == 'remove'                       Click Element       ${Remove_Called_Rules_1}
    Sleep       1s
    Run Keyword If  '${T_reg_in_3}' != '#BLANK'                           Input Text          ${T_Reg_In_Field_3}              ${T_reg_in_3}
    Run Keyword If  '${T_reg_out_3}' != '#BLANK'                          Input Text          ${T_Reg_Out_Field_3}              ${T_reg_out_3}
    Run Keyword If  '${A_reg_in_3}' != '#BLANK'                           Input Text          ${A_Reg_In_Field_3}              ${A_reg_in_3}
    Run Keyword If  '${A_reg_out_3}' != '#BLANK'                          Input Text          ${A_Reg_Out_Field_3}              ${A_reg_out_3}
    Sleep       1s
    Run Keyword If      '${Called_rules_2}' == 'add'                          Click Element       ${Add_Called_Rules}
    Run Keyword If      '${Called_rules_2}' == 'remove'                       Click Element       ${Remove_Called_Rules_2}
    Sleep       1s
    Run Keyword If  '${T_reg_in_4}' != '#BLANK'                           Input Text          ${T_Reg_In_Field_4}              ${T_reg_in_4}
    Run Keyword If  '${T_reg_out_4}' != '#BLANK'                          Input Text          ${T_Reg_Out_Field_4}              ${T_reg_out_4}
    Run Keyword If  '${A_reg_in_4}' != '#BLANK'                           Input Text          ${A_Reg_In_Field_4}              ${A_reg_in_4}
    Run Keyword If  '${A_reg_out_4}' != '#BLANK'                          Input Text          ${A_Reg_Out_Field_4}              ${A_reg_out_4}
    Sleep       1s
    Click Element       ${Confirm_Add_Type_Input_2}
    Sleep       3s

View UserToNet
    [Arguments]     ${Index}  ${Message_invite}  ${Message_bye}  ${Message_ack}  ${Message_update}  ${Message_subscribe}  ${Message_register}  ${Message_prack}  ${Message_refer}  ${Message_info}  ${Message_options}
    ...    ${From}  ${PPI}  ${To}  ${RQ-URI}  ${Refer_To}

    Click View Element With 2 Info          ${Index}    ${Message_invite}
    Sleep       3s

    Verify Page Contains 2 Expected Elements Pnum    Index                                          ${Index}
    Run Keyword If  '${Message_invite}' == 'INVITE'         Verify Page Contains 2 Expected Elements Pnum   Message types                ${Message_invite}
    Run Keyword If  '${Message_bye}' == 'BYE'               Verify Page Contains 2 Expected Elements Pnum   Message types                ${Message_bye}
    Run Keyword If  '${Message_ack}' == 'ACK'               Verify Page Contains 2 Expected Elements Pnum    Message types                ${Message_ack}
    Run Keyword If  '${Message_update}' == 'UPDATE'         Verify Page Contains 2 Expected Elements Pnum    Message types                ${Message_update}
    Run Keyword If  '${Message_subscribe}' == 'SUBSCRIBE'   Verify Page Contains 2 Expected Elements Pnum    Message types                ${Message_subscribe}
    Run Keyword If  '${Message_register}' == 'REGISTER'     Verify Page Contains 2 Expected Elements Pnum    Message types                ${Message_register}
    Run Keyword If  '${Message_prack}' == 'PRACK'           Verify Page Contains 2 Expected Elements Pnum    Message types                ${Message_prack}
    Run Keyword If  '${Message_refer}' == 'REFER'           Verify Page Contains 2 Expected Elements Pnum    Message types                ${Message_refer}
    Run Keyword If  '${Message_info}' == 'INFO'             Verify Page Contains 2 Expected Elements Pnum    Message types                ${Message_info}
    Run Keyword If  '${Message_options}' == 'OPTIONS'       Verify Page Contains 2 Expected Elements Pnum    Message types                ${Message_options}

    Run Keyword If  '${From}' == 'From'                     Verify Page Contains 2 Expected Elements Pnum    Calling header               ${From}
    Run Keyword If  '${PPI}' == 'PPI'                       Verify Page Contains 2 Expected Elements Pnum    Calling header               ${PPI}
    Run Keyword If  '${To}' == 'To'                         Verify Page Contains 2 Expected Elements Pnum    Called header                ${To}
    Run Keyword If  '${RQ-URI}' == 'RQ-URI'                 Verify Page Contains 2 Expected Elements Pnum    Called header                ${RQ-URI}
    Run Keyword If  '${Refer_To}' == 'Refer-To'             Verify Page Contains 2 Expected Elements Pnum    Called header                ${Refer_To}







##########################################################################
Add Extension
    [Arguments]     ${Add_New_Ext}  ${Ext_Id}  ${Rule1}  ${Add_rule2}  ${Rule2}  ${Add_rule3}  ${Rule3}

    Click Element       ${Add_Button}
    Sleep       1s
#    Run Keyword If      '${Add_New_Ext}' == 'True'       Click Element           ${Add_New_Ext_Button}
#    Run Keyword If      '${Add_New_Ext}' == 'False'      Click Element          ${Add_Existing_Ext_Button}
    Sleep       1s

    Run Keyword If      '${Add_New_Ext}' == 'True' and '${Ext_Id}' != '#BLANK'    Input Text        ${Ext_Id_Field}  ${Ext_Id}
    Run Keyword If      '${Add_New_Ext}' == 'False' and '${Ext_Id}' != '#BLANK'    Click Element        ${Ext_Id_Dropdown}
    Sleep       1s

    Run Keyword If      '${Add_New_Ext}' == 'False' and '${Ext_Id}' != '#BLANK'    Click Element        ${Ext_Id_1}
    Sleep       1s

    Add_Edit Extension  ${Rule1}  ${Add_rule2}  ${Rule2}  ${Add_rule3}  ${Rule3}

Edit Extension
      [Arguments]     ${Ext_Id}  ${Rule1}  ${Add_rule2}  ${Rule2}  ${Add_rule3}  ${Rule3}

      Click Edit Element With 1 Info      ${Ext_Id}
      Sleep       1s

      Add_Edit Extension  ${Rule1}  ${Add_rule2}  ${Rule2}  ${Add_rule3}  ${Rule3}

Add_Edit Extension
    [Arguments]     ${Rule1}  ${Add_rule2}  ${Rule2}  ${Add_rule3}  ${Rule3}

    Run Keyword If       '${Rule1}' != '#BLANK'       Input Text        ${Rule1_Field}              ${Rule1}

    Run Keyword If           '${Add_rule2}' == 'add'      Click Element     ${Add_Rule_Button}
    Sleep       1s
    Run Keyword If       '${Rule2}' != '#BLANK'       Input Text        ${Rule2_Field}              ${Rule2}

    Run Keyword If           '${Add_rule3}' == 'add'      Click Element     ${Add_Rule_Button}
    Sleep       1s
    Run Keyword If       '${Rule3}' != '#BLANK'       Input Text        ${Rule3_Field}              ${Rule3}
    Sleep       1s

    Click Element     ${Confirm_Add_Type_Input_2}  
    Sleep       3s

Add Local_area
    [Arguments]     ${Prefix}  ${Extension}

    Click Element             ${Add_Button}
    Sleep       1s
    Run Keyword If       '${Prefix}' != '#BLANK'       Input Text           ${Prefix_Field}              ${Prefix}

    Run Keyword If       '${Extension}' != '#BLANK'    Click Element        ${Extension_Dropdown}
    Sleep       1s
    Run Keyword If           '${Extension}' == '1'         Click Element        ${Extension_1}
    Run Keyword If           '${Extension}' == '2'         Click Element        ${Extension_2}
    Sleep       1s

    Click Element           ${Confirm_Add_Type_Input_2}
    Sleep       3s

Edit Local_area
    [Arguments]     ${Prefix}  ${Extension}  ${New_Extension}

    Click Edit Element With 2 Info LocalArea      ${Prefix}  ${Extension}
    Sleep       2s

    Run Keyword If       '${New_Extension}' != '#BLANK'    Click Element        ${Extension_Dropdown}
    Sleep       1s
    Run Keyword If           '${New_Extension}' == '1'         Click Element        ${Extension_1}
    Run Keyword If           '${New_Extension}' == '2'         Click Element        ${Extension_2}
    Sleep       1s

    Click Element             ${Confirm_Add_Type_Input_2}
    Sleep       3s