*** Settings ***
Documentation  This is all tests of PCSCF_PEER
Library  SeleniumLibrary
Resource  ../../Resources/DataManager.robot
Resource  ../../Data/InputData.robot
Resource  ../../Resources/Common.robot
Resource  ../../Resources/PCSCF/PCSCF_PeerApp.robot

Test Setup      Common.Begin Web Test
Test Teardown   Common.End Web Test

*** Tasks ***

### Matching Rules####
		
Add Matching Rules
    [Documentation]     Add proper matching rules for PCSCF_PEER
    [Tags]  Smoke  PCSCF_Matching Rule  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}  MatchingRules
    PCSCF_PeerApp.Add MatchingRules   ${AdministrationScenarios}
	
Sort Matching Rules
    [Documentation]     Sort proper matching rules for PCSCF_PEER
    [Tags]  PCSCF_Matching Rule  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}  MatchingRules
    PCSCF_PeerApp.Sort MatchingRules   ${AdministrationScenarios}
		
View Matching Rules
    [Documentation]     View proper matching rules for PCSCF_PEER
    [Tags]    PCSCF_Matching Rule  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}  MatchingRules_Edit
    PCSCF_PeerApp.View MatchingRules   ${AdministrationScenarios}
	
Filter Matching Rules
    [Documentation]     Filter proper matching rules for PCSCF_PEER
    [Tags]    PCSCF_Matching Rule  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}  MatchingRules_Edit
    PCSCF_PeerApp.Filter MatchingRules   ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}  MatchingRules_Filter_Spechar
    PCSCF_PeerApp.Filter Special Character MatchingRules   ${AdministrationScenarios}
		
Edit Matching Rules
    [Documentation]     Edit proper matching rules for PCSCF_PEER
    [Tags]  Smoke  PCSCF_Matching Rule  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}  MatchingRules_Edit
    PCSCF_PeerApp.Edit MatchingRules   ${AdministrationScenarios}
			
Delete Matching Rules
    [Documentation]     Delete proper matching rules for PCSCF_PEER
    [Tags]  Smoke  PCSCF_Matching Rule  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}  MatchingRules_Delete
    PCSCF_PeerApp.Delete MatchingRules   ${AdministrationScenarios}

### Manipulation Rules####		
Add Manipulation Rules
    [Documentation]     This is the basic added proper manipulation rules for PCSCF_PEER
    [Tags]  Smoke  PCSCF_Manipulation Rule  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}   ManiRules
    PCSCF_PeerApp.Add ManiRules   ${AdministrationScenarios}
	
Sort Manipulation Rules
    [Documentation]     Sort proper manipulation rules for PCSCF_PEER
    [Tags]  PCSCF_Manipulation Rule  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}  ManiRules
    PCSCF_PeerApp.Sort ManiRules   ${AdministrationScenarios}
		
View Manipulation Rules
    [Documentation]     View proper manipulation rules for PCSCF_PEER
    [Tags]  PCSCF_Manipulation Rule  sbc77
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}  ManiRules_Edit
    PCSCF_PeerApp.View ManiRules   ${AdministrationScenarios}
		
Filter Manipulation Rules
    [Documentation]     Filter proper manipulation rules for PCSCF_PEER
    [Tags]  PCSCF_Manipulation Rule  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}  ManiRules_Edit
    PCSCF_PeerApp.Filter ManiRules   ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}  ManiRules_Filter_Spechar
    PCSCF_PeerApp.Filter Special Character ManiRules   ${AdministrationScenarios}
		
Edit Manipulation Rules
    [Documentation]     Edit proper manipulation rules for PCSCF_PEER
    [Tags]  Smoke  PCSCF_Manipulation Rule  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}   ManiRules_Edit
    PCSCF_PeerApp.Edit ManiRules   ${AdministrationScenarios}
		
Delete Manipulation Rules
    [Documentation]     Delete proper manipulation rules for PCSCF_PEER
    [Tags]  Smoke  PCSCF_Manipulation Rule  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}   ManiRules_Delete
    PCSCF_PeerApp.Delete ManiRules   ${AdministrationScenarios}

### Header Authorization Profiles####		
Add Header Authorization Profiles
    [Documentation]     This is the basic added proper Header Authorization Profiles for PCSCF_PEER
    [Tags]  Smoke  PCSCF_Header Authorization Profiles  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}   HAP
    PCSCF_PeerApp.Add HeaderAuthProfiles   ${AdministrationScenarios}
	
