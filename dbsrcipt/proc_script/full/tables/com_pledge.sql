create table COM_PLEDGE
(
  report_id      VARCHAR2(30) not null,
  serial_no      VARCHAR2(64),
  pledge_type    VARCHAR2(5),
  pledge_owner   VARCHAR2(200),
  pledge_species VARCHAR2(200),
  currency       VARCHAR2(15),
  assess_sum     VARCHAR2(15),
  assess_date    VARCHAR2(20),
  guar_sum       VARCHAR2(15)
)
;
comment on table COM_PLEDGE
  is '��/��Ѻ��';
comment on column COM_PLEDGE.report_id
  is '������';
comment on column COM_PLEDGE.serial_no
  is '��ˮ��';
comment on column COM_PLEDGE.pledge_type
  is '����Ѻ������(01����Ѻ,02����Ѻ)';
comment on column COM_PLEDGE.pledge_owner
  is '��Ѻ��������';
comment on column COM_PLEDGE.pledge_species
  is '��Ѻ������';
comment on column COM_PLEDGE.currency
  is '����';
comment on column COM_PLEDGE.assess_sum
  is '��ֵ���';
comment on column COM_PLEDGE.assess_date
  is '��������';
comment on column COM_PLEDGE.guar_sum
  is '�������';

