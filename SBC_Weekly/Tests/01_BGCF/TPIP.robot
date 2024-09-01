*** Settings ***
Documentation  All manipulation TPIP section
Resource  ../../Resources/DataManager.robot
Resource  ../../Data/InputData.robot
Resource  ../../Resources/Common.robot
Resource  ../../Resources/BGCF/BGCF_TpipApp.robot

#Test Setup      Common.Begin Web Test
Test Teardown   Common.End Web Test

*** Tasks ***

Add TPIP
    [Documentation]    Verify the functionality of 'Add TPIP' on the BGCF page
    [Tags]   BGCF    BGCF_TPIP 
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${BGCF_TPIP}  Add
    BGCF_TpipApp.Add Valid Cases  ${AdministrationScenarios}

Add Invalid TPIP
    [Documentation]    Verify the functionality of 'Add Invalid TPIP' on the BGCF page
    [Tags]   BGCF    BGCF_TPIP    
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${BGCF_TPIP}  Add_Invalid
    BGCF_TpipApp.Add Invalid Cases  ${AdministrationScenarios}

Filter TPIP
    [Documentation]    Verify the functionality of 'Filter TPIP' on the BGCF page
    [Tags]   BGCF    BGCF_TPIP     
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${BGCF_TPIP}  Filter
    BGCF_TpipApp.Filter Cases  ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${BGCF_TPIP}  Filter_Spechar
    BGCF_TpipApp.Filter Special Cases  ${AdministrationScenarios}

# View TPIP
#     [Documentation]    Verify the functionality of 'View TPIP' on the BGCF page
#     [Tags]   BGCF    BGCF_TPIP           
#     ${AdministrationScenarios} =  DataManager.Get Excel Data  ${BGCF_TPIP}  View
#     BGCF_TpipApp.View Cases  ${AdministrationScenarios}
	
Sort TPIP
    [Documentation]    Verify the functionality of 'Sort TPIP' on the BGCF page
    [Tags]   BGCF    BGCF_TPIP     
    ${AdministrationScenarios} =  DataManager.Get Excel Data  ${BGCF_TPIP}  Sort
    BGCF_TpipApp.Sort Cases  ${AdministrationScenarios}