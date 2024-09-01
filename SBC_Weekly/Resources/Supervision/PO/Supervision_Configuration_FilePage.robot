*** Settings ***
Library  SeleniumLibrary
Resource  ../../Common.robot

*** Variables ***

##################---BUTTON---@#####################
${Choose_file_button}       xpath=//input[@id="file_upload"]
${Reload_button}            xpath=//input[@id='reload_button']
${Reload_Config_button}     xpath=//button[@name='reload_cfg']
${Save_button}              xpath=//input[@id='save']
${Upload_button}            xpath=//input[@id='upload']
${Download_button}          xpath=//input[@id="download"]

##################---Configuration-File-Page---@#####################
${Configuration_File_tab}              xpath=//*[@class='first-menu' and contains(text(),'Configuration file')]
${Proxy_dropdown}                      xpath=//label[contains(text(),'Proxy: ')]//following::input[@class='select-dropdown']
${Proxy_Module_BGCF}                   xpath=//select[@id='list_proxies']//preceding-sibling::ul/li[span[text()='bgcf']]
${Proxy_Module_ECSCF}                  xpath=//select[@id='list_proxies']//preceding-sibling::ul/li[span[text()='ecscf']]
${Proxy_Module_IBCF}                   xpath=//select[@id='list_proxies']//preceding-sibling::ul/li[span[text()='ibcf']]
${Proxy_Module_ICSCF}                  xpath=//select[@id='list_proxies']//preceding-sibling::ul/li[span[text()='icscf']]
${Proxy_Module_PCSCF}                  xpath=//select[@id='list_proxies']//preceding-sibling::ul/li[span[text()='pcscf']]
${Proxy_Module_SCSCF}                  xpath=//select[@id='list_proxies']//preceding-sibling::ul/li[span[text()='scscf']]
#${Proxy_Module_ECSCF}                 xpath=//label[contains(text(),'Proxy: ')]//following::input[@class='select-dropdown']//following::li[span[text()='scscf']]

${Configuration_file_select_dropdown}                xpath=//label[contains(text(),'Configuration file select')]//following::input[@class='select-dropdown'][1]
${Configuration_file_select_None}                    xpath=//select[@id='list_files']//preceding-sibling::ul/li[span[text()='NONE']]
${Configuration_file_select_Omni}                    xpath=//select[@id='list_files']//preceding-sibling::ul/li[span[text()='1_test_config_file_omni.cfg']]
${Configuration_file_select_Root}                    xpath=//select[@id='list_files']//preceding-sibling::ul/li[span[text()='2_test_config_file_root.cfg']]
${Configuration_file_select_Annsrv}                  xpath=//select[@id='list_files']//preceding-sibling::ul/li[span[text()='annsrv.cfg']]

${Edit_File_Field}                                   xpath=//textarea[@id="file_content"]

*** Keywords ***
Navigate to Configuration file section in Supervision Page
    Click Element   ${Supervision_tab}
    Sleep       2s
    Click Element   ${Configuration_File_tab}
    Sleep       2s

Reload configuration
    [Arguments]     ${Proxy_Module}

    Run Keyword If             '${Proxy_Module}' != '#BLANK'                          Click Element             ${Proxy_dropdown}
    Sleep       2s
    Run Keyword If             '${Proxy_Module}' == 'BGCF'                            Click Element             ${Proxy_Module_BGCF}
    ...    ELSE IF             '${Proxy_Module}' == 'ECSCF'                           Click Element             ${Proxy_Module_ECSCF}
    ...    ELSE IF             '${Proxy_Module}' == 'IBCF'                            Click Element             ${Proxy_Module_IBCF}
    ...    ELSE IF             '${Proxy_Module}' == 'ICSCF'                           Click Element             ${Proxy_Module_ICSCF}
    ...    ELSE IF             '${Proxy_Module}' == 'PCSCF'                           Click Element             ${Proxy_Module_PCSCF}
    ...    ELSE IF             '${Proxy_Module}' == 'SCSCF'                           Click Element             ${Proxy_Module_SCSCF}
    Sleep       2s
    Click Element             ${Reload_button}


Get Log Reload
    [Arguments]   ${HOST}  ${Credentials}
    Common.Open SSH Connection To Remote Server  ${HOST}   ${USER_SIPP}    ${PASS_SIPP}
    ${output}=  Execute Command     tail -1 /home/log/mgt.log
    #Execute Command     Sleep   30s
    Sleep    5s
    Log     ${output}
    Close All Connections
    RETURN  ${output}




