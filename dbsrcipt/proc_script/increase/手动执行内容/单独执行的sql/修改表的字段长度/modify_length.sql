---������
--������Ϣ��
alter table cifm_person_info modify client_name VARCHAR2(100);
alter table cifm_person_info modify CREDENTIALS_NO VARCHAR2(150);
--������ϸ��
alter table CIFM_PERSON_DETAIL modify client_name VARCHAR2(100);
alter table CIFM_PERSON_DETAIL modify CREDENTIALS_NO VARCHAR2(150);
--��ҵ��Ϣ��
alter table CIFM_COMPANY_INFO modify company_name VARCHAR2(200);
alter table CIFM_COMPANY_INFO modify china_credit_code VARCHAR2(150);
--��ҵ��ϸ��
alter table CIFM_COMPANY_DETAIL modify company_name VARCHAR2(200);
alter table CIFM_COMPANY_DETAIL modify china_credit_code VARCHAR2(150);
--���в�ѯ��ˮ��
alter table CIFM_BANK_QUERY_FLOW modify PRODUCT_DES1 VARCHAR2(150);
alter table CIFM_BANK_QUERY_FLOW modify PRODUCT_DES3 VARCHAR2(200);

--���˱����
--������Ϣ
alter table PER_BASIC modify CLIENT_NAME VARCHAR2(80);
alter table PER_BASIC modify CREDENTIALS_NO VARCHAR2(150);
alter table PER_BASIC modify CLIENT_BIRTHDAY VARCHAR2(100);
alter table PER_BASIC modify PHONE_NUM VARCHAR2(150);
alter table PER_BASIC modify COMPANY_TEL VARCHAR2(150);
alter table PER_BASIC modify FAMILY_TEL VARCHAR2(150);
alter table PER_BASIC modify MAILING_ADDRESS VARCHAR2(300);
alter table PER_BASIC modify RESIDENCE_ADDRESS VARCHAR2(300);
ALTER TABLE PER_BASIC MODIFY CH_PHONE VARCHAR2(200);
--��ż��Ϣ
alter table PER_SPOU modify SPOU_NAME VARCHAR2(80);
alter table PER_SPOU modify SPOU_CREDENTIALS_NO VARCHAR2(150);
alter table PER_SPOU modify SPOU_COMPANY VARCHAR2(200);
alter table PER_SPOU modify SPOU_TEL VARCHAR2(150);
--��ס��Ϣ
alter table PER_LIVE modify RESIDENTIAL_ADDRESS VARCHAR2(300);
--ְҵ��Ϣ
alter table PER_CAREER modify COMPANY_NAME VARCHAR2(200);
alter table PER_CAREER modify COMPANY_ADDRESS VARCHAR2(300);
alter table PER_CAREER modify JOB_TITLE VARCHAR2(100);
--������ɷ�
alter table PER_PROVIDENT_FUND_PAY modify PAY_COM_NAME VARCHAR2(200);
--���Ͻɷ�
alter table PER_PENSIO_PAY modify PAY_COM_NAME VARCHAR2(200);
--���ϱ��ս𷢷ż�¼
alter table PER_PENSIO_RELEASE modify ORIGINAL_COMAPNY VARCHAR2(200);
--�ͱ�������¼
alter table PER_LOW_SECURITY modify COMPANY VARCHAR2(200);
--�������׺͵�Ѻ��¼
alter table PER_VEHICLE_TRANSACTION modify PLATE_NUM VARCHAR2(100);
alter table PER_VEHICLE_TRANSACTION modify ENGINE_NUM VARCHAR2(100);

---��ҵ�����
--��ҵ���Ż�����Ϣ
alter table COM_CREDIT_BASIC_INFO modify BORR_NAME VARCHAR2(200);
alter table COM_CREDIT_BASIC_INFO modify REGI_ADDR VARCHAR2(300);
alter table COM_CREDIT_BASIC_INFO modify REGI_NO VARCHAR2(150);
alter table COM_CREDIT_BASIC_INFO modify MECH_CODE VARCHAR2(150);
alter table COM_CREDIT_BASIC_INFO modify china_credit_code VARCHAR2(150);
alter table COM_CREDIT_BASIC_INFO modify COUNTRY_TAX_REGI_NO VARCHAR2(150);
alter table COM_CREDIT_BASIC_INFO modify LAND_TEX_REGI_NO VARCHAR2(150);
--��������Ϣ
alter table COM_INVESTOR_INFO modify INVE_NAME VARCHAR2(300);
alter table COM_INVESTOR_INFO modify INVE_CRED_NUM VARCHAR2(150);
--�߹���Ա��Ϣ
alter table COM_SENIOR_MANAGER_INFO modify SENIOR_NAME VARCHAR2(300);
alter table COM_SENIOR_MANAGER_INFO modify SNEIOR_CRED_NUM VARCHAR2(150);
--��ֱ�ӹ�����ϵ��������ҵ
alter table COM_DIRECT_CONN_OTHERS modify COM_NAME VARCHAR2(300);
alter table COM_DIRECT_CONN_OTHERS modify CHINA_CREDIT_CODE VARCHAR2(150);
--������Ϣ
alter table COM_REPORT_INFO modify ORG_CODE VARCHAR2(150);
alter table COM_REPORT_INFO modify CHINA_CREDIT_CODE VARCHAR2(150);
--2���޸��ֶγ���
alter table PER_SPECIAL_TRADE modify OVERDUE_DETAIL varchar2(200);
alter table PER_LABEL_INFO modify L_TYPE varchar2(200);
alter table PER_LABEL_INFO modify L_CONTENT varchar2(200);
alter table PER_OWE_TAXES modify TAX_AUTHORITY varchar2(80);  
alter table PER_VERDICT modify COURT_NAME varchar2(100); 
alter table PER_VERDICT modify GOAL_SYM varchar2(200); 
alter table COM_JUDGE_RECORD modify LITIG_SUB varchar2(200);             
alter table COM_VERDICT modify GOAL_SYM varchar2(200); 
alter table COM_VERDICT modify APPLY_SYM varchar2(200); 
alter table PER_INFORCE modify APPLY_SYM varchar2(200); 
alter table PER_INFORCE modify GOAL_SYM varchar2(200); 
alter table PER_PROVIDENT_FUND_PAY modify PAY_COM_NAME varchar2(100); 
alter table PER_QUALIFICATION modify QUAL_NAME varchar2(100); 
alter table COM_SPETRANS_INFO modify TRANS_INFO varchar2(200); 
alter table COM_PENALTIES modify ILEHAL_BEHAVIOR varchar2(500); 
alter table COM_PENALTIES modify PENALTIES_DECIDION varchar2(500); 
alter table COM_PENALTIES modify PENALTIES_SITATION varchar2(500); 
alter table COM_PENALTIES modify RECONSIDERATION_RESULT varchar2(200);           
alter table COM_OBTAIN_LICENSE modify CONTENT_LICENSE varchar2(1000); 
alter table COM_OBTAIN_CERTIFI modify CONTENT_CERTIFI varchar2(200); 
alter table COM_OBTAIN_QUAL modify CONTENT_QUAL varchar2(200); 
alter table COM_OBTAIN_REWARD modify CONTENT_REWARD varchar2(200); 
alter table COM_PATENT_CASE modify PATENT_NO varchar2(100); 