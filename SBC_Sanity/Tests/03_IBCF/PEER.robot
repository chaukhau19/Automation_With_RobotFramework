*** Settings ***
*** Settings ***
Documentation  This is all tests of IBCF_PEER
Resource  ../../Resources/DataManager.robot
Resource  ../../Data/InputData.robot
Resource  ../../Resources/Common.robot
Resource  ../../Resources/IBCF/IBCF_PeerApp.robot

Test Setup      Common.Begin Web Test
Test Teardown   Common.End Web Test

*** Tasks ***
### Matching Rules####		
Add Matching Rules
    [Documentation]     Add proper matching rules for IBCF_PEER
    [Tags]  Smoke  IBCF_Matching Rule  sbc77
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  MatchingRules
    IBCF_PeerApp.Add MatchingRules   ${AdministrationScenarios}
	
Add Invalid Matching Rules
    [Documentation]     Add invalid matching rules for IBCF_PEER
    [Tags]    IBCF_Matching Rule  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  MatchingRules_Errors
    IBCF_PeerApp.Add Invalid MatchingRules   ${AdministrationScenarios}	
			
Edit Invalid Matching Rules
    [Documentation]     Edit proper matching rules for IBCF_PEER
    [Tags]    IBCF_Matching Rule  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  MatchingRules_Edit_Errors
    IBCF_PeerApp.Edit Invalid MatchingRules   ${AdministrationScenarios}
	
Sort Matching Rules
    [Documentation]     Sort proper matching rules for IBCF_PEER
    [Tags]    IBCF_Matching Rule  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  MatchingRules
    IBCF_PeerApp.Sort MatchingRules   ${AdministrationScenarios}
	
View Matching Rules
    [Documentation]     View proper matching rules for IBCF_PEER
    [Tags]    IBCF_Matching Rule  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  MatchingRules_Edit
    IBCF_PeerApp.View MatchingRules   ${AdministrationScenarios}
		
Filter Matching Rules
    [Documentation]     Filter proper matching rules for IBCF_PEER
    [Tags]    IBCF_Matching Rule  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  MatchingRules_Edit
    IBCF_PeerApp.Filter MatchingRules   ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  MatchingRules_Filter_Spechar
    IBCF_PeerApp.Filter Special Character MatchingRules   ${AdministrationScenarios}
		
Edit Matching Rules
    [Documentation]     Edit proper matching rules for IBCF_PEER
    [Tags]  Smoke  IBCF_Matching Rule  sbc77
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  MatchingRules_Edit
    IBCF_PeerApp.Edit MatchingRules   ${AdministrationScenarios}
		
Delete Matching Rules
    [Documentation]     Delete proper matching rules for IBCF_PEER
    [Tags]  Smoke  IBCF_Matching Rule  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  MatchingRules_Delete
    IBCF_PeerApp.Delete MatchingRules   ${AdministrationScenarios}

### Manipulation Rules####		
Add Manipulation Rules
    [Documentation]     Add proper manipulation rules for IBCF_PEER
    [Tags]  Smoke  IBCF_Manipulation Rule  sbc77
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  ManiRules
    IBCF_PeerApp.Add ManiRules   ${AdministrationScenarios}
	
Sort Manipulation Rules
    [Documentation]     Sort proper manipulation rules for IBCF_PEER
    [Tags]  IBCF_Manipulation Rule  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  ManiRules
    IBCF_PeerApp.Sort ManiRules   ${AdministrationScenarios}
	
View Manipulation Rules
    [Documentation]     View proper manipulation rules for IBCF_PEER
    [Tags]  IBCF_Manipulation Rule  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  ManiRules_Edit
    IBCF_PeerApp.View ManiRules   ${AdministrationScenarios}
			
Filter Manipulation Rules
    [Documentation]     Filter proper manipulation rules for IBCF_PEER
    [Tags]  IBCF_Manipulation Rule  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  ManiRules_Edit
    IBCF_PeerApp.Filter ManiRules   ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  ManiRules_Filter_Spechar
    IBCF_PeerApp.Filter Special Character ManiRules   ${AdministrationScenarios}
		
Edit Manipulation Rules
    [Documentation]     Edit proper manipulation rules for IBCF_PEER
    [Tags]  Smoke  IBCF_Manipulation Rule  sbc77
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  ManiRules_Edit
    IBCF_PeerApp.Edit ManiRules   ${AdministrationScenarios}
		
