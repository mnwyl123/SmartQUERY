create table COM_REPORT_INFO
(
  report_id         VARCHAR2(30) not null,
  org_code          VARCHAR2(200),
  china_credit_code VARCHAR2(200),
  report_date       VARCHAR2(150),
  query_reason      VARCHAR2(150),
  query_operator    VARCHAR2(200),
  report_time       VARCHAR2(100),
  sum_ent_ident     VARCHAR2(100),
  rate_exchange     VARCHAR2(100),
  effe_date_rate    VARCHAR2(100),
  ent_name          VARCHAR2(150),
  obj_lab_item      VARCHAR2(100)
)
;
comment on table COM_REPORT_INFO
  is '报告头信息单元';
comment on column COM_REPORT_INFO.report_id
  is '报告编号';
comment on column COM_REPORT_INFO.org_code
  is '机构信用代码（查询机构代码）';
comment on column COM_REPORT_INFO.china_credit_code
  is '中征码';
comment on column COM_REPORT_INFO.report_date
  is '报告日期';
comment on column COM_REPORT_INFO.query_reason
  is '查询原因';
comment on column COM_REPORT_INFO.query_operator
  is '查询操作员';
comment on column COM_REPORT_INFO.report_time
  is '报告生成时间';
comment on column COM_REPORT_INFO.sum_ent_ident
  is '企业身份标识个数';
comment on column COM_REPORT_INFO.rate_exchange
  is '美元折人民币汇率';
comment on column COM_REPORT_INFO.effe_date_rate
  is '汇率有效日期';
comment on column COM_REPORT_INFO.ent_name
  is '企业名称';
comment on column COM_REPORT_INFO.obj_lab_item
  is '异议标注数目';