Sort Header Authorization Profiles
    [Documentation]     Sort proper Header Authorization Profiles for PCSCF_PEER
    [Tags]  PCSCF_Header  Authorization  Profiles  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}  HAP
    PCSCF_PeerApp.Sort HeaderAuthProfiles   ${AdministrationScenarios}
		
View Header Authorization Profiles
    [Documentation]     View proper Header Authorization Profiles for PCSCF_PEER
    [Tags]  PCSCF_Header Authorization Profiles  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}  HAP
    PCSCF_PeerApp.View HeaderAuthProfiles   ${AdministrationScenarios}
		
Filter Header Authorization Profiles
    [Documentation]     Filter proper Header Authorization Profiles for PCSCF_PEER
    [Tags]  PCSCF_Header Authorization Profiles  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}  HAP
    PCSCF_PeerApp.Filter HeaderAuthProfiles   ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}  HAP_Filter_Spechar
    PCSCF_PeerApp.Filter Special Character HeaderAuthProfiles   ${AdministrationScenarios}
		
Delete Header Authorization Profiles
    [Documentation]     Delete proper Header Authorization Profiles for PCSCF_PEER
    [Tags]  Smoke  PCSCF_Header Authorization Profiles  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}  HAP_Delete
    PCSCF_PeerApp.Delete HeaderAuthProfiles   ${AdministrationScenarios}

### Authorization Profiles####		
Add Authorization Profiles
    [Documentation]     This is the basic added proper Authorization Profiles for PCSCF_PEER
    [Tags]  Smoke  PCSCF_Authorization Profiles  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}   AP
    PCSCF_PeerApp.Add AuthProfiles   ${AdministrationScenarios}
	
Sort Authorization Profiles
    [Documentation]     Sort proper Authorization Profiles for PCSCF_PEER
    [Tags]  PCSCF_Authorization Profiles  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}  AP
    PCSCF_PeerApp.Sort AuthProfiles   ${AdministrationScenarios}
		
View Authorization Profiles
    [Documentation]     View proper Authorization Profiles for PCSCF_PEER
    [Tags]   PCSCF_Authorization Profiles  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}  AP_Edit
    PCSCF_PeerApp.View AuthProfiles   ${AdministrationScenarios}
		
Filter Authorization Profiles
    [Documentation]     Filter proper Authorization Profiles for PCSCF_PEER
    [Tags]  PCSCF_Authorization Profiles  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}  AP_Edit
    PCSCF_PeerApp.Filter AuthProfiles   ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}  AP_Filter_Spechar
    PCSCF_PeerApp.Filter Special Character AuthProfiles   ${AdministrationScenarios}
		
Edit Authorization Profiles
    [Documentation]     Edit proper Authorization Profiles for PCSCF_PEER
    [Tags]  Smoke  PCSCF_Authorization Profiles  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}   AP_Edit
    PCSCF_PeerApp.Edit AuthProfiles   ${AdministrationScenarios}
		
Delete Authorization Profiles
    [Documentation]     Delete proper Authorization Profiles for PCSCF_PEER
    [Tags]  Smoke  PCSCF_Authorization Profiles  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}   AP_Delete
    PCSCF_PeerApp.Delete AuthProfiles   ${AdministrationScenarios}

### Header Manipulation ####		
Add Header Manipulation
    [Documentation]     Add proper Header Manipulation for PCSCF_PEER
    [Tags]  Smoke  PCSCF_Header Manipulation  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}   HM
    PCSCF_PeerApp.Add HeaderManipulation   ${AdministrationScenarios}
	
Sort Header Manipulation
    [Documentation]     Sort proper Header Manipulation for PCSCF_PEER
    [Tags]  PCSCF_Header  Manipulation  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}  HM
    PCSCF_PeerApp.Sort HeaderManipulation   ${AdministrationScenarios
		
View Header Manipulation
    [Documentation]     View proper Header Manipulation for PCSCF_PEER
    [Tags]  PCSCF_Header Manipulation  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}  HM_Edit
    PCSCF_PeerApp.View HeaderManipulation   ${AdministrationScenarios}
		
Filter Header Manipulation
    [Documentation]     Filter proper Header Manipulation for PCSCF_PEER
    [Tags]  PCSCF_Header Manipulation  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}  HM_Edit
    PCSCF_PeerApp.Filter HeaderManipulation   ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}  HM_Filter_Spechar
    PCSCF_PeerApp.Filter Special Character HeaderManipulation   ${AdministrationScenarios}
		