Delete Manipulation Rules
    [Documentation]     Delete proper manipulation rules for IBCF_PEER
    [Tags]  Smoke  IBCF_Manipulation Rule  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  ManiRules_Delete
    IBCF_PeerApp.Delete ManiRules   ${AdministrationScenarios}

### Header Authorization Profiles####		
#Add Header Authorization Profiles
    #[Documentation]     Add proper Header Authorization Profiles for IBCF_PEER
    #[Tags]  Smoke  IBCF_Header Authorization Profiles  sbc77
    #${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  HAP
    #IBCF_PeerApp.Add HeaderAuthProfiles   ${AdministrationScenarios}

Add Valid Header Authorization Profiles
    [Documentation]     Add proper Header Authorization Profiles for IBCF_PEER
    [Tags]  Smoke  IBCF_Header Authorization Profiles  sbc77
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  HAP_Add_Valid
    IBCF_PeerApp.Add Valid HeaderAuthProfiles   ${AdministrationScenarios}
	
Sort Header Authorization Profiles
    [Documentation]     Sort proper Header Authorization Profiles for IBCF_PEER
    [Tags]  IBCF_Header Authorization Profiles  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  HAP
    IBCF_PeerApp.Sort HeaderAuthProfiles   ${AdministrationScenarios}
		
View Header Authorization Profiles
    [Documentation]     View proper Header Authorization Profiles for IBCF_PEER
    [Tags]  IBCF_Header Authorization Profiles  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  HAP
    IBCF_PeerApp.View HeaderAuthProfiles   ${AdministrationScenarios}
	
Filter Header Authorization Profiles
    [Documentation]     Filter proper Header Authorization Profiles for IBCF_PEER
    [Tags]  IBCF_Header Authorization Profiles  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  HAP
    IBCF_PeerApp.Filter HeaderAuthProfiles   ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  HAP_Filter_Spechar
    IBCF_PeerApp.Filter Special Character HeaderAuthProfiles   ${AdministrationScenarios}
		
Delete Header Authorization Profiles
    [Documentation]     Delete proper Header Authorization Profiles for IBCF_PEER
    [Tags]  Smoke  IBCF_Header Authorization Profiles  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  HAP_Delete
    IBCF_PeerApp.Delete HeaderAuthProfiles   ${AdministrationScenarios}

### Authorization Profiles####		
Add Authorization Profiles
    [Documentation]     Add proper Authorization Profiles for IBCF_PEER
    [Tags]  Smoke  IBCF_Authorization Profiles  sbc77
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  AP
    IBCF_PeerApp.Add AuthProfiles   ${AdministrationScenarios}
	
Sort Authorization Profiles
    [Documentation]     Sort proper Authorization Profiles for IBCF_PEER
    [Tags]   IBCF_Authorization Profiles  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  AP
    IBCF_PeerApp.Sort AuthProfiles   ${AdministrationScenarios}
		
View Authorization Profiles
    [Documentation]     View proper Authorization Profiles for IBCF_PEER
    [Tags]  IBCF_Authorization Profiles  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  AP_Edit
    IBCF_PeerApp.View AuthProfiles   ${AdministrationScenarios}
		
Filter Authorization Profiles
    [Documentation]     Filter proper Authorization Profiles for IBCF_PEER
    [Tags]  IBCF_Authorization Profiles  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  AP_Edit
    IBCF_PeerApp.Filter AuthProfiles   ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  AP_Filter_Spechar
    IBCF_PeerApp.Filter Special Character AuthProfiles   ${AdministrationScenarios}
		
Edit Authorization Profiles
    [Documentation]     Edit proper Authorization Profiles for IBCF_PEER
    [Tags]  Smoke  IBCF_Authorization Profiles  sbc77
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  AP_Edit
    #IBCF_PeerApp.Edit AuthProfiles   ${AdministrationScenarios}
		
Delete Authorization Profiles
    [Documentation]     Delete proper Authorization Profiles for IBCF_PEER
    [Tags]  Smoke  IBCF_Authorization Profiles  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  AP_Delete
    IBCF_PeerApp.Delete AuthProfiles   ${AdministrationScenarios}

