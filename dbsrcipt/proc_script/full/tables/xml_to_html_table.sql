create table XML_TO_HTML_TABLE
(
  id         VARCHAR2(100),
  query_name VARCHAR2(50),
  type       VARCHAR2(10),
  query_time VARCHAR2(20)
)
;
comment on table XML_TO_HTML_TABLE
  is 'XML转HTML所需参数表';
comment on column XML_TO_HTML_TABLE.id
  is '查询编号';
comment on column XML_TO_HTML_TABLE.query_name
  is '查询员';
comment on column XML_TO_HTML_TABLE.type
  is '查询类型；1-个人，2-企业';
comment on column XML_TO_HTML_TABLE.query_time
  is '查询时间';
alter table XML_TO_HTML_TABLE
  add constraint UK_ID unique (ID);

