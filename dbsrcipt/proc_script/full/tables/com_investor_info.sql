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
  is '出资人信息';
comment on column COM_INVESTOR_INFO.report_id
  is '报告编号';
comment on column COM_INVESTOR_INFO.inve_name
  is '出资方名称';
comment on column COM_INVESTOR_INFO.inve_cred_type
  is '出资证件类型';
comment on column COM_INVESTOR_INFO.inve_cred_num
  is '出资证件号码';
comment on column COM_INVESTOR_INFO.inve_percent
  is '出资比例';
comment on column COM_INVESTOR_INFO.type_invest
  is '出资人类型';
comment on column COM_INVESTOR_INFO.type_invest_ident
  is '出资人身份类别';
comment on column COM_INVESTOR_INFO.inve_cred_type2
  is '出资证件类型2';