### Routing Profiles####	
Add Routing Profiles
    [Documentation]     Add proper Routing Profiles for IBCF_PEER
    [Tags]  Smoke  IBCF_Routing Profiles  sbc77
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  RP
    IBCF_PeerApp.Add RoutingProfiles   ${AdministrationScenarios}
		
Sort Routing Profiles
    [Documentation]     Sort proper Routing Profiles for IBCF_PEER
    [Tags]   IBCF_Routing Profiles  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  RP
    IBCF_PeerApp.Sort RoutingProfiles   ${AdministrationScenarios}
	
Filter Routing Profiles
    [Documentation]     Filter proper Routing Profiles for IBCF_PEER
    [Tags]  IBCF_Routing Profiles  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  RP_Edit
    IBCF_PeerApp.Filter RoutingProfiles   ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  RP_Filter_Spechar
    IBCF_PeerApp.Filter Special Character RoutingProfiles   ${AdministrationScenarios}
		
Edit Routing Profiles
    [Documentation]     Edit proper Routing Profiles for IBCF_PEER
    [Tags]  Smoke  IBCF_Routing Profiles  sbc77
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  RP_Edit
    IBCF_PeerApp.Edit RoutingProfiles   ${AdministrationScenarios}
		
Delete Routing Profiles
    [Documentation]     Delete proper Routing Profiles for IBCF_PEER
    [Tags]  Smoke  IBCF_Routing Profiles  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  RP_Delete
    IBCF_PeerApp.Delete RoutingProfiles   ${AdministrationScenarios}

### Header Manipulation ####		
Add Header Manipulation
    [Documentation]     Add proper Header Manipulation for IBCF_PEER
    [Tags]  Smoke  IBCF_Header Manipulation  sbc77
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  HM
    IBCF_PeerApp.Add HeaderManipulation   ${AdministrationScenarios}
	
Sort Header Manipulation
    [Documentation]     Sort proper Header Manipulation for IBCF_PEER
    [Tags]   IBCF_Header  Manipulation  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  HM
    IBCF_PeerApp.Sort HeaderManipulation   ${AdministrationScenarios}
		
View Header Manipulation
    [Documentation]     View proper Header Manipulation for IBCF_PEER
    [Tags]  IBCF_Header Manipulation  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  HM_Edit
    IBCF_PeerApp.View HeaderManipulation   ${AdministrationScenarios}
		
Filter Header Manipulation
    [Documentation]     Filter proper Header Manipulation for IBCF_PEER
    [Tags]  IBCF_Header Manipulation  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  HM_Edit
    IBCF_PeerApp.Filter HeaderManipulation   ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  HM_Filter_Spechar
    IBCF_PeerApp.Filter Special Character HeaderManipulation   ${AdministrationScenarios}
		
Edit Header Manipulation
    [Documentation]     Edit proper Header Manipulation for IBCF_PEER
    [Tags]  Smoke  IBCF_Header Manipulation  sbc77
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  HM_Edit
    IBCF_PeerApp.Edit HeaderManipulation   ${AdministrationScenarios}
	
Delete Header Manipulation
    [Documentation]     Delete proper Header Manipulation for IBCF_PEER
    [Tags]  Smoke  IBCF_Header Manipulation  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  HM_Delete
    IBCF_PeerApp.Delete HeaderManipulation   ${AdministrationScenarios}
	
### SDP Profile ####		
#Add SDP Profile
    #[Documentation]     Add proper SDP Profile for IBCF_PEER
    #[Tags]  Smoke  IBCF_SDP Profiles  sbc77
    #${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}   SDP
    #IBCF_PeerApp.Add SDPProfile   ${AdministrationScenarios}

Add Valid SDP Profile
    [Documentation]     Add proper SDP Profile for IBCF_PEER
    [Tags]  Smoke  IBCF_SDP Profiles  sbc77
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}   SDP_Add_Valid
   # IBCF_PeerApp.Add Valid SDPProfile   ${AdministrationScenarios}
	
Sort SDP Profile
    [Documentation]     Sort proper SDP Profile for IBCF_PEER
    [Tags]   IBCF_SDP Profiles  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  SDP
    IBCF_PeerApp.Sort SDPProfile   ${AdministrationScenarios}
		
View SDP Profile
    [Documentation]     View proper SDP Profile for IBCF_PEER
    [Tags]  IBCF_SDP Profiles  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  SDP_Edit
    IBCF_PeerApp.View SDPProfile   ${AdministrationScenarios}
		
