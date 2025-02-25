create table COM_ENFORCE_RECORD
(
  report_id    VARCHAR2(30) not null,
  court_filing VARCHAR2(200),
  filing_date  VARCHAR2(20),
  exe_case     VARCHAR2(200),
  case_num     VARCHAR2(50),
  app_exe_sub  VARCHAR2(100),
  app_exe_sum  VARCHAR2(15),
  case_status  VARCHAR2(100),
  close_style  VARCHAR2(50),
  exe_sub      VARCHAR2(100),
  exe_sum      VARCHAR2(15),
  exe_type     VARCHAR2(5)
)
;
comment on table COM_ENFORCE_RECORD
  is '执行记录';
comment on column COM_ENFORCE_RECORD.report_id
  is '报告编号';
comment on column COM_ENFORCE_RECORD.court_filing
  is '立案法院';
comment on column COM_ENFORCE_RECORD.filing_date
  is '立案日期';
comment on column COM_ENFORCE_RECORD.exe_case
  is '执行案由';
comment on column COM_ENFORCE_RECORD.case_num
  is '案号';
comment on column COM_ENFORCE_RECORD.app_exe_sub
  is '申请执行标的';
comment on column COM_ENFORCE_RECORD.app_exe_sum
  is '申请执行金额';
comment on column COM_ENFORCE_RECORD.case_status
  is '案件状态';
comment on column COM_ENFORCE_RECORD.close_style
  is '结案方式';
comment on column COM_ENFORCE_RECORD.exe_sub
  is '执行标的';
comment on column COM_ENFORCE_RECORD.exe_sum
  is '执行金额';
comment on column COM_ENFORCE_RECORD.exe_type
  is '执行类别(01:强制执行；02:行政处罚)';

