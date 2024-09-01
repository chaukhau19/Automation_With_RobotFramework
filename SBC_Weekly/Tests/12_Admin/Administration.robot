*** Settings ***
Resource  ../../Resources/Common.robot
Resource  ../../Resources/DataManager.robot
Resource  ../../Data/InputData.robot
Resource  ../../Resources/Admin/LoginApp_SBC.robot
Resource  ../../Resources/Admin/ProxyApp.robot
Resource  ../../Resources/Admin/UserManagerApp.robot
Resource  ../../Resources/Admin/UserPreferenceApp.robot
Resource  ../../Resources/Admin/PermissionApp.robot
Resource  ../../Resources/Admin/PasswordPolicyApp.robot
Resource  ../../Resources/Admin/ManageHostsApp.robot
Resource  ../../Resources/Admin/LoginPolicyApp.robot

# Test Setup  Common.Begin Web Test
Test Teardown  Common.End Web Test


*** Tasks ***
############################################### Display Proxies  ############################################################
Changed Config Log
    [Documentation]   
    [Tags]     CirpackWeb.cfg    IMP_27646      
    Get Version Update Config Log

# Enable OIDC
#     [Documentation]   
#     [Tags]     Login          
#     Update Config And Restart Server


# Statistics
#     [Documentation]   
#     [Tags]     Statistics     
#     # Statistics Proxy
    # Statistics Media
    # Statistics Limiter
    # Statistics Annsrv
    

Display Proxy 
    [Documentation]   Verify The Display Proxy function on the Proxy page of Admin
    [Tags]     Admin     Admin_Proxy   
    Get Getenforce Update Password 
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Admin}  Proxy
    ProxyApp.Proxy  ${AdministrationScenarios}



############################################### User Manager ############################################################
Add Valid User Manager 
    [Documentation]   Verify The Add Valid function on the User Manager page of Admin
    [Tags]     Admin     Admin_UserManager     
    Get Getenforce Restore DB
    Get Getenforce Update Password
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Admin}  Permission_Add
    PermissionApp.Permission Add  ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Admin}  Blocking_Period_Time_For_Login
    LoginPolicyApp.Login Policy Edit Valid  ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Admin}  User_Manager_Add_Valid
    UserManagerApp.Add Valid User Manager  ${AdministrationScenarios}

Add Invalid User Manager 
    [Documentation]   Verify The Add Invalid function on the User Manager page of Admin
    [Tags]     Admin     Admin_UserManager  
    Get Getenforce Update Password        
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Admin}  User_Manager_Add_Invalid
    UserManagerApp.Add Invalid User Manager  ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Admin}  User_Manager_Add_Invalid_Login
    UserManagerApp.Add Invalid User Manager To First Login  ${AdministrationScenarios}

Sort User Manager 
    [Documentation]   Verify The Sort function on the User Manager page of Admin
    [Tags]     Admin     Admin_UserManager
    Get Getenforce Update Password       
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Admin}  User_Manager_Sort
    UserManagerApp.User Manager Sort   ${AdministrationScenarios}

Filter User Manager 
    [Documentation]   Verify The Filter function on the User Manager page of Admin
    [Tags]     Admin     Admin_UserManager   
    Get Getenforce Update Password       
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Admin}  User_Manager_Filter
    UserManagerApp.User Manager Filter   ${AdministrationScenarios}

Edit Invalid User Manager 
    [Documentation]   Verify The Edit Invalid function on the User Manager page of Admin
    [Tags]     Admin     Admin_UserManager   
    Get Getenforce Update Password    
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Admin}  User_Manager_Edit_Invalid
    UserManagerApp.Edit Invalid User Manager  ${AdministrationScenarios}


Edit Valid User Manager 
    [Documentation]   Verify The Edit Valid function on the User Manager page of Admin
    [Tags]     Admin     Admin_UserManager   
    Get Getenforce Update Password          
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Admin}  User_Manager_Edit_Valid
    UserManagerApp.Edit User Manager  ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Admin}  User_Manager_Edit_Valid_Not_PW
    UserManagerApp.Edit User Manager without changing the password  ${AdministrationScenarios}

Delete User Manager 
    [Documentation]   Verify The Delete function on the User Manager page of Admin
    [Tags]     Admin     Admin_UserManager 
    Get Getenforce Update Password        
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Admin}  User_Manager_Delete
    UserManagerApp.Delete User Manager  ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Admin}  Permission_Delete
    PermissionApp.Permission Delete  ${AdministrationScenarios}



