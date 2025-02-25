create table XML_TO_HTML_TABLE_HIS
(
  id         VARCHAR2(100),
  query_name VARCHAR2(50),
  type       VARCHAR2(10),
  query_time VARCHAR2(20)
);
comment on table XML_TO_HTML_TABLE_HIS
  is 'XML转HTML所需参数历史表';
comment on column XML_TO_HTML_TABLE_HIS.id
  is '查询编号';
comment on column XML_TO_HTML_TABLE_HIS.query_name
  is '查询员';
comment on column XML_TO_HTML_TABLE_HIS.type
  is '查询类型；1-个人，2-企业';
comment on column XML_TO_HTML_TABLE_HIS.query_time
  is '查询时间';