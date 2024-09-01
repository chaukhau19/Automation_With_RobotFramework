*** Settings ***
Variables    ./IP.yaml

*** Variables ***
# Configuration
${BROWSER} =  Chrome
${HEADLESS_FOLDER} =  SBC_WEB


${IP_WEB_SBC} =  ${eth0}
${BASE_URL} =  https://${eth0}/user/login
${HOST_SBC} =  ${eth0}
${SBC_IPV6} =  ${eth0_IPv6}
${Local_Host_SBC} =  ${ifcfg-lo}
${DATA_DIRECTORY}   ${CURDIR}
${DATA_Dowload} =  C:\\Users\\ntckhau\\Downloads


${Lab_Value}=    SBC_Normal 
#For Version and Getenforce:    SBC_Normal    SBC_Secure       SBC_7.5_Normal
${TC_PRIORITY} =  MEDIUM
#For Sanity or Weekly:  LOW    MEDIUM    HIGH    CRITICAL
${TPIP_IP_DROPDOWN}=    ${ifcfg-lo} 
#For TPIP BGCF/IBCF/PCSCF run auto:       eth0           ifcfg-lo 
#At 33.105 -> ifcfg-lo, at 12.110 -> ifcfg-lo 
${RFC4028}=    5
#At 33.105 -> 5, at 12.110 -> 0
${Version_Log}=   Yes
#For Version:  Yes / No
###########################  Register ########################################
${SIPP} =   ${eth0_Sipp}
${SIPP_IP} =  ${eth0_Sipp}
${HOST_CIRPACK} =   ${eth0}
${HOST_CLUSTER} =   ${eth0_Cluster}
${USER_SIPP} =  root
${PASS_SIPP} =  rcirkey
${SSH_USER_ROOT} =  root
${SSH_PASS_ROOT} =  rcirkey
${SSH_USER_OMNI} =  omni
${SSH_PASS_OMNI} =  omni
${SSH_USER_EXPLOIT} =  exploit
${SSH_PASS_EXPLOIT} =  exploit
${SIPP_TEST_FD} =   /home/omni/autoweb/Scripts
${SIPP_XML_FD}=     ${SIPP_TEST_FD}/xml
${SIPP_CSV_FD}=     ${SIPP_TEST_FD}/csv
${SIPP_PORT_A} =  8421
${SIPP_PORT_B} =  8422
${SIPP_PORT_C} =  8423
${SIPP_PORT_D} =  8424
${PCSCF_IP_PORT} =    ${eth0}:5091
${XML_REGISTER} =   register.xml
${XML_DEREGISTER} =   deregister.xml
${CSV_FILE_A} =  0667778881.csv


#################################################################################################################################
#                                                       --- DATA EXCEL ---                                                      #
#################################################################################################################################


##########################  Administration  #################################
${Admin} =  ${DATA_DIRECTORY}\\Administration\\Administration.xlsx
${CREDENTIALS_FROM_CSV} =  ${DATA_DIRECTORY}\\LoginUserstest.csv
${LOGINPAGE_FROM_CSV} =  ${DATA_DIRECTORY}\\Loginpage.csv

##########################  BGCF  #################################
${BGCF_IBCF} =  ${DATA_DIRECTORY}\\BGCF\\BGCF_IBCF.xlsx
${BGCF_Peer} =  ${DATA_DIRECTORY}\\BGCF\\BGCF_Peer.xlsx
${BGCF_IncomingProxy} =  ${DATA_DIRECTORY}\\BGCF\\BGCF_IncomingProxy.xlsx
${SessionBackup} =  ${DATA_DIRECTORY}\\BGCF\\SessionBackup.xlsx
${BGCF_TPIP} =  ${DATA_DIRECTORY}\\BGCF\\BGCF_TPIP.xlsx

###########################  Cluster Inf  ##########################################
${Cluster_Inf} =  ${DATA_DIRECTORY}\\CLuster_Inf\\CLuster_Inf.xlsx

