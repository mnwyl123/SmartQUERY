create table PER_LOAN_DETAIL_UNCOMMON
(
  report_id        VARCHAR2(30) not null,
  serial           VARCHAR2(10),
  loan_org_code    VARCHAR2(50),
  report_file_name VARCHAR2(100),
  update_time      VARCHAR2(20)
)
;
comment on table PER_LOAN_DETAIL_UNCOMMON
  is '异议版报告贷款';
comment on column PER_LOAN_DETAIL_UNCOMMON.report_id
  is '报告编号';
comment on column PER_LOAN_DETAIL_UNCOMMON.serial
  is '编号';
comment on column PER_LOAN_DETAIL_UNCOMMON.loan_org_code
  is '贷款机构代码';
comment on column PER_LOAN_DETAIL_UNCOMMON.report_file_name
  is '报文文件名称';
comment on column PER_LOAN_DETAIL_UNCOMMON.update_time
  is '信息更新日期';

