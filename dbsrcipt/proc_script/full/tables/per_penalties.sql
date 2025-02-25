create table PER_PENALTIES
(
  report_id              VARCHAR2(30) not null,
  serial                 VARCHAR2(10),
  penalties_comapny      VARCHAR2(100),
  penalties_contents     VARCHAR2(200),
  penalties_sum          VARCHAR2(20),
  start_date             VARCHAR2(20),
  stop_date              VARCHAR2(20),
  reconsideration_result VARCHAR2(100),
  label_cnt              VARCHAR2(100)
)
;
comment on table PER_PENALTIES
  is '����������¼��Ϣ��';
comment on column PER_PENALTIES.report_id
  is '������';
comment on column PER_PENALTIES.serial
  is '���';
comment on column PER_PENALTIES.penalties_comapny
  is '��������';
comment on column PER_PENALTIES.penalties_contents
  is '��������';
comment on column PER_PENALTIES.penalties_sum
  is '�������';
comment on column PER_PENALTIES.start_date
  is '������Ч����';
comment on column PER_PENALTIES.stop_date
  is '������ֹ����';
comment on column PER_PENALTIES.reconsideration_result
  is '����������';
comment on column PER_PENALTIES.label_cnt
  is '��ע����������';

