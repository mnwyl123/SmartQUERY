create table ONE_DICTIONARIES
(
  d_num  VARCHAR2(5),
  code   VARCHAR2(10),
  name   VARCHAR2(100),
  d_desc VARCHAR2(300),
  note   VARCHAR2(200)
)
;
comment on table ONE_DICTIONARIES
  is 'һ����ǩ�ֵ��';
comment on column ONE_DICTIONARIES.d_num
  is '���';
comment on column ONE_DICTIONARIES.code
  is '����';
comment on column ONE_DICTIONARIES.name
  is '����';
comment on column ONE_DICTIONARIES.d_desc
  is '�ֵ�����';
comment on column ONE_DICTIONARIES.note
  is '��ע';

