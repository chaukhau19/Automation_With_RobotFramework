@echo off
set PATH_AUTO=D:\\SBC_WEB\\Trunk_Secure

call rmdir /s /q %PATH_AUTO%\\result
cd %PATH_AUTO%


call robot -d result -v "DATA_DIRECTORY:%PATH_AUTO%\\Data" -i "Admin_Proxy"          --log Proxy_log.html                   --report Proxy_report.html                   -o Proxy.xml                       Tests

call robot -d result -v "DATA_DIRECTORY:%PATH_AUTO%\\Data" -i "CirpackWeb.cfg"       --log cfg_log.html                     --report cfg_report.html                     -o cfg.xml                         Tests

call robot -d result -v "DATA_DIRECTORY:%PATH_AUTO%\\Data" -i "BGCF"                 --log 01_BGCF_log.html                 --report 01_BGCF_report.html                 -o 01_BGCF_run.xml                 Tests
call robot -d result -v "DATA_DIRECTORY:%PATH_AUTO%\\Data" -i "IBCF"                 --log 02_IBCF_log.html                 --report 02_IBCF_report.html                 -o 02_IBCF_run.xml                 Tests
call robot -d result -v "DATA_DIRECTORY:%PATH_AUTO%\\Data" -i "PCSCF"                --log 03_PCSCF_log.html                --report 03_PCSCF_report.html                -o 03_PCSCF_run.xml                Tests
call robot -d result -v "DATA_DIRECTORY:%PATH_AUTO%\\Data" -i "MediaProxy"           --log 04_Media_Proxy_log.html          --report 04_Media_Proxy_report.html          -o 04_Media_Proxy_run.xml          Tests
call robot -d result -v "DATA_DIRECTORY:%PATH_AUTO%\\Data" -i "Transcoding"          --log 05_Transcoding_log.html          --report 05_Transcoding_report.html          -o 05_Transcoding_run.xml          Tests
call robot -d result -v "DATA_DIRECTORY:%PATH_AUTO%\\Data" -i "ECSCF"                --log 06_ECSCF_log.html                --report 06_ECSCF_report.html                -o 06_ECSCF_run.xml                Tests
call robot -d result -v "DATA_DIRECTORY:%PATH_AUTO%\\Data" -i "Admin"                --log 07_Admin_log.html                --report 07_Admin_report.html                -o 07_Admin_run.xml                Tests

call rebot --outputdir result --output run.xml --merge result/*_run.xml





