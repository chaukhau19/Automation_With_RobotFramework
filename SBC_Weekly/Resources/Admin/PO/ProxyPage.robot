*** Settings ***
Library  SeleniumLibrary
Resource  ../../Common.robot
*** Variables ***
${Proxy_section}  xpath=//*[@class='first-menu' and text()='Proxy']

#Reset Proxy
${RESET}                xpath=//*[@href='/management/reset']
# ${RESET??}               xpath=(//div[@id='activehss' and contains(@class,'s12')]//following::a[@href='/management/reset'])[1]


#PCSCF
${PCSCF}                    xpath=//a[@href='#pcscf']
${DISPLAY_MENU_PCSCF}       xpath=//label[@for='display-pcscf']
${CRYTO}                xpath=//label[@for='display-pcscf-crypto']
${MEDIA_PROFILE}        xpath=//label[@for='display-pcscf-media_profile']
${BYPASS}               xpath=//label[@for='display-pcscf-bypass']
${WHITE_LABEL}          xpath=//label[@for='display-pcscf-white_label']
${IPV6}                 xpath=//label[@for='display-pcscf-IPv6']
${AKA}                  xpath=//label[@for='display-pcscf-AKA']
${SUBMIT_PCSCF}         xpath=//div[@id='pcscf']//button[@type='submit']


#PCSCF_STANDALONE
${PCSCF_STANDALONE}         xpath=//a[@href='#pcscf_standalone']
${DISPLAY_MENU_PCSCF_STANDALONE}         xpath=//label[@for='display-pcscf_standalone']
${CRYTO_STANDALONE}                xpath=//label[@for='display-pcscf_standalone-crypto']
${MEDIA_PROFILE_STANDALONE}        xpath=//label[@for='display-pcscf_standalone-media_profile']
${BYPASS_STANDALONE}               xpath=//label[@for='display-pcscf_standalone-bypass']
${WHITE_LABEL_STANDALONE}          xpath=//label[@for='display-pcscf_standalone-white_label']
${IPV6_STANDALONE}                 xpath=//label[@for='display-pcscf_standalone-IPv6']
${AKA_STANDALONE}                  xpath=//label[@for='display-pcscf_standalone-AKA']
${SUBMIT_PCSCF_STANDALONE}         xpath=//div[@id='pcscf_standalone']//button[@type='submit']



#IBCF
${IBCF}                         xpath=//a[@href='#ibcf']
${DISPLAY_MENU_IBCF}               xpath=//label[@for='display-ibcf']
${CRYTO_IBCF}                       xpath=//label[@for='display-ibcf-crypto']
${MEDIA_PROFILE_IBCF}               xpath=//label[@for='display-ibcf-media_profile']
${BYPASS_IBCF}                      xpath=//label[@for='display-ibcf-bypass']
${IPV6_IBCF}                        xpath=//label[@for='display-ibcf-IPv6']
${KA_IBCF}                          xpath=//label[@for='display-ibcf-keepalive']
${SUBMIT_IBCF}                      xpath=//div[@id='ibcf']//button[@type='submit']


#IBCF_STANDALONE
${IBCF_STANDALONE}                 xpath=//a[@href='#ibcf_standalone']
${DISPLAY_MENU_IBCF_STANDALONE}    xpath=//label[@for='display-ibcf_standalone']
${CRYTO_IBCF_STANDALONE}           xpath=//label[@for='display-ibcf_standalone-crypto']
${MEDIA_PROFILE_IBCF_STANDALONE}               xpath=//label[@for='display-ibcf_standalone-media_profile']
${BYPASS_IBCF_STANDALONE}          xpath=//label[@for='display-ibcf_standalone-bypass']
${IPV6_IBCF_STANDALONE}            xpath=//label[@for='display-ibcf_standalone-IPv6']
${KA_IBCF_STANDALONE}              xpath=//label[@for='display-ibcf_standalone-keepalive']
${SUBMIT_IBCF_STANDALONE}          xpath=//div[@id='ibcf_standalone']//button[@type='submit']


#BGCF
${BGCF}                     xpath=//a[@href='#bgcf']
${DISPLAY_MENU_BGCF}               xpath=//label[@for='display-bgcf']
${SUBMIT_BGCF}                     xpath=//div[@id='bgcf']//button[@type='submit']


#BGCF_STANDALONE
${BGCF_STANDALONE}          xpath=//a[@href='#bgcf_standalone']
${DISPLAY_MENU_BGCF_STANDALONE}    xpath=//label[@for='display-bgcf_standalone']
${SUBMIT_BGCF_STANDALONE}          xpath=//div[@id='bgcf_standalone']//button[@type='submit']

#Media
${Media}                    xpath=//a[@href='#media']
${Media_Forwarder}          xpath=//label[@for='display-media-forwarder']
${Media_Transcoding}        xpath=//label[@for='display-media-tcgw']
${Submit_Media}             xpath=//div[@id='media']//button[@type='submit']

