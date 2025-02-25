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
  is '银承附加信息';
comment on column COM_BANK_ACC_ATTACGED_INFO.report_id
  is '报告编号';
comment on column COM_BANK_ACC_ATTACGED_INFO.serial_no
  is '流水号';
comment on column COM_BANK_ACC_ATTACGED_INFO.credit_org
  is '授信机构';
comment on column COM_BANK_ACC_ATTACGED_INFO.bank_acc_num
  is '笔数';
comment on column COM_BANK_ACC_ATTACGED_INFO.th_balance
  is '30天余额';
comment on column COM_BANK_ACC_ATTACGED_INFO.six_balance
  is '60天余额';
comment on column COM_BANK_ACC_ATTACGED_INFO.ni_balance
  is '90天余额';
comment on column COM_BANK_ACC_ATTACGED_INFO.mor_ni_balance
  is '90+天余额';
comment on column COM_BANK_ACC_ATTACGED_INFO.remarks
  is '备注';
comment on column COM_BANK_ACC_ATTACGED_INFO.total
  is '总和';
comment on column COM_BANK_ACC_ATTACGED_INFO.his_record
  is '历史记录';