Edit Header Manipulation
    [Documentation]     Edit proper Header Manipulation for PCSCF_PEER
    [Tags]  Smoke  PCSCF_Header Manipulation  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}   HM_Edit
    PCSCF_PeerApp.Edit HeaderManipulation   ${AdministrationScenarios}
		
Delete Header Manipulation
    [Documentation]     Delete proper Header Manipulation for PCSCF_PEER
    [Tags]  Smoke  PCSCF_Header Manipulation  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}   HM_Delete
    PCSCF_PeerApp.Delete HeaderManipulation   ${AdministrationScenarios}

### Session Control Profile ####		
Add Session Control
    [Documentation]     Add proper Session Control for PCSCF_PEER
    [Tags]  Smoke  PCSCF_Session Control  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}   SessControl
    PCSCF_PeerApp.Add SessionControl 65  ${AdministrationScenarios}

Sort Session Control
    [Documentation]     Sort proper Session Control for PCSCF_PEER
    [Tags]  PCSCF_Session  Control  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}  SessControl
    PCSCF_PeerApp.Sort SessionControl   ${AdministrationScenarios}
			
View Session Control
    [Documentation]     View proper Session Control for PCSCF_PEER
    [Tags]  PCSCF_Session Control  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}  SessControl_Edit
    PCSCF_PeerApp.View SessionControl   ${AdministrationScenarios}
		
Filter Session Control
    [Documentation]     Filter proper Session Control for PCSCF_PEER
    [Tags]  PCSCF_Session Control  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}  SessControl_Edit
    PCSCF_PeerApp.Filter SessionControl   ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}  SessControl_Filter_Spechar
    PCSCF_PeerApp.Filter Special Character SessionControl   ${AdministrationScenarios}
			
Edit Session Control
    [Documentation]     Edit proper Session Control for PCSCF_PEER
    [Tags]  Smoke  PCSCF_Session Control  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}    SessControl_Edit
    PCSCF_PeerApp.Edit SessionControl 65  ${AdministrationScenarios}
	
Delete Session Control
    [Documentation]     Delete proper Session Control for PCSCF_PEER
    [Tags]  Smoke  PCSCF_Session Control  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}    SessControl_Delete
    PCSCF_PeerApp.Delete SessionControl  ${AdministrationScenarios}
	
### User Agent ########		
Add UA
    [Documentation]     Add proper UA of PCSCF
    [Tags]  Smoke  PCSCF_UserAgent  sbc77
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}    UA
    PCSCF_PeerApp.Add UAPCSCF  ${AdministrationScenarios}
	
Sort UA
    [Documentation]     Sort proper UA for PCSCF_PEER
    [Tags]  PCSCF_UserAgent  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}  UA
    PCSCF_PeerApp.Sort UAPCSCF   ${AdministrationScenarios}
	
View UA
    [Documentation]     View proper UA for PCSCF_PEER
    [Tags]  PCSCF_UserAgent  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}  UA_Edit
    PCSCF_PeerApp.View UAPCSCF   ${AdministrationScenarios}
			
Filter UA
    [Documentation]     Filter proper UA for PCSCF_PEER
    [Tags]  PCSCF_UserAgent  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}  UA_Edit
    PCSCF_PeerApp.Filter UAPCSCF   ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}  UA_Filter_Spechar
    PCSCF_PeerApp.Filter Special Character UAPCSCF   ${AdministrationScenarios}
		
Edit UA
    [Documentation]     Edit proper UA of PCSCF
    [Tags]  Smoke  PCSCF_UserAgent  sbc77
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}    UA_Edit
    PCSCF_PeerApp.Edit UAPCSCF  ${AdministrationScenarios}
		
Delete UA
    [Documentation]     Delete proper UA of PCSCF
    [Tags]  Smoke  PCSCF_UserAgent  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}    UA_Delete
    PCSCF_PeerApp.Delete UAPCSCF  ${AdministrationScenarios}

### PCRF profile ########		
Add PCRF
    [Documentation]     Add proper PCRF of PCSCF
    [Tags]   PCSCF_PCRF  sbc77
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}    PCRF
    PCSCF_PeerApp.Add PCRF  ${AdministrationScenarios}
		
Sort PCRF
    [Documentation]     Sort proper PCRF for PCSCF_PEER
    [Tags]  PCSCF_PCRF  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}  PCRF
    PCSCF_PeerApp.Sort PCRF   ${AdministrationScenarios}
		
