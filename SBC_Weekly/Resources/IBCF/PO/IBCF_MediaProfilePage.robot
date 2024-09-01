*** Settings ***
Library  SeleniumLibrary
Resource  ../../Common.robot
Resource  ../../../Data/InputData.robot

*** Variables ***

*** Keywords ***
Go to IBCF tab
    Click Element        ${IBCF_tab}
    Sleep       1s

Go to Media Profile section in IBCF tab
    Click Element        ${MP_section}
    Sleep   1s
    Wait Until Page Contains Element    ${Data_table}         20

Add MediaProfile
    [Arguments]     ${Index}  ${2833_mode}	${INFO_mode}	  ${INBAND_mode}	${INFO_variant}    ${Ptime_preferred}    ${Ptime_minimum}	  ${Ptime_maximum}
    ...             ${Fax_mode}   ${Fax_detection}	  ${Fax_codec}      ${Code_adaptation_mode}

    Click Element       ${Add_Button}
    Sleep       2s

    Run Keyword If  '${Index}' != '#BLANK'                              Input Text                  ${Index_Field}              ${Index}

    Add_Edit Media Profile      ${2833_mode}	${INFO_mode}	  ${INBAND_mode}	${INFO_variant}    ${Ptime_preferred}    ${Ptime_minimum}	  ${Ptime_maximum}
    ...             ${Fax_mode}   ${Fax_detection}	  ${Fax_codec}      ${Code_adaptation_mode}

Edit MediaProfile
    [Arguments]     ${Index}  ${2833_mode}	${INFO_mode}	  ${INBAND_mode}	${INFO_variant}    ${Ptime_preferred}    ${Ptime_minimum}	  ${Ptime_maximum}
    ...             ${Fax_mode}   ${Fax_detection}	  ${Fax_codec}      ${Code_adaptation_mode}

    Click Edit Element With 1 Info      ${Index}
    Sleep       1s
    Add_Edit Media Profile      ${2833_mode}	${INFO_mode}	  ${INBAND_mode}	${INFO_variant}    ${Ptime_preferred}    ${Ptime_minimum}	  ${Ptime_maximum}
    ...             ${Fax_mode}   ${Fax_detection}	  ${Fax_codec}      ${Code_adaptation_mode}


