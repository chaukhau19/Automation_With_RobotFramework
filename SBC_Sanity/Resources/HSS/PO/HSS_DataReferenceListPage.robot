*** Settings ***
Library  SeleniumLibrary
Resource  ../../Common.robot
Resource  ../../../Data/InputData.robot

*** Variables ***
############ General variables ##############
${DataReferenceList_tab}                xpath=//*[@class='first-menu' and text()='Data Reference List']
${IPName_Field}                         id=ipname
${DataReferenceList_Dropdown_list}       xpath=//label[contains(text(),'Data References')]//preceding::div[1]/input
${DataReferenceList_ipi}                 xpath=//label[contains(text(),'Data References')]//preceding::span[text()='ipi']
${DataReferenceList_ius}              xpath=//label[contains(text(),'Data References')]//preceding::span[text()='ius']
${DataReferenceList_scscf}              xpath=//label[contains(text(),'Data References')]//preceding::span[text()='scscf']
${DataReferenceList_ifc}              xpath=//label[contains(text(),'Data References')]//preceding::span[text()='ifc']
${DataReferenceList_li}              xpath=//label[contains(text(),'Data References')]//preceding::span[text()='li']
${DataReferenceList_us}              xpath=//label[contains(text(),'Data References')]//preceding::span[text()='us']
${DataReferenceList_chinf}              xpath=//label[contains(text(),'Data References')]//preceding::span[text()='chinf']
${DataReferenceList_ms}              xpath=//label[contains(text(),'Data References')]//preceding::span[text()='ms']
${DataReferenceList_psia}              xpath=//label[contains(text(),'Data References')]//preceding::span[text()='psia']
${DataReferenceList_dsai}              xpath=//label[contains(text(),'Data References')]//preceding::span[text()='dsai']
${DataReferenceList_tads}              xpath=//label[contains(text(),'Data References')]//preceding::span[text()='tads']
${DataReferenceList_srvcc}              xpath=//label[contains(text(),'Data References')]//preceding::span[text()='srvcc']
${DataReferenceList_stn}              xpath=//label[contains(text(),'Data References')]//preceding::span[text()='stn']
${DataReferenceList_rd}              xpath=//label[contains(text(),'Data References')]//preceding::span[text()='rd']
${DataReferenceList_ard}              xpath=//label[contains(text(),'Data References')]//preceding::span[text()='ard']
${DataReferenceList_snru}              xpath=//label[contains(text(),'Data References')]//preceding::span[text()='snru']
${DataReferenceList_spbx}              xpath=//label[contains(text(),'Data References')]//preceding::span[text()='spbx']
${DataReferenceList_forkingmode}              xpath=//label[contains(text(),'Data References')]//preceding::span[text()='forkingmode']
${DataReferenceList_scscf_pull_0}              xpath=//label[contains(text(),'Data References')]//preceding::span[text()='scscf_pull_0']
${ServiceIndication_Field}        id=si
${MaxSize_Field}                  id=size
*** Keywords ***

Go to HSS tab
    Click Element        ${HSS_tab}
    Sleep  1s

Go to Data Reference List tab
    Click Element        ${DataReferenceList_tab}
    Sleep  1s

Add DataReferenceList
    [Arguments]  ${Name}    ${DataReferenceList}  ${DataReference1}  ${DataReference2}  ${DataReference3}  ${DataReference4}
    ...  ${DataReference5}  ${DataReference6}  ${DataReference7}  ${DataReference8}  ${DataReference9}  ${DataReference10}
    ...  ${DataReference11}  ${DataReference12}  ${DataReference13}  ${DataReference14}  ${DataReference15}  ${DataReference16}
    ...  ${DataReference17}  ${DataReference18}  ${DataReference19}

    Click Element       ${Add_Button}
    Sleep  2s
    Run Keyword If  '${Name}' != '#BLANK'    input text   ${Name_Field}   ${Name}

    AddEdit DataReferenceList  ${DataReferenceList}  ${DataReference1}  ${DataReference2}  ${DataReference3}  ${DataReference4}
    ...  ${DataReference5}  ${DataReference6}  ${DataReference7}  ${DataReference8}  ${DataReference9}  ${DataReference10}
    ...  ${DataReference11}  ${DataReference12}  ${DataReference13}  ${DataReference14}  ${DataReference15}  ${DataReference16}
    ...  ${DataReference17}  ${DataReference18}  ${DataReference19}

    Click Element       ${Confirm_Add_MatRul}
    Sleep       3s

