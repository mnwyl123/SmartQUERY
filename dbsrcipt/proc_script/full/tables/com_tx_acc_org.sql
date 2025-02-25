create table COM_TX_ACC_ORG
(
  report_id            VARCHAR2(30) not null,
  type_org             VARCHAR2(100),
  num_acc_settle_sum   VARCHAR2(100),
  code_org             VARCHAR2(100),
  num_acc_settle       VARCHAR2(100),
  type_business        VARCHAR2(100),
  five_type            VARCHAR2(100),
  num_org_info         VARCHAR2(100),
  num_outstand_account VARCHAR2(100),
  over_principal_sum   VARCHAR2(100),
  balance_num_sum      VARCHAR2(100),
  over_sum             VARCHAR2(100)
)
;
comment on table COM_TX_ACC_ORG
  is '贴现账户分机构汇总信息单元';
comment on column COM_TX_ACC_ORG.report_id
  is '报告编号';
comment on column COM_TX_ACC_ORG.type_org
  is '业务管理机构类型';
comment on column COM_TX_ACC_ORG.num_acc_settle_sum
  is '已结清账户贴现金额合计';
comment on column COM_TX_ACC_ORG.code_org
  is '业务管理机构代码';
comment on column COM_TX_ACC_ORG.num_acc_settle
  is '已结清账户数';
comment on column COM_TX_ACC_ORG.type_business
  is '业务种类';
comment on column COM_TX_ACC_ORG.five_type
  is '五级分类';
comment on column COM_TX_ACC_ORG.num_org_info
  is '贴现账户分机构汇总信息编号';
comment on column COM_TX_ACC_ORG.num_outstand_account
  is '未结清账户数';
comment on column COM_TX_ACC_ORG.over_principal_sum
  is '逾期本金合计';
comment on column COM_TX_ACC_ORG.balance_num_sum
  is '余额合计';
comment on column COM_TX_ACC_ORG.over_sum
  is '逾期总额合计';

