create table PER_REPORT_INFO
(
  report_id      VARCHAR2(30) not null,
  query_time     VARCHAR2(20),
  report_time    VARCHAR2(20),
  query_operator VARCHAR2(50),
  query_reason   VARCHAR2(50),
  check_code     VARCHAR2(64)
)
;
comment on table PER_REPORT_INFO
  is '������Ϣ��';
comment on column PER_REPORT_INFO.report_id
  is '������';
comment on column PER_REPORT_INFO.query_time
  is '��ѯʱ��';
comment on column PER_REPORT_INFO.report_time
  is '����ʱ��';
comment on column PER_REPORT_INFO.query_operator
  is '��ѯ����Ա';
comment on column PER_REPORT_INFO.query_reason
  is '��ѯԭ��';
comment on column PER_REPORT_INFO.check_code
  is 'У����';

