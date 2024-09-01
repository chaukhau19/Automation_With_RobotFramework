@echo off
set PATH_AUTO=D:\\SBC_WEB\\Sanity

call rmdir /s /q %PATH_AUTO%\\result
cd %PATH_AUTO%

:: First, run 'Display Proxies 71' on '01_Admin' to display a menu module.
call robot -d result -t "Display Proxies 71" -v "DATA_DIRECTORY:%PATH_AUTO%\\Data" Tests\01_Admin\Administration.robot
:: Run auto for Sanity
call robot -d result -i sbc77 -i ims47 -e not_critical -v "DATA_DIRECTORY:%PATH_AUTO%\\Data" Tests

call robot -d test_result Sendemail.robot