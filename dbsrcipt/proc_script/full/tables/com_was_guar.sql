create table COM_WAS_GUAR
(
  report_id  VARCHAR2(30) not null,
  serial_no  VARCHAR2(64),
  guarantor  VARCHAR2(200),
  guar_date  VARCHAR2(20),
  currency   VARCHAR2(15),
  guar_sum   VARCHAR2(15),
  guar_style VARCHAR2(100),
  currency2  VARCHAR2(15)
)
;
comment on table COM_WAS_GUAR
  is '������';
comment on column COM_WAS_GUAR.report_id
  is '������';
comment on column COM_WAS_GUAR.serial_no
  is '��ˮ��';
comment on column COM_WAS_GUAR.guarantor
  is '������';
comment on column COM_WAS_GUAR.guar_date
  is '��������';
comment on column COM_WAS_GUAR.currency
  is '����';
comment on column COM_WAS_GUAR.guar_sum
  is '�������';
comment on column COM_WAS_GUAR.guar_style
  is '������ʽ';

