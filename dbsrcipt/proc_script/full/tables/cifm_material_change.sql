create table CIFM_MATERIAL_CHANGE
(
  id               VARCHAR2(64) not null,
  check_sys_id     VARCHAR2(32) not null,
  user_sys_id      VARCHAR2(32) not null,
  status           VARCHAR2(255) not null,
  client_name      VARCHAR2(50) not null,
  credentials_type VARCHAR2(50) not null,
  credentials_no   VARCHAR2(50) not null,
  fileaddress      VARCHAR2(255) not null,
  edit_reason      VARCHAR2(255) not null,
  client_type      VARCHAR2(255) not null,
  audit_opinion    VARCHAR2(255),
  application_time VARCHAR2(30),
  check_time       VARCHAR2(30)
)
;
comment on column CIFM_MATERIAL_CHANGE.id
  is '��ѯ���';
comment on column CIFM_MATERIAL_CHANGE.check_sys_id
  is '�����ϵͳID';
comment on column CIFM_MATERIAL_CHANGE.user_sys_id
  is '�û�ϵͳID';
comment on column CIFM_MATERIAL_CHANGE.status
  is '״̬(00:�����01:ͬ��02:��ͬ��)';
comment on column CIFM_MATERIAL_CHANGE.client_name
  is '����';
comment on column CIFM_MATERIAL_CHANGE.credentials_type
  is '֤������';
comment on column CIFM_MATERIAL_CHANGE.credentials_no
  is '֤������';
comment on column CIFM_MATERIAL_CHANGE.fileaddress
  is '�ļ��еĵ�ַ';
comment on column CIFM_MATERIAL_CHANGE.edit_reason
  is '���ԭ��';
comment on column CIFM_MATERIAL_CHANGE.client_type
  is '�ͻ�����';
comment on column CIFM_MATERIAL_CHANGE.audit_opinion
  is '������';

