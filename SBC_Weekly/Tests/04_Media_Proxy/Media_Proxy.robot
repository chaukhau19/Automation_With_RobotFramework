*** Settings ***
Documentation  This is all tests of Media Proxy
Resource  ../../Resources/DataManager.robot
Resource  ../../Data/InputData.robot
Resource  ../../Resources/Common.robot
Resource  ../../Resources/Media_Proxy/Media_ProxyApp.robot

#Test Setup  Common.Begin Web Test
Test Teardown  Common.End Web Test

*** Tasks ***


###################################### Forwarder ######################################
Add Forwarder
    [Documentation]    Verify the functionality of 'Add Forwarder' on the Media Proxy page
    [Tags]  MediaProxy  MP_Forwarder  
    ${AdministrationScenarios} =  DataManager.Get Excel Data    ${MediaProxy}  Forwarder_Add
    Media_ProxyApp.Add Forwarder   ${AdministrationScenarios}

Sort Forwarder
    [Documentation]    Verify the functionality of 'Sort Forwarder' on the Media Proxy page
    [Tags]  MediaProxy  MP_Forwarder    
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${MediaProxy}  Forwarder_Sort
    Media_ProxyApp.Sort Forwarder   ${AdministrationScenarios}

Filter Forwarder
    [Documentation]    Verify the functionality of 'Filter Forwarder' on the Media Proxy page
    [Tags]  MediaProxy  MP_Forwarder    
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${MediaProxy}  Forwarder_Filter
    Media_ProxyApp.Filter Forwarder   ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${MediaProxy}  Forwarder_Filter_Spechar
    Media_ProxyApp.Filter Special Character Forwarder   ${AdministrationScenarios}

Delete Forwarder
    [Documentation]    Verify the functionality of 'Delete Forwarder' on the Media Proxy page
    [Tags]  MediaProxy  MP_Forwarder      
    ${AdministrationScenarios} =  DataManager.Get Excel Data    ${MediaProxy}  Forwarder_Delete
    Media_ProxyApp.Delete Forwarder   ${AdministrationScenarios}




######################################### ICMP ##############################################
Add ICMP
    [Documentation]    Verify the functionality of 'Add ICMP' on the Media Proxy page
    [Tags]  MediaProxy  MediaProxy_ICMP  
    ${AdministrationScenarios} =  DataManager.Get Excel Data    ${MediaProxy}  ICMP_Add
    Media_ProxyApp.Add ICMP Check   ${AdministrationScenarios}

Sort ICMP
    [Documentation]    Verify the functionality of 'Sort ICMP' on the Media Proxy page
    [Tags]  MediaProxy  MediaProxy_ICMP
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${MediaProxy}  ICMP_Sort
    Media_ProxyApp.Sort ICMP   ${AdministrationScenarios}

Filter ICMP
    [Documentation]    Verify the functionality of 'Filter ICMP' on the Media Proxy page
    [Tags]  MediaProxy  MediaProxy_ICMP 
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${MediaProxy}  ICMP_Filter
    Media_ProxyApp.Filter ICMP   ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${MediaProxy}  ICMP_Filter_Spechar
    Media_ProxyApp.Filter Special Character ICMP   ${AdministrationScenarios}

Delete ICMP
    [Documentation]    Verify the functionality of 'Delete ICMP' on the Media Proxy page
    [Tags]  MediaProxy  MediaProxy_ICMP    
    ${AdministrationScenarios} =  DataManager.Get Excel Data    ${MediaProxy}  ICMP_Delete
    Media_ProxyApp.Delete ICMP Check   ${AdministrationScenarios}
    




####################################### V-NIC ##################################################
Add Valid VNIC
    [Documentation]    Verify the functionality of 'Add VNIC' on the Media Proxy page
    [Tags]  MediaProxy  MediaProxy_VNIC    
    ${AdministrationScenarios} =  DataManager.Get Excel Data    ${MediaProxy}  VNIC_Add_Valid
    Media_ProxyApp.Add Valid VNIC    ${AdministrationScenarios}

# Add Invalid VNIC
#     [Documentation]    Verify the functionality of 'Add VNIC' on the Media Proxy page
#     [Tags]  MediaProxy  MediaProxy_VNIC     
#     ${AdministrationScenarios} =  DataManager.Get Excel Data    ${MediaProxy}  VNIC_Add_Invalid
#     Media_ProxyApp.Add Invalid VNIC    ${AdministrationScenarios}

Sort VNIC
    [Documentation]    Verify the functionality of 'Sort VNIC' on the Media Proxy page
    [Tags]  MediaProxy  MediaProxy_VNIC   
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${MediaProxy}  VNIC_Sort
    Media_ProxyApp.Sort VNIC   ${AdministrationScenarios}

Filter VNIC
    [Documentation]    Verify the functionality of 'Filter VNIC' on the Media Proxy page
    [Tags]  MediaProxy  MediaProxy_VNIC      
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${MediaProxy}  VNIC_Filter
    Media_ProxyApp.Filter VNIC    ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${MediaProxy}  VNIC_Filter_Spechar
    Media_ProxyApp.Filter Special Character VNIC    ${AdministrationScenarios}

Edit Valid VNIC
    [Documentation]    Verify the functionality of 'Edit VNIC' on the Media Proxy page
    [Tags]  MediaProxy  MediaProxy_VNIC      
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${MediaProxy}  VNIC_Edit_Valid
    Media_ProxyApp.Edit Valid VNIC   ${AdministrationScenarios}

# Edit Invalid VNIC
#     [Documentation]    Verify the functionality of 'Edit VNIC' on the Media Proxy page
#     [Tags]  MediaProxy  MediaProxy_VNIC      
#     ${AdministrationScenarios} =  DataManager.Get Excel Data   ${MediaProxy}  VNIC_Edit_Invalid
#     Media_ProxyApp.Edit Invalid VNIC    ${AdministrationScenarios}

Delete VNIC
    [Documentation]    Verify the functionality of 'Delete VNIC' on the Media Proxy page
    [Tags]  MediaProxy  MediaProxy_VNIC       
    ${AdministrationScenarios} =  DataManager.Get Excel Data    ${MediaProxy}  VNIC_Delete
    Media_ProxyApp.Delete VNIC    ${AdministrationScenarios}
	
	