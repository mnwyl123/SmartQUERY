create table WEB_CRAWLER_INFO
(
  urlaction_name VARCHAR2(100),
  code           VARCHAR2(100),
  value          VARCHAR2(2000),
  code_chn       VARCHAR2(100)
)
;
comment on table WEB_CRAWLER_INFO
  is '������ҳ����ҳ�������Ϣ��';
comment on column WEB_CRAWLER_INFO.urlaction_name
  is 'url�е�action����';
comment on column WEB_CRAWLER_INFO.code
  is '������';
comment on column WEB_CRAWLER_INFO.value
  is '����ֵ';
comment on column WEB_CRAWLER_INFO.code_chn
  is '����������';

