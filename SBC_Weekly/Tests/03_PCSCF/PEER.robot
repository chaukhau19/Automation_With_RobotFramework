*** Settings ***
Documentation  This is all tests of PCSCF_PEER
Library  SeleniumLibrary
Resource  ../../Resources/DataManager.robot
Resource  ../../Data/InputData.robot
Resource  ../../Resources/Common.robot
Resource  ../../Resources/PCSCF/PCSCF_PeerApp.robot

#Test Setup      Common.Begin Web Test
Test Teardown   Common.End Web Test

*** Tasks ***


###################### Matching Rules ##############################
Add Matching Rules
    [Documentation]   Verify The Add function on the Matching Rules page of PCSCF 
    [Tags]    PCSCF    PCSCF_Peer    PCSCF_Peer_MatchingRule    
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}  MatchingRules
    PCSCF_PeerApp.Add MatchingRules   ${AdministrationScenarios}

Sort Matching Rules
    [Documentation]   Verify The Sort function on the Matching Rules page of PCSCF 
    [Tags]    PCSCF    PCSCF_Peer    PCSCF_Peer_MatchingRule     
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}  MatchingRules_Sort
    PCSCF_PeerApp.Sort MatchingRules   ${AdministrationScenarios}

View Matching Rules
    [Documentation]   Verify The View function on the Matching Rules page of PCSCF 
    [Tags]    PCSCF    PCSCF_Peer    PCSCF_Peer_MatchingRule        
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}  MatchingRules_View
    PCSCF_PeerApp.View MatchingRules   ${AdministrationScenarios}

Filter Matching Rules
    [Documentation]   Verify The Filter function on the Matching Rules page of PCSCF 
    [Tags]    PCSCF    PCSCF_Peer    PCSCF_Peer_MatchingRule    
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}  MatchingRules_Filter
    PCSCF_PeerApp.Filter MatchingRules   ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}  MatchingRules_Filter_Spechar
    PCSCF_PeerApp.Filter Special Character MatchingRules   ${AdministrationScenarios}

Edit Matching Rules
    [Documentation]   Verify The Edit function on the Matching Rules page of PCSCF 
    [Tags]    PCSCF    PCSCF_Peer    PCSCF_Peer_MatchingRule     
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}  MatchingRules_Edit
    PCSCF_PeerApp.Edit MatchingRules   ${AdministrationScenarios}

Delete Matching Rules
    [Documentation]   Verify The Delete function on the Matching Rules page of PCSCF 
    [Tags]    PCSCF    PCSCF_Peer    PCSCF_Peer_MatchingRule    
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}  MatchingRules_Delete
    PCSCF_PeerApp.Delete MatchingRules   ${AdministrationScenarios}




################################ Manipulation Rules ######################################
Add Manipulation Rules
    [Documentation]   Verify The Add function on the Manipulation Rules page of PCSCF 
    [Tags]    PCSCF    PCSCF_Peer    PCSCF_Peer_ManipulationRule
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}   ManiRules
    PCSCF_PeerApp.Add ManiRules   ${AdministrationScenarios}

Sort Manipulation Rules
    [Documentation]   Verify The Sort function on the Manipulation Rules page of PCSCF 
    [Tags]    PCSCF    PCSCF_Peer    PCSCF_Peer_ManipulationRule 
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}  ManiRules_Sort
    PCSCF_PeerApp.Sort ManiRules   ${AdministrationScenarios}

View Manipulation Rules
    [Documentation]   Verify The View function on the Manipulation Rules page of PCSCF 
    [Tags]    PCSCF    PCSCF_Peer    PCSCF_Peer_ManipulationRule
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}  ManiRules_View
    PCSCF_PeerApp.View ManiRules   ${AdministrationScenarios}

Filter Manipulation Rules
    [Documentation]   Verify The Filter function on the Manipulation Rules page of PCSCF 
    [Tags]    PCSCF    PCSCF_Peer    PCSCF_Peer_ManipulationRule
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}  ManiRules_Filter
    PCSCF_PeerApp.Filter ManiRules   ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}  ManiRules_Filter_Spechar
    PCSCF_PeerApp.Filter Special Character ManiRules   ${AdministrationScenarios}

Edit Manipulation Rules
    [Documentation]   Verify The Edit function on the Manipulation Rules page of PCSCF 
    [Tags]    PCSCF    PCSCF_Peer    PCSCF_Peer_ManipulationRule 
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}   ManiRules_Edit
    PCSCF_PeerApp.Edit ManiRules   ${AdministrationScenarios}