############################################### User Preference ############################################################
Edit Valid User Preference 
    [Documentation]   Verify The Edit Valid function on the User Preference  page of Admin
    [Tags]     Admin    Admin_UserPreference       
    Get Getenforce Restore DB
    Get Getenforce Update Password
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Admin}  Permission_Add
    PermissionApp.Permission Add  ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Admin}  User_Manager_Test_Preference
    UserManagerApp.Add Valid User Manager  ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Admin}  User_Preference_Valid_Admin
    UserPreferenceApp.User Preference  ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Admin}  User_Preference_Valid_User
    UserPreferenceApp.User Preference  ${AdministrationScenarios}

Edit Invalid User Preference 
    [Documentation]   Verify The Edit Invalid function on the User Preference  page of Admin
    [Tags]     Admin    Admin_UserPreference 
    Get Getenforce Update Password
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Admin}  User_Preference_Invalid_Admin
    UserPreferenceApp.Invalid User Preference  ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Admin}  User_Preference_Invalid_User
    UserPreferenceApp.Invalid User Preference  ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Admin}  User_Manager_Test_Preference
    UserManagerApp.Delete User Manager  ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Admin}  Permission_Delete
    PermissionApp.Permission Delete  ${AdministrationScenarios}





############################################### Permission ############################################################
Add Permission 
    [Documentation]   Verify The Add function on the Permission page of Admin
    [Tags]     Admin    Admin_Role       
    Get Getenforce Restore DB
    Get Getenforce Update Password
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Admin}  Permission_Add
    PermissionApp.Permission Add  ${AdministrationScenarios}

Add Invalid Permission 
    [Documentation]   Verify The Add function on the Permission page of Admin
    [Tags]     Admin    Admin_Role       
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Admin}  Permission_Add_Invalid
    PermissionApp.Permission Add Invalid  ${AdministrationScenarios}

Edit Permission 
    [Documentation]   Verify The Edit function on the Permission page of Admin
    [Tags]     Admin    Admin_Role 
    Get Getenforce Update Password
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Admin}  Permission_Edit
    PermissionApp.Permission Edit  ${AdministrationScenarios}

View Permission 
    [Documentation]   Verify The View function on the Permission page of Admin
    [Tags]     Admin    Admin_Role 
    Get Getenforce Update Password
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Admin}  Permission_View
    PermissionApp.Permission View  ${AdministrationScenarios}

Sort Permission 
    [Documentation]   Verify The Sort function on the Permission page of Admin
    [Tags]     Admin    Admin_Role 
    Get Getenforce Update Password
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Admin}  Permission_Sort
    PermissionApp.Permission Sort   ${AdministrationScenarios}

Filter Permission 
    [Documentation]   Verify The Filter function on the Permission page of Admin
    [Tags]     Admin    Admin_Role 
    Get Getenforce Update Password
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Admin}  Permission_Filter
    PermissionApp.Permission Filter   ${AdministrationScenarios}

Delete Permission 
    [Documentation]   Verify The Delete function on the Permission page of Admin
    [Tags]     Admin    Admin_Role 
    Get Getenforce Update Password
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Admin}  Permission_Delete
    PermissionApp.Permission Delete  ${AdministrationScenarios}


###############################################  Password Policy ############################################################
# Edit Valid Password Policy 
#     [Tags]     Admin    Admin_PWpolicy         
#     [Documentation]  Edit Valid Password Policy 
#     ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Admin}  Permission_Add
#     PermissionApp.Permission Add  ${AdministrationScenarios}
#     ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Admin}  Edit_Valid_Password_Policy
#     PasswordPolicyApp.Password Policy Edit  ${AdministrationScenarios}
#     ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Admin}  Delete_Valid_Password_Policy
#     PasswordPolicyApp.Delete User Manager   ${AdministrationScenarios}
#     ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Admin}  Permission_Delete
#     PermissionApp.Permission Delete  ${AdministrationScenarios}

Login Policy 
    [Documentation]   Verify The Policy function on the Login Policy page of Admin
    [Tags]     Admin     Admin_LoginPolicy   
    Get Getenforce Update Password
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Admin}  Edit_Valid_Login_Policy
    LoginPolicyApp.Login Policy Edit Valid  ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Admin}  Edit_Invalid_Login_Policy
    LoginPolicyApp.Login Policy Edit Invalid  ${AdministrationScenarios}
    # ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Admin}  Test_Password_Invalid
    # LoginPolicyApp.Test Password Invalid  ${AdministrationScenarios}
    



