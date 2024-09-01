*** Settings ***
Library  SeleniumLibrary
Resource  ../../Common.robot
Resource  ../../../Data/InputData.robot

*** Variables ***
############ General variables ##############
${DNS_tab}                  xpath=//a[@class='collapsible-header active'][contains(.,'Scscf')]//following::*[@class='collapsible-header first-menu' and contains(text(),'DNS')]
${Configuration_tab}        xpath=//a[@class='collapsible-header active'][contains(.,'Scscf')]//following::*[@class='collapsible-header sub-menu' and contains(text(),'Configuration')]
${Configuration_section}    xpath=//a[@href='/scscf/2/dns/index']
${Resolver_section}         xpath=//a[@href='/scscf/2/resolv/index']
${Edit_Button}              xpath=//a[contains(text(),'Edit DNS')]
${Cancel_Add}      xpath=//a[@class='button-cancel']
##Configuration
${KeyOut_Field}             id=key_out
${KeyIn_Field}             id=key_in
${TimeWaitForDNS_Field}     id=t_wait
${UseDNS_True}              xpath=//label[contains(text(),'Use DNS For Via FQDN')]//following::div[1]/button[contains(text(),'True')]
${UseDNS_False}             xpath=//label[contains(text(),'Use DNS For Via FQDN')]//following::div[1]/button[contains(text(),'False')]
${UseCaching_True}          xpath=//label[contains(text(),'Use Caching')]//following::div[1]/button[contains(text(),'True')]
${UseCaching_False}         xpath=//label[contains(text(),'Use Caching')]//following::div[1]/button[contains(text(),'False')]
${CachingTime_Field}        id=caching_time
${Blacklisting_True}        xpath=//label[contains(text(),'Blacklisting')]//following::div[1]/button[contains(text(),'True')]
${Blacklisting_False}       xpath=//label[contains(text(),'Blacklisting')]//following::div[1]/button[contains(text(),'False')]
${BlacklistTime_Field}      id=t_black_list
${RefuseCall_True}          xpath=//label[contains(text(),'Refuse Call')]//following::div[1]/button[contains(text(),'True')]
${RefuseCall_False}         xpath=//label[contains(text(),'Refuse Call')]//following::div[1]/button[contains(text(),'False')]
${ReasonCode_Field}         id=reason_code
${ReasonPhrase_Field}       id=reason_phrase
${SNMP_True}                xpath=//label[contains(text(),'SNMP')]//following::div[1]/button[contains(text(),'True')]
${SNMP_False}               xpath=//label[contains(text(),'SNMP')]//following::div[1]/button[contains(text(),'False')]
${SRVOnly_True}             xpath=//label[contains(text(),'SRV Only')]//following::div[1]/button[contains(text(),'True')]
${SRVOnly_False}            xpath=//label[contains(text(),'SRV Only')]//following::div[1]/button[contains(text(),'False')]
#Resolver

*** Keywords ***
Go to SCSCF tab
    Click Element        ${SCSCF_tab}
    Sleep  1s

Go to DNS section in SCSCF tab
    Click Element        ${DNS_tab}
    Sleep   3s

Go to Configuration section in DNS tab
    Click Element        ${Configuration_tab}
    Sleep   3s

Go to Configuration section in Configuration tab
    Click Element        ${Configuration_section}
    Sleep   3s

Go to Resolver section in Configuration tab
    Click Element        ${Resolver_section}
    Sleep   3s

