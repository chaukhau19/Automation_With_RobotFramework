*** Settings ***
Resource  ../../Resources/Common.robot
Resource  ../../Resources/DataManager.robot
Resource  ../../Data/InputData.robot
Resource  ../../Resources/Admin/LoginApp_SBC.robot
Resource  ../../Resources/Admin/ProxyApp.robot
Resource  ../../Resources/Admin/UserManagerApp.robot
Resource  ../../Resources/Admin/UserPreferenceApp.robot
Resource  ../../Resources/Admin/PermissionApp.robot
Resource  ../../Resources/Admin/ManageHostsApp.robot

Test Setup  Common.Begin Web Test
Test Teardown  Common.End Web Test
*** Tasks ***


Login Web 71
    [Tags]  Admin_Login  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Admin}  Login
    LoginApp_SBC.Login with some Credentials  ${AdministrationScenarios}
	
Display Proxies 71
    [Tags]  Admin_Proxies  sbc77
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Admin}  Proxy
    ProxyApp.Proxy  ${AdministrationScenarios}
	
Manipulate User Manager 71
    [Tags]  Admin_User Manager  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Admin}  User_Manager
    UserManagerApp.User Manager  ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Admin}  Invalid_User_Manager
    UserManagerApp.Invalid Add User Manager  ${AdministrationScenarios}

Add User Manager 71
    [Tags]  Admin_User Manager  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Admin}  Add_User_Manager
    UserManagerApp.Add User Manager  ${AdministrationScenarios}

Add Invalid User Manager 71
    [Tags]  Admin_User Manager  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Admin}  Invalid_User_Manager
    UserManagerApp.Invalid Add User Manager  ${AdministrationScenarios}

View User Manager 71
    [Tags]  Admin_User Manager  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Admin}  Add_User_Manager
    UserManagerApp.View User Manager  ${AdministrationScenarios}

Edit User Manager 71
    [Tags]  Admin_User Manager  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Admin}  Permission_Add
    PermissionApp.Permission Add  ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Admin}  Edit_User_Manager
    UserManagerApp.Edit User Manager  ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Admin}  Permission_Add
    PermissionApp.Permission Delete  ${AdministrationScenarios}

Delete User Manager 71
    [Tags]  Admin_User Manager  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Admin}  Delete_User_Manager
    UserManagerApp.Delete User Manager  ${AdministrationScenarios}


User Preference 71
    [Tags]  Admin_User  Preference  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Admin}  User_Preference
    UserPreferenceApp.User Preference  ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Admin}  Invalid_User_Preference
    UserPreferenceApp.Invalid User Preference  ${AdministrationScenarios}

	
Add Permission 71
    [Tags]  Admin_User Role  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Admin}  Permission_Add
    PermissionApp.Permission Add  ${AdministrationScenarios}
	
Edit Permission 71
    [Tags]  Admin_User Role  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Admin}  Permission_Edit
    PermissionApp.Permission Edit  ${AdministrationScenarios}

	
View Permission 71
    [Tags]  Admin_User Role  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Admin}  Permission_Edit
    PermissionApp.Permission View  ${AdministrationScenarios}

	
Delete Permission 71
    [Tags]  Admin_User Role  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Admin}  Permission_Add
    PermissionApp.Permission Delete  ${AdministrationScenarios}


Sort Permission 71
    [Tags]  Admin_User Role  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Admin}  Permission_Edit
    PermissionApp.Permission Sort   ${AdministrationScenarios}

	
Filter Permission 71
    [Tags]  Admin_User Role  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Admin}  Permission_Filter
    PermissionApp.Permission Filter   ${AdministrationScenarios}

Add hosts 71
    [Tags]  Admin_Manage  hosts  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Admin}  Manage_Hosts
    ManageHostsApp.Add Hosts   ${AdministrationScenarios}

Edit hosts 71
    [Tags]  Admin_Manage  hosts  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Admin}  Manage_Hosts
    ManageHostsApp.Edit Hosts   ${AdministrationScenarios}

View hosts 71
    [Tags]  Admin_Manage  hosts  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Admin}  Manage_Hosts
    ManageHostsApp.View Hosts   ${AdministrationScenarios}

Delete hosts 71
    [Tags]  Admin_Manage  hosts  sbc77  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Admin}  Manage_Hosts
    ManageHostsApp.Delete Hosts   ${AdministrationScenarios}

TR_19270_Tc1
    [Tags]  TR_19270  sbc77  not_critical
    [Documentation]     Add a new role with BGCF_PEER_ACCESS check box not checked then edit it and check that other permission of the role is not impacted
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Admin}  TR_19270
    PermissionApp.TR_19270_Tc1 function  ${AdministrationScenarios}

TR_19270_Tc2
    [Tags]  TR_19270  sbc77  not_critical
    [Documentation]     Add a new role with BGCF_ACCESS check box not checked then edit it and check that other permission of the role is not impacted
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Admin}  TR_19270
    PermissionApp.TR_19270_Tc2 function  ${AdministrationScenarios}

TR_19262
    [Tags]  TR_19262  sbc77  sbc70  not_critical
    [Documentation]  Setting proxy and changing hosts(back and forth) then check that proxy settings are not erased
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Admin}  Manage_Hosts
    ManageHostsApp.Add Hosts   ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Admin}  TR_19262
    ProxyApp.TR_19262 function  ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Admin}  Manage_Hosts
    ManageHostsApp.Delete Hosts   ${AdministrationScenarios}

IMP_19315
    [Tags]  IMP_19315  sbc77  sbc70  not_critical
    [Documentation]  Verify user with view permission only can change host
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Admin}  Add_User_Manager
    UserManagerApp.Add User Manager  ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Admin}  Manage_Hosts
    ManageHostsApp.Add Hosts With User  ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Admin}  IMP_19315
    UserManagerApp.IMP_19315 function  ${AdministrationScenarios}
    #${AdministrationScenarios} =  DataManager.Get Excel Data   ${Admin}  Manage_Hosts
    #ManageHostsApp.Delete Hosts   ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Admin}  Delete_User_Manager
    UserManagerApp.Delete User Manager  ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Admin}  Permission_Add
    PermissionApp.Permission Delete  ${AdministrationScenarios}

IMP_21634
    [Tags]  IMP_21634  sbc72  not_critical
    [Documentation]  Default statictis user with permission to access statictis page only
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Admin}  Manage_Hosts
    ManageHostsApp.Add Hosts   ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Admin}  IMP_21634
    LoginApp_SBC.Login with statictis user  ${AdministrationScenarios}
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Admin}  Manage_Hosts
    ManageHostsApp.Delete Hosts   ${AdministrationScenarios}

TR_22983
    [Tags]  TR_22983  sbc72  not_critical
    ${AdministrationScenarios} =  DataManager.Get Excel Data   ${Admin}  Proxy
    ProxyApp.TR_22983  ${AdministrationScenarios}