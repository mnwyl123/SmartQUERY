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
  is '��Ҫ��Ϣ��ʾ1';
comment on column TEST_IMPORTANT_MESSAGE.id
  is 'ID��ʶ';
comment on column TEST_IMPORTANT_MESSAGE.m_date
  is '����';
comment on column TEST_IMPORTANT_MESSAGE.status
  is '״̬';
comment on column TEST_IMPORTANT_MESSAGE.report_id
  is '������';
comment on column TEST_IMPORTANT_MESSAGE.message
  is '��Ϣ˵��';
comment on column TEST_IMPORTANT_MESSAGE.name
  is '�ļ�����';