View PCRF
    [Documentation]     View proper PCRF for PCSCF_PEER
    [Tags]  PCSCF_PCRF  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}  PCRF_Edit
    PCSCF_PeerApp.View PCRF   ${AdministrationScenarios}
		
Filter PCRF
    [Documentation]     Filter proper PCRF for PCSCF_PEER
    [Tags]  PCSCF_PCRF  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}  PCRF_Edit
    PCSCF_PeerApp.Filter PCRF   ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}  PCRF_Filter_Spechar
    PCSCF_PeerApp.Filter Special Character PCRF   ${AdministrationScenarios}
		
Edit PCRF
    [Documentation]     Edit proper PCRF of PCSCF
    [Tags]   PCSCF_PCRF  sbc77
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}    PCRF_Edit
    PCSCF_PeerApp.Edit PCRF  ${AdministrationScenarios}
		
Delete PCRF
    [Documentation]     Delete proper PCRF of PCSCF
    [Tags]   PCSCF_PCRF  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}    PCRF_Delete
    PCSCF_PeerApp.Delete PCRF  ${AdministrationScenarios}

### PHeader Filtering profile ########	
Add PHF
    [Documentation]     Add proper PHF of PCSCF
    [Tags]   PCSCF_PHF  sbc77
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}    PHF65
    PCSCF_PeerApp.Add PHF 63  ${AdministrationScenarios}
		
Sort PHF
    [Documentation]     Sort proper PHF for PCSCF_PEER
    [Tags]  PCSCF_PHF  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}  PHF
    PCSCF_PeerApp.Sort PHF   ${AdministrationScenarios}
		
View PHF
    [Documentation]     View proper PHF for PCSCF_PEER
    [Tags]  PCSCF_PHF  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}  PHF_Edit
    PCSCF_PeerApp.View PHF   ${AdministrationScenarios}
	
Filter PHF
    [Documentation]     Filter proper PHF for PCSCF_PEER
    [Tags]  PCSCF_PHF  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}  PHF_Edit
    PCSCF_PeerApp.Filter PHF   ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}  PHF_Filter_Spechar
    PCSCF_PeerApp.Filter Special Character PHF   ${AdministrationScenarios}
			
Edit PHF
    [Documentation]     Edit proper PHF of PCSCF
    [Tags]   PCSCF_PHF  sbc77
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}    PHF_Edit65
    PCSCF_PeerApp.Edit PHF 63  ${AdministrationScenarios}
		
Delete PHF
    [Documentation]     Delete proper PHF of PCSCF
    [Tags]   PCSCF_PHF  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}    PHF_Delete
    PCSCF_PeerApp.Delete PHF  ${AdministrationScenarios}

### PEER #####
		
Add Peer
    [Documentation]     Add proper Peer of PCSCF
    [Tags]  Smoke  PCSCF_PEER  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}   PEER
    PCSCF_PeerApp.Add PeerPCSCF 63  ${AdministrationScenarios}
    		
Sort Peer
    [Documentation]     Sort proper Peer for PCSCF_PEER
    [Tags]   PCSCF_PEER  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}  PEER
    PCSCF_PeerApp.Sort PeerPCSCF   ${AdministrationScenarios}
		
View Peer
    [Documentation]     View proper Peer for PCSCF_PEER
    [Tags]  PCSCF_PEER  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}  PEER_Edit
    PCSCF_PeerApp.View PeerPCSCF   ${AdministrationScenarios}
	
Filter Peer
    [Documentation]     Filter proper Peer for PCSCF_PEER
    [Tags]  PCSCF_PEER  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}  PEER_Edit
    PCSCF_PeerApp.Filter PeerPCSCF   ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}  PEER_Filter_Spechar
    PCSCF_PeerApp.Filter Special Character PeerPCSCF   ${AdministrationScenarios}
			
Edit Peer
    [Documentation]     Edit proper Peer of PCSCF
    [Tags]  Smoke  PCSCF_PEER  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}    PEER_Edit
    PCSCF_PeerApp.Edit PeerPCSCF 63  ${AdministrationScenarios}
    
Delete Peer
    [Documentation]     Delete proper Peer of PCSCF
    [Tags]  Smoke  PCSCF_PEER  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}    PEER_Delete
    PCSCF_PeerApp.Delete PeerPCSCF  ${AdministrationScenarios}