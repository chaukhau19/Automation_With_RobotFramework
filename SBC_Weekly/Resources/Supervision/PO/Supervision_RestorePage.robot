*** Settings ***
Library  SeleniumLibrary
Resource  ../../Common.robot

*** Variables ***

##################---ELEMENT---#####################
${IP}  xpath=//input[@id='ip']
${Port}  xpath=//input[@id='port']
${Description}  xpath=//input[@id='description']

##################---BUTTON---@#####################
${Choose_file_button}       xpath=//input[@id="upload_file"]
${Restore_button}           xpath=//input[@id="restore"]
##################---Restore- Page---@#####################
${Restore_tab}              xpath=//*[@class='first-menu' and contains(text(),'Restore')]
${Backup_tab}              xpath=//*[@href='/supervision/backup/index']
*** Keywords ***
Navigate to Restore section in Supervision Page
    Click Element   ${Supervision_tab}
    Sleep       2s
    Click Element   ${Restore_tab}
    Sleep       2s


Navigate to Backup section in Supervision Page
    Click Element   ${Supervision_tab}
    Sleep       2s
    Click Element   ${Backup_tab}
    Sleep       2s

# Backup Valid configuration
#     [Arguments]     ${Path_File}    ${Remove_File}
#     Change The Owner File To Omni            ${HOST_CIRPACK}


Restore Valid configuration
    [Arguments]     ${Path_File}    ${Remove_File}
    Create file with permission Omni
    
    Remove Configuration File In /home/etc   ${HOST_CIRPACK}
    Create file with Empty File
    Create file with permission Root
    Create file with permission Omni
    Change The Owner File To Omni            ${HOST_CIRPACK}        
    
    Run Keyword If   '${Path_File}' == 'OneFile_Omni'              choose file    ${Choose_file_button}      ${Restore_Only_One_File_Omni}
    ...   ELSE IF    '${Path_File}' == 'MultipleFiles_Omni'        choose file    ${Choose_file_button}      ${Restore_Multiple_Files_Omni}
    ...   ELSE IF    '${Path_File}' == 'Empty_File'                choose file    ${Choose_file_button}      ${Restore_Empty_File}  
    Click Element    ${Restore_button}
    Sleep   2s
    
Restore Invalid configuration
    [Arguments]     ${Path_File}    ${Remove_File}
    Create file with permission Root
    Remove Configuration File In /home/etc   ${HOST_CIRPACK}
    Create file with Empty Folder
    Create file with permission Root
    Create file with permission Omni
    Change The Owner File To Root            ${HOST_CIRPACK}

    Run Keyword If   '${Path_File}' == 'OneFile_Root'            choose file    ${Choose_file_button}      ${Restore_Only_One_File_Root}
    ...   ELSE IF    '${Path_File}' == 'MultipleFiles_Root'      choose file    ${Choose_file_button}      ${Restore_Multiple_Files_Root}
    ...   ELSE IF    '${Path_File}' == 'Empty_Folder'            choose file    ${Choose_file_button}      ${Restore_One_Folder}
    Click Element    ${Restore_button}
    Sleep   2s