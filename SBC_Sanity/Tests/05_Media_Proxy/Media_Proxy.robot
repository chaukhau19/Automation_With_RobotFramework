*** Settings ***
Documentation  This is all tests of Media Proxy
Resource  ../../Resources/DataManager.robot
Resource  ../../Data/InputData.robot
Resource  ../../Resources/Common.robot
Resource  ../../Resources/Media_Proxy/Media_ProxyApp.robot

Test Setup  Common.Begin Web Test
Test Teardown  Common.End Web Test

*** Tasks ***
	
Add Forwarder
    [Documentation]     Add proper Forwarder
    [Tags]  Smoke  MediaProxy_Forwarder  sbc77
    ${AdministrationScenarios} =  DataManager.Get Excel Data    ${MediaProxy}  Forwarder
    Media_ProxyApp.Add Forwarder   ${AdministrationScenarios}

	
Sort Forwarder
    [Documentation]     Sort proper Forwarder
    [Tags]  MediaProxy_Forwarder  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${MediaProxy}  Forwarder
    Media_ProxyApp.Sort Forwarder   ${AdministrationScenarios}


	
Filter Forwarder
    [Documentation]     Filter proper Forwarder
    [Tags]  MediaProxy_Forwarder  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${MediaProxy}  Forwarder
    Media_ProxyApp.Filter Forwarder   ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${MediaProxy}  Forwarder_Filter_Spechar
    Media_ProxyApp.Filter Special Character Forwarder   ${AdministrationScenarios}
		
Delete Forwarder
    [Documentation]     Delete proper Forwarder
    [Tags]  Smoke  MediaProxy_Forwarder  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data    ${MediaProxy}  Forwarder
    Media_ProxyApp.Delete Forwarder   ${AdministrationScenarios}
		
Add ICMP
    [Documentation]     Add proper icmp
    [Tags]  Smoke  MediaProxy_ICMP  sbc77
    ${AdministrationScenarios} =  DataManager.Get Excel Data    ${MediaProxy}  ICMP
    Media_ProxyApp.Add ICMP Check   ${AdministrationScenarios}
	
Sort ICMP
    [Documentation]     Sort proper ICMP for ICMP PCSCF
    [Tags]  MediaProxy_ICMP  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${MediaProxy}  ICMP
    Media_ProxyApp.Sort ICMP   ${AdministrationScenarios}
		
Filter ICMP
    [Documentation]     Filter proper ICMP for ICMP PCSCF
    [Tags]  MediaProxy_ICMP  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${MediaProxy}  ICMP
    Media_ProxyApp.Filter ICMP   ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${MediaProxy}  ICMP_Filter_Spechar
    Media_ProxyApp.Filter Special Character ICMP   ${AdministrationScenarios}
		
Delete ICMP
    [Documentation]     Delete proper icmp
    [Tags]  Smoke  MediaProxy_ICMP  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data    ${MediaProxy}  ICMP
    Media_ProxyApp.Delete ICMP Check   ${AdministrationScenarios}
			
Add VNIC
    [Documentation]     Add proper VNIC
    [Tags]  Smoke  MediaProxy_VNIC  sbc77
    ${AdministrationScenarios} =  DataManager.Get Excel Data    ${MediaProxy}  VNIC
    Media_ProxyApp.Add VNIC 71   ${AdministrationScenarios}

Sort VNIC
    [Documentation]     Sort proper VNIC for VNIC PCSCF
    [Tags]  MediaProxy_VNIC  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${MediaProxy}  VNIC
    Media_ProxyApp.Sort VNIC   ${AdministrationScenarios}
	
Filter VNIC
    [Documentation]     Filter proper VNIC for VNIC PCSCF
    [Tags]  MediaProxy_VNIC  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${MediaProxy}  VNIC
    Media_ProxyApp.Filter VNIC   ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${MediaProxy}  VNIC_Filter_Spechar
    Media_ProxyApp.Filter Special Character VNIC   ${AdministrationScenarios}	
			
View VNIC
    [Documentation]     View proper VNIC for VNIC PCSCF
    [Tags]   MediaProxy_VNIC  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${MediaProxy}  VNIC
    Media_ProxyApp.View VNIC 71   ${AdministrationScenarios}
		
Edit VNIC
    [Documentation]     Edit proper VNIC for VNIC PCSCF
    [Tags]   MediaProxy_VNIC  sbc77
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${MediaProxy}  VNIC_Edit
    Media_ProxyApp.Edit VNIC 71   ${AdministrationScenarios}
		
Delete VNIC
    [Documentation]     Delete proper VNIC
    [Tags]  Smoke  MediaProxy_VNIC  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data    ${MediaProxy}  VNIC
    Media_ProxyApp.Delete VNIC   ${AdministrationScenarios}
	
	