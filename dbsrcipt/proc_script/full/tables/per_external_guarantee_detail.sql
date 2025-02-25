create table PER_EXTERNAL_GUARANTEE_DETAIL
(
  report_id           VARCHAR2(30) not null,
  serial              VARCHAR2(10),
  loan_grant_org      VARCHAR2(100),
  loan_contract_sum   VARCHAR2(20),
  loan_grant_date     VARCHAR2(20),
  loan_stop_date      VARCHAR2(20),
  guarantee_sum       VARCHAR2(20),
  guarantee_balance   VARCHAR2(20),
  loan_five_calss     VARCHAR2(20),
  settle_account_date VARCHAR2(20),
  loan_type           VARCHAR2(5),
  loan_type2          VARCHAR2(5),
  loan_five_calss2    VARCHAR2(20)
)
;
comment on table PER_EXTERNAL_GUARANTEE_DETAIL
  is '对外担保信息明细';
comment on column PER_EXTERNAL_GUARANTEE_DETAIL.report_id
  is '报告编号';
comment on column PER_EXTERNAL_GUARANTEE_DETAIL.serial
  is '编号';
comment on column PER_EXTERNAL_GUARANTEE_DETAIL.loan_grant_org
  is '担保贷款发放机构';
comment on column PER_EXTERNAL_GUARANTEE_DETAIL.loan_contract_sum
  is '担保贷款合同金额';
comment on column PER_EXTERNAL_GUARANTEE_DETAIL.loan_grant_date
  is '担保贷款发放日期';
comment on column PER_EXTERNAL_GUARANTEE_DETAIL.loan_stop_date
  is '担保贷款到期日期';
comment on column PER_EXTERNAL_GUARANTEE_DETAIL.guarantee_sum
  is '担保金额';
comment on column PER_EXTERNAL_GUARANTEE_DETAIL.guarantee_balance
  is '担保贷款本金余额';
comment on column PER_EXTERNAL_GUARANTEE_DETAIL.loan_five_calss
  is '担保贷款五级分类';
comment on column PER_EXTERNAL_GUARANTEE_DETAIL.settle_account_date
  is '结算日期';
comment on column PER_EXTERNAL_GUARANTEE_DETAIL.loan_type
  is '担保类型(0:贷款，1:信用卡)';

