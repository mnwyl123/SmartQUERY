create table COM_BORROM_REPAY
(
  report_id                      VARCHAR2(30) not null,
  num_other_trans_borrow         VARCHAR2(100),
  balance_num_other_trans_borrow VARCHAR2(100),
  type_respon                    VARCHAR2(100),
  amount_repay_recover           VARCHAR2(100),
  balance_num_other_bad          VARCHAR2(100),
  num_amonut_account             VARCHAR2(100),
  balance_num_recover            VARCHAR2(100),
  amount_repay_recover_others    VARCHAR2(100),
  balance_num_other_focus        VARCHAR2(100)
)
;
comment on table COM_BORROM_REPAY
  is '���������ػ������λ�����';
comment on column COM_BORROM_REPAY.report_id
  is '������';
comment on column COM_BORROM_REPAY.num_other_trans_borrow
  is '������������˻���';
comment on column COM_BORROM_REPAY.balance_num_other_trans_borrow
  is '������������˻����';
comment on column COM_BORROM_REPAY.type_respon
  is '��������';
comment on column COM_BORROM_REPAY.amount_repay_recover
  is '��׷���˻��Ļ������ν��';
comment on column COM_BORROM_REPAY.balance_num_other_bad
  is '������������˻����������';
comment on column COM_BORROM_REPAY.num_amonut_account
  is '��׷���˻���';
comment on column COM_BORROM_REPAY.balance_num_recover
  is '��׷���˻����';
comment on column COM_BORROM_REPAY.amount_repay_recover_others
  is '����������׵Ļ������ν��';
comment on column COM_BORROM_REPAY.balance_num_other_focus
  is '������������˻���ע�����';

