create table PER_REPAYER
(
  report_id           VARCHAR2(30) not null,
  buss_category       VARCHAR2(100),
  contract_num        VARCHAR2(100),
  overdraft_month_cnt VARCHAR2(100),
  borrower_category   VARCHAR2(100),
  create_date         VARCHAR2(100),
  balance             VARCHAR2(100),
  buss_org_code       VARCHAR2(100),
  five_type           VARCHAR2(100),
  info_report_date    VARCHAR2(100),
  buss_org_type       VARCHAR2(100),
  repayer_type        VARCHAR2(100),
  repay_sum           VARCHAR2(100),
  acc_type            VARCHAR2(100),
  label_cnt           VARCHAR2(100),
  currency            VARCHAR2(100),
  expi_date           VARCHAR2(100),
  repay_status        VARCHAR2(100),
  serial              VARCHAR2(100)
)
;
comment on table PER_REPAYER
  is '相关还款责任信息段';
comment on column PER_REPAYER.report_id
  is '报告编号';
comment on column PER_REPAYER.buss_category
  is '业务种类';
comment on column PER_REPAYER.contract_num
  is '保证合同编号';
comment on column PER_REPAYER.overdraft_month_cnt
  is '逾期月数';
comment on column PER_REPAYER.borrower_category
  is '主借款人身份类别';
comment on column PER_REPAYER.create_date
  is '开立日期';
comment on column PER_REPAYER.balance
  is '余额';
comment on column PER_REPAYER.buss_org_code
  is '业务管理机构';
comment on column PER_REPAYER.five_type
  is '五级分类';
comment on column PER_REPAYER.info_report_date
  is '信息报告日期';
comment on column PER_REPAYER.buss_org_type
  is '业务管理机构类型';
comment on column PER_REPAYER.repayer_type
  is '相关还款责任人类型';
comment on column PER_REPAYER.repay_sum
  is '相关还款责任金额';
comment on column PER_REPAYER.acc_type
  is '账户类型';
comment on column PER_REPAYER.label_cnt
  is '标注及声明个数';
comment on column PER_REPAYER.currency
  is '币种';
comment on column PER_REPAYER.expi_date
  is '到期日期';
comment on column PER_REPAYER.repay_status
  is '还款状态';

