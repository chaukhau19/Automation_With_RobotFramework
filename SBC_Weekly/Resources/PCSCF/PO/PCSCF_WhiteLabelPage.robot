*** Settings ***
Library  SeleniumLibrary
Resource  ../../Common.robot
Resource  ../../../Data/InputData.robot

*** Variables ***
${Whitelabel_section}               xpath=//a[@class='collapsible-header first-menu' and text()='White label']
# ${Whitelabel_section}             xpath=//a[contains(text(),'White label')]
${Sub_Whitelabel_section}           xpath=//a[@class='sub-menu'][contains(text(),'White label')]
${Edit_Whitelabel_Button}                      xpath=//div[@class='footer-button']//a[1]
${Reset_Whitelabel_Button}                      xpath=//div[@class='footer-button']//a[2]
${Filtering_True_Button}             xpath=//label[@for='filtering']//following::div[1]/button[contains(.,'True')]
${Filtering_False_Button}            xpath=//label[@for='filtering']//following::div[1]/button[contains(.,'False')]
${Routing_Whitelabel}                xpath=//label[@for='routing']//following::div[1]/button[contains(.,'Whitelabel')]
${Routing_Registering}               xpath=//label[@for='routing']//following::div[1]/button[contains(.,'Registering')]
${Default_Domain_False}              xpath=//label[@for='display_domain']//following::div[1]/button[contains(.,'False')]
${Default_Domain_True}               xpath=//label[@for='display_domain']//following::div[1]/button[contains(.,'True')]
${Domain_Field}                      id=domain
${Config_File_False}                 xpath=//label[@for='display_file']//following::div[1]/button[contains(.,'False')]
${Config_File_True}                  xpath=//label[@for='display_file']//following::div[1]/button[contains(.,'True')]
${Upload_Button}                     xpath=//label[@for='white_label_file']//following::div[1]/button[contains(.,'Upload')]
${Edit_File_Button}                  xpath=//label[@for='white_label_file']//following::div[1]/button[contains(.,'Edit')]
${Configuration_Browser}            id=file_upload
${Configuration_Field}              id=file_content
${Request_Uri_False}                xpath=//label[@for='use_request_uri']//following::div[1]/button[contains(.,'False')]
${Request_Uri_True}                 xpath=//label[@for='use_request_uri']//following::div[1]/button[contains(.,'True')]
${Config_File_Field}                id=filepath
${Add_White_Label}                  xpath=//button[@value='add-more-Whitelabel']
${Remove_White_Label_1}             xpath=//fieldset[1]/button[@class='remove-button-control']
${Remove_White_Label_2}             xpath=//fieldset[2]/button[@class='remove-button-control']
${Label_1_Field}                    xpath=//input[@id='whitelabels-0-white_label']
${Domain_1_Field}                   xpath=//input[@id='whitelabels-0-domain_name']
${Label_2_Field}                    xpath=//input[@id='whitelabels-1-white_label']
${Domain_2_Field}                   xpath=//input[@id='whitelabels-1-domain_name']

${Fiiltering_section}               xpath=//li[@class='active']//a[@class='sub-menu'][contains(text(),'Filtering Profile')]
${Whitelabel_TPIP_Dropdown}         xpath=//label[@for='tpip']//preceding::div[1]/input
${TPIP_1_Field}                     xpath=//label[@for='tpip']//preceding::div[1]//span[text()='home']
${TPIP_2_Field}                     xpath=//label[@for='tpip']//preceding::div[1]//span[text()='extern']
${Header_Field_Filterting}          xpath=//div[@class='row col 12 header-content']
*** Keywords ***
Go to PCSCF tab

    Click Element        ${PCSCF_tab}
    Sleep       1s

Go to Whitelabel section in PCSCF tab

    Click Element        ${Whitelabel_section}
     Sleep       1s


Go to Whitelabel section in Whitelabel tab

    Click Element        ${Sub_Whitelabel_section}
     Sleep       1s
Go to Filtering section in Whitelabel tab
    Click Element        ${Fiiltering_section}
     Sleep       1s
