@ECHO off 
cls 
color 0A 
ECHO **************************************************************
ECHO ***	数据平台数据库初始化安装	***
ECHO ***    在执行本安装前请建立系统的用户	***    
ECHO **************************************************************

echo 请输入数据平台系统数据库的SENSE用户名：
set /p SENSE_name=
echo 请输入数据平台系统数据库的SENSE用户密码：
set /p SENSE_pwd=
echo 请输入数据平台系统数据库的TNSNAME：
set /p data_sid=

ECHO 您输入的数据库信息为：
ECHO ************************************************************
echo SENSE用户名：  
ECHO %SENSE_name%
echo SENSE用户密码： 
ECHO %SENSE_pwd%
echo 数据库的TNSNAME：
ECHO %data_sid%

ECHO ************************************************************

PAUSE

echo 开始执行数据库SENSE初始化脚本：
sqlplus  %SENSE_name%/%SENSE_pwd%@%data_sid%   @.\senseRunAll.sql  >senseRunAll.log
echo 数据库SENSE初始化脚本执行完毕，请查看日志记录。

:end 

PAUSE
color
@ECHO ON 