Edit DataReferenceList
    [Arguments]  ${Name}    ${DataReferenceList}  ${DataReference1}  ${DataReference2}  ${DataReference3}  ${DataReference4}
    ...  ${DataReference5}  ${DataReference6}  ${DataReference7}  ${DataReference8}  ${DataReference9}  ${DataReference10}
    ...  ${DataReference11}  ${DataReference12}  ${DataReference13}  ${DataReference14}  ${DataReference15}  ${DataReference16}
    ...  ${DataReference17}  ${DataReference18}  ${DataReference19}

    Click Edit Element With 1 Info  ${Name}
    Sleep  1s

    AddEdit DataReferenceList  ${DataReferenceList}  ${DataReference1}  ${DataReference2}  ${DataReference3}  ${DataReference4}
    ...  ${DataReference5}  ${DataReference6}  ${DataReference7}  ${DataReference8}  ${DataReference9}  ${DataReference10}
    ...  ${DataReference11}  ${DataReference12}  ${DataReference13}  ${DataReference14}  ${DataReference15}  ${DataReference16}
    ...  ${DataReference17}  ${DataReference18}  ${DataReference19}

    Click Element       ${Confirm_Add_MatRul}
    Sleep       3s

AddEdit DataReferenceList
    [Arguments]  ${DataReferenceList}  ${DataReference1}  ${DataReference2}  ${DataReference3}  ${DataReference4}
    ...  ${DataReference5}  ${DataReference6}  ${DataReference7}  ${DataReference8}  ${DataReference9}  ${DataReference10}
    ...  ${DataReference11}  ${DataReference12}  ${DataReference13}  ${DataReference14}  ${DataReference15}  ${DataReference16}
    ...  ${DataReference17}  ${DataReference18}  ${DataReference19}
    Sleep  2s
    Run Keyword If  '${DataReferenceList}' != '#BLANK'    Click Element   ${DataReferenceList_Dropdown_list}
    Sleep  2s

    Run Keyword If      '${DataReference1}' == 'ipi'        Click Element    ${DataReferenceList_ipi}
    Run Keyword If     '${DataReference2}' == 'ius'        Click Element   ${DataReferenceList_ius}
    Run Keyword If     '${DataReference3}' == 'scscf'      Click Element   ${DataReferenceList_scscf}
    Run Keyword If     '${DataReference4}' == 'ifc'        Click Element   ${DataReferenceList_ifc}
    Run Keyword If     '${DataReference5}' == 'li'         Click Element   ${DataReferenceList_li}
    Run Keyword If    '${DataReference6}' == 'us'         Click Element   ${DataReferenceList_us}
    Run Keyword If     '${DataReference7}' == 'chinf'      Click Element   ${DataReferenceList_chinf}
    Run Keyword If     '${DataReference8}' == 'ms'         Click Element   ${DataReferenceList_ms}
    Run Keyword If     '${DataReference9}' == 'psia'       Click Element   ${DataReferenceList_psia}
    Run Keyword If     '${DataReference10}' == 'dsai'      Click Element   ${DataReferenceList_dsai}
    Run Keyword If     '${DataReference11}' == 'tads'      Click Element   ${DataReferenceList_tads}
    Run Keyword If     '${DataReference12}' == 'stn'       Click Element   ${DataReferenceList_stn}
    Run Keyword If     '${DataReference13}' == 'srvcc'     Click Element   ${DataReferenceList_srvcc}
    Run Keyword If     '${DataReference14}' == 'rd'        Click Element   ${DataReferenceList_rd}
    Run Keyword If     '${DataReference15}' == 'ard'       Click Element   ${DataReferenceList_ard}
    Run Keyword If     '${DataReference16}' == 'snru'      Click Element   ${DataReferenceList_snru}
    Run Keyword If     '${DataReference17}' == 'spbx'      Click Element   ${DataReferenceList_spbx}
    Run Keyword If     '${DataReference18}' == 'forkingmode'    Click Element   ${DataReferenceList_forkingmode}
    Run Keyword If     '${DataReference19}' == 'scscf_pull_0'    Click Element   ${DataReferenceList_scscf_pull_0}
    Sleep       1s

    Click Element   ${Name_Field}
    Sleep  1s


View DataReferenceList
    [Arguments]     ${Name}    ${DataReference1}  ${DataReference2}  ${DataReference3}  ${DataReference4}
    ...  ${DataReference5}  ${DataReference6}  ${DataReference7}  ${DataReference8}  ${DataReference9}  ${DataReference10}
    ...  ${DataReference11}  ${DataReference12}  ${DataReference13}
    Click View Element With 1 Info     ${Name}
    Sleep       3s

    Verify Page Contains 2 Expected Elements    Name                              ${Name}
    Verify Page Contains 2 Expected Elements    Data References                   ${DataReference1}, ${DataReference2}, ${DataReference3}, ${DataReference4}, ${DataReference5}, ${DataReference6}, ${DataReference7}, ${DataReference8}, ${DataReference9}, ${DataReference10}, ${DataReference11}, ${DataReference12}, ${DataReference13}

    Click Element       ${Cancel_View}
    Sleep       3s