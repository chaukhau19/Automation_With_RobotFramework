*** Settings ***
Library  SeleniumLibrary
Resource  ../../Common.robot
*** Variables ***
${Proxy_section}  xpath=//*[@class='first-menu' and text()='Proxy']

#PCSCF
${PCSCF_Button}         xpath=//a[@href='#pcscf']
${DISPLAY_MENU}         xpath=//label[@for='display-pcscf']
${CRYTO}                xpath=//label[@for='display-pcscf-crypto']
${MEDIA_PROFILE}        xpath=//label[@for='display-pcscf-media_profile']
${BYPASS}               xpath=//label[@for='display-pcscf-bypass']
${WHITE_LABEL}          xpath=//label[@for='display-pcscf-white_label']
${IPV6}                 xpath=//label[@for='display-pcscf-IPv6']
${AKA}                  xpath=//label[@for='display-pcscf-AKA']
${SUBMIT_PCSCF}         xpath=//div[@id='pcscf']//button[@type='submit']
#IBCF
${IBCF}                 xpath=//a[@href='#ibcf']
${DISPLAY_MENU_IBCF}    xpath=//label[@for='display-ibcf']
${CRYTO_IBCF}           xpath=//label[@for='display-ibcf-crypto']
${MEDIA_PROFILE_IBCF}   xpath=//label[@for='display-ibcf-media_profile']
${BYPASS_IBCF}          xpath=//label[@for='display-ibcf-bypass']
${IPV6_IBCF}            xpath=//label[@for='display-ibcf-IPv6']
${KA_IBCF}              xpath=//label[@for='display-ibcf-keepalive']
${SUBMIT_IBCF}          xpath=//div[@id='ibcf']//button[@type='submit']
#BGCF
${BGCF}                 xpath=//a[@href='#bgcf']
${DISPLAY_MENU_BGCF}    xpath=//label[@for='display-bgcf']
${SUBMIT_BGCF}          xpath=//div[@id='bgcf']//button[@type='submit']
#Reset Proxy
${RESET}                //body/div[@id='root']/section[@id='container']/section[@id='main-content']/section[@id='content-container']/div[1]/div[2]/div[1]/form[1]/div[1]/div[1]/a[1]

#Media

${Media}                xpath=//a[@href='#media']
${Media_Forwarder}          xpath=//label[@for='display-media-forwarder']
${Media_Transcoding}          xpath=//label[@for='display-media-tcgw']
${Submit_Media}         xpath=//div[@id='media']//button[@type='submit']

*** Keywords ***

Navigate to Proxy Page
    Click Element  ${Admin_tab}
    Sleep  1s
    Click Element  ${Proxy_section}
    Sleep  1s

Display PCSCF to the List
    Click Element  ${PCSCF_Button}
    Click Element  ${DISPLAY_MENU}
    Click Element  ${CRYTO}
    Click Element  ${MEDIA_PROFILE}
    Click Element  ${BYPASS}
    Click Element  ${WHITE_LABEL}
    Click Element  ${IPV6}
    Click Element  ${AKA}
    Click Element  ${SUBMIT_PCSCF}
    Sleep  5s

Display PCSCF to the List 64
    Click Element  ${PCSCF_Button}
    Click Element  ${DISPLAY_MENU}
    Click Element  ${CRYTO}
    Click Element  ${MEDIA_PROFILE}
    Click Element  ${BYPASS}
    Click Element  ${WHITE_LABEL}
    Click Element  ${IPV6}
    #Click Element  ${AKA}
    Click Element  ${SUBMIT_PCSCF}
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

Display BGCF to the List
    Click Element  ${BGCF}
    Click Element  ${DISPLAY_MENU_BGCF}
    Click Element  ${SUBMIT_BGCF}
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

Verify element
    Element Should Contain      xpath=//*[@class='collapsible-header' and contains(text(),'Pcscf')]    Pcscf
    Element Should Contain      xpath=//*[@class='collapsible-header' and contains(text(),'Ibcf')]    Ibcf
    Element Should Contain      xpath=//*[@class='collapsible-header' and contains(text(),'Bgcf')]    Bgcf
    Element Should Contain      xpath=//*[@class='collapsible-header' and contains(text(),'Transcoding')]    Transcoding
    Element Should Contain      xpath=//*[@class='collapsible-header' and contains(text(),'Media proxy')]    Media proxy

Verify element SBC
    Element Should Contain      xpath=//*[@class='collapsible-header' and contains(text(),'Pcscf_active')]    Pcscf_active
    Element Should Contain      xpath=//*[@class='collapsible-header' and contains(text(),'Bgcf_active')]    Bgcf_active
    Element Should Contain      xpath=//*[@class='collapsible-header' and contains(text(),'Ibcf_active')]    Ibcf_active
    Element Should Contain      xpath=//*[@class='collapsible-header' and contains(text(),'Transcoding')]    Transcoding
    Element Should Contain      xpath=//*[@class='collapsible-header' and contains(text(),'Media proxy')]    Media proxy

Reset Proxy Page
    #Click Element  ${BGCF}
    Sleep  1s
    Click Element  ${RESET}
    Sleep  20s
    Page Should Not Contain      xpath=//*[@class='collapsible-header' and contains(text(),'Pcscf')]
    Page Should Not Contain      xpath=//*[@class='collapsible-header' and contains(text(),'Ibcf')]
    Page Should Not Contain      xpath=//*[@class='collapsible-header' and contains(text(),'Bgcf')]
    Page Should Not Contain      xpath=//*[@class='collapsible-header' and contains(text(),'Transcoding')]
    Page Should Not Contain      xpath=//*[@class='collapsible-header' and contains(text(),'Media proxy')]
    #Sleep  5s
