@echo off
echo ************************************************************
echo **                                                        **
echo **                      SmartFintelligen                  **
echo **                      �������ݿ��û�                    **
echo **                                                        **
echo ************************************************************
echo ������SmartFintelligen���ݿ�ϵͳ����Աsys�û������룺
set /p data_pwd= 
echo ������SmartFintelligen���ݿ�ķ�����SID��
set /p data_sid= 
echo ����������ݿ���ϢΪ��
echo ���ݿ�SID��%data_sid%
echo ���ݿ����룺%data_pwd%
pause
echo ��ʼִ�д���Fintelligen���ݿ��û�����
sqlplus  sys/%data_pwd%@%data_sid%   @.\CreateUser.sql >CreateUser.log
echo Fintelligen���ݿ��û����󴴽���ϣ���鿴��־��¼��
pause
