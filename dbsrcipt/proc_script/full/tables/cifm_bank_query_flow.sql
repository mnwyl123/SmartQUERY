create table CIFM_BANK_QUERY_FLOW
(
  trade_no            VARCHAR2(100),
  trade_time          VARCHAR2(32),
  hq_institution_code VARCHAR2(50),
  hq_institution_name VARCHAR2(100),
  branch_code         VARCHAR2(50),
  branch_name         VARCHAR2(50),
  branch_location     VARCHAR2(100),
  user_name           VARCHAR2(30),
  report_type         VARCHAR2(50),
  consumption_num     VARCHAR2(20),
  product_des1        VARCHAR2(150),
  product_des2        VARCHAR2(100),
  product_des3        VARCHAR2(200),
  product_des4        VARCHAR2(100),
  fri_org_name        VARCHAR2(30),
  sec_org_name        VARCHAR2(30),
  thr_org_name        VARCHAR2(30),
  four_org_name       VARCHAR2(30),
  fiv_org_name        VARCHAR2(30),
  six_org_name        VARCHAR2(30),
  company             VARCHAR2(10)
)
;
comment on table CIFM_BANK_QUERY_FLOW
  is '人行查询流水表';
comment on column CIFM_BANK_QUERY_FLOW.trade_no
  is '交易号';
comment on column CIFM_BANK_QUERY_FLOW.trade_time
  is '交易时间';
comment on column CIFM_BANK_QUERY_FLOW.hq_institution_code
  is '总部机构代码';
comment on column CIFM_BANK_QUERY_FLOW.hq_institution_name
  is '总部机构名称';
comment on column CIFM_BANK_QUERY_FLOW.branch_code
  is '分支机构代码';
comment on column CIFM_BANK_QUERY_FLOW.branch_name
  is '分支机构名称';
comment on column CIFM_BANK_QUERY_FLOW.branch_location
  is '分支机构所在地';
comment on column CIFM_BANK_QUERY_FLOW.user_name
  is '操作用户名';
comment on column CIFM_BANK_QUERY_FLOW.report_type
  is '产品名称（客户类型）';
comment on column CIFM_BANK_QUERY_FLOW.consumption_num
  is '消费件数';
comment on column CIFM_BANK_QUERY_FLOW.product_des1
  is '产品说明1';
comment on column CIFM_BANK_QUERY_FLOW.product_des2
  is '产品说明2';
comment on column CIFM_BANK_QUERY_FLOW.product_des3
  is '产品说明3';
comment on column CIFM_BANK_QUERY_FLOW.product_des4
  is '产品说明4';
comment on column CIFM_BANK_QUERY_FLOW.fri_org_name
  is '一级机构名称';
comment on column CIFM_BANK_QUERY_FLOW.sec_org_name
  is '二级机构名称';
comment on column CIFM_BANK_QUERY_FLOW.thr_org_name
  is '三级机构名称';
comment on column CIFM_BANK_QUERY_FLOW.four_org_name
  is '四级机构名称';
comment on column CIFM_BANK_QUERY_FLOW.fiv_org_name
  is '五级机构名称';
comment on column CIFM_BANK_QUERY_FLOW.six_org_name
  is '六级机构名称';

