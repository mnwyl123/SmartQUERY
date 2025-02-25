create table PER_CRED_BASE_INFO
(
  report_id      VARCHAR2(30) not null,
  buss_org_code  VARCHAR2(100),
  cred_quota_use VARCHAR2(100),
  cred_quota     VARCHAR2(100),
  cred_status    VARCHAR2(100),
  cred_limit     VARCHAR2(100),
  label_cnt      VARCHAR2(100),
  buss_org_type  VARCHAR2(100),
  expi_date      VARCHAR2(100),
  cred_limit_num VARCHAR2(100),
  cred_sign      VARCHAR2(100),
  currency       VARCHAR2(100),
  effe_date      VARCHAR2(100),
  used_quota     VARCHAR2(100),
  cred_num       VARCHAR2(100),
  serial         VARCHAR2(100)
)
;
comment on table PER_CRED_BASE_INFO
  is '����Э�������Ϣ��';
comment on column PER_CRED_BASE_INFO.report_id
  is '������';
comment on column PER_CRED_BASE_INFO.buss_org_code
  is 'ҵ��������';
comment on column PER_CRED_BASE_INFO.cred_quota_use
  is '���Ŷ����;';
comment on column PER_CRED_BASE_INFO.cred_quota
  is '���Ŷ��';
comment on column PER_CRED_BASE_INFO.cred_status
  is '����Э��״̬';
comment on column PER_CRED_BASE_INFO.cred_limit
  is '�����޶�';
comment on column PER_CRED_BASE_INFO.label_cnt
  is '��ע����������';
comment on column PER_CRED_BASE_INFO.buss_org_type
  is 'ҵ������������';
comment on column PER_CRED_BASE_INFO.expi_date
  is '��������';
comment on column PER_CRED_BASE_INFO.cred_limit_num
  is '�����޶���';
comment on column PER_CRED_BASE_INFO.cred_sign
  is '����Э���ʶ';
comment on column PER_CRED_BASE_INFO.currency
  is '����';
comment on column PER_CRED_BASE_INFO.effe_date
  is '��Ч����';
comment on column PER_CRED_BASE_INFO.used_quota
  is '���ö��';
comment on column PER_CRED_BASE_INFO.cred_num
  is '����Э����';