Filter SDP Profile
    [Documentation]     Filter proper SDP Profile for IBCF_PEER
    [Tags]  IBCF_SDP Profiles  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  SDP_Edit
    IBCF_PeerApp.Filter SDPProfile   ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  SDP_Filter_Spechar
    IBCF_PeerApp.Filter Special Character SDPProfile   ${AdministrationScenarios}
		
Edit SDP Profile
    [Documentation]     Edit proper SDP Profile for IBCF_PEER
    [Tags]  Smoke  IBCF_SDP Profiles  sbc77
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}   SDP_Edit
    #IBCF_PeerApp.Edit Valid SDPProfile   ${AdministrationScenarios}

Edit Valid SDP Profile
    [Documentation]     Edit proper SDP Profile for IBCF_PEER
    [Tags]  Smoke  IBCF_SDP Profiles  sbc77
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}   SDP_Edit_Valid
   # IBCF_PeerApp.Edit Valid SDPProfile   ${AdministrationScenarios}
	
Delete SDP Profile
    [Documentation]     Delete proper SDP Profile for IBCF_PEER
    [Tags]  Smoke  IBCF_SDP Profiles  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}   SDP_Delete
    IBCF_PeerApp.Delete SDPProfile   ${AdministrationScenarios}
	
### Session Limiter Profile ####		
Add Session Limiter
    [Documentation]     Add proper Session Limiter for IBCF_PEER
    [Tags]  Smoke  IBCF_Session Limiter  sbc77
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  SessLimiter
    IBCF_PeerApp.Add SessionLimiter  ${AdministrationScenarios}
	
Sort Session Limiter
    [Documentation]     Sort proper Session Limiter for IBCF_PEER
    [Tags]   IBCF_Session  Limiter  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  SessLimiter
    IBCF_PeerApp.Sort SessionLimiter   ${AdministrationScenarios}
	
View Session Limiter
    [Documentation]     View proper Session Limiter for IBCF_PEER
    [Tags]  IBCF_Session Limiter  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  SessLimiter_Edit
    IBCF_PeerApp.View SessionLimiter   ${AdministrationScenarios}
			
Filter Session Limiter
    [Documentation]     Filter proper Session Limiter for IBCF_PEER
    [Tags]  IBCF_Session Limiter  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  SessLimiter_Edit
    IBCF_PeerApp.Filter SessionLimiter   ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  SessLimiter_Filter_Spechar
    IBCF_PeerApp.Filter Special Character SessionLimiter   ${AdministrationScenarios}
	
Edit Session Limiter
    [Documentation]     Edit proper Session Limiter for IBCF_PEER
    [Tags]  Smoke  IBCF_Session Limiter  sbc77
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  SessLimiter_Edit
    IBCF_PeerApp.Edit SessionLimiter  ${AdministrationScenarios}
			
Delete Session Limiter
    [Documentation]     Delete proper Session Limiter for IBCF_PEER
    [Tags]  Smoke  IBCF_Session Limiter  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  SessLimiter_Delete
    IBCF_PeerApp.Delete SessionLimiter  ${AdministrationScenarios}

### Session Control Profile ####	
Add Session Control
    [Documentation]     Add proper Session Control for IBCF_PEER
    [Tags]  Smoke  IBCF_Session_Control  sbc77
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  SessControl
    IBCF_PeerApp.Add SessionControl  ${AdministrationScenarios}
		
Sort Session Control
    [Documentation]     Sort proper Session Control for IBCF_PEER
    [Tags]   IBCF_Session_Control  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  SessControl
    IBCF_PeerApp.Sort SessionControl   ${AdministrationScenarios}
		
View Session Control
    [Documentation]     View proper Session Control for IBCF_PEER
    [Tags]  IBCF_Session_Control  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  SessControl_Edit
    IBCF_PeerApp.View SessionControl   ${AdministrationScenarios}
		
Filter Session Control
    [Documentation]     Filter proper Session Control for IBCF_PEER
    [Tags]  IBCF_Session_Control  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  SessControl_Edit
    IBCF_PeerApp.Filter SessionControl   ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  SessControl_Filter_Spechar
    IBCF_PeerApp.Filter Special Character SessionControl   ${AdministrationScenarios}
	