Upload Valid Configuration
   [Arguments]      ${Configuration_file_select}  ${Save_File}  ${Choose_File}  ${Edit_File}
 #Reload Configuration file select
    Run Keyword If             '${Configuration_file_select}' != '#BLANK'                          Click Element             ${Configuration_file_select_dropdown}
    Sleep       3s
    Run Keyword If             '${Configuration_file_select}' == 'NONE'                            Click Element             ${Configuration_file_select_None}
    ...    ELSE IF             '${Configuration_file_select}' == 'Omni File'                       Click Element             ${Configuration_file_select_Omni}
    ...    ELSE IF             '${Configuration_file_select}' == 'Root File'                       Click Element             ${Configuration_file_select_Root}
    Sleep       2s
    Click Element               ${Reload_Config_button}
    Sleep       2s


    Run Keyword If             '${Choose_File}' != '#Blank'            choose file          ${Choose_file_button}       ${Config_File_Path_Upload_Only_One_File_Omni}
    Sleep       2s
    Run Keyword If             '${Choose_File}' != '#Blank'            Click Element        ${Upload_button}
    Sleep       2s
    Run Keyword If             '${Edit_File}' != '#Blank'     Run Keywords     press keys     ${Edit_File_Field}    CTRL+a+BACKSPACE 
    ...  AND  Input Text     ${Edit_File_Field}  ${Edit_File}  AND   Sleep       3s
    Run Keyword If             '${Save_File}' == 'Save'                Click Element             ${Save_button}
    Sleep       2s




Select Again the Dropdown To Confirm It Is Correct
    [Arguments]      ${Configuration_file_select}
    Run Keyword If             '${Configuration_file_select}' != '#BLANK'                          Click Element             ${Configuration_file_select_dropdown}
    Sleep       2s
    Run Keyword If             '${Configuration_file_select}' == 'NONE'                            Click Element             ${Configuration_file_select_None}
    ...    ELSE IF             '${Configuration_file_select}' == 'Omni File'                       Click Element             ${Configuration_file_select_Omni}
    ...    ELSE IF             '${Configuration_file_select}' == 'Annsrv Config File'              Click Element             ${Configuration_file_select_Annsrv}
    ...    ELSE IF             '${Configuration_file_select}' == 'Root File'                       Click Element             ${Configuration_file_select_Root}
    Sleep       2s
    Click Element               ${Reload_Config_button}
    Sleep       3s





Upload Invalid Configuration
   [Arguments]      ${Configuration_file_select}  ${Save_File}  ${Choose_File}  ${Edit_File}

    Run Keyword If      '${Configuration_file_select}' != '#BLANK'                 Click Element      ${Configuration_file_select_dropdown}
    Sleep       2s
    Run Keyword If      '${Configuration_file_select}' == 'NONE'                   Run Keywords      Click Element      ${Configuration_file_select_None}      AND        Sleep   1.5s
    ...    ELSE IF      '${Configuration_file_select}' == 'Omni File'              Run Keywords      Click Element      ${Configuration_file_select_Omni}      AND        Sleep   1.5s
    ...    ELSE IF      '${Configuration_file_select}' == 'Annsrv Config File'     Run Keywords      Click Element      ${Configuration_file_select_Annsrv}    AND        Sleep   1.5s
    ...    ELSE IF      '${Configuration_file_select}' == 'Root File'              Run Keywords      Click Element      ${Configuration_file_select_Root}      AND        Sleep   1.5s
    
    Click Element        ${Reload_Config_button}
    Sleep  2.5s
    Run Keyword If      '${Choose_File}' != '#Blank'        choose file               ${Choose_file_button}       ${Config_File_Path_Upload_Only_One_File_Omni}
    Sleep  2.5s
    Run Keyword If      '${Choose_File}' != '#Blank'        Click Element             ${Upload_button}
    Sleep  2.5s
    Run Keyword If      '${Edit_File}' != '#Blank'          Run Keywords     press keys     ${Edit_File_Field}    CTRL+a+BACKSPACE  AND  Input Text     ${Edit_File_Field}  ${Edit_File}
    Sleep  2.5s
    Run Keyword If      '${Save_File}' == 'Save' and '${Choose_File}' == '#Blank'       Click Element        ${Save_button}
    Sleep  2.5s






