create table CIFM_PERSON_DETAIL
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
comment on table CIFM_PERSON_DETAIL
  is '���Ų�ѯ������ϸ��';
comment on column CIFM_PERSON_DETAIL.id
  is '��ѯ���';
comment on column CIFM_PERSON_DETAIL.org_code
  is '�ϼ���������';
comment on column CIFM_PERSON_DETAIL.branch_code
  is '��ѯ���������';
comment on column CIFM_PERSON_DETAIL.branch_name
  is '��ѯ��������';
comment on column CIFM_PERSON_DETAIL.user_sys_name
  is '��ѯ�û�ϵͳ��';
comment on column CIFM_PERSON_DETAIL.user_real_name
  is '��ѯ�û���ʵ����';
comment on column CIFM_PERSON_DETAIL.query_time
  is '��ѯʱ��';
comment on column CIFM_PERSON_DETAIL.client_name
  is '����ѯ������';
comment on column CIFM_PERSON_DETAIL.credentials_type
  is '֤������';
comment on column CIFM_PERSON_DETAIL.credentials_no
  is '֤������';
comment on column CIFM_PERSON_DETAIL.query_reason
  is '��ѯԭ��';
comment on column CIFM_PERSON_DETAIL.query_version
  is '��ѯ�汾';
comment on column CIFM_PERSON_DETAIL.is_get
  is '�Ƿ���';
comment on column CIFM_PERSON_DETAIL.check_time
  is '��ѯ��Ȩʱ��';
comment on column CIFM_PERSON_DETAIL.ip
  is '��ѯ��IP';

