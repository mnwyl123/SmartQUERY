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
  is '标签字典表';
comment on column XML_DICTIONARIES.d_num
  is '编号';
comment on column XML_DICTIONARIES.code
  is '编码';
comment on column XML_DICTIONARIES.name
  is '名称';
comment on column XML_DICTIONARIES.d_desc
  is '字典描述';
comment on column XML_DICTIONARIES.xml_tag
  is '人行返回的XML报文的标签名称';
comment on column XML_DICTIONARIES.xml_tag_sign_val
  is '分类标签的值（如：账户分类，不同的账户类型对应的账户分类的字典不一样，此字段则为账户类型的值）';
comment on column XML_DICTIONARIES.note
  is '备注';
create unique index UK_NUM_CODE on XML_DICTIONARIES (D_NUM, CODE);