Add_Edit Media Profile
     [Arguments]    ${2833_mode}	${INFO_mode}	  ${INBAND_mode}	${INFO_variant}    ${Ptime_preferred}    ${Ptime_minimum}	  ${Ptime_maximum}
    ...             ${Fax_mode}   ${Fax_detection}	  ${Fax_codec}      ${Code_adaptation_mode}
    #DTMF options
    Run Keyword If  '${2833_mode}' != '#BLANK'                          Click Element               ${2833_Mode_Dropdown}
    Sleep   1s
    Run Keyword If      '${2833_mode}' == 'transparent'                     Click Element               ${2833_Mode_Transparent}
    ...     ELSE IF     '${2833_mode}' == 'needed'                          Click Element               ${2833_Mode_Needed}
    ...     ELSE IF     '${2833_mode}' == 'removed'                         Click Element               ${2833_Mode_Removed}
    ...     ELSE IF     '${2833_mode}' == 'needed_when_not_pcm'             Click Element               ${2833_Mode_NotPCM}
    Sleep   1s

    Run Keyword If  '${INFO_mode}' != '#BLANK'                          Click Element               ${INFO_Mode_Dropdown}
    Sleep   1s
    Run Keyword If      '${INFO_mode}' == 'transparent'                     Click Element               ${INFO_Mode_Transparent}
    ...     ELSE IF     '${INFO_mode}' == 'supported'                       Click Element               ${INFO_Mode_Supported}
    ...     ELSE IF     '${INFO_mode}' == 'parallel'                        Click Element               ${INFO_Mode_Parallel}
    Sleep   1s

    Run Keyword If  '${INBAND_mode}' != '#BLANK'                      Click Element               ${INBAND_Mode_Dropdown}
    Sleep   1s
    Run Keyword If      '${INBAND_mode}' == 'enabled'                     Click Element               ${INBAND_Mode_Enabled}
    ...     ELSE IF     '${INBAND_mode}' == 'disabled'                    Click Element               ${INBAND_Mode_Disabled}
    Sleep   1s

    Run Keyword If  '${INFO_variant}' != '#BLANK'                       Click Element               ${INFO_Variant_Dropdown}
    Sleep   1s
    Run Keyword If     '${INFO_variant}' == 'dtmf'                           Click Element               ${INFO_Variant_DTMF}
    ...    ELSE IF     '${INFO_variant}' == 'dtmf-relay'                     Click Element               ${INFO_Variant_DTMF_Relay}
    Sleep   1s

    #Ptime options

    Run Keyword If  '${Ptime_preferred}' != '#BLANK'                              Input Text                  ${Ptime_Preferred_Field}              ${Ptime_preferred}
    Run Keyword If  '${Ptime_minimum}' != '#BLANK'                                Input Text                  ${Ptime_Minimum_Field}                ${Ptime_minimum}
    Run Keyword If  '${Ptime_maximum}' != '#BLANK'                                Input Text                  ${Ptime_Maximum_Field}                ${Ptime_maximum}

    #Fax transcoding

    Run Keyword If  '${Fax_mode}' != '#BLANK'                                   Click Element               ${Fax_Mode_Dropdown}
    Sleep   1s
    Run Keyword If      '${Fax_mode}' == 'transparent'                              Click Element               ${Fax_Mode_Transparent}
    ...     ELSE IF     '${Fax_mode}' == 'audio_only'                               Click Element               ${2833_Mode_Audio}
    ...     ELSE IF     '${Fax_mode}' == 'prefer_t38'                               Click Element               ${2833_Mode_T38}
    ...     ELSE IF     '${Fax_mode}' == 'compressed_codec_prevention'              Click Element               ${2833_Mode_Compressed}
    Sleep   1s

    Run Keyword If  '${Fax_detection}' != '#BLANK'                              Click Element               ${Fax_Detection_Dropdown}
    Sleep   1s
    Run Keyword If      '${Fax_detection}' == 'enable'                             Click Element               ${Fax_Detection_Enabled}
    ...     ELSE IF     '${Fax_detection}' == 'disable'                            Click Element               ${Fax_Detection_Disabled}
    Sleep   1s

    Run Keyword If  '${Fax_codec}' != '#BLANK'                                   Click Element               ${Fax_Codec_Dropdown}
    Sleep   1s
    Run Keyword If      '${Fax_codec}' == 'pcma_vbd'                                Click Element               ${Fax_Codec_PCMA}
    ...     ELSE IF     '${Fax_codec}' == 'PCMU_VBD'                                Click Element               ${Fax_Codec_PCMU}
    ...     ELSE IF     '${Fax_codec}' == 'PCMA_VBD,PCMU_VBD'                               Click Element               ${Fax_Codec_PCMA_PCMU}
    Sleep       3s

    #Codec adaptation

    Run Keyword If  '${Code_adaptation_mode}' != '#BLANK'                        Click Element               ${Code_Adaptation_Dropdown}
    Sleep   3s
    Run Keyword If      '${Code_adaptation_mode}' == '0'                                Click Element               ${Code_adaptation_0}
    ...     ELSE IF     '${Code_adaptation_mode}' == '2'                                Click Element               ${Code_adaptation_2}
    Sleep       1s

    Click Element    ${Confirm_Add_Type_3}
    Sleep       3s

View MediaProfile
    [Arguments]     ${Index}  ${2833_mode}	${INFO_mode}	  ${INBAND_mode}	${INFO_variant}    ${Ptime_preferred}    ${Ptime_minimum}	  ${Ptime_maximum}
    ...             ${Fax_mode}   ${Fax_detection}	  ${Fax_codec}

    Click View Element With 1 Info          ${Index}
    Sleep       3s

    Verify Page Contains 2 Expected Elements    Index                                                       ${Index}
    Verify Page Contains 2 Expected Elements    Mode 2833                                                   ${2833_mode}
    Verify Page Contains 2 Expected Elements    INFO mode                                                   ${INFO_mode}
    Verify Page Contains 2 Expected Elements    Inband mode                                                 ${INBAND_mode}
    Verify Page Contains 2 Expected Elements    INFO variant                                                ${INFO_variant}
    Verify Page Contains 2 Expected Elements    Ptime preferred                                             ${Ptime_preferred}
    Verify Page Contains 2 Expected Elements    Ptime minimum                                               ${Ptime_minimum}
    Verify Page Contains 2 Expected Elements    Ptime maximum                                               ${Ptime_maximum}
    Verify Page Contains 2 Expected Elements    Fax Mode                                                    ${Fax_mode}
    Verify Page Contains 2 Expected Elements    Fax Detection                                               ${Fax_detection}
    Verify Page Contains 2 Expected Elements    Fax Codec                                                   ${Fax_codec}
