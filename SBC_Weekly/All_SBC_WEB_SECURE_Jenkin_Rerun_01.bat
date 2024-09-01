@echo off
set PATH_AUTO=D:\\SBC_WEB\\Trunk_Secure

cd %PATH_AUTO%


call robot -d result -v "DATA_DIRECTORY:%PATH_AUTO%\\Data" -i "Admin_Proxy"  --log Proxy_log.html  --report Proxy_report.html  -o Proxy.xml Tests

call robot -d result -v "DATA_DIRECTORY:%PATH_AUTO%\\Data" -R result/01_BGCF_run.xml                 -o 01_BGCF_rerun_1.xml                 Tests
call robot -d result -v "DATA_DIRECTORY:%PATH_AUTO%\\Data" -R result/02_IBCF_run.xml                 -o 02_IBCF_rerun_1.xml                 Tests
call robot -d result -v "DATA_DIRECTORY:%PATH_AUTO%\\Data" -R result/03_PCSCF_run.xml                -o 03_PCSCF_rerun_1.xml                Tests
call robot -d result -v "DATA_DIRECTORY:%PATH_AUTO%\\Data" -R result/04_Media_Proxy_run.xml          -o 04_Media_Proxy_rerun_1.xml          Tests
call robot -d result -v "DATA_DIRECTORY:%PATH_AUTO%\\Data" -R result/05_Transcoding_run.xml          -o 05_Transcoding_rerun_1.xml          Tests
call robot -d result -v "DATA_DIRECTORY:%PATH_AUTO%\\Data" -R result/06_ECSCF_run.xml                -o 06_ECSCF_rerun_1.xml                Tests
call robot -d result -v "DATA_DIRECTORY:%PATH_AUTO%\\Data" -R result/07_Admin_run.xml                -o 07_Admin_rerun_1.xml                Tests


call rebot --outputdir result --output rerun_1.xml --merge result/*_rerun_1.xml
call rebot --outputdir result --output output.xml --merge result/run.xml result/rerun_1.xml