Edit DNS
    [Arguments]  ${KeyOut}  ${KeyIn}  ${TimeWaitForDNS}  ${UseDNS}  ${UseCaching}  ${CachingTime}
    ...    ${Blacklisting}  ${BlacklistTime}  ${RefuseCall}  ${ReasonCode}  ${ReasonPhrase}  ${SNMP}  ${SRVOnly}

    Click Element       ${Edit_Button}
    Sleep  3s

    Run Keyword If  '${KeyOut}' != '#BLANK'    input text   ${KeyOut_Field}   ${KeyOut}

    Run Keyword If  '${KeyIn}' != '#BLANK'    input text   ${KeyIn_Field}   ${KeyIn}

    Run Keyword If  '${TimeWaitForDNS}' != '#BLANK'    input text   ${TimeWaitForDNS_Field}   ${TimeWaitForDNS}

    Run Keyword If  '${UseDNS}' == 'True'    Click Element   ${UseDNS_True}
    Run Keyword If  '${UseDNS}' == 'False'    Click Element   ${UseDNS_False}
    Sleep  1s

    Run Keyword If  '${UseCaching}' == 'True'    Click Element   ${UseCaching_True}
    Run Keyword If  '${UseCaching}' == 'False'   Click Element   ${UseCaching_False}
    Sleep  1s
    Run Keyword If  '${UseCaching}' == 'True' and '${CachingTime}' != 'BLANK'   input text   ${CachingTime_Field}  ${CachingTime}

    Run Keyword If  '${Blacklisting}' == 'True'    Click Element   ${Blacklisting_True}
    Run Keyword If  '${Blacklisting}' == 'False'   Click Element   ${Blacklisting_False}
    Sleep  1s
    Run Keyword If  '${Blacklisting}' == 'True' and '${BlacklistTime}' != 'BLANK'   input text   ${BlacklistTime_Field}  ${BlacklistTime}

    Run Keyword If  '${RefuseCall}' == 'True'    Click Element   ${RefuseCall_True}
    Run Keyword If  '${RefuseCall}' == 'False'   Click Element   ${RefuseCall_False}
    Sleep  1s
    Run Keyword If  '${RefuseCall}' == 'True' and '${ReasonCode}' != 'BLANK'   input text   ${ReasonCode_Field}  ${ReasonCode}
    Run Keyword If  '${RefuseCall}' == 'True' and '${ReasonPhrase}' != 'BLANK'   input text   ${ReasonPhrase_Field}  "${ReasonPhrase}"

    Run Keyword If  '${SNMP}' == 'True'    Click Element   ${SNMP_True}
    Run Keyword If  '${SNMP}' == 'False'   Click Element   ${SNMP_False}
    Sleep  1s

    Run Keyword If  '${SRVOnly}' == 'True'    Click Element   ${SRVOnly_True}
    Run Keyword If  '${SRVOnly}' == 'False'   Click Element   ${SRVOnly_False}
    Sleep  1s
    Click Element       ${Confirm_Add_DNS}
    Sleep       3s


Add resolver
    [Arguments]  ${FQDN}    ${IP}      ${Port}  ${Protocol}   ${Weight}   ${Priority}
    Click Element       ${Add_Button}
    Sleep  3s

    Run Keyword If  '${FQDN}' != '#BLANK'    input text   ${FQDN_Field}   ${FQDN}
    Sleep       1s

    Run Keyword If  '${IP}' != '#BLANK'    input text   ${IP_Field}   ${IP}
    Sleep       1s

    Run Keyword If  '${Port}' != '#BLANK'    input text     ${Port_Field}    ${Port}
    Sleep       1s

    Run Keyword If  '${Protocol}' != '#BLANK'    input text   ${Protocol_Field}          ${Protocol}
    Sleep       1s

    Run Keyword If  '${Weight}' != '#BLANK'    input text   ${Weight_Field}          ${Weight}
    Sleep       1s

    Run Keyword If  '${Priority}' != '#BLANK'    input text     ${Priority_Field}    ${Priority}

    Click Element       ${Confirm_Add_DNS}
    Sleep       3s
    reload page


View resolver
    [Arguments]    ${FQDN}    ${IP}      ${Port}  ${Protocol}   ${Weight}   ${Priority}
    Common.Click View Element With 3 Info      ${FQDN}    ${IP}      ${Port}
    Sleep  3s
    Verify Page Contains 2 Expected Elements    FQDN        ${FQDN}
    Verify Page Contains 2 Expected Elements    IP          ${IP}
    Verify Page Contains 2 Expected Elements    Port        ${Port}
    Verify Page Contains 2 Expected Elements    Protocol    ${Protocol}
    Verify Page Contains 2 Expected Elements    Weight      ${Weight}
    Verify Page Contains 2 Expected Elements    Priority    ${Priority}
    Sleep  1s

Edit resolver
    [Arguments]    ${FQDN}    ${IP}      ${Port}  ${Protocol}     ${Edit_Weight}      ${Edit_Piority}
    Common.Click Edit Element With 3 Info      ${FQDN}    ${IP}      ${Port}
    Sleep  3s
    Run Keyword If  '${Edit_Weight}' != '#BLANK'    input text   ${Weight_Field}          ${Edit_Weight}
    Sleep       1s

    Run Keyword If  '${Edit_Piority}' != '#BLANK'    input text   ${Priority_Field}          ${Edit_Piority}
    Sleep       1s
    Click Element       ${Confirm_Add_DNS}
    Sleep       3s
    reload page

Cancel invalid add
    Click Element  ${Cancel_Add}