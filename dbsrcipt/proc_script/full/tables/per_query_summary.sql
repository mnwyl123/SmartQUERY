create table PER_QUERY_SUMMARY
(
  report_id                 VARCHAR2(30) not null,
  mon_loan_query_org_num    INTEGER,
  mon_credit_query_org_num  INTEGER,
  mon_loan_query_num        INTEGER,
  mon_credit_query_num      INTEGER,
  mon_own_query_num         INTEGER,
  year_loan_query_num       INTEGER,
  year_own_query_num        INTEGER,
  year_special_query_num    INTEGER,
  year_after_loan_query_num VARCHAR2(100),
  lr_query_org_reason       VARCHAR2(100),
  lr_query_org_code         VARCHAR2(100),
  year_assure_query_num     VARCHAR2(100),
  lr_query_time             VARCHAR2(100),
  lr_query_org_type         VARCHAR2(100)
)
;
comment on table PER_QUERY_SUMMARY
  is '查询记录概要信息段';
comment on column PER_QUERY_SUMMARY.report_id
  is '报告编号';
comment on column PER_QUERY_SUMMARY.mon_loan_query_org_num
  is '最近 1 个月内的查询机构数(贷款审批)';
comment on column PER_QUERY_SUMMARY.mon_credit_query_org_num
  is '最近 1 个月内的查询机构数(信用卡审批)';
comment on column PER_QUERY_SUMMARY.mon_loan_query_num
  is '最近 1 个月内的查询次数(贷款审批)';
comment on column PER_QUERY_SUMMARY.mon_credit_query_num
  is '最近 1 个月内的查询次数(信用卡审批)';
comment on column PER_QUERY_SUMMARY.mon_own_query_num
  is '最近 1 个月内的查询次数(本人查询)';
comment on column PER_QUERY_SUMMARY.year_loan_query_num
  is '最近两年内查询次数（贷款）';
comment on column PER_QUERY_SUMMARY.year_own_query_num
  is '最近两年内查询次数（信用卡）';
comment on column PER_QUERY_SUMMARY.year_special_query_num
  is '最近 2 年内的查询次数(特约商户实名审查)';
comment on column PER_QUERY_SUMMARY.year_after_loan_query_num
  is '最近 2 年内的查询次数(贷后管理)';
comment on column PER_QUERY_SUMMARY.lr_query_org_reason
  is '上一次查询原因';
comment on column PER_QUERY_SUMMARY.lr_query_org_code
  is '上一次查询机构代码';
comment on column PER_QUERY_SUMMARY.year_assure_query_num
  is '最近 2 年内的查询次数(担保资格审查)';
comment on column PER_QUERY_SUMMARY.lr_query_time
  is '上一次查询日期';
comment on column PER_QUERY_SUMMARY.lr_query_org_type
  is '上一次查询机构机构类型';