Delete Manipulation Rules
    [Documentation]   Verify The Delete function on the Manipulation Rules page of PCSCF 
    [Tags]    PCSCF    PCSCF_Peer    PCSCF_Peer_ManipulationRule
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}   ManiRules_Delete
    PCSCF_PeerApp.Delete ManiRules   ${AdministrationScenarios}




################################ Header Authorization Profiles ############################################
Add Valid Header Authorization Profiles
    [Documentation]    Verify the functionality of 'Add Header Authorization Profiles' on the Peer page of IBCF
    [Tags]    PCSCF    PCSCF_Peer    PCSCF_Peer_HAP  
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}   HAP_Add_Valid
    PCSCF_PeerApp.Add Valid HeaderAuthProfiles   ${AdministrationScenarios}

Add Invalid Header Authorization Profiles
    [Documentation]    Verify the functionality of 'Add Header Authorization Profiles' on the Peer page of IBCF
    [Tags]    PCSCF    PCSCF_Peer    PCSCF_Peer_HAP   
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}   HAP_Add_Invalid
    PCSCF_PeerApp.Add Invalid HeaderAuthProfiles   ${AdministrationScenarios}

Sort Header Authorization Profiles
    [Documentation]   Verify The Sort function on the Header Authorization Profiles page of PCSCF 
    [Tags]    PCSCF    PCSCF_Peer    PCSCF_Peer_HAP
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}  HAP_Sort
    PCSCF_PeerApp.Sort HeaderAuthProfiles   ${AdministrationScenarios}

# View Header Authorization Profiles
#     [Documentation]   Verify The View function on the Header Authorization Profiles page of PCSCF 
#     [Tags]    PCSCF    PCSCF_Peer    PCSCF_Peer_HAP     
#     ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}  HAP_View
#     PCSCF_PeerApp.View HeaderAuthProfiles   ${AdministrationScenarios}

Filter Header Authorization Profiles
    [Documentation]   Verify The Filter function on the Header Authorization Profiles page of PCSCF 
    [Tags]    PCSCF    PCSCF_Peer    PCSCF_Peer_HAP 
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}  HAP_Filter
    PCSCF_PeerApp.Filter HeaderAuthProfiles   ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}  HAP_Filter_Spechar
    PCSCF_PeerApp.Filter Special Character HeaderAuthProfiles   ${AdministrationScenarios}

Delete Header Authorization Profiles
    [Documentation]   Verify The Delete function on the Header Authorization Profiles page of PCSCF 
    [Tags]    PCSCF    PCSCF_Peer    PCSCF_Peer_HAP
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}  HAP_Delete
    PCSCF_PeerApp.Delete HeaderAuthProfiles   ${AdministrationScenarios}




#################################### Authorization Profiles ############################################
Add Authorization Profiles
    [Documentation]   Verify The Add function on the Authorization Profiles page of PCSCF 
    [Tags]    PCSCF    PCSCF_Peer    PCSCF_Peer_AP    
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}   AP
    PCSCF_PeerApp.Add AuthProfiles   ${AdministrationScenarios}

Add Invalid Authorization Profiles
    [Documentation]   Verify The Add function on the Authorization Profiles page of PCSCF 
    [Tags]    PCSCF    PCSCF_Peer    PCSCF_Peer_AP    
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}   AP_Add_Invalid
    PCSCF_PeerApp.Add Invalid AuthProfiles   ${AdministrationScenarios}

Sort Authorization Profiles
    [Documentation]   Verify The Sort function on the Authorization Profiles page of PCSCF 
    [Tags]    PCSCF    PCSCF_Peer    PCSCF_Peer_AP      
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}  AP_Sort
    PCSCF_PeerApp.Sort AuthProfiles   ${AdministrationScenarios}

View Authorization Profiles
   [Documentation]   Verify The Filter function on the Authorization Profiles page of PCSCF 
    [Tags]    PCSCF    PCSCF_Peer    PCSCF_Peer_AP     
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}  AP_View
    PCSCF_PeerApp.View AuthProfiles   ${AdministrationScenarios}

Filter Authorization Profiles
    [Documentation]   Verify The Filter function on the Authorization Profiles page of PCSCF 
    [Tags]    PCSCF    PCSCF_Peer    PCSCF_Peer_AP    
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}  AP_Filter
    PCSCF_PeerApp.Filter AuthProfiles   ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}  AP_Filter_Spechar
    PCSCF_PeerApp.Filter Special Character AuthProfiles   ${AdministrationScenarios}

