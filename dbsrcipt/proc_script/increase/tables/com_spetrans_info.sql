create table COM_SPETRANS_INFO
(
  report_id             VARCHAR2(30) not null,
  trans_info            VARCHAR2(200),
  serial                VARCHAR2(100),
  date_trans            VARCHAR2(100),
  trans_sum             VARCHAR2(100),
  month_change_due_time VARCHAR2(100),
  type_trans            VARCHAR2(100)
)
;
comment on table COM_SPETRANS_INFO
  is '�ض�������Ϣ';
comment on column COM_SPETRANS_INFO.report_id
  is '������';
comment on column COM_SPETRANS_INFO.trans_info
  is '������ϸ��Ϣ';
comment on column COM_SPETRANS_INFO.serial
  is '���';
comment on column COM_SPETRANS_INFO.date_trans
  is '��������';
comment on column COM_SPETRANS_INFO.trans_sum
  is '���׽��';
comment on column COM_SPETRANS_INFO.month_change_due_time
  is '�������ڱ������';
comment on column COM_SPETRANS_INFO.type_trans
  is '��������';

