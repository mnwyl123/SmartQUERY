@ECHO off 
cls 
color 0A 
ECHO **************************************************************
ECHO ***	����ƽ̨���ݿ��ʼ����װ	***
ECHO ***    ��ִ�б���װǰ�뽨��ϵͳ���û�	***    
ECHO **************************************************************

echo ����������ƽ̨ϵͳ���ݿ��SENSE�û�����
set /p SENSE_name=
echo ����������ƽ̨ϵͳ���ݿ��SENSE�û����룺
set /p SENSE_pwd=
echo ����������ƽ̨ϵͳ���ݿ��TNSNAME��
set /p data_sid=

ECHO ����������ݿ���ϢΪ��
ECHO ************************************************************
echo SENSE�û�����  
ECHO %SENSE_name%
echo SENSE�û����룺 
ECHO %SENSE_pwd%
echo ���ݿ��TNSNAME��
ECHO %data_sid%

ECHO ************************************************************

PAUSE

echo ��ʼִ�����ݿ�SENSE��ʼ���ű���
sqlplus  %SENSE_name%/%SENSE_pwd%@%data_sid%   @.\senseRunAll.sql  >senseRunAll.log
echo ���ݿ�SENSE��ʼ���ű�ִ����ϣ���鿴��־��¼��

:end 

PAUSE
color
@ECHO ON 