Edit Authorization Profiles
    [Documentation]   Verify The Edit function on the Authorization Profiles page of PCSCF 
    [Tags]    PCSCF    PCSCF_Peer    PCSCF_Peer_AP     
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}   AP_Edit
    PCSCF_PeerApp.Edit AuthProfiles   ${AdministrationScenarios}

Delete Authorization Profiles
    [Documentation]   Verify The Delete function on the Authorization Profiles page of PCSCF 
    [Tags]    PCSCF    PCSCF_Peer    PCSCF_Peer_AP    
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}   AP_Delete
    PCSCF_PeerApp.Delete AuthProfiles   ${AdministrationScenarios}




####################################### Header Manipulation ######################################################
Add Header Manipulation
    [Documentation]   Verify The Add function on the Header Manipulation page of PCSCF 
    [Tags]    PCSCF    PCSCF_Peer    PCSCF_Peer_HM
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}   HM
    PCSCF_PeerApp.Add HeaderManipulation   ${AdministrationScenarios}

Sort Header Manipulation
    [Documentation]   Verify The Sort function on the Header Manipulation page of PCSCF 
    [Tags]    PCSCF    PCSCF_Peer    PCSCF_Peer_HM
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}  HM_Sort
    PCSCF_PeerApp.Sort HeaderManipulation   ${AdministrationScenarios}

View Header Manipulation
    [Documentation]   Verify The View function on the Header Manipulation page of PCSCF 
    [Tags]    PCSCF    PCSCF_Peer    PCSCF_Peer_HM
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}  HM_View
    PCSCF_PeerApp.View HeaderManipulation   ${AdministrationScenarios}

Filter Header Manipulation
    [Documentation]   Verify The Filter function on the Header Manipulation page of PCSCF 
    [Tags]    PCSCF    PCSCF_Peer    PCSCF_Peer_HM
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}  HM_Filter
    PCSCF_PeerApp.Filter HeaderManipulation   ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}  HM_Filter_Spechar
    PCSCF_PeerApp.Filter Special Character HeaderManipulation   ${AdministrationScenarios}

Edit Header Manipulation
    [Documentation]   Verify The Edit function on the Header Manipulation page of PCSCF 
    [Tags]    PCSCF    PCSCF_Peer    PCSCF_Peer_HM
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}   HM_Edit
    PCSCF_PeerApp.Edit HeaderManipulation   ${AdministrationScenarios}

Delete Header Manipulation
    [Documentation]   Verify The Delete function on the Header Manipulation page of PCSCF 
    [Tags]    PCSCF    PCSCF_Peer    PCSCF_Peer_HM   
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}   HM_Delete
    PCSCF_PeerApp.Delete HeaderManipulation   ${AdministrationScenarios}




####################################### Session Control Profile ################################################
Add Session Control
    [Documentation]   Verify The Add function on the Session Control page of PCSCF 
    [Tags]    PCSCF    PCSCF_Peer    PCSCF_Peer_SessionControl    
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}   SessControl
    PCSCF_PeerApp.Add SessionControl   ${AdministrationScenarios}

Sort Session Control
    [Documentation]   Verify The Sort function on the Session Control page of PCSCF 
    [Tags]    PCSCF    PCSCF_Peer    PCSCF_Peer_SessionControl  
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}  SessControl_Sort
    PCSCF_PeerApp.Sort SessionControl   ${AdministrationScenarios}

View Session Control
    [Documentation]   Verify The View function on the Session Control page of PCSCF 
    [Tags]    PCSCF    PCSCF_Peer    PCSCF_Peer_SessionControl  
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}  SessControl_View
    PCSCF_PeerApp.View SessionControl   ${AdministrationScenarios}

Filter Session Control
    [Documentation]   Verify The Filter function on the Session Control page of PCSCF 
    [Tags]    PCSCF    PCSCF_Peer    PCSCF_Peer_SessionControl   
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}  SessControl_Filter
    PCSCF_PeerApp.Filter SessionControl   ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}  SessControl_Filter_Spechar
    PCSCF_PeerApp.Filter Special Character SessionControl   ${AdministrationScenarios}

Edit Session Control
    [Documentation]   Verify The Edit function on the Session Control page of PCSCF 
    [Tags]    PCSCF    PCSCF_Peer    PCSCF_Peer_SessionControl   
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}    SessControl_Edit
    PCSCF_PeerApp.Edit SessionControl  ${AdministrationScenarios}

Delete Session Control
    [Documentation]   Verify The Delete function on the Session Control page of PCSCF 
    [Tags]    PCSCF    PCSCF_Peer    PCSCF_Peer_SessionControl  
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}    SessControl_Delete
    PCSCF_PeerApp.Delete SessionControl  ${AdministrationScenarios}
	




