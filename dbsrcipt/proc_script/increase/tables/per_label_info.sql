create table PER_LABEL_INFO
(
  report_id  VARCHAR2(30) not null,
  l_content  VARCHAR2(200),
  add_date   VARCHAR2(100),
  per_type   VARCHAR2(100),
  l_type     VARCHAR2(200),
  serial     VARCHAR2(100),
  l_content2 VARCHAR2(100),
  per_type2  VARCHAR2(100)
)
;
comment on table PER_LABEL_INFO
  is '标注及声明信息(整体)';
comment on column PER_LABEL_INFO.report_id
  is '报告编号';
comment on column PER_LABEL_INFO.l_content
  is '标注或声明内容';
comment on column PER_LABEL_INFO.add_date
  is '添加日期';
comment on column PER_LABEL_INFO.per_type
  is '标注类型（1-整体 2-借贷账户 3-授信协议 4-相关还款责任 5-后付费业务 6-欠税记录 7-民事判决 8-强制执行 9-行政处罚 10-住房公积金 11-低保 12-执业资格 13-行政奖励）';
comment on column PER_LABEL_INFO.l_type
  is '标注及声明类型';
comment on column PER_LABEL_INFO.serial
  is '编号';

