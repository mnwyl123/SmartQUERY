create table WEBCRAWLER_DICT
(
  dict_name VARCHAR2(100),
  o_code    VARCHAR2(100),
  c_code    VARCHAR2(100),
  code_chn  VARCHAR2(100)
)
;
comment on table WEBCRAWLER_DICT
  is '人行网页爬虫数据字典映照表';
comment on column WEBCRAWLER_DICT.dict_name
  is '数据字典名称';
comment on column WEBCRAWLER_DICT.o_code
  is '系统字典Code';
comment on column WEBCRAWLER_DICT.c_code
  is '人行字典Code';
comment on column WEBCRAWLER_DICT.code_chn
  is '字典中文名称';

