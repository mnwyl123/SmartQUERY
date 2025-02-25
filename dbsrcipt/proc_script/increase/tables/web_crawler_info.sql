create table WEB_CRAWLER_INFO
(
  urlaction_name VARCHAR2(100),
  code           VARCHAR2(100),
  value          VARCHAR2(2000),
  code_chn       VARCHAR2(100)
)
;
comment on table WEB_CRAWLER_INFO
  is '人行网页爬虫页面参数信息表';
comment on column WEB_CRAWLER_INFO.urlaction_name
  is 'url中的action名字';
comment on column WEB_CRAWLER_INFO.code
  is '参数名';
comment on column WEB_CRAWLER_INFO.value
  is '参数值';
comment on column WEB_CRAWLER_INFO.code_chn
  is '参数中文名';