###############################################  Manager hosts ############################################################    
Add hosts 
    [Documentation]   Verify The Add function on the Manage Host page of Admin
    [Tags]     Admin    Admin_Managehost      
    Get Getenforce Update Password
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Admin}  Manage_Hosts
    ManageHostsApp.Add Hosts   ${AdministrationScenarios}

Edit hosts 
    [Documentation]   Verify The Edit function on the Manage Host page of Admin
    [Tags]     Admin    Admin_Managehost 
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Admin}  Manage_Hosts
    ManageHostsApp.Edit Hosts   ${AdministrationScenarios}

View hosts 
    [Documentation]   Verify The View function on the Manage Host page of Admin
    [Tags]     Admin    Admin_Managehost       
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Admin}  Manage_Hosts
    ManageHostsApp.View Hosts   ${AdministrationScenarios}

Delete hosts 
    [Documentation]   Verify The Delete function on the Manage Host page of Admin
    [Tags]     Admin    Admin_Managehost  
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Admin}  Manage_Hosts
    ManageHostsApp.Delete Hosts   ${AdministrationScenarios}




############################################### TR IMP ############################################################    
Adding permission with BGCF_PEER_ACCESS
    [Tags]     Admin    TR_19270        
    [Documentation]     Add a new role with BGCF_PEER_ACCESS check box not checked then edit it and check that other permission of the role is not impacted
    Get Getenforce Update Password
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Admin}  TR_19270
    PermissionApp.TR_19270_Tc1 function  ${AdministrationScenarios}

Adding permission with BGCF_ACCESS
    [Tags]     Admin    TR_19270        
    [Documentation]     Add a new role with BGCF_ACCESS check box not checked then edit it and check that other permission of the role is not impacted
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Admin}  TR_19270
    PermissionApp.TR_19270_Tc2 function  ${AdministrationScenarios}

Transitioning between LocalHost and RemoteHost
    [Tags]     Admin    TR_19262      
    [Documentation]  Setting proxy and changing hosts(back and forth) then check that proxy settings are not erased
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Admin}  Manage_Hosts
   # ManageHostsApp.Add Hosts   ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Admin}  TR_19262
    ProxyApp.TR_19262 function  ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Admin}  Manage_Hosts
    #ManageHostsApp.Delete Hosts   ${AdministrationScenarios}

Adding and editing hosts for normal users
    [Tags]     Admin    IMP_19315    
    [Documentation]  Verify user with view permission only can change host
     ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Admin}  Permission_19315
    PermissionApp.Permission Add  ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Admin}  User_19315
    UserManagerApp.Add Valid User Manager  ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Admin}  Manage_Hosts
    ManageHostsApp.Add Hosts With User  ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Admin}  IMP_19315
    UserManagerApp.IMP_19315 function  ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Admin}  User_19315
    UserManagerApp.Delete User Manager  ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Admin}  Permission_19315
    PermissionApp.Permission Delete  ${AdministrationScenarios}
    # ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Admin}  Blocking_Period_Time_For_Login
    # LoginPolicyApp.Login Policy Edit Valid  ${AdministrationScenarios}
    Get Getenforce Restore DB
    Get Getenforce Update Password







############################################### Login Web ############################################################
Login Web Successfully 
    [Tags]     Admin    Admin_Login      
    [Documentation]   Verify The Login Web Successfully function on the Login page of Admin
    Get Getenforce Restore DB
    Get Getenforce Update Password
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Admin}  Permission_Add
    PermissionApp.Permission Add  ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Admin}  Blocking_Period_Time_For_Login
    LoginPolicyApp.Login Policy Edit Valid  ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Admin}  User_Preference_Last_Password
    UserPreferenceApp.User Preference  ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Admin}  User_Manager_Add_To_Test_Login
    UserManagerApp.Add Valid User Manager  ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Admin}  Login_Successful
    LoginApp_SBC.Login with some Credentials  ${AdministrationScenarios}


Login Web Unsuccessfully 
    [Tags]     Admin    Admin_Login   
    Get Getenforce Update Password  
    [Documentation]   Verify The Login Web Unsuccessfully function on the Login page of Admin
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Admin}  Login_Unsuccessful
    LoginApp_SBC.Login with some Credentials  ${AdministrationScenarios}
