create table COM_PENALTIES
(
  report_id              VARCHAR2(30) not null,
  reconsideration_result VARCHAR2(200),
  penalties_comapny      VARCHAR2(100),
  penalties_id           VARCHAR2(100),
  serial                 VARCHAR2(100),
  penalties_sum          VARCHAR2(100),
  start_date             VARCHAR2(100),
  penalties_sitation     VARCHAR2(500),
  ilehal_behavior        VARCHAR2(500),
  penalties_decidion     VARCHAR2(500)
)
;
comment on table COM_PENALTIES
  is '����������¼��Ϣ��Ԫ';
comment on column COM_PENALTIES.report_id
  is '������';
comment on column COM_PENALTIES.reconsideration_result
  is '����������';
comment on column COM_PENALTIES.penalties_comapny
  is '������������';
comment on column COM_PENALTIES.penalties_id
  is '�����������ĺ�';
comment on column COM_PENALTIES.serial
  is '����������¼���';
comment on column COM_PENALTIES.penalties_sum
  is '�������';
comment on column COM_PENALTIES.start_date
  is '��������';
comment on column COM_PENALTIES.penalties_sitation
  is '����ִ�����';
comment on column COM_PENALTIES.ilehal_behavior
  is 'Υ����Ϊ';
comment on column COM_PENALTIES.penalties_decidion
  is '��������';

