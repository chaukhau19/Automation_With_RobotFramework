*** Settings ***
Documentation  This is all tests of Transcoding
Library  SeleniumLibrary
Resource  ../../Resources/DataManager.robot
Resource  ../../Data/InputData.robot
Resource  ../../Resources/Common.robot
Resource  ../../Resources/Transcoding/TranscodingApp.robot

# #Test Setup  Common.Begin Web Test
Test Teardown  Common.End Web Test
*** Tasks ***
######################### Card #################################
Add Valid Card
    [Documentation]    Verify the functionality of 'Add Card' on the Transcoding page
    [Tags]  Transcoding  Transcoding_Card  
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Transcoding}  Card_Add_Valid
    TranscodingApp.Add Card   ${AdministrationScenarios}

Sort Card
    [Documentation]    Verify the functionality of 'Sort Card' on the Transcoding page
    [Tags]  Transcoding  Transcoding_Card  
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Transcoding}  Card_Sort
    TranscodingApp.Sort Card   ${AdministrationScenarios}

View Card
    [Documentation]    Verify the functionality of 'View Card' on the Transcoding page
    [Tags]  Transcoding  Transcoding_Card
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Transcoding}  Card_View
    TranscodingApp.View Card   ${AdministrationScenarios}

Filter Card
    [Documentation]    Verify the functionality of 'Filter Card' on the Transcoding page
    [Tags]  Transcoding  Transcoding_Card
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Transcoding}  Card_Filter
    TranscodingApp.Filter Card   ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Transcoding}  Card_Filter_Spechar
   TranscodingApp.Filter Special Character Card   ${AdministrationScenarios}  

Delete Card
    [Documentation]    Verify the functionality of 'Delete Card' on the Transcoding page
    [Tags]  Transcoding  Transcoding_Card 
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Transcoding}  Card_Delete
    TranscodingApp.Delete Card   ${AdministrationScenarios}




############################### Profile ###########################################
Add Profile
    [Documentation]    Verify the functionality of 'Add Profile' on the Transcoding page
    [Tags]  Transcoding  Transcoding_Profile  
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Transcoding}  Profile_Add_Valid
    TranscodingApp.Add Profile   ${AdministrationScenarios}

Sort Profile
    [Documentation]    Verify the functionality of 'Sort Profile' on the Transcoding page
    [Tags]  Transcoding  Transcoding_Profile     
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Transcoding}  Profile_Sort
    TranscodingApp.Sort Profile   ${AdministrationScenarios}

Filter Profile
    [Documentation]    Verify the functionality of 'Filter Profile' on the Transcoding page
    [Tags]  Transcoding  Transcoding_Profile  
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Transcoding}  Profile_Filter
    TranscodingApp.Filter Profile   ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Transcoding}  Profile_Filter_Spechar
   TranscodingApp.Filter Special Character Profile   ${AdministrationScenarios}   

Delete Profile
    [Documentation]    Verify the functionality of 'Delete Profile' on the Transcoding page
    [Tags]  Transcoding  Transcoding_Profile   
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Transcoding}  Profile_Delete
    TranscodingApp.Delete Profile   ${AdministrationScenarios}


    
################################## TCGW #############################################
Add TCGW
    [Documentation]    Verify the functionality of 'Add TCGW' on the Transcoding page
    [Tags]  Transcoding  Transcoding_TCGW  
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Transcoding}  TCGW_Add_Valid
    TranscodingApp.Add TCGW   ${AdministrationScenarios}

Sort TCGW
    [Documentation]    Verify the functionality of 'Sort TCGW' on the Transcoding page
    [Tags]  Transcoding  Transcoding_TCGW     
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Transcoding}  TCGW_Sort
    TranscodingApp.Sort TCGW   ${AdministrationScenarios}

Filter TCGW
    [Documentation]    Verify the functionality of 'Filter TCGW' on the Transcoding page
    [Tags]  Transcoding  Transcoding_TCGW  
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Transcoding}  TCGW_Filter
    TranscodingApp.Filter TCGW   ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Transcoding}  TCGW_Filter_Spechar
   TranscodingApp.Filter Special Character TCGW   ${AdministrationScenarios}

Delete TCGW
    [Documentation]    Verify the functionality of 'Delete TCGW' on the Transcoding page
    [Tags]  Transcoding  Transcoding_TCGW 
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Transcoding}  TCGW_Delete
    TranscodingApp.Delete TCGW   ${AdministrationScenarios}

