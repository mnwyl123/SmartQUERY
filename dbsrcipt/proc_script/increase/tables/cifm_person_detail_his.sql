create table CIFM_PERSON_DETAIL_HIS
(
  id               VARCHAR2(64),
  org_code         VARCHAR2(30),
  branch_code      VARCHAR2(30),
  branch_name      VARCHAR2(100),
  user_sys_name    VARCHAR2(30),
  user_real_name   VARCHAR2(20),
  query_time       DATE,
  client_name      VARCHAR2(100),
  credentials_type VARCHAR2(10),
  credentials_no   VARCHAR2(150),
  query_reason     VARCHAR2(2),
  query_version    VARCHAR2(2),
  is_get           VARCHAR2(2),
  check_time       DATE,
  ip               VARCHAR2(16)
)
;
comment on table CIFM_PERSON_DETAIL_HIS
  is '���Ų�ѯ������ϸ��ʷ��';
comment on column CIFM_PERSON_DETAIL_HIS.id
  is '��ѯ���';
comment on column CIFM_PERSON_DETAIL_HIS.org_code
  is '�ϼ���������';
comment on column CIFM_PERSON_DETAIL_HIS.branch_code
  is '��ѯ���������';
comment on column CIFM_PERSON_DETAIL_HIS.branch_name
  is '��ѯ��������';
comment on column CIFM_PERSON_DETAIL_HIS.user_sys_name
  is '��ѯ�û�ϵͳ��';
comment on column CIFM_PERSON_DETAIL_HIS.user_real_name
  is '��ѯ�û���ʵ����';
comment on column CIFM_PERSON_DETAIL_HIS.query_time
  is '��ѯʱ��';
comment on column CIFM_PERSON_DETAIL_HIS.client_name
  is '����ѯ������';
comment on column CIFM_PERSON_DETAIL_HIS.credentials_type
  is '֤������';
comment on column CIFM_PERSON_DETAIL_HIS.credentials_no
  is '֤������';
comment on column CIFM_PERSON_DETAIL_HIS.query_reason
  is '��ѯԭ��';
comment on column CIFM_PERSON_DETAIL_HIS.query_version
  is '��ѯ�汾';
comment on column CIFM_PERSON_DETAIL_HIS.is_get
  is '�Ƿ���';
comment on column CIFM_PERSON_DETAIL_HIS.check_time
  is '��ѯ��Ȩʱ��';
comment on column CIFM_PERSON_DETAIL_HIS.ip
  is '��ѯ��IP';

