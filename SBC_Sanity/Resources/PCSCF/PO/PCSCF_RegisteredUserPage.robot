*** Settings ***
Library  SeleniumLibrary
Resource  ../../Common.robot
Resource  ../../../Data/InputData.robot

*** Variables ***
${RegisteredUser_section}               xpath=//*[@class='collapsible-header active']//following::a[contains(text(),'Registered User')]
*** Keywords ***
Go to PCSCF tab

    Click Element        ${PCSCF_tab}
    Sleep  1s

Go to Registered User section in PCSCF tab
    Scroll Element Into View    ${RegisteredUser_section}
    Click Element        ${RegisteredUser_section}
     Sleep  1s
View Registered User function
    [Arguments]     ${Public_identity}  ${Status}  ${Publicid}  ${PrivateID}  ${MainIPID}  ${Stored_Service_Route}  ${Stored_Path}  ${Stored_Contact}  ${Stored_User_Agent}  ${Registered}  ${IMS_User}  ${PBX}

    Click View Element With 1 Info        ${Public_identity}
    Sleep  1s

    Verify Page Contains 2 Expected Elements Registered             Reg Status                                          ${Status}
    Verify Page Contains 2 Expected Elements Registered             Public IDs                                          ${Publicid}
    Verify Page Contains 2 Expected Elements Registered             Private ID                                          ${PrivateID}
    Verify Page Contains 2 Expected Elements Registered MainIPID    Main IP ID                                          ${MainIPID}
    Verify Page Contains 2 Expected Elements Registered             Stored Service-Route                                ${Stored_Service_Route}
    #Verify Page Contains 2 Expected Elements Registered MainIPID    Stored Path                                         ${Stored_Path}
    Verify Page Contains 2 Expected Elements Registered             Stored Contact                                      ${Stored_Contact}
    Verify Page Contains 2 Expected Elements Registered             Stored User-Agent                                   ${Stored_User_Agent}
    Verify Page Contains 2 Expected Elements Registered             Registered                                          ${Registered}
    Verify Page Contains 2 Expected Elements Registered             IMS User                                            ${IMS_User}
    Verify Page Contains 2 Expected Elements Registered             PBX                                                 ${PBX}