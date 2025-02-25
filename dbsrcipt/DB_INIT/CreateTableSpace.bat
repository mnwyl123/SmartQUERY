@echo off
echo ************************************************************
echo **                                                        **
echo **			       金融数据平台                    **
echo **                      创建数据库表空间                  **
echo **                                                        **
echo ************************************************************
     set  current_path=%CD%
echo 当前路径： %current_path%
echo ***********************************************************************
echo 请首先修改数据文件存放的路径！！！！！！
echo 请首先修改运行脚本：%current_path%\createTableSpace.sql
echo ***********************************************************************
pause
notepad %current_path%\CreateTableSpace.sql
echo 请输入金融数据平台数据库系统管理员sys用户的密码：
set /p data_pwd= 
echo 请输入金融数据平台数据库的服务名SID：
set /p data_sid= 
echo 您输入的数据库信息为：
echo 数据库SID：%data_sid%
echo 数据库密码：%data_pwd%
pause
echo 开始执行创建金融数据平台数据库的表空间：
sqlplus  sys/%data_pwd%@%data_sid% AS SYSDBA  @.\CreateTableSpace.txt >CreateTableSpace.log
echo 数据库数据表空间创建完毕，请查看日志记录。
pause
