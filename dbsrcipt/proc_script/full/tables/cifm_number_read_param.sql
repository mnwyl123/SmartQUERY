create table CIFM_NUMBER_READ_PARAM
(
  request_user_name VARCHAR2(50),
  request_user_code VARCHAR2(50),
  company           VARCHAR2(10),
  param             VARCHAR2(50)
)
;
comment on table CIFM_NUMBER_READ_PARAM
  is '���ֽ���ϱ�Ա������';
comment on column CIFM_NUMBER_READ_PARAM.request_user_name
  is '�ϱ�Ա����';
comment on column CIFM_NUMBER_READ_PARAM.request_user_code
  is '�ϱ�Ա�����û�����';
comment on column CIFM_NUMBER_READ_PARAM.company
  is '��������';

