create table XML_DICTIONARIES
(
  d_num            VARCHAR2(5),
  code             VARCHAR2(10),
  name             VARCHAR2(100),
  d_desc           VARCHAR2(300),
  xml_tag          VARCHAR2(8),
  xml_tag_sign_val VARCHAR2(50),
  note             VARCHAR2(200)
)
;
comment on table XML_DICTIONARIES
  is '��ǩ�ֵ��';
comment on column XML_DICTIONARIES.d_num
  is '���';
comment on column XML_DICTIONARIES.code
  is '����';
comment on column XML_DICTIONARIES.name
  is '����';
comment on column XML_DICTIONARIES.d_desc
  is '�ֵ�����';
comment on column XML_DICTIONARIES.xml_tag
  is '���з��ص�XML���ĵı�ǩ����';
comment on column XML_DICTIONARIES.xml_tag_sign_val
  is '�����ǩ��ֵ���磺�˻����࣬��ͬ���˻����Ͷ�Ӧ���˻�������ֵ䲻һ�������ֶ���Ϊ�˻����͵�ֵ��';
comment on column XML_DICTIONARIES.note
  is '��ע';
create unique index UK_NUM_CODE on XML_DICTIONARIES (D_NUM, CODE);