Edit Session Control
    [Documentation]     Edit proper Session Control for IBCF_PEER
    [Tags]  Smoke  IBCF_Session_Control  sbc77
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  SessControl_Edit
    IBCF_PeerApp.Edit SessionControl  ${AdministrationScenarios}
			
Delete Session Control
    [Documentation]     Delete proper Session Control for IBCF_PEER
    [Tags]  Smoke  IBCF_Session_Control  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  SessControl_Delete
    IBCF_PeerApp.Delete SessionControl  ${AdministrationScenarios}

### RFC4028 Profile ####		
Add RFC4028
    [Documentation]     Add proper RFC4028 for IBCF_PEER
    [Tags]  Smoke  IBCF_RFC4028  sbc77
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  RFC4028
    IBCF_PeerApp.Add RFC4028  ${AdministrationScenarios}
	
Sort RFC4028
    [Documentation]     Sort proper RFC4028 for IBCF_PEER
    [Tags]   IBCF_RFC4028  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  RFC4028
    IBCF_PeerApp.Sort RFC4028   ${AdministrationScenarios}
		
View RFC4028
    [Documentation]     View proper RFC4028 for IBCF_PEER
    [Tags]  IBCF_RFC4028  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  RFC4028_Edit
    IBCF_PeerApp.View RFC4028   ${AdministrationScenarios}
		
Filter RFC4028
    [Documentation]     Filter proper RFC4028 for IBCF_PEER
    [Tags]  IBCF_RFC4028  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  RFC4028_Edit
    IBCF_PeerApp.Filter RFC4028   ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  RFC4028_Filter_Spechar
    IBCF_PeerApp.Filter Special Character RFC4028   ${AdministrationScenarios}
	
Edit RFC4028
    [Documentation]     Edit proper RFC4028 for IBCF_PEER
    [Tags]  Smoke  IBCF_RFC4028  sbc77
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  RFC4028_Edit
    IBCF_PeerApp.Edit RFC4028  ${AdministrationScenarios}
			
Delete RFC4028
    [Documentation]     Delete proper RFC4028 for IBCF_PEER
    [Tags]  Smoke  IBCF_RFC4028  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  RFC4028_Delete
    IBCF_PeerApp.Delete RFC4028  ${AdministrationScenarios}

### Core Domain ####		
Add Core Domain
    [Documentation]     Add proper core domain for IBCF_PEER
    [Tags]  Smoke  IBCF_Core Domain  sbc77
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  CoreDomain
    IBCF_PeerApp.Add Core Domain  ${AdministrationScenarios}
		
Delete Core Domain
    [Documentation]     Delete proper core domain for IBCF_PEER
    [Tags]  Smoke  IBCF_Core Domain  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  CoreDomain
    IBCF_PeerApp.Delete Core Domain  ${AdministrationScenarios}
	

### PEER #####
	
Add Peer
    [Documentation]     Add added proper Peer of IBCF
    [Tags]  Smoke  IBCF_PEER  sbc77  Precondition
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  Peer
    IBCF_PeerApp.Add PeerIBCF71  ${AdministrationScenarios}

View Peer
    [Documentation]     View proper Peer for IBCF
    [Tags]  IBCF_PEER  sbc77  Precondition  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  Peer
    IBCF_PeerApp.View PeerIBCF71   ${AdministrationScenarios}
	
Sort Peer
    [Documentation]     Sort proper Peer for IBCF
    [Tags]   IBCF_PEER  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  Peer
    IBCF_PeerApp.Sort PeerIBCF   ${AdministrationScenarios}
		
Filter Peer
    [Documentation]     Filter proper Peer for IBCF
    [Tags]  IBCF_PEER  sbc77  Precondition  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  Peer_Edit
    IBCF_PeerApp.Filter PeerIBCF   ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  Peer_Filter_Spechar
    IBCF_PeerApp.Filter Special Character PeerIBCF   ${AdministrationScenarios}
	
Edit Peer
    [Documentation]     Edit proper Peer of IBCF
    [Tags]  Smoke  IBCF_PEER  sbc77  Precondition
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  Peer_Edit
    IBCF_PeerApp.Edit PeerIBCF71  ${AdministrationScenarios}
		
Delete Peer
    [Documentation]     Delete proper Peer of IBCF
    [Tags]  Smoke  IBCF_PEER  sbc77  Precondition  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  Peer_Delete
    IBCF_PeerApp.Delete PeerIBCF  ${AdministrationScenarios}


