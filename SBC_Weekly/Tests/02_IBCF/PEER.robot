*** Settings ***
*** Settings ***
Documentation  This is all tests of IBCF_PEER
Resource  ../../Resources/DataManager.robot
Resource  ../../Data/InputData.robot
Resource  ../../Resources/Common.robot
Resource  ../../Resources/IBCF/IBCF_PeerApp.robot

#Test Setup      Common.Begin Web Test
Test Teardown   Common.End Web Test

*** Tasks ***

############################### Matching Rules #######################################
	
Add Matching Rules
    [Documentation]    Verify the functionality of 'Add Matching Rules' on the Peer page of IBCF
    [Tags]    IBCF    IBCF_Peer    IBCF_Peer_MatchingRule    
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  MatchingRules_Add
    IBCF_PeerApp.Add MatchingRules   ${AdministrationScenarios}

Add Invalid Matching Rules
    [Documentation]    Verify the functionality of 'Add Invalid Matching Rules' on the Peer page of IBCF
    [Tags]    IBCF    IBCF_Peer    IBCF_Peer_MatchingRule    
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  MatchingRules_Add_Invalid
    IBCF_PeerApp.Add Invalid MatchingRules   ${AdministrationScenarios}	

View Matching Rules
    [Documentation]    Verify the functionality of 'View Matching Rules' on the Peer page of IBCF
    [Tags]    IBCF    IBCF_Peer    IBCF_Peer_MatchingRule      
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  MatchingRules_View
    IBCF_PeerApp.View MatchingRules   ${AdministrationScenarios}

Filter Matching Rules
    [Documentation]    Verify the functionality of 'Filter Matching Rules' on the Peer page of IBCF
    [Tags]    IBCF    IBCF_Peer    IBCF_Peer_MatchingRule  
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  MatchingRules_Filter
    IBCF_PeerApp.Filter MatchingRules   ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  MatchingRules_Filter_Spechar
    IBCF_PeerApp.Filter Special Character MatchingRules   ${AdministrationScenarios}

Sort Matching Rules
    [Documentation]    Verify the functionality of 'Sort Matching Rules' on the Peer page of IBCF
    [Tags]    IBCF    IBCF_Peer    IBCF_Peer_MatchingRule  
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  MatchingRules_Sort
    IBCF_PeerApp.Sort MatchingRules   ${AdministrationScenarios}

Edit Invalid Matching Rules
    [Documentation]    Verify the functionality of 'Edit Invalid Matching Rules' on the Peer page of IBCF
    [Tags]    IBCF    IBCF_Peer    IBCF_Peer_MatchingRule    
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  MatchingRules_Edit_Invalid
    IBCF_PeerApp.Edit Invalid MatchingRules   ${AdministrationScenarios}

Edit Matching Rules
    [Documentation]    Verify the functionality of 'Edit Matching Rules' on the Peer page of IBCF
    [Tags]    IBCF    IBCF_Peer    IBCF_Peer_MatchingRule   
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  MatchingRules_Edit
    IBCF_PeerApp.Edit MatchingRules   ${AdministrationScenarios}

Delete Matching Rules
    [Documentation]    Verify the functionality of 'Delete Matching Rules' on the Peer page of IBCF
    [Tags]    IBCF    IBCF_Peer    IBCF_Peer_MatchingRule     
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  MatchingRules_Delete
    IBCF_PeerApp.Delete MatchingRules   ${AdministrationScenarios}






######################### Manipulation Rules ###############################
	
Add Manipulation Rules
    [Documentation]    Verify the functionality of 'Add Manipulation Rules' on the Peer page of IBCF
    [Tags]    IBCF    IBCF_Peer    IBCF_Peer_ManipulationRule  
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  ManiRules_Add
    IBCF_PeerApp.Add ManiRules   ${AdministrationScenarios}

