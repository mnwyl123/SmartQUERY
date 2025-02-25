create table COM_JUDGE_RECORD
(
  report_id        VARCHAR2(30) not null,
  court_filing     VARCHAR2(100),
  filing_date      VARCHAR2(20),
  litig_status     VARCHAR2(100),
  case_num         VARCHAR2(50),
  litig_pro        VARCHAR2(100),
  litig_sub        VARCHAR2(200),
  litig_sum        VARCHAR2(15),
  close_style      VARCHAR2(100),
  judge_start_date VARCHAR2(20),
  judge_result     VARCHAR2(300),
  litig_reason     VARCHAR2(50),
  serial           VARCHAR2(100),
  close_style2     VARCHAR2(100)
)
;
comment on table COM_JUDGE_RECORD
  is '民事判决记录信息单元';
comment on column COM_JUDGE_RECORD.report_id
  is '报告编号';
comment on column COM_JUDGE_RECORD.court_filing
  is '立案法院名称';
comment on column COM_JUDGE_RECORD.filing_date
  is '立案日期';
comment on column COM_JUDGE_RECORD.litig_status
  is '诉讼地位';
comment on column COM_JUDGE_RECORD.case_num
  is '案号';
comment on column COM_JUDGE_RECORD.litig_pro
  is '审判程序';
comment on column COM_JUDGE_RECORD.litig_sub
  is '诉讼标的';
comment on column COM_JUDGE_RECORD.litig_sum
  is '诉讼标的金额';
comment on column COM_JUDGE_RECORD.close_style
  is '结案方式';
comment on column COM_JUDGE_RECORD.judge_start_date
  is '判决/调解生效日期';
comment on column COM_JUDGE_RECORD.judge_result
  is '判决/调解结果';
comment on column COM_JUDGE_RECORD.litig_reason
  is '案由';
comment on column COM_JUDGE_RECORD.serial
  is '民事判决记录编号';
comment on column COM_JUDGE_RECORD.close_style2
  is '结案方式2';

