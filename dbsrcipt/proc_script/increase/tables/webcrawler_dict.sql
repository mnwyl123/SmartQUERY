create table WEBCRAWLER_DICT
(
  dict_name VARCHAR2(100),
  o_code    VARCHAR2(100),
  c_code    VARCHAR2(100),
  code_chn  VARCHAR2(100)
)
;
comment on table WEBCRAWLER_DICT
  is '������ҳ���������ֵ�ӳ�ձ�';
comment on column WEBCRAWLER_DICT.dict_name
  is '�����ֵ�����';
comment on column WEBCRAWLER_DICT.o_code
  is 'ϵͳ�ֵ�Code';
comment on column WEBCRAWLER_DICT.c_code
  is '�����ֵ�Code';
comment on column WEBCRAWLER_DICT.code_chn
  is '�ֵ���������';

