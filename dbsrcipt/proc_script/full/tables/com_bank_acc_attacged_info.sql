create table COM_BANK_ACC_ATTACGED_INFO
(
  report_id      VARCHAR2(30) not null,
  serial_no      VARCHAR2(64),
  credit_org     VARCHAR2(50),
  bank_acc_num   VARCHAR2(20),
  th_balance     VARCHAR2(15),
  six_balance    VARCHAR2(15),
  ni_balance     VARCHAR2(15),
  mor_ni_balance VARCHAR2(15),
  remarks        VARCHAR2(200),
  total          VARCHAR2(20),
  his_record     VARCHAR2(100)
)
;
comment on table COM_BANK_ACC_ATTACGED_INFO
  is '���и�����Ϣ';
comment on column COM_BANK_ACC_ATTACGED_INFO.report_id
  is '������';
comment on column COM_BANK_ACC_ATTACGED_INFO.serial_no
  is '��ˮ��';
comment on column COM_BANK_ACC_ATTACGED_INFO.credit_org
  is '���Ż���';
comment on column COM_BANK_ACC_ATTACGED_INFO.bank_acc_num
  is '����';
comment on column COM_BANK_ACC_ATTACGED_INFO.th_balance
  is '30�����';
comment on column COM_BANK_ACC_ATTACGED_INFO.six_balance
  is '60�����';
comment on column COM_BANK_ACC_ATTACGED_INFO.ni_balance
  is '90�����';
comment on column COM_BANK_ACC_ATTACGED_INFO.mor_ni_balance
  is '90+�����';
comment on column COM_BANK_ACC_ATTACGED_INFO.remarks
  is '��ע';
comment on column COM_BANK_ACC_ATTACGED_INFO.total
  is '�ܺ�';
comment on column COM_BANK_ACC_ATTACGED_INFO.his_record
  is '��ʷ��¼';