################################ User Agent #########################################
Add UA
    [Documentation]   Verify The Add function on the User Agent page of PCSCF 
    [Tags]    PCSCF    PCSCF_Peer    PCSCF_Peer_UA   
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}    UA
    PCSCF_PeerApp.Add UAPCSCF  ${AdministrationScenarios}

Sort UA
    [Documentation]   Verify The Sort function on the User Agent page of PCSCF 
    [Tags]    PCSCF    PCSCF_Peer    PCSCF_Peer_UA 
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}  UA_Sort
    PCSCF_PeerApp.Sort UAPCSCF   ${AdministrationScenarios}

View UA
    [Documentation]   Verify The Filter function on the User Agent page of PCSCF 
    [Tags]    PCSCF    PCSCF_Peer    PCSCF_Peer_UA 
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}  UA_View
    PCSCF_PeerApp.View UAPCSCF   ${AdministrationScenarios}

Filter UA
    [Documentation]   Verify The Filter function on the User Agent page of PCSCF 
    [Tags]    PCSCF    PCSCF_Peer    PCSCF_Peer_UA 
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}  UA_Filter
    PCSCF_PeerApp.Filter UAPCSCF   ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}  UA_Filter_Spechar
    PCSCF_PeerApp.Filter Special Character UAPCSCF   ${AdministrationScenarios}

Edit UA
    [Documentation]   Verify The Edit function on the User Agent page of PCSCF 
    [Tags]    PCSCF    PCSCF_Peer    PCSCF_Peer_UA 
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}    UA_Edit
    PCSCF_PeerApp.Edit UAPCSCF  ${AdministrationScenarios}

Delete UA
    [Documentation]   Verify The Delete function on the User Agent page of PCSCF 
    [Tags]    PCSCF    PCSCF_Peer    PCSCF_Peer_UA  
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}    UA_Delete
    PCSCF_PeerApp.Delete UAPCSCF  ${AdministrationScenarios}





###################################### PCRF profile #############################################
Add PCRF
    [Documentation]   Verify The Add function on the PCRF page of PCSCF 
    [Tags]    PCSCF    PCSCF_Peer    PCSCF_Peer_PCRF
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}    PCRF
    PCSCF_PeerApp.Add PCRF  ${AdministrationScenarios}

Sort PCRF
    [Documentation]   Verify The Sort function on the PCRF page of PCSCF 
    [Tags]    PCSCF    PCSCF_Peer    PCSCF_Peer_PCRF
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}  PCRF_Sort
    PCSCF_PeerApp.Sort PCRF   ${AdministrationScenarios}

View PCRF
    [Documentation]   Verify The View function on the PCRF page of PCSCF 
    [Tags]    PCSCF    PCSCF_Peer    PCSCF_Peer_PCRF
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}  PCRF_View
    PCSCF_PeerApp.View PCRF   ${AdministrationScenarios}

Filter PCRF
    [Documentation]   Verify The Filter function on the PCRF page of PCSCF 
    [Tags]    PCSCF    PCSCF_Peer    PCSCF_Peer_PCRF
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}  PCRF_Filter
    PCSCF_PeerApp.Filter PCRF   ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}  PCRF_Filter_Spechar
    PCSCF_PeerApp.Filter Special Character PCRF   ${AdministrationScenarios}

Edit PCRF
    [Documentation]   Verify The Edit function on the PCRF page of PCSCF 
    [Tags]    PCSCF    PCSCF_Peer    PCSCF_Peer_PCRF
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}    PCRF_Edit
    PCSCF_PeerApp.Edit PCRF  ${AdministrationScenarios}

Delete PCRF
    [Documentation]   Verify The Delete function on the PCRF page of PCSCF 
    [Tags]    PCSCF    PCSCF_Peer    PCSCF_Peer_PCRF
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}    PCRF_Delete
    PCSCF_PeerApp.Delete PCRF  ${AdministrationScenarios}







################################# PHeader Filtering profile ########################################
Add PHF
    [Documentation]   Verify The Add function on the PHF page of PCSCF 
    [Tags]    PCSCF    PCSCF_Peer    PCSCF_Peer_PHF
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}    PHF65
    PCSCF_PeerApp.Add PHF   ${AdministrationScenarios}

Sort PHF
    [Documentation]   Verify The Sort function on the PHF page of PCSCF 
    [Tags]    PCSCF    PCSCF_Peer    PCSCF_Peer_PHF   
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}  PHF_Sort
    PCSCF_PeerApp.Sort PHF   ${AdministrationScenarios}

