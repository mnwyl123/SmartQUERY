create table COM_INNER_BUSS_NOR_HIS_RECORD
(
  report_id           VARCHAR2(30) not null,
  serial_no           VARCHAR2(64),
  buss_occur_date     VARCHAR2(20),
  balance_change_date VARCHAR2(20),
  balance             VARCHAR2(15),
  five_type           VARCHAR2(15)
)
;
comment on table COM_INNER_BUSS_NOR_HIS_RECORD
  is '����ҵ����������ʷ��¼';
comment on column COM_INNER_BUSS_NOR_HIS_RECORD.report_id
  is '������';
comment on column COM_INNER_BUSS_NOR_HIS_RECORD.serial_no
  is '��ˮ��';
comment on column COM_INNER_BUSS_NOR_HIS_RECORD.buss_occur_date
  is 'ҵ��������';
comment on column COM_INNER_BUSS_NOR_HIS_RECORD.balance_change_date
  is '���ı�����';
comment on column COM_INNER_BUSS_NOR_HIS_RECORD.balance
  is '���';
comment on column COM_INNER_BUSS_NOR_HIS_RECORD.five_type
  is '�弶����';

