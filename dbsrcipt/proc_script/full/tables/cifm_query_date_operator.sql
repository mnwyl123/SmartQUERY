create table CIFM_QUERY_DATE_OPERATOR
(
  para_type VARCHAR2(20) not null,
  limt_date VARCHAR2(50),
  company   VARCHAR2(10),
  org_id    VARCHAR2(100)
)
;
comment on table CIFM_QUERY_DATE_OPERATOR
  is '查询时限设置表';
comment on column CIFM_QUERY_DATE_OPERATOR.para_type
  is '参数类型(1个人，2企业)';
comment on column CIFM_QUERY_DATE_OPERATOR.limt_date
  is '时间(单位：天)';
comment on column CIFM_QUERY_DATE_OPERATOR.company
  is '法人';
comment on column CIFM_QUERY_DATE_OPERATOR.org_id
  is '机构ID';