Sort Manipulation Rules
    [Documentation]    Verify the functionality of 'Sort Manipulation Rules' on the Peer page of IBCF
    [Tags]    IBCF    IBCF_Peer    IBCF_Peer_ManipulationRule  
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  ManiRules_Sort
    IBCF_PeerApp.Sort ManiRules   ${AdministrationScenarios}

View Manipulation Rules
    [Documentation]    Verify the functionality of 'View Manipulation Rules' on the Peer page of IBCF
    [Tags]    IBCF    IBCF_Peer    IBCF_Peer_ManipulationRule   
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  ManiRules_View
    IBCF_PeerApp.View ManiRules   ${AdministrationScenarios}

Filter Manipulation Rules
    [Documentation]    Verify the functionality of 'Filter Manipulation Rules' on the Peer page of IBCF
    [Tags]    IBCF    IBCF_Peer    IBCF_Peer_ManipulationRule     
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  ManiRules_Filter
    IBCF_PeerApp.Filter ManiRules   ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  ManiRules_Filter_Spechar
    IBCF_PeerApp.Filter Special Character ManiRules   ${AdministrationScenarios}

Edit Manipulation Rules
    [Documentation]    Verify the functionality of 'Edit Manipulation Rules' on the Peer page of IBCF
    [Tags]    IBCF    IBCF_Peer    IBCF_Peer_ManipulationRule 
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  ManiRules_Edit
    IBCF_PeerApp.Edit ManiRules   ${AdministrationScenarios}

Delete Manipulation Rules
    [Documentation]    Verify the functionality of 'Delete Manipulation Rules' on the Peer page of IBCF
    [Tags]    IBCF    IBCF_Peer    IBCF_Peer_ManipulationRule  
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  ManiRules_Delete
    IBCF_PeerApp.Delete ManiRules   ${AdministrationScenarios}






######################### Header Authorization Profiles ###########################
Add Valid Header Authorization Profiles
    [Documentation]    Verify the functionality of 'Add Header Authorization Profiles' on the Peer page of IBCF
    [Tags]    IBCF    IBCF_Peer    IBCF_Peer_HAP
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  HAP_Add_Valid
    IBCF_PeerApp.Add Valid HeaderAuthProfiles   ${AdministrationScenarios}

Add Invalid Header Authorization Profiles
    [Documentation]    Verify the functionality of 'Add Header Authorization Profiles' on the Peer page of IBCF
    [Tags]    IBCF    IBCF_Peer    IBCF_Peer_HAP   
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  HAP_Add_Invalid
    IBCF_PeerApp.Add Invalid HeaderAuthProfiles   ${AdministrationScenarios}

Sort Header Authorization Profiles
    [Documentation]    Verify the functionality of 'Sort Header Authorization Profiles' on the Peer page of IBCF
    [Tags]    IBCF    IBCF_Peer    IBCF_Peer_HAP 
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  HAP_Sort
    IBCF_PeerApp.Sort HeaderAuthProfiles   ${AdministrationScenarios}

View Header Authorization Profiles
    [Documentation]    Verify the functionality of 'View Header Authorization Profiles' on the Peer page of IBCF
    [Tags]    IBCF    IBCF_Peer    IBCF_Peer_HAP
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  HAP_View
    IBCF_PeerApp.View HeaderAuthProfiles   ${AdministrationScenarios}

Filter Header Authorization Profiles
    [Documentation]    Verify the functionality of 'Filter Header Authorization Profiles' on the Peer page of IBCF
    [Tags]    IBCF    IBCF_Peer    IBCF_Peer_HAP 
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  HAP_Filter
    IBCF_PeerApp.Filter HeaderAuthProfiles   ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  HAP_Filter_Spechar
    IBCF_PeerApp.Filter Special Character HeaderAuthProfiles   ${AdministrationScenarios}

