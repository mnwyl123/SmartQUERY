@echo off
echo ************************************************************
echo **                                                        **
echo **			       ��������ƽ̨                    **
echo **                      �������ݿ��ռ�                  **
echo **                                                        **
echo ************************************************************
     set  current_path=%CD%
echo ��ǰ·���� %current_path%
echo ***********************************************************************
echo �������޸������ļ���ŵ�·��������������
echo �������޸����нű���%current_path%\createTableSpace.sql
echo ***********************************************************************
pause
notepad %current_path%\CreateTableSpace.sql
echo �������������ƽ̨���ݿ�ϵͳ����Աsys�û������룺
set /p data_pwd= 
echo �������������ƽ̨���ݿ�ķ�����SID��
set /p data_sid= 
echo ����������ݿ���ϢΪ��
echo ���ݿ�SID��%data_sid%
echo ���ݿ����룺%data_pwd%
pause
echo ��ʼִ�д�����������ƽ̨���ݿ�ı�ռ䣺
sqlplus  sys/%data_pwd%@%data_sid% AS SYSDBA  @.\CreateTableSpace.txt >CreateTableSpace.log
echo ���ݿ����ݱ�ռ䴴����ϣ���鿴��־��¼��
pause
