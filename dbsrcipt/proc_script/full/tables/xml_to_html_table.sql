create table XML_TO_HTML_TABLE
(
  id         VARCHAR2(100),
  query_name VARCHAR2(50),
  type       VARCHAR2(10),
  query_time VARCHAR2(20)
)
;
comment on table XML_TO_HTML_TABLE
  is 'XMLתHTML���������';
comment on column XML_TO_HTML_TABLE.id
  is '��ѯ���';
comment on column XML_TO_HTML_TABLE.query_name
  is '��ѯԱ';
comment on column XML_TO_HTML_TABLE.type
  is '��ѯ���ͣ�1-���ˣ�2-��ҵ';
comment on column XML_TO_HTML_TABLE.query_time
  is '��ѯʱ��';
alter table XML_TO_HTML_TABLE
  add constraint UK_ID unique (ID);