Delete Header Authorization Profiles
    [Documentation]    Verify the functionality of 'Delete Header Authorization Profiles' on the Peer page of IBCF
    [Tags]    IBCF    IBCF_Peer    IBCF_Peer_HAP 
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  HAP_Delete
    IBCF_PeerApp.Delete HeaderAuthProfiles   ${AdministrationScenarios}






############################# Authorization Profiles ########################################
Add Authorization Profiles
    [Documentation]    Verify the functionality of 'Add Authorization Profiles' on the Peer page of IBCF
    [Tags]    IBCF    IBCF_Peer    IBCF_Peer_AP       
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  AP_Add    
    IBCF_PeerApp.Add AuthProfiles   ${AdministrationScenarios}

Add Invalid Authorization Profiles
    [Documentation]    Verify the functionality of 'Add Authorization Profiles' on the Peer page of IBCF
    [Tags]    IBCF    IBCF_Peer    IBCF_Peer_AP      
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  AP_Add_Invalid   
    IBCF_PeerApp.Add Invalid AuthProfiles   ${AdministrationScenarios}

Sort Authorization Profiles
    [Documentation]    Verify the functionality of 'Sort Authorization Profiles' on the Peer page of IBCF
    [Tags]    IBCF    IBCF_Peer    IBCF_Peer_AP     
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  AP_Sort
    IBCF_PeerApp.Sort AuthProfiles   ${AdministrationScenarios}

View Authorization Profiles
    [Documentation]    Verify the functionality of 'View Authorization Profiles' on the Peer page of IBCF
    [Tags]    IBCF    IBCF_Peer    IBCF_Peer_AP           
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  AP_View
    IBCF_PeerApp.View AuthProfiles   ${AdministrationScenarios}

Filter Authorization Profiles
    [Documentation]    Verify the functionality of 'Filter Authorization Profiles' on the Peer page of IBCF
    [Tags]    IBCF    IBCF_Peer    IBCF_Peer_AP       
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  AP_Filter
    IBCF_PeerApp.Filter AuthProfiles   ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  AP_Filter_Spechar
    IBCF_PeerApp.Filter Special Character AuthProfiles   ${AdministrationScenarios}

Edit Authorization Profiles
    [Documentation]    Verify the functionality of 'Edit Authorization Profiles' on the Peer page of IBCF
    [Tags]    IBCF    IBCF_Peer    IBCF_Peer_AP   
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  AP_Edit
    IBCF_PeerApp.Edit AuthProfiles   ${AdministrationScenarios}

Delete Authorization Profiles
    [Documentation]    Verify the functionality of 'Edit Authorization Profiles' on the Peer page of IBCF
    [Tags]    IBCF    IBCF_Peer    IBCF_Peer_AP        
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  AP_Delete
    IBCF_PeerApp.Delete AuthProfiles   ${AdministrationScenarios}






################################## Routing Profiles #############################################
Add Routing Profiles
    [Documentation]    Verify the functionality of 'Add Routing Profiles' on the Peer page of IBCF
    [Tags]    IBCF    IBCF_Peer    IBCF_Peer_RoutingProfiles      
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  RP_Add
    IBCF_PeerApp.Add RoutingProfiles   ${AdministrationScenarios}

Sort Routing Profiles
    [Documentation]    Verify the functionality of 'Sort Routing Profiles' on the Peer page of IBCF
    [Tags]    IBCF    IBCF_Peer    IBCF_Peer_RoutingProfiles     
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  RP_Sort
    IBCF_PeerApp.Sort RoutingProfiles   ${AdministrationScenarios}

Filter Routing Profiles
    [Documentation]    Verify the functionality of 'Filter Routing Profiles' on the Peer page of IBCF
    [Tags]    IBCF    IBCF_Peer    IBCF_Peer_RoutingProfiles    
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  RP_Filter
    IBCF_PeerApp.Filter RoutingProfiles   ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  RP_Filter_Spechar
    IBCF_PeerApp.Filter Special Character RoutingProfiles   ${AdministrationScenarios}