Upload and Download Configuration
   [Arguments]      ${Configuration_file_select}  ${Save_File}  ${Choose_File}  ${Edit_File}
    #Download
    Run Keyword If     '${Configuration_file_select}' != '#BLANK'         Click Element         ${Configuration_file_select_dropdown}
    Sleep       1s
    Run Keyword If     '${Configuration_file_select}' == 'Omni File'      Run Keyword      Click Element      ${Configuration_file_select_Omni}    
    ...    ELSE IF     '${Configuration_file_select}' == 'Root File'      Run Keyword      Click Element      ${Configuration_file_select_Root}   
    Sleep       1s
    Click Element      ${Reload_Config_button}
    Sleep       2s
    Click Element      ${Download_button}    
    Sleep       2s

    #Upload
    Run Keyword If     '${Choose_File}' == 'omni'    choose file        ${Choose_file_button}       ${Config_File_Path_Download_Only_One_File_Omni}
    ...    ELSE IF     '${Choose_File}' == 'root'    choose file        ${Choose_file_button}       ${Config_File_Path_Download_Only_One_File_Root}
    Sleep       4s
    Run Keyword If     '${Choose_File}' != '#BLANK'  Click Element      ${Upload_button}
    Sleep       3s

    #Edit_Save
    Run Keyword If     '${Edit_File}' != '#BLANK'   Run Keywords     press keys     ${Edit_File_Field}    CTRL+a+BACKSPACE  AND  Input Text     ${Edit_File_Field}  ${Edit_File}
    Sleep       2s
    Run Keyword If     '${Save_File}' == 'Save'     Click Element    ${Save_button}
    Sleep       2s









##############################################################################################################
Verify Page Contains Content Of Configuration File
  [Arguments]      ${Save_File}    ${Content_of_Configuration_File}
  Run Keyword If         '${Content_of_Configuration_File}' == '#Blank'     Page Should Not Contain Element      ${Upload_button}
  Run Keyword If         '${Save_File}' != '#Blank'                         Page Should Contain                  ${Content_of_Configuration_File}


Verify Page Not Contains Content Of Configuration File
  [Arguments]     ${Configuration_file_select}   ${Save_File}   ${Choose_File}     ${Content_of_Configuration_File}
  Run Keyword If         '${Save_File}' == 'Not Save' and '${Choose_File}' == '#Blank'                                        Page Should Contain                  ${Content_of_Configuration_File}
  Run Keyword If         '${Configuration_file_select}' == 'Root File' and '${Save_File}' == 'Save'          Run Keywords     Verify Page Contains Error Message   ${Content_of_Configuration_File}
  ...     AND   Click Element    ${Close_button}
  #Verify Upload Root File
  Run Keyword If         '${Save_File}' == '#Blank' and '${Choose_File}' != '#Blank'                         Run Keywords     Page Should Contain                  ${Content_of_Configuration_File}
  ...     AND   Click Element    ${Close_button}
  #Verify Upload Root File And Then Save
  Run Keyword If         '${Save_File}' == 'Save' and '${Choose_File}' != '#Blank'          Run Keywords     Click Element          ${Save_button}
  ...     AND   Page Should Contain     Cannot write file ( because wrong permissions are requested, 2_test_config_file_root.cfg should be omni permission )   AND   Click Element    ${Close_button}


Verify Download Successfully
  [Arguments]     ${Configuration_file_select}   ${Save_File}   ${Choose_File}     ${Content_of_Configuration_File}
  ${Log_Download_Omni} =    OperatingSystem.Get File     ${Config_File_Path_Download_Only_One_File_Omni}
  ${Log_Download_Root} =    OperatingSystem.Get File     ${Config_File_Path_Download_Only_One_File_Root}
  Log  ${Log_Download_Omni}
  Log  ${Log_Download_Root}
  Log  ${Content_of_Configuration_File}
  Run Keyword If  '${Configuration_file_select}' == 'Omni File'   Should Contain    ${Content_of_Configuration_File}  ${Log_Download_Omni}
  ...    ELSE IF  '${Configuration_file_select}' == 'Root File'   Should Contain    ${Content_of_Configuration_File}  ${Log_Download_Root}
  # Run Keyword If  '${Configuration_file_select}' == 'Root File'   Run Keywords      remove file   ${Config_File_Path_Download_Only_One_File_Omni}
  # ...     AND   remove file  ${Config_File_Path_Download_Only_One_File_Root}