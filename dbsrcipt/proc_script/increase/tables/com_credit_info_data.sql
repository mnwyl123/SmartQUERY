create table COM_CREDIT_INFO_DATA
(
  report_id        VARCHAR2(30) not null,
  cr_credit_sum    VARCHAR2(100),
  cr_used_sum      VARCHAR2(100),
  cr_lim           VARCHAR2(100),
  code_org         VARCHAR2(100),
  end_date         VARCHAR2(100),
  date_info_report VARCHAR2(100),
  effec_date       VARCHAR2(100),
  type_org         VARCHAR2(100),
  currency         VARCHAR2(100),
  cred_id          VARCHAR2(100),
  quota_cyc_mark   VARCHAR2(100),
  type_cerd        VARCHAR2(100),
  cr_lim_id        VARCHAR2(100)
)
;
comment on table COM_CREDIT_INFO_DATA
  is '����Э����Ϣ��Ԫ';
comment on column COM_CREDIT_INFO_DATA.report_id
  is '������';
comment on column COM_CREDIT_INFO_DATA.cr_credit_sum
  is '���Ŷ��';
comment on column COM_CREDIT_INFO_DATA.cr_used_sum
  is '���ö��';
comment on column COM_CREDIT_INFO_DATA.cr_lim
  is '�����޶�';
comment on column COM_CREDIT_INFO_DATA.code_org
  is 'ҵ������������';
comment on column COM_CREDIT_INFO_DATA.end_date
  is '��ֹ����';
comment on column COM_CREDIT_INFO_DATA.date_info_report
  is '��Ϣ��������';
comment on column COM_CREDIT_INFO_DATA.effec_date
  is '��Ч����';
comment on column COM_CREDIT_INFO_DATA.type_org
  is 'ҵ������������';
comment on column COM_CREDIT_INFO_DATA.currency
  is '����';
comment on column COM_CREDIT_INFO_DATA.cred_id
  is '����Э����';
comment on column COM_CREDIT_INFO_DATA.quota_cyc_mark
  is '���ѭ����־';
comment on column COM_CREDIT_INFO_DATA.type_cerd
  is '���Ŷ������';
comment on column COM_CREDIT_INFO_DATA.cr_lim_id
  is '�����޶���';

