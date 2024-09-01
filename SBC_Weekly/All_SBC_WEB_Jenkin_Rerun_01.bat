@echo off
set PATH_AUTO=D:\\SBC_WEB\\Trunk

cd %PATH_AUTO%

@REM call robot -d result/01 --rerunfailed result/output.xml --output rerun.xml -v "DATA_DIRECTORY:%PATH_AUTO%\\Data" Tests
@REM call rebot --outputdir result --output output_01.xml --merge result/output.xml  result/01/rerun.xml
@REM call rebot --outputdir result --output output.xml --merge result/output_01.xml
@REM call robot -d result_sendmail Sendemail.robot

call robot -d result -v "DATA_DIRECTORY:%PATH_AUTO%\\Data" -i "Admin_Proxy"  --log Proxy_log.html  --report Proxy_report.html  -o Proxy.xml Tests

call robot -d result -v "DATA_DIRECTORY:%PATH_AUTO%\\Data" -R result/01_BGCF_run.xml                 -o 01_BGCF_rerun_1.xml                 Tests
call robot -d result -v "DATA_DIRECTORY:%PATH_AUTO%\\Data" -R result/02_IBCF_run.xml                 -o 02_IBCF_rerun_1.xml                 Tests
call robot -d result -v "DATA_DIRECTORY:%PATH_AUTO%\\Data" -R result/03_PCSCF_run.xml                -o 03_PCSCF_rerun_1.xml                Tests
call robot -d result -v "DATA_DIRECTORY:%PATH_AUTO%\\Data" -R result/04_Media_Proxy_run.xml          -o 04_Media_Proxy_rerun_1.xml          Tests
call robot -d result -v "DATA_DIRECTORY:%PATH_AUTO%\\Data" -R result/05_Transcoding_run.xml          -o 05_Transcoding_rerun_1.xml          Tests
call robot -d result -v "DATA_DIRECTORY:%PATH_AUTO%\\Data" -R result/06_HSS_run.xml                  -o 06_HSS_rerun_1.xml                  Tests
call robot -d result -v "DATA_DIRECTORY:%PATH_AUTO%\\Data" -R result/07_ICSCF_run.xml                -o 07_ICSCF_rerun_1.xml                Tests
call robot -d result -v "DATA_DIRECTORY:%PATH_AUTO%\\Data" -R result/08_SCSCF_run.xml                -o 08_SCSCF_rerun_1.xml                Tests
call robot -d result -v "DATA_DIRECTORY:%PATH_AUTO%\\Data" -R result/09_TAS_run.xml                  -o 09_TAS_rerun_1.xml                  Tests
call robot -d result -v "DATA_DIRECTORY:%PATH_AUTO%\\Data" -R result/10_ECSCF_run.xml                -o 10_ECSCF_rerun_1.xml                Tests
call robot -d result -v "DATA_DIRECTORY:%PATH_AUTO%\\Data" -R result/11_Supervision_run.xml          -o 11_Supervision_rerun_1.xml          Tests
call robot -d result -v "DATA_DIRECTORY:%PATH_AUTO%\\Data" -R result/12_Admin_run.xml                -o 12_Admin_rerun_1.xml                Tests
@REM call robot -d result -v "DATA_DIRECTORY:%PATH_AUTO%\\Data" -R result/13_Cluster_Information_run.xml  -o 13_Cluster_Information_rerun_1.xml  Tests

call rebot --outputdir result --output rerun_1.xml --merge result/*_rerun_1.xml
call rebot --outputdir result --output output.xml --merge result/run.xml result/rerun_1.xml