View PHF
    [Documentation]   Verify The View function on the PHF page of PCSCF 
    [Tags]    PCSCF    PCSCF_Peer    PCSCF_Peer_PHF
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}  PHF_View
    PCSCF_PeerApp.View PHF   ${AdministrationScenarios}

Filter PHF
    [Documentation]   Verify The Filter function on the PHF page of PCSCF 
    [Tags]    PCSCF    PCSCF_Peer    PCSCF_Peer_PHF   
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}  PHF_Filter
    PCSCF_PeerApp.Filter PHF   ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}  PHF_Filter_Spechar
    PCSCF_PeerApp.Filter Special Character PHF   ${AdministrationScenarios}

Edit PHF
    [Documentation]   Verify The Edit function on the PHF page of PCSCF 
    [Tags]    PCSCF    PCSCF_Peer    PCSCF_Peer_PHF
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}    PHF_Edit65
    PCSCF_PeerApp.Edit PHF  ${AdministrationScenarios}

Delete PHF
    [Documentation]   Verify The Delete function on the PHF page of PCSCF 
    [Tags]    PCSCF    PCSCF_Peer    PCSCF_Peer_PHF 
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}    PHF_Delete
    PCSCF_PeerApp.Delete PHF  ${AdministrationScenarios}




############################ RFC4028 Profile ##################################
Add Valid RFC4028
    [Documentation]     Add RFC4028 for PCSCF_PEER
    [Tags]    PCSCF    PCSCF_Peer    PCSCF_Peer_RFC4028  
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}  RFC4028
    PCSCF_PeerApp.Add Valid RFC4028  ${AdministrationScenarios}

Add Invalid RFC4028
    [Documentation]     Add Invalid RFC4028 for PCSCF_PEER
    [Tags]    PCSCF    PCSCF_Peer    PCSCF_Peer_RFC4028  
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}  RFC4028_Error
    PCSCF_PeerApp.Add Invalid RFC4028  ${AdministrationScenarios}

Edit Valid RFC4028
    [Documentation]     Edit RFC4028 for PCSCF_PEER
    [Tags]    PCSCF    PCSCF_Peer    PCSCF_Peer_RFC4028  
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}  RFC4028_Edit
    PCSCF_PeerApp.Edit Valid RFC4028  ${AdministrationScenarios}

Edit Invalid RFC4028
    [Documentation]     Edit Invalid RFC4028 for PCSCF_PEER
    [Tags]    PCSCF    PCSCF_Peer    PCSCF_Peer_RFC4028  
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}  RFC4028_Edit_Error
    PCSCF_PeerApp.Edit Invalid RFC4028  ${AdministrationScenarios}





############################### PEER ########################################
Add Peer
    [Documentation]   Verify The Add function on the Peer page of PCSCF 
     [Tags]    PCSCF    PCSCF_Peer    PCSCF_Peer_PEER      
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}   PEER
    PCSCF_PeerApp.Add PeerPCSCF   ${AdministrationScenarios}

Sort Peer
    [Documentation]   Verify The Sort function on the Peer page of PCSCF 
     [Tags]    PCSCF    PCSCF_Peer    PCSCF_Peer_PEER     
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}  PEER_Sort
    PCSCF_PeerApp.Sort PeerPCSCF   ${AdministrationScenarios}

Filter Peer
    [Documentation]   Verify The Filter function on the Peer page of PCSCF 
     [Tags]    PCSCF    PCSCF_Peer    PCSCF_Peer_PEER        
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}  PEER_Filter
    PCSCF_PeerApp.Filter PeerPCSCF   ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}  PEER_Filter_Spechar
    PCSCF_PeerApp.Filter Special Character PeerPCSCF   ${AdministrationScenarios}

View Peer
    [Documentation]   Verify The View function on the Peer page of PCSCF 
     [Tags]    PCSCF    PCSCF_Peer    PCSCF_Peer_PEER          
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}  PEER_View
    PCSCF_PeerApp.View PeerPCSCF   ${AdministrationScenarios}

Edit Peer
    [Documentation]   Verify The Edit function on the Peer page of PCSCF 
     [Tags]    PCSCF    PCSCF_Peer    PCSCF_Peer_PEER    
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}    PEER_Edit
    PCSCF_PeerApp.Edit PeerPCSCF   ${AdministrationScenarios}

Delete Peer
    [Documentation]   Verify The Delete function on the Peer page of PCSCF 
     [Tags]    PCSCF    PCSCF_Peer    PCSCF_Peer_PEER      
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${PCSCF_Peer}    PEER_Delete
    PCSCF_PeerApp.Delete PeerPCSCF  ${AdministrationScenarios}