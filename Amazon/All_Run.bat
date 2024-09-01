@echo off

call rmdir /s /q D:\Amazon\Log
cd D:/Amazon

call robot -d .\Log\ -i "HomePage" .\Tests\Admin\Administration.robot
