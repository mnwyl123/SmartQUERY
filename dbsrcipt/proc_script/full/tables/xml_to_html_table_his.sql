create table XML_TO_HTML_TABLE_HIS
(
  id         VARCHAR2(100),
  query_name VARCHAR2(50),
  type       VARCHAR2(10),
  query_time VARCHAR2(20)
);
comment on table XML_TO_HTML_TABLE_HIS
  is 'XMLתHTML���������ʷ��';
comment on column XML_TO_HTML_TABLE_HIS.id
  is '��ѯ���';
comment on column XML_TO_HTML_TABLE_HIS.query_name
  is '��ѯԱ';
comment on column XML_TO_HTML_TABLE_HIS.type
  is '��ѯ���ͣ�1-���ˣ�2-��ҵ';
comment on column XML_TO_HTML_TABLE_HIS.query_time
  is '��ѯʱ��';