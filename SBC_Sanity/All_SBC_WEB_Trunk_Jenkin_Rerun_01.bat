@echo off
:: Do not rerun during the Sanity test
set PATH_AUTO=D:\\SBC_WEB_AUTO\\Sanity
cd %PATH_AUTO%

call robot -d result/SBC_WEB/01 --rerunfailed result/SBC_WEB/output.xml --output rerun.xml -v "DATA_DIRECTORY:%PATH_AUTO%\\Data"  Tests
call rebot --outputdir result/SBC_WEB --output output_01.xml --merge result/SBC_WEB/output.xml  result/SBC_WEB/01/rerun.xml
call rebot --outputdir result --output output.xml --merge result/SBC_WEB/output_01.xml