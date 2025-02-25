create table COM_FINANCIAL_REPORT_FORM
(
  report_id         VARCHAR2(30) not null,
  report_type       VARCHAR2(20),
  date_range        VARCHAR2(20),
  report_year       VARCHAR2(20),
  enterprise_range  VARCHAR2(20),
  sub_no            VARCHAR2(20),
  gegin_balance     VARCHAR2(20),
  end_balance       VARCHAR2(20),
  date_range2       VARCHAR2(20),
  enterprise_range2 VARCHAR2(20),
  report_type2      VARCHAR2(20)
)
;
comment on table COM_FINANCIAL_REPORT_FORM
  is '财务报表';
comment on column COM_FINANCIAL_REPORT_FORM.report_id
  is '报告编号';
comment on column COM_FINANCIAL_REPORT_FORM.report_type
  is '报表类型(01：资产负债表,02：利润分配表,03：现金流量表)';
comment on column COM_FINANCIAL_REPORT_FORM.date_range
  is '时间范围(01：年报,02：上半年,03：下半年,04：一季度,05：二季度,06：三季度,07：四季度)';
comment on column COM_FINANCIAL_REPORT_FORM.report_year
  is '年份';
comment on column COM_FINANCIAL_REPORT_FORM.enterprise_range
  is '企业范围(01：合并,02：本部)';
comment on column COM_FINANCIAL_REPORT_FORM.sub_no
  is '科目号';
comment on column COM_FINANCIAL_REPORT_FORM.gegin_balance
  is '期初余额';
comment on column COM_FINANCIAL_REPORT_FORM.end_balance
  is '期末余额';

