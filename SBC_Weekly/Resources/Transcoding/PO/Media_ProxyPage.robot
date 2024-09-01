*** Settings ***
Library  SeleniumLibrary
Resource   ../../Media_Proxy/PO/Media_ProxyPage.robot
Resource  ../../Common.robot

*** Variables ***
${ADMIN}  xpath=//*[@class='collapsible-header' and contains(text(),'Admin')]
${PROXY}  xpath=//*[@class='first-menu' and contains(text(),'Proxy')]


${MEDIA}  xpath=.//*[@href='#media' and contains(text(),'Media')]
${MEDIA_PROXY}  xpath=.//*[@id='media']/div/form/div/p[1]/label
${TRANSCODING}  xpath=.//*[@id='media']/div/form/div/p[2]/label
${SUBMIT}  xpath=.//*[@class='btn waves-effect waves-light #3AB4D6 btn-custom' and contains(text(),'Submit')]
${RESET}  xpath=.//*[@id='media']/div/form/div/div/a  #Reset

##########Forwarder########
${MEDIA_PROXY_BUTTON}  xpath=.//*[@class='collapsible-header' and contains(text(),'Media proxy')]
${FORWARDER}  xpath=.//*[@class='first-menu' and contains(text(),'Forwarder')]
${ADD_FORWARDER_BUTTON}  xpath=.//*[@class='material-icons add-i' and contains(text(),'add_circle')]
${FORWARDER_NAME}  id=name
${FORWARDER_IP}  id=ip
${SUBMIT_FORWARDER}  id=submit_field
${CANCEL_FORWARDER}  xpath=//*[@class='button-cancel' and contains(text(),'Cancel')]
${FILTER_FORWARDER}  id=btn-filter
${FILTER_DROPDOWN}  id=select-options-bbc20ff0-a549-e3df-25f8-081a676ab62c
${NAME_FORWARDER}  xpath=//span[text()="Name"]
${IP_FORWARDER}  xpath=//span[text()="IP"]
${STATUS_FORWARDER}  xpath=//span[text()="Status"]
${CANCEL_FILTER}  xpath=.//*[@id='content-container']/div/fieldset/form/div[3]/button[2]

##################Icmp-Check################

${ICMP_CHECK}  xpath=.//*[@class='first-menu' and contains(text(),'Icmp Check')]
${ADD_ICMP_BUTTON}  xpath=.//*[@class='material-icons add-i' and contains(text(),'add_circle')]
${ICMP_NAME}  id=name
${ICMP_IP}  id=ip
${ICMP_ADD_IP}  id=add_ip
${ICMP_ADD_MORE_IP}  id=ips-1-ip
${ICMP_SUBMIT}  id=submit_field
${ICMP_CANCEL}  xpath=//*[@class='button-cancel' and contains(text(),'Cancel')]


*** Keywords ***

Displayed Media Proxy
    Click Element  ${ADMIN}
    Click Element  ${PROXY}
    wait until page contains element  ${Media}
    Click Element  ${Media}
    Click Element  ${Media_Proxy}
    Click Button  ${Submit}

Navigato to Forwarder

    Click Element  ${Media_Proxy_Button}
    Sleep       1s
    Click Element  ${Forwarder}