##########################  IBCF  #################################
${IBCF_TPIP} =  ${DATA_DIRECTORY}\\IBCF\\IBCF_TPIP.xlsx
${IBCF_BGCF} =  ${DATA_DIRECTORY}\\IBCF\\IBCF_BGCF.xlsx
${IBCF_Peer}=             ${DATA_DIRECTORY}\\IBCF\\IBCF_Peer.xlsx
${IBCF_MP}=             ${DATA_DIRECTORY}\\IBCF\\IBCF_MP.xlsx
${IBCF_SRTP}=             ${DATA_DIRECTORY}\\IBCF\\IBCF_SRTP.xlsx
${IBCF_TLS}=             ${DATA_DIRECTORY}\\IBCF\\IBCF_TLS.xlsx
${IBCF_Bypass}=          ${DATA_DIRECTORY}\\IBCF\\IBCF_Bypass.xlsx
${IBCF_Pnum}=          ${DATA_DIRECTORY}\\IBCF\\IBCF_Pnum.xlsx
${IBCF_Alerting}=          ${DATA_DIRECTORY}\\IBCF\\IBCF_Alerting.xlsx
${IBCF_SCSCF}=             ${DATA_DIRECTORY}\\IBCF\\IBCF_SCSCF.xlsx
${ICSCF_SCSCF}=             ${DATA_DIRECTORY}\\ICSCF\\ICSCF_SCSCF.xlsx
#${CA_File_Path}=         ${DATA_DIRECTORY}\\IBCF\\CA.txt
#${Certificate_File_Path}=  ${DATA_DIRECTORY}\\IBCF\\Certificate.txt
#${Private_File_Path}=     ${DATA_DIRECTORY}\\IBCF\\Private.txt

###########################  PCSCF  ##########################################
${PCSCF_TPIP} =  ${DATA_DIRECTORY}\\PCSCF\\PCSCF_TPIP.xlsx
${PCSCF_Peer} =  ${DATA_DIRECTORY}\\PCSCF\\PCSCF_Peer.xlsx
${PCSCF_MP} =  ${DATA_DIRECTORY}\\PCSCF\\PCSCF_MP.xlsx
${PCSCF_I_ECSCF} =  ${DATA_DIRECTORY}\\PCSCF\\PCSCF_I_ECSCF.xlsx
${PCSCF_I_ECSCF} =  ${DATA_DIRECTORY}\\PCSCF\\PCSCF_I_ECSCF.xlsx
${PCSCF_SRTP}=             ${DATA_DIRECTORY}\\PCSCF\\PCSCF_SRTP.xlsx
${PCSCF_TLS}=             ${DATA_DIRECTORY}\\PCSCF\\PCSCF_TLS.xlsx
${PCSCF_Bypass}=          ${DATA_DIRECTORY}\\PCSCF\\PCSCF_Bypass.xlsx
${PCSCF_Pnum}=          ${DATA_DIRECTORY}\\PCSCF\\PCSCF_Pnum.xlsx
${PCSCF_Alerting}=          ${DATA_DIRECTORY}\\PCSCF\\PCSCF_Alerting.xlsx
${PCSCF_RegisteredUser} =  ${DATA_DIRECTORY}\\PCSCF\\PCSCF_RegisteredUser.xlsx
${PCSCF_AKA}=             ${DATA_DIRECTORY}\\PCSCF\\PCSCF_AKA.xlsx
${PCSCF_Whitelabel}=      ${DATA_DIRECTORY}\\PCSCF\\PCSCF_Whitelabel.xlsx

${CA_File_Path}=         ${DATA_DIRECTORY}\\PCSCF\\CA.txt
${Certificate_File_Path}=  ${DATA_DIRECTORY}\\PCSCF\\Certificate.txt
${Private_File_Path}=     ${DATA_DIRECTORY}\\PCSCF\\Private.txt

${Config_File_Path}=      ${DATA_DIRECTORY}\\PCSCF\\whiteLabel.cfg
${CONFIG_FILE} =    /home/httpd/Cirpack_web_admin/app/conf/CirpackWeb.cfg

${Config_File_Path_Restore_All_Files_Omni}=      ${DATA_DIRECTORY}\\Supervision\\backup_all_files_omni.tar.gz
${Config_File_Path_Restore_All_Files_Root}=      ${DATA_DIRECTORY}\\Supervision\\backup_all_files_root.tar.gz

${Restore_Only_One_File_Root}=      ${DATA_DIRECTORY}\\Supervision\\backup_only_one_file_root.tar.gz
${Restore_Multiple_Files_Root}=      ${DATA_DIRECTORY}\\Supervision\\backup_multiple_files_root.tar.gz
${Restore_One_Folder}=      ${DATA_DIRECTORY}\\Supervision\\backup_only_emply_folder.tar.gz

${Restore_Only_One_File_Omni}=      ${DATA_DIRECTORY}\\Supervision\\backup_only_one_file_omni.tar.gz
${Restore_Multiple_Files_Omni}=      ${DATA_DIRECTORY}\\Supervision\\backup_multiple_files_omni.tar.gz
${Restore_Empty_File}=      ${DATA_DIRECTORY}\\Supervision\\backup_only_emply_file.tar.gz


${Config_File_Path_Upload_Only_One_File_Omni}=      ${DATA_DIRECTORY}\\Supervision\\1_test_config_file_omni.cfg
${Config_File_Path_Upload_Only_One_File_Root}=      ${DATA_DIRECTORY}\\Supervision\\2_test_config_file_root.cfg