Edit Routing Profiles
    [Documentation]    Verify the functionality of 'Edit Routing Profiles' on the Peer page of IBCF
    [Tags]    IBCF    IBCF_Peer    IBCF_Peer_RoutingProfiles   
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  RP_Edit
    IBCF_PeerApp.Edit RoutingProfiles   ${AdministrationScenarios}

Delete Routing Profiles
    [Documentation]    Verify the functionality of 'Delete Routing Profiles' on the Peer page of IBCF
    [Tags]    IBCF    IBCF_Peer    IBCF_Peer_RoutingProfiles  
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  RP_Delete
    IBCF_PeerApp.Delete RoutingProfiles   ${AdministrationScenarios}





########################## Header Manipulation ##########################
Add Header Manipulation
    [Documentation]    Verify the functionality of 'Add Header Manipulation' on the Peer page of IBCF
    [Tags]    IBCF    IBCF_Peer    IBCF_Peer_HM 
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  HM_Add
    IBCF_PeerApp.Add HeaderManipulation   ${AdministrationScenarios}

Sort Header Manipulation
    [Documentation]    Verify the functionality of 'Sort Header Manipulation' on the Peer page of IBCF
    [Tags]    IBCF    IBCF_Peer    IBCF_Peer_HM   
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  HM_Sort
    IBCF_PeerApp.Sort HeaderManipulation   ${AdministrationScenarios}

View Header Manipulation
    [Documentation]    Verify the functionality of 'View Header Manipulation' on the Peer page of IBCF
    [Tags]    IBCF    IBCF_Peer    IBCF_Peer_HM  
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  HM_View
    IBCF_PeerApp.View HeaderManipulation   ${AdministrationScenarios}

Filter Header Manipulation
    [Documentation]    Verify the functionality of 'Filter Header Manipulation' on the Peer page of IBCF
    [Tags]    IBCF    IBCF_Peer    IBCF_Peer_HM     
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  HM_Filter
    IBCF_PeerApp.Filter HeaderManipulation   ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  HM_Filter_Spechar
    IBCF_PeerApp.Filter Special Character HeaderManipulation   ${AdministrationScenarios}

Edit Header Manipulation
    [Documentation]    Verify the functionality of 'Edit Header Manipulation' on the Peer page of IBCF
    [Tags]    IBCF    IBCF_Peer    IBCF_Peer_HM   
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  HM_Edit
    IBCF_PeerApp.Edit HeaderManipulation   ${AdministrationScenarios}

Delete Header Manipulation
    [Documentation]    Verify the functionality of 'Delete Header Manipulation' on the Peer page of IBCF
    [Tags]    IBCF    IBCF_Peer    IBCF_Peer_HM  
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  HM_Delete
    IBCF_PeerApp.Delete HeaderManipulation   ${AdministrationScenarios}
	




########################### SDP Profile ###############################
Add Valid SDP Profile
    [Documentation]    Verify the functionality of 'Add SDP Profile' on the Peer page of IBCF
    [Tags]    IBCF    IBCF_Peer    IBCF_Peer_SDPProfiles    
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}   SDP_Add_Valid
    IBCF_PeerApp.Add Valid SDPProfile   ${AdministrationScenarios}

Add Invalid SDP Profile
    [Documentation]    Verify the functionality of 'Add SDP Profile' on the Peer page of IBCF
    [Tags]    IBCF    IBCF_Peer    IBCF_Peer_SDPProfiles     
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}   SDP_Add_Invalid
    IBCF_PeerApp.Add Invalid SDPProfile   ${AdministrationScenarios}

Sort SDP Profile
    [Documentation]    Verify the functionality of 'Sort SDP Profile' on the Peer page of IBCF
    [Tags]    IBCF    IBCF_Peer    IBCF_Peer_SDPProfiles          
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  SDP_Sort
    IBCF_PeerApp.Sort SDPProfile   ${AdministrationScenarios}

