*** Settings ***
Documentation  This is all tests of Services in TAS
Resource  ../../Resources/DataManager.robot
Resource  ../../Data/InputData.robot
Resource  ../../Resources/Common.robot
Resource  ../../Resources/TAS/TAS_ServicesApp.robot

Test Setup      Common.Begin Web Test
Test Teardown   Common.End Web Test

*** Tasks ***

All services displayed on web 41
    [Documentation]     Verify all services shown on web successfully
    [Tags]    Smoke  TAS_Services	ims47
    ${AdministrationScenarios} =  DataManager.Get Excel Data    ${TAS_Services}     Services
    TAS_ServicesApp.Services  ${AdministrationScenarios}