${Config_File_Path_Download_Only_One_File_Omni}=      ${DATA_Dowload}\\1_test_config_file_omni.cfg
${Config_File_Path_Download_Only_One_File_Root}=      ${DATA_Dowload}\\2_test_config_file_root.cfg

${client_certificate}=      ${DATA_Dowload}\\client_certificate.pfx
${ca_certificate}=      ${DATA_Dowload}\\ca_certificate.crt

###########################  Transcoding_Media Proxy  ##########################################
${Transcoding} =  ${DATA_DIRECTORY}\\Transcoding\\Transcoding.xlsx
${MediaProxy} =  ${DATA_DIRECTORY}\\MediaProxy\\MediaProxy.xlsx

###########################  SCSCF  ##########################################
${SCSCF_IBCF} =  ${DATA_DIRECTORY}\\SCSCF\\SCSCF_IBCF.xlsx
${SCSCF_BGCF} =  ${DATA_DIRECTORY}\\SCSCF\\SCSCF_BGCF.xlsx
${SCSCF_DNS} =  ${DATA_DIRECTORY}\\SCSCF\\SCSCF_DNS.xlsx
${SCSCF_Trusted} =  ${DATA_DIRECTORY}\\SCSCF\\SCSCF_Trusted.xlsx
${SCSCF_PBXAS} =  ${DATA_DIRECTORY}\\SCSCF\\SCSCF_PBXAS.xlsx
${SCSCF_CoreDomain} =  ${DATA_DIRECTORY}\\SCSCF\\SCSCF_CoreDomain.xlsx

###########################  Supervision  ##########################################
${Supervision_Configuration_File} =  ${DATA_DIRECTORY}\\Supervision\\Supervision_Configuration_File.xlsx
${Supervision_Restore} =  ${DATA_DIRECTORY}\\Supervision\\Supervision_Restore.xlsx

##########################  TAS  #################################
${TAS_Services} =  ${DATA_DIRECTORY}\\TAS\\TAS_Services.xlsx
${TAS_IPDestination} =  ${DATA_DIRECTORY}\\TAS\\TAS_IPDestination.xlsx
${TAS_DomainRoutes} =  ${DATA_DIRECTORY}\\TAS\\TAS_DomainRoutes.xlsx

##########################  HSS  #################################
${HSS_DataReference} =  ${DATA_DIRECTORY}\\HSS\\HSS_DataReference.xlsx
${HSS_DataReference_List} =  ${DATA_DIRECTORY}\\HSS\\HSS_DataReferenceList.xlsx
${HSS_ApplicationServer} =  ${DATA_DIRECTORY}\\HSS\\HSS_ApplicationServer.xlsx
${HSS_DiameterTPIP} =  ${DATA_DIRECTORY}\\HSS\\HSS_DiameterTPIP.xlsx
${HSS_Peer} =  ${DATA_DIRECTORY}\\HSS\\HSS_Peer.xlsx
${HSS_PeerGroup} =  ${DATA_DIRECTORY}\\HSS\\HSS_PeerGroup.xlsx
${HSS_Realm} =  ${DATA_DIRECTORY}\\HSS\\HSS_Realm.xlsx
${HSS_HSSRealm} =  ${DATA_DIRECTORY}\\HSS\\HSS_HSSRealm.xlsx
${HSS_HSSHost} =  ${DATA_DIRECTORY}\\HSS\\HSS_HSSHost.xlsx

###########################  ICSCF  ##########################################
${ICSCF_BGCF} =  ${DATA_DIRECTORY}\\ICSCF\\ICSCF_BGCF.xlsx
${ICSCF_DNS} =  ${DATA_DIRECTORY}\\ICSCF\\ICSCF_DNS.xlsx

###########################  ECSCF  ##########################################
${ECSCF_BGCF} =  ${DATA_DIRECTORY}\\ECSCF\\ECSCF_BGCF.xlsx
${ECSCF_IBCF} =  ${DATA_DIRECTORY}\\ECSCF\\ECSCF_IBCF.xlsx


###########################  SEND EMAIL  ##########################################
${WEB_SSH_USERNAME} =  root
${WEB_SSH_PASSWORD} =  rcirkey
${EMAIL_SENDER} =   cirpack_wiki@tma.com.vn
${EMAIL_PWD} =  Cirpack!2024
${EMAIL_RECEIVER} =   ntckhau@tma.com.vn
${EMAIL_CONTENT}    Hi All,\n\nPlease see the auto non reg test result in the attached html files.
${EMAIL_CONTENT2}     n\nBest Regards\n\nTMA Validation
${WEB_SBC_RPM_REVISION} =   yum list installed |grep SBC_ui|awk -F" " '{print $2}'|awk -F".el" '{print $1}'
${REPORT_MODE} =   SBC_WEB
