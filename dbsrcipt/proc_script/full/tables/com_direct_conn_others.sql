create table COM_DIRECT_CONN_OTHERS
(
  report_id         VARCHAR2(30) not null,
  com_name          VARCHAR2(300),
  china_credit_code VARCHAR2(200),
  realtion          VARCHAR2(200)
)
;
comment on table COM_DIRECT_CONN_OTHERS
  is '有直接关联关系的其他企业';
comment on column COM_DIRECT_CONN_OTHERS.report_id
  is '报告编号';
comment on column COM_DIRECT_CONN_OTHERS.com_name
  is '企业名称';
comment on column COM_DIRECT_CONN_OTHERS.china_credit_code
  is '中征码';
comment on column COM_DIRECT_CONN_OTHERS.realtion
  is '关系';