#Sesion
${Pcscf_Session}      xpath=//*[@class='collapsible-header' and contains(text(),'Pcscf')]    
${Bgcf_Session}      xpath=//*[@class='collapsible-header' and contains(text(),'Bgcf')]    
${Ibcf_Session}      xpath=//*[@class='collapsible-header' and contains(text(),'Ibcf')]    
${Transcoding_Session}      xpath=//*[@class='collapsible-header' and contains(text(),'Transcoding')]    
${Media_Session}      xpath=//*[@class='collapsible-header' and contains(text(),'Media proxy')]  

*** Keywords ***

Navigate to Proxy Page
    Click Element  ${Admin_tab}
    Sleep       1s
    Click Element  ${Proxy_section}
    Sleep       1s

Display PCSCF to the List
    Click Element  ${PCSCF}
    Click Element  ${DISPLAY_MENU_PCSCF}
    Click Element  ${CRYTO}
    Click Element  ${MEDIA_PROFILE}
    Click Element  ${BYPASS}
    Click Element  ${WHITE_LABEL}
    Click Element  ${IPV6}
    Click Element  ${AKA}
    Click Element  ${SUBMIT_PCSCF}
    Sleep  5s

Display PCSCF_STANDALONE to the List
    Click Element  ${PCSCF_STANDALONE}
    Click Element  ${DISPLAY_MENU_PCSCF_STANDALONE}
    Click Element  ${CRYTO_STANDALONE}
    Click Element  ${MEDIA_PROFILE_STANDALONE}
    Click Element  ${BYPASS_STANDALONE}
    Click Element  ${WHITE_LABEL_STANDALONE}
    Click Element  ${IPV6_STANDALONE}
    Click Element  ${AKA_STANDALONE}
    Click Element  ${SUBMIT_PCSCF_STANDALONE}
    Sleep  5s

Display IBCF to the List
    Click Element  ${IBCF}
    Click Element  ${DISPLAY_MENU_IBCF}
    Click Element  ${CRYTO_IBCF}
    Click Element  ${MEDIA_PROFILE_IBCF}
    Click Element  ${BYPASS_IBCF}
    Click Element  ${KA_IBCF}
    Click Element  ${IPV6_IBCF}
    Click Element  ${SUBMIT_IBCF}
    Sleep  5s

Display IBCF_STANDALONE to the List
    Click Element  ${IBCF_STANDALONE}
    Click Element  ${DISPLAY_MENU_IBCF_STANDALONE}
    Click Element  ${CRYTO_IBCF_STANDALONE}
    Click Element  ${MEDIA_PROFILE_IBCF_STANDALONE}
    Click Element  ${BYPASS_IBCF_STANDALONE}
    Click Element  ${KA_IBCF_STANDALONE}
    Click Element  ${IPV6_IBCF_STANDALONE}
    Click Element  ${SUBMIT_IBCF_STANDALONE}
    Sleep  5s

Display BGCF to the List
    Click Element  ${BGCF}
    Click Element  ${DISPLAY_MENU_BGCF}
    Click Element  ${SUBMIT_BGCF}
    Sleep  5s

Display BGCF_STANDALONE to the List
    Click Element  ${BGCF_STANDALONE}
    Click Element  ${DISPLAY_MENU_BGCF_STANDALONE}
    Click Element  ${SUBMIT_BGCF_STANDALONE}
    Sleep  5s


Display Media
    Click Element  ${Media}
    Click Element  ${Media_Forwarder}
    Click Element  ${Media_Transcoding}
    Click Element  ${Submit_Media}
    Sleep  5s

Display Process
    [Arguments]  ${Process}
    Click Element   xpath=//a[@href='#${Process}']
    Click Element   xpath=//label[@for='display-${Process}']
    Click Element   xpath=//div[@id='${Process}']//button[@type='submit']
    Sleep  5s

# Verify Element
#     Element Should Contain      ${Pcscf_Session}    Pcscf
#     Element Should Contain      ${Bgcf_Session}     Bgcf
#     Element Should Contain      ${Ibcf_Session}    Ibcf
#     Element Should Contain      ${Transcoding_Session}    Transcoding
#     Element Should Contain      ${Media_Session}    Media proxy

Verify Element SBC
    Element Should Contain      ${Pcscf_Session}    Pcscf
    Element Should Contain      ${Bgcf_Session}     Bgcf
    Element Should Contain      ${Ibcf_Session}    Ibcf
    Element Should Contain      ${Transcoding_Session}    Transcoding
    Element Should Contain      ${Media_Session}    Media proxy

Reset Proxy 
    Click Element  ${RESET}
    Sleep  20s
    Page Should Not Contain      ${Pcscf_Session}
    Page Should Not Contain      ${Ibcf_Session}
    Page Should Not Contain      ${Bgcf_Session} 
    Page Should Not Contain      ${Transcoding_Session}
    Page Should Not Contain      ${Media_Session}
 

