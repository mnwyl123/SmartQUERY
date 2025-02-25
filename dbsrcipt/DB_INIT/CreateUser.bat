@echo off
echo ************************************************************
echo **                                                        **
echo **                      SmartFintelligen                  **
echo **                      创建数据库用户                    **
echo **                                                        **
echo ************************************************************
echo 请输入SmartFintelligen数据库系统管理员sys用户的密码：
set /p data_pwd= 
echo 请输入SmartFintelligen数据库的服务名SID：
set /p data_sid= 
echo 您输入的数据库信息为：
echo 数据库SID：%data_sid%
echo 数据库密码：%data_pwd%
pause
echo 开始执行创建Fintelligen数据库用户对象：
sqlplus  sys/%data_pwd%@%data_sid%   @.\CreateUser.sql >CreateUser.log
echo Fintelligen数据库用户对象创建完毕，请查看日志记录。
pause
