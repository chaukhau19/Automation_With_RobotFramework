@echo off
set PATH_AUTO=D:\\SBC_WEB\\Trunk

call rmdir /s /q %PATH_AUTO%\\result
cd %PATH_AUTO%

@REM call robot -d result -v "DATA_DIRECTORY:%PATH_AUTO%\\Data" Tests
@REM call rebot --outputdir result --output output.xml --merge result/output.xml
@REM call robot -d result_sendmail Sendemail.robot

call robot -d result -v "DATA_DIRECTORY:%PATH_AUTO%\\Data" -i "Admin_Proxy"          --log Proxy_log.html                   --report Proxy_report.html                   -o Proxy.xml                       Tests

call robot -d result -v "DATA_DIRECTORY:%PATH_AUTO%\\Data" -i "CirpackWeb.cfg"       --log cfg_log.html                     --report cfg_report.html                     -o cfg.xml                         Tests

call robot -d result -v "DATA_DIRECTORY:%PATH_AUTO%\\Data" -i "BGCF"                 --log 01_BGCF_log.html                 --report 01_BGCF_report.html                 -o 01_BGCF_run.xml                 Tests
call robot -d result -v "DATA_DIRECTORY:%PATH_AUTO%\\Data" -i "IBCF"                 --log 02_IBCF_log.html                 --report 02_IBCF_report.html                 -o 02_IBCF_run.xml                 Tests
call robot -d result -v "DATA_DIRECTORY:%PATH_AUTO%\\Data" -i "PCSCF"                --log 03_PCSCF_log.html                --report 03_PCSCF_report.html                -o 03_PCSCF_run.xml                Tests
call robot -d result -v "DATA_DIRECTORY:%PATH_AUTO%\\Data" -i "MediaProxy"           --log 04_Media_Proxy_log.html          --report 04_Media_Proxy_report.html          -o 04_Media_Proxy_run.xml          Tests
call robot -d result -v "DATA_DIRECTORY:%PATH_AUTO%\\Data" -i "Transcoding"          --log 05_Transcoding_log.html          --report 05_Transcoding_report.html          -o 05_Transcoding_run.xml          Tests
call robot -d result -v "DATA_DIRECTORY:%PATH_AUTO%\\Data" -i "HSS"                  --log 06_HSS_log.html                  --report 06_HSS_report.html                  -o 06_HSS_run.xml                  Tests
call robot -d result -v "DATA_DIRECTORY:%PATH_AUTO%\\Data" -i "ICSCF"                --log 07_ICSCF_log.html                --report 07_ICSCF_report.html                -o 07_ICSCF_run.xml                Tests
call robot -d result -v "DATA_DIRECTORY:%PATH_AUTO%\\Data" -i "SCSCF"                --log 08_SCSCF_log.html                --report 08_SCSCF_report.html                -o 08_SCSCF_run.xml                Tests
call robot -d result -v "DATA_DIRECTORY:%PATH_AUTO%\\Data" -i "TAS"                  --log 09_TAS_log.html                  --report 09_TAS_report.html                  -o 09_TAS_run.xml                  Tests
call robot -d result -v "DATA_DIRECTORY:%PATH_AUTO%\\Data" -i "ECSCF"                --log 10_ECSCF_log.html                --report 10_ECSCF_report.html                -o 10_ECSCF_run.xml                Tests
call robot -d result -v "DATA_DIRECTORY:%PATH_AUTO%\\Data" -i "Supervision"          --log 11_Supervision_log.html          --report 11_Supervision_report.html          -o 11_Supervision_run.xml          Tests
call robot -d result -v "DATA_DIRECTORY:%PATH_AUTO%\\Data" -i "Admin"                --log 12_Admin_log.html                --report 12_Admin_report.html                -o 12_Admin_run.xml                Tests
@REM call robot -d result -v "DATA_DIRECTORY:%PATH_AUTO%\\Data" -i "Cluster_Information"  --log 13_Cluster_Information_log.html  --report 13_Cluster_Information_report.html  -o 13_Cluster_Information_run.xml  Tests

call rebot --outputdir result --output run.xml --merge result/*_run.xml