View SDP Profile
    [Documentation]    Verify the functionality of 'View SDP Profile' on the Peer page of IBCF
    [Tags]    IBCF    IBCF_Peer    IBCF_Peer_SDPProfiles        
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  SDP_View
    IBCF_PeerApp.View SDPProfile   ${AdministrationScenarios}

Filter SDP Profile
    [Documentation]    Verify the functionality of 'Filter SDP Profile' on the Peer page of IBCF
    [Tags]    IBCF    IBCF_Peer    IBCF_Peer_SDPProfiles          
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  SDP_Filter_Valid
    IBCF_PeerApp.Filter SDPProfile   ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  SDP_Filter_Spechar
    IBCF_PeerApp.Filter Special Character SDPProfile   ${AdministrationScenarios}

Edit Valid SDP Profile
    [Documentation]    Verify the functionality of 'Edit SDP Profile' on the Peer page of IBCF
    [Tags]    IBCF    IBCF_Peer    IBCF_Peer_SDPProfiles         
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}   SDP_Edit_Valid
    IBCF_PeerApp.Edit Valid SDPProfile   ${AdministrationScenarios}

Edit Invalid SDP Profile
    [Documentation]    Verify the functionality of 'Edit SDP Profile' on the Peer page of IBCF
    [Tags]    IBCF    IBCF_Peer    IBCF_Peer_SDPProfiles    
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}   SDP_Edit_Invalid
    IBCF_PeerApp.Edit Invalid SDPProfile   ${AdministrationScenarios}

Delete SDP Profile
    [Documentation]    Verify the functionality of 'Delete SDP Profile' on the Peer page of IBCF
    [Tags]    IBCF    IBCF_Peer    IBCF_Peer_SDPProfiles       
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}   SDP_Delete
    IBCF_PeerApp.Delete SDPProfile   ${AdministrationScenarios}
	



####################### Session Limiter Profile ############################
Add Session Limiter
    [Documentation]    Verify the functionality of 'Add Session Limiter' on the Peer page of IBCF
    [Tags]    IBCF    IBCF_Peer    IBCF_Peer_SessionLimiter  
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  SessLimiter
    IBCF_PeerApp.Add SessionLimiter  ${AdministrationScenarios}

Sort Session Limiter
    [Documentation]    Verify the functionality of 'Sort Session Limiter' on the Peer page of IBCF
    [Tags]    IBCF    IBCF_Peer    IBCF_Peer_SessionLimiter     
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  SessLimiter_Sort
    IBCF_PeerApp.Sort SessionLimiter   ${AdministrationScenarios}

View Session Limiter
    [Documentation]    Verify the functionality of 'View Session Limiter' on the Peer page of IBCF
    [Tags]    IBCF    IBCF_Peer    IBCF_Peer_SessionLimiter     
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  SessLimiter_View
    IBCF_PeerApp.View SessionLimiter   ${AdministrationScenarios}

Filter Session Limiter
    [Documentation]    Verify the functionality of 'Filter Session Limiter' on the Peer page of IBCF
    [Tags]    IBCF    IBCF_Peer    IBCF_Peer_SessionLimiter     
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  SessLimiter_Filter
    IBCF_PeerApp.Filter SessionLimiter   ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  SessLimiter_Filter_Spechar
    IBCF_PeerApp.Filter Special Character SessionLimiter   ${AdministrationScenarios}

Edit Session Limiter
    [Documentation]    Verify the functionality of 'Edit Session Limiter' on the Peer page of IBCF
    [Tags]    IBCF    IBCF_Peer    IBCF_Peer_SessionLimiter  
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  SessLimiter_Edit
    IBCF_PeerApp.Edit SessionLimiter  ${AdministrationScenarios}

