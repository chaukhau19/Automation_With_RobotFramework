*** Settings ***
Documentation  This is all tests of Services in TAS
Resource  ../../Resources/DataManager.robot
Resource  ../../Data/InputData.robot
Resource  ../../Resources/Common.robot
Resource  ../../Resources/TAS/TAS_ServicesApp.robot

#Test Setup      Common.Begin Web Test
Test Teardown   Common.End Web Test

*** Tasks ***

All services displayed on web 
    [Documentation]   Verify The All services displayed on the services page of TAS    [ims]
    [Tags]      TAS   TAS_Services	
    ${AdministrationScenarios} =  DataManager.Get Excel Data    ${TAS_Services}     Services
    TAS_ServicesApp.Services  ${AdministrationScenarios}
