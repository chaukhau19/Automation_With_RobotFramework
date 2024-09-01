*** Settings ***
Library  SeleniumLibrary
Resource  ../../Common.robot
Resource  ../../../Data/InputData.robot
*** Variables ***
#Card
${Card_section}                         xpath=//a[contains(text(),'Card')]
${Protocol_Dropdown}                    xpath=//label[@for='protocol']//preceding::div[1]/input
${Protocol_IPv4}                        xpath=//label[@for='protocol']//preceding::div[1]/ul/li[1]
${Protocol_IPv6}                        xpath=//label[@for='protocol']//preceding::div[1]/ul/li[2]
${Netmask_Field}                        id=netmask
${Gateway_Field}                        id=gateway
#Profile
${Profile_section}                      xpath=//a[text()='Profile']
${First_Card_Dropdown}                  xpath=//label[@for='card1']//preceding::div[1]/input
${Second_Card_Dropdown}                 xpath=//label[@for='card2']//preceding::div[1]/input
${Third_Card_Dropdown}                  xpath=//label[@for='card3']//preceding::div[1]/input
${Forth_Card_Dropdown}                  xpath=//label[@for='card4']//preceding::div[1]/input
${Fifth_Card_Dropdown}                  xpath=//label[@for='card5']//preceding::div[1]/input
${Sixth_Card_Dropdown}                  xpath=//label[@for='card6']//preceding::div[1]/input
${Seventh_Card_Dropdown}                xpath=//label[@for='card7']//preceding::div[1]/input
${Eighth_Card_Dropdown}                 xpath=//label[@for='card8']//preceding::div[1]/input
${First_Card}                           xpath=//label[@for='card1']//preceding::div[1]//span[contains(.,'profile_voc1')]
${Second_Card}                          xpath=//label[@for='card2']//preceding::div[1]//span[contains(.,'profile_voc2')]
${Third_Card}                           xpath=//label[@for='card3']//preceding::div[1]//span[contains(.,'profile_voc3')]
${Forth_Card}                           xpath=//label[@for='card4']//preceding::div[1]//span[contains(.,'profile_voc4')]
${Fifth_Card}                           xpath=//label[@for='card5']//preceding::div[1]//span[contains(.,'profile_voc5')]
${Sixth_Card}                           xpath=//label[@for='card6']//preceding::div[1]//span[contains(.,'profile_voc6')]
${Seventh_Card}                         xpath=//label[@for='card7']//preceding::div[1]//span[contains(.,'profile_voc7')]
${Eighth_Card}                          xpath=//label[@for='card8']//preceding::div[1]//span[contains(.,'profile_voc8')]
#TCGW
${TCGW_section}                         xpath=//a[contains(text(),'TCGW')]
${Profile_Dropdown}                     xpath=//label[@for='profile']//preceding::div[1]/input
#${Profile_1}                           xpath=//label[@for='profile']//preceding::div[1]/ul/li[1]
#${Profile_2}                           xpath=//label[@for='profile']//preceding::div[1]/ul/li[2]
${Profile_1}                            xpath=//label[contains(text(),'Profile')]//preceding-sibling::div[@class='select-wrapper']/ul/li[contains(.,'tcgwprof1')]
${Profile_2}                            xpath=//label[contains(text(),'Profile')]//preceding-sibling::div[@class='select-wrapper']/ul/li[contains(.,'tcgwprof2')]
${Profile_3}                            xpath=//label[contains(text(),'Profile')]//preceding-sibling::div[@class='select-wrapper']/ul/li[contains(.,'auto_profile1')]

*** Keywords ***

Go to TCGW tab
    Click Element        ${Transcoding_tab}
    Sleep       1s

Go to Card section in TCGW tab
    Click Element        ${Card_section}
    Sleep   1s
    Wait Until Page Contains Element    ${Data_table}         20

Go to Profile section in TCGW tab
    Click Element        ${Profile_section}
    Sleep   1s
    Wait Until Page Contains Element    ${Data_table}         20

Go to TCGW section in TCGW tab
    Click Element        ${TCGW_section}
    Sleep   1s
    Wait Until Page Contains Element    ${Data_table}         20

Add TCGWCard
    [Arguments]  ${Name}  ${Protocol}  ${IP}  ${Netmask}  ${Gateway}

    Click Element       ${Add_Button}
    Sleep  1.5s
    Run Keyword If  '${Name}' != '#BLANK'           Input Text          ${Name_Field}           ${Name}

    Run Keyword If  '${Protocol}' != '#BLANK'        Click Element       ${Protocol_Dropdown}
    Sleep       2s
    IF             '${Protocol}' == 'IPV4'          Click Element       ${Protocol_IPv4}
    ...  ELSE IF   '${Protocol}' == 'IPV6'          Click Element       ${Protocol_IPv6}
    Sleep       2s
    Run Keyword If  '${IP}' != '#BLANK'              Input Text         ${IP_Field}             ${IP}
    Run Keyword If  '${Netmask}' != '#BLANK'         Input Text         ${Netmask_Field}        ${Netmask}
    Run Keyword If  '${Gateway}' != '#BLANK'         Input Text         ${Gateway_Field}        ${Gateway}
    Sleep  1.5s

    Click Element  ${Confirm_Add_Type_Input_2}
    Sleep       3s