Delete Session Limiter
    [Documentation]    Verify the functionality of 'Delete Session Limiter' on the Peer page of IBCF
    [Tags]    IBCF    IBCF_Peer    IBCF_Peer_SessionLimiter    
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  SessLimiter_Delete
    IBCF_PeerApp.Delete SessionLimiter  ${AdministrationScenarios}




##################### Session Control Profile #######################
Add Session Control
    [Documentation]    Verify the functionality of 'Add Session Control' on the Peer page of IBCF
    [Tags]    IBCF    IBCF_Peer    IBCF_Peer_SessionControl 
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  SessControl
    IBCF_PeerApp.Add SessionControl  ${AdministrationScenarios}

Sort Session Control
    [Documentation]    Verify the functionality of 'Sort Session Control' on the Peer page of IBCF
    [Tags]    IBCF    IBCF_Peer    IBCF_Peer_SessionControl   
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  SessControl_Sort
    IBCF_PeerApp.Sort SessionControl   ${AdministrationScenarios}

View Session Control
    [Documentation]    Verify the functionality of 'View Session Control' on the Peer page of IBCF
    [Tags]    IBCF    IBCF_Peer    IBCF_Peer_SessionControl 
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  SessControl_View
    IBCF_PeerApp.View SessionControl   ${AdministrationScenarios}

Filter Session Control
    [Documentation]    Verify the functionality of 'Filter Session Control' on the Peer page of IBCF
    [Tags]    IBCF    IBCF_Peer    IBCF_Peer_SessionControl   
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  SessControl_Filter
    IBCF_PeerApp.Filter SessionControl   ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  SessControl_Filter_Spechar
    IBCF_PeerApp.Filter Special Character SessionControl   ${AdministrationScenarios}

Edit Session Control
    [Documentation]    Verify the functionality of 'Edit Session Control' on the Peer page of IBCF
    [Tags]    IBCF    IBCF_Peer    IBCF_Peer_SessionControl 
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  SessControl_Edit
    IBCF_PeerApp.Edit SessionControl  ${AdministrationScenarios}

Delete Session Control
    [Documentation]    Verify the functionality of 'Delete Session Control' on the Peer page of IBCF
    [Tags]    IBCF    IBCF_Peer    IBCF_Peer_SessionControl    
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  SessControl_Delete
    IBCF_PeerApp.Delete SessionControl  ${AdministrationScenarios}

######################### RFC4028 Profile ################################
Add Valid RFC4028
    [Documentation]    Verify the functionality of 'Add Valid RFC4028' on the Peer page of IBCF
    [Tags]    IBCF    IBCF_Peer    IBCF_Peer_RFC4028   
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  RFC4028
    IBCF_PeerApp.Add Valid RFC4028  ${AdministrationScenarios}

Add Invalid RFC4028
    [Documentation]    Verify the functionality of 'Add Invalid RFC4028' on the Peer page of IBCF
    [Tags]    IBCF    IBCF_Peer    IBCF_Peer_RFC4028  
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  RFC4028_Error
    IBCF_PeerApp.Add Invalid RFC4028  ${AdministrationScenarios}

Sort RFC4028
    [Documentation]    Verify the functionality of 'Sort RFC4028' on the Peer page of IBCF
    [Tags]    IBCF    IBCF_Peer    IBCF_Peer_RFC4028       
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  RFC4028_Sort
    IBCF_PeerApp.Sort RFC4028   ${AdministrationScenarios}

View RFC4028
    [Documentation]    Verify the functionality of 'View RFC4028' on the Peer page of IBCF
    [Tags]    IBCF    IBCF_Peer    IBCF_Peer_RFC4028     
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  RFC4028_View
    IBCF_PeerApp.View RFC4028   ${AdministrationScenarios}

Filter RFC4028
    [Documentation]     Edit proper RFC4028 for IBCF_PEER
    [Tags]    IBCF    IBCF_Peer    IBCF_Peer_RFC4028  
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  RFC4028_Filter
    IBCF_PeerApp.Filter RFC4028   ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  RFC4028_Filter_Spechar
    IBCF_PeerApp.Filter Special Character RFC4028   ${AdministrationScenarios}

