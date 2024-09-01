*** Settings ***
Documentation  This is all tests of Transcoding
Library  SeleniumLibrary
Resource  ../../Resources/DataManager.robot
Resource  ../../Data/InputData.robot
Resource  ../../Resources/Common.robot
Resource  ../../Resources/Transcoding/TranscodingApp.robot

Test Setup  Common.Begin Web Test
Test Teardown  Common.End Web Test
*** Tasks ***
	
Add Card
    [Documentation]     Add proper Transcoding card
    [Tags]  Smoke  Transcoding_Card  sbc77
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Transcoding}  Card
    TranscodingApp.Add Card   ${AdministrationScenarios}
		
Sort Card
    [Documentation]     Sort proper Card for Card PCSCF
    [Tags]  Transcoding_Card  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Transcoding}  Card
    TranscodingApp.Sort Card   ${AdministrationScenarios}
	
View Card
    [Documentation]     View proper Card for Card PCSCF
    [Tags]   Transcoding_Card  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Transcoding}  Card
    TranscodingApp.View Card   ${AdministrationScenarios}

Filter Card
    [Documentation]     Filter proper Card for Card PCSCF
    [Tags]  Transcoding_Card  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Transcoding}  Card
    TranscodingApp.Filter Card   ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Transcoding}  Card_Filter_Spechar
   TranscodingApp.Filter Special Character Card   ${AdministrationScenarios}  
		
Delete Card
    [Documentation]     Delete proper Transcoding card
    [Tags]  Smoke  Transcoding_Card  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Transcoding}  Card
    TranscodingApp.Delete Card   ${AdministrationScenarios}
		
Add Profile
    [Documentation]     Add proper Transcoding profile
    [Tags]  Smoke  Transcoding_Profile  sbc77
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Transcoding}  Profile
    TranscodingApp.Add Profile   ${AdministrationScenarios}
	
Sort Profile
    [Documentation]     Sort proper Profile
    [Tags]  Transcoding_Profile  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Transcoding}  Profile
    TranscodingApp.Sort Profile   ${AdministrationScenarios}
Filter Profile section 70Filter Profile
    [Documentation]     Filter proper Profile
    [Tags]  Transcoding_Profile  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Transcoding}  Profile
    TranscodingApp.Filter Profile   ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Transcoding}  Profile_Filter_Spechar
   TranscodingApp.Filter Special Character Profile   ${AdministrationScenarios}   
	
Delete Profile
    [Documentation]    Delete proper Transcoding profile
    [Tags]  Smoke  Transcoding_Profile  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Transcoding}  Profile
    TranscodingApp.Delete Profile   ${AdministrationScenarios}
			
Add TCGW
    [Documentation]    Add proper Transcoding TCGW
    [Tags]  Smoke  Transcoding_TCGW  sbc77
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Transcoding}  TCGW
    TranscodingApp.Add TCGW   ${AdministrationScenarios}
	
Sort TCGW
    [Documentation]     Sort proper TCGW
    [Tags]  Transcoding_TCGW  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Transcoding}  TCGW
    TranscodingApp.Sort TCGW   ${AdministrationScenarios}
Filter TCGW section 70Filter TCGW
    [Documentation]     Filter proper TCGW
    [Tags]  Transcoding_TCGW  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Transcoding}  TCGW
    TranscodingApp.Filter TCGW   ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Transcoding}  TCGW_Filter_Spechar
   TranscodingApp.Filter Special Character TCGW   ${AdministrationScenarios}
		
Delete TCGW
    [Documentation]     Delete proper Transcoding TCGW
    [Tags]  Smoke  Transcoding_TCGW  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Transcoding}  TCGW
    TranscodingApp.Delete TCGW   ${AdministrationScenarios}