Edit Whitelabel
    [Arguments]     ${Filtering}   ${Routing}	 ${Default_Domain}  ${Domain}  ${Request_Uri}	 ${Config_File}   ${Config_File_Dir}
    ...  ${White_Label_1}  ${Label_1}  ${Domain_1}  ${White_Label_2}  ${Label_2}  ${Domain_2}

    Click Element       ${Edit_Whitelabel_Button}
    Sleep       2s
    Run Keyword If  '${Filtering}' == 'True'                                     Click Element              ${Filtering_True_Button}
    ...   ELSE IF   '${Filtering}' == 'False'                                    Click Element              ${Filtering_False_Button}

    Run Keyword If  '${Routing}' == 'whitelabel'                                 Click Element              ${Routing_Whitelabel}
    ...   ELSE IF   '${Routing}' == 'registering'                                Click Element              ${Routing_Registering}

    Run Keyword If   '${Default_Domain}' == 'False'                              Click Element              ${Default_Domain_False}
    ...    ELSE IF   '${Default_Domain}' == 'True'           Run Keywords        Click Element              ${Default_Domain_True}  AND  Sleep       1s  AND  Input Text  ${Domain_Field}  ${Domain}

    Run Keyword If   '${Request_Uri}' == 'False'                                 Click Element              ${Request_Uri_False}
    ...    ELSE IF   '${Request_Uri}' == 'True'                                  Click Element              ${Request_Uri_True}
    Sleep       2s

    Run Keyword If   '${Config_File}' == 'False'                                 Click Element              ${Config_File_False}
    ...    ELSE IF   '${Config_File}' == 'True'                                  Click Element              ${Config_File_True}
    Sleep       1s

    #Run Keyword If   '${Config_File}' == 'True' and '${Action}' == 'Upload'    Click Element              ${Upload_Button}
    #Run Keyword If   '${Config_File}' == 'True' and '${Action}' == 'Edit'      Click Element              ${Edit_File_Button}
    #Sleep       1s
    #Run Keyword If   '${Config_File}' == 'True' and '${Action}' == 'Upload'    choose file                ${Configuration_Browser}    ${Config_File_Path}
    #Run Keyword If   '${Config_File}' == 'True' and '${Action}' == 'Edit'      Input Text                 ${Configuration_Field}      ${Input}
    #Sleep       3s
    Run Keyword If   '${Config_File}' == 'True'                                 Input Text              ${Config_File_Field}  ${Config_File_Dir}
    Sleep       1s
    Run Keyword If    '${White_label_1}' == 'add'                               Click Element           ${Add_White_Label}
    ...    ELSE IF   '${White_label_1}' == 'remove'                             Click Element           ${Remove_White_Label_1}
    Sleep       1s
    Run Keyword If   '${Label_1}' != '#BLANK'                                 Input Text              ${Label_1_Field}  ${Label_1}
    Run Keyword If   '${Domain_1}' != '#BLANK'                                Input Text              ${Domain_1_Field}  ${Domain_1}

    Run Keyword If    '${White_label_2}' == 'add'                                Click Element           ${Add_White_Label}
    ...    ELSE IF    '${White_label_2}' == 'remove'                             Click Element           ${Remove_White_Label_2}
    Sleep       1s
    Run Keyword If   '${Label_2}' != '#BLANK'                                 Input Text              ${Label_2_Field}  ${Label_2}
    Run Keyword If   '${Domain_2}' != '#BLANK'                                Input Text              ${Domain_2_Field}  ${Domain_2}
    Sleep       1s
    Click Element       ${Confirm_Add_Type_Input_2}
    Sleep       3s

Add Filtering
    [Arguments]     ${Name}   ${TPIP}  ${TPIP1}  ${TPIP2}

    Click Element       ${Add_Button}
    Sleep       1s
    Run Keyword If   '${Name}' != '#BLANK'                                 Input Text              ${Name_Field}  ${Name}

    Run Keyword If  '${TPIP}' != '#BLANK'                                        Click Element           ${Whitelabel_TPIP_Dropdown}
    Sleep       1s
    Run Keyword If  '${TPIP1}' == 'home'              Click Element           ${TPIP_1_Field}
    Run Keyword If  '${TPIP2}' == 'extern'            Click Element           ${TPIP_2_Field}
    Sleep       1s
    Click Element    ${Name_Field}
    Sleep       1s
    Click Element       ${Confirm_Add_Type_Button}
    Sleep       3s

Edit Filtering
    [Arguments]     ${Name}   ${TPIP}  ${TPIP1}  ${TPIP2}

    Click Edit Element With 1 Info      ${Name}
    Sleep       1s
    Run Keyword If  '${TPIP}' != '#BLANK'                                        Click Element           ${Whitelabel_TPIP_Dropdown}
    Sleep       1s
    Run Keyword If  '${TPIP1}' == 'home'              Click Element           ${TPIP_1_Field}
    Run Keyword If  '${TPIP2}' == 'extern'            Click Element           ${TPIP_2_Field}
    Sleep       1s
    Click Element    ${Header_Field_Filterting}
    Sleep       1s
    Click Element       ${Confirm_Add_Type_Button}
    Sleep       3s