Edit Valid RFC4028
    [Documentation]    Verify the functionality of 'Edit Valid RFC4028' on the Peer page of IBCF
    [Tags]    IBCF    IBCF_Peer    IBCF_Peer_RFC4028   
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  RFC4028_Edit
    IBCF_PeerApp.Edit Valid RFC4028  ${AdministrationScenarios}

Edit Invalid RFC4028
    [Documentation]    Verify the functionality of 'Edit Invalid RFC4028' on the Peer page of IBCF
    [Tags]    IBCF    IBCF_Peer    IBCF_Peer_RFC4028   
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  RFC4028_Edit_Error
    IBCF_PeerApp.Edit invalid RFC4028  ${AdministrationScenarios}

Delete RFC4028
    [Documentation]    Verify the functionality of 'Delete RFC4028' on the Peer page of IBCF
    [Tags]    IBCF    IBCF_Peer    IBCF_Peer_RFC4028     
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  RFC4028_Delete
    IBCF_PeerApp.Delete RFC4028  ${AdministrationScenarios}





########################### Core Domain ####################################
Add Core Domain
    [Documentation]    Verify the functionality of 'Add Core Domain' on the Peer page of IBCF
    [Tags]    IBCF    IBCF_Peer    IBCF_Peer_CoreDomain  
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  CoreDomain_Add
    IBCF_PeerApp.Add Core Domain  ${AdministrationScenarios}
	
Delete Core Domain
    [Documentation]    Verify the functionality of 'Delete Core Domain' on the Peer page of IBCF
    [Tags]    IBCF    IBCF_Peer    IBCF_Peer_CoreDomain  
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  CoreDomain_Delete
    IBCF_PeerApp.Delete Core Domain  ${AdministrationScenarios}
	






############################### PEER #####################################
Add Peer
    [Documentation]    Verify the functionality of 'Add Peer' on the Peer page of IBCF
    [Tags]    IBCF    IBCF_Peer    IBCF_Peer_PEER    
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  Peer_Add
    IBCF_PeerApp.Add PeerIBCF  ${AdministrationScenarios}

Edit Peer
    [Documentation]    Verify the functionality of 'Edit Peer' on the Peer page of IBCF
    [Tags]    IBCF    IBCF_Peer    IBCF_Peer_PEER   
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  Peer_Edit
    IBCF_PeerApp.Edit PeerIBCF  ${AdministrationScenarios}

View Peer
    [Documentation]    Verify the functionality of 'View Peer' on the Peer page of IBCF
    [Tags]    IBCF    IBCF_Peer    IBCF_Peer_PEER     
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  Peer_View
    IBCF_PeerApp.View PeerIBCF   ${AdministrationScenarios}

Sort Peer
    [Documentation]    Verify the functionality of 'Sort Peer' on the Peer page of IBCF
    [Tags]    IBCF    IBCF_Peer    IBCF_Peer_PEER       
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  Peer_Sort
    IBCF_PeerApp.Sort PeerIBCF   ${AdministrationScenarios}

Filter Peer
    [Documentation]    Verify the functionality of 'Filter Peer' on the Peer page of IBCF
    [Tags]    IBCF    IBCF_Peer    IBCF_Peer_PEER     
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  Peer_Filter
    IBCF_PeerApp.Filter PeerIBCF   ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  Peer_Filter_Spechar
    IBCF_PeerApp.Filter Special Character PeerIBCF   ${AdministrationScenarios}

Delete Peer
    [Documentation]    Verify the functionality of 'Delete Peer' on the Peer page of IBCF
    [Tags]    IBCF    IBCF_Peer    IBCF_Peer_PEER   
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${IBCF_Peer}  Peer_Delete
    IBCF_PeerApp.Delete PeerIBCF  ${AdministrationScenarios}


