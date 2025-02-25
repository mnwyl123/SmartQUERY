create table COM_EXTER_GUAR
(
  report_id       VARCHAR2(30) not null,
  serial_no       VARCHAR2(64),
  main_buss_type  VARCHAR2(10),
  currency        VARCHAR2(20),
  guar_sum        VARCHAR2(20),
  guar_balance    VARCHAR2(20),
  start_date      VARCHAR2(20),
  end_date        VARCHAR2(20),
  minor_buss_type VARCHAR2(100),
  five_type       VARCHAR2(20),
  contract_valid  VARCHAR2(15),
  main_buss_type2 VARCHAR2(10)
)
;
comment on table COM_EXTER_GUAR
  is '对外担保';
comment on column COM_EXTER_GUAR.report_id
  is '报告编号';
comment on column COM_EXTER_GUAR.serial_no
  is '流水号';
comment on column COM_EXTER_GUAR.main_buss_type
  is '主业务类型(01：贷款,02：类贷款,03：贸易融资,04：保理,05：票据贴现,06：银承,07：信用证,08：包含)';
comment on column COM_EXTER_GUAR.currency
  is '币种';
comment on column COM_EXTER_GUAR.guar_sum
  is '金额';
comment on column COM_EXTER_GUAR.guar_balance
  is '余额';
comment on column COM_EXTER_GUAR.start_date
  is '开始日期';
comment on column COM_EXTER_GUAR.end_date
  is '结束日期';
comment on column COM_EXTER_GUAR.minor_buss_type
  is '次级业务类型';
comment on column COM_EXTER_GUAR.five_type
  is '五级分类';
comment on column COM_EXTER_GUAR.contract_valid
  is '合同是否有效';