View TCGWCard
    [Arguments]     ${Name}   ${IP}  ${Netmask}  ${Gateway}  ${Protocol}

    Click View Element With 2 Info          ${Name}  ${IP}
    Sleep       2s

    Verify Page Contains 2 Expected Elements                                                     Name                                           ${Name}
    Verify Page Contains 2 Expected Elements                                                     IP                                             ${IP}
    Verify Page Contains 2 Expected Elements                                                     Netmask                                        ${Netmask}
    Verify Page Contains 2 Expected Elements                                                     Gateway                                        ${Gateway}
    Verify Page Contains 2 Expected Elements                                                     Protocol                                       ${Protocol}

Add TCGWProfile
    [Arguments]  ${Name}  ${1st_card}  ${2nd_card}  ${3rd_card}  ${4th_card}  ${5th_card}  ${6th_card}  ${7th_card}  ${8th_card}

    Click Element           ${Add_Button}
    Sleep       1s
    Run Keyword If      '${Name}' != '#BLANK'                       Input Text          ${Name_Field}           ${Name}

    Run Keyword If      '${1st_card}' != '#BLANK'                   Click Element       ${First_Card_Dropdown}
    Sleep       1s
    Run Keyword If      '${1st_card}' != '#BLANK'                   Click Element       ${First_Card}
    Sleep       2s

    Run Keyword If      '${2nd_card}' != '#BLANK'                   Click Element       ${Second_Card_Dropdown}
    Sleep       1s
    Run Keyword If      '${2nd_card}' != '#BLANK'                   Click Element       ${Second_Card}
    Sleep       2s

    Run Keyword If      '${3rd_card}' != '#BLANK'                   Click Element       ${Third_Card_Dropdown}
    Sleep       1s
    Run Keyword If      '${3rd_card}' != '#BLANK'                   Click Element       ${Third_Card}
    Sleep       2s

    Run Keyword If      '${4th_card}' != '#BLANK'                   Click Element       ${Forth_Card_Dropdown}
    Sleep       1s
    Run Keyword If      '${4th_card}' != '#BLANK'                   Click Element       ${Forth_Card}
    Sleep       2s

    Run Keyword If      '${5th_card}' != '#BLANK'                   Click Element       ${Fifth_Card_Dropdown}
    Sleep       1s
    Run Keyword If      '${5th_card}' != '#BLANK'                   Click Element       ${Fifth_Card}
    Sleep       2s

    Run Keyword If      '${6th_card}' != '#BLANK'                   Click Element       ${Sixth_Card_Dropdown}
    Sleep       1s
    Run Keyword If      '${6th_card}' != '#BLANK'                   Click Element       ${Sixth_Card}
    Sleep       2s

    Run Keyword If      '${7th_card}' != '#BLANK'                   Click Element       ${Seventh_Card_Dropdown}
    Sleep       1s
    Run Keyword If      '${7th_card}' != '#BLANK'                   Click Element       ${Seventh_Card}
    Sleep       2s

    Run Keyword If      '${8th_card}' != '#BLANK'                   Click Element       ${Eighth_Card_Dropdown}
    Sleep       2s
    Run Keyword If      '${8th_card}' != '#BLANK'                   Click Element       ${Eighth_Card}
    Sleep       1s

    Click Element    ${Confirm_Add_Type_Input_2}
    Sleep       3s

Add TCGW
    [Arguments]  ${Name}  ${IP}  ${Profile}

    Click Element       ${Add_Button}
    Sleep       1s
    Run Keyword If  '${Name}' != '#BLANK'           Input Text          ${Name_Field}           ${Name}
    Run Keyword If  '${IP}' != '#BLANK'             Input Text          ${IP_Field}           ${IP}

    Run Keyword If   '${Profile}' != '#BLANK'       Click Element       ${Profile_Dropdown}
    Sleep       1s
    Run Keyword If       '${Profile}' == '1'            Click Element       ${Profile_1}
    Run Keyword If       '${Profile}' == '2'            Click Element       ${Profile_2}
    Run Keyword If       '${Profile}' == '3'            Click Element       ${Profile_3}
    Sleep       1s

    Click Element   ${Confirm_Add_Type_Input_2} 
    Sleep       3s