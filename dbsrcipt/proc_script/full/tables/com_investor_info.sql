create table COM_INVESTOR_INFO
(
  report_id         VARCHAR2(30) not null,
  inve_name         VARCHAR2(300),
  inve_cred_type    VARCHAR2(100),
  inve_cred_num     VARCHAR2(200),
  inve_percent      VARCHAR2(100),
  type_invest       VARCHAR2(100),
  type_invest_ident VARCHAR2(100),
  inve_cred_type2   VARCHAR2(100)
)
;
comment on table COM_INVESTOR_INFO
  is '��������Ϣ';
comment on column COM_INVESTOR_INFO.report_id
  is '������';
comment on column COM_INVESTOR_INFO.inve_name
  is '���ʷ�����';
comment on column COM_INVESTOR_INFO.inve_cred_type
  is '����֤������';
comment on column COM_INVESTOR_INFO.inve_cred_num
  is '����֤������';
comment on column COM_INVESTOR_INFO.inve_percent
  is '���ʱ���';
comment on column COM_INVESTOR_INFO.type_invest
  is '����������';
comment on column COM_INVESTOR_INFO.type_invest_ident
  is '������������';
comment on column COM_INVESTOR_INFO.inve_cred_type2
  is '����֤������2';

