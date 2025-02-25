create table TEST_IMPORTANT_MESSAGE
(
  id        VARCHAR2(32) not null,
  m_date    VARCHAR2(20),
  status    VARCHAR2(5),
  report_id VARCHAR2(50),
  message   VARCHAR2(1000),
  name      VARCHAR2(50)
)
;
comment on table TEST_IMPORTANT_MESSAGE
  is '重要信息提示1';
comment on column TEST_IMPORTANT_MESSAGE.id
  is 'ID标识';
comment on column TEST_IMPORTANT_MESSAGE.m_date
  is '日期';
comment on column TEST_IMPORTANT_MESSAGE.status
  is '状态';
comment on column TEST_IMPORTANT_MESSAGE.report_id
  is '报告编号';
comment on column TEST_IMPORTANT_MESSAGE.message
  is '信息说明';
comment on column TEST_IMPORTANT_MESSAGE.name
  is '文件名称';

