create table COM_GUAR_TRANS_RESPON_INFO
(
  report_id             VARCHAR2(30) not null,
  type_respon           VARCHAR2(100),
  balance_num_focus_bad VARCHAR2(100),
  amount_repay_recover  VARCHAR2(100),
  balance_num_focus     VARCHAR2(100),
  num_account           VARCHAR2(100),
  balance_num           VARCHAR2(100)
)
;
comment on table COM_GUAR_TRANS_RESPON_INFO
  is '����������ػ������λ�����Ϣ';
comment on column COM_GUAR_TRANS_RESPON_INFO.report_id
  is '������';
comment on column COM_GUAR_TRANS_RESPON_INFO.type_respon
  is '��������';
comment on column COM_GUAR_TRANS_RESPON_INFO.balance_num_focus_bad
  is '���������';
comment on column COM_GUAR_TRANS_RESPON_INFO.amount_repay_recover
  is '�������ν��';
comment on column COM_GUAR_TRANS_RESPON_INFO.balance_num_focus
  is '��ע�����';
comment on column COM_GUAR_TRANS_RESPON_INFO.num_account
  is '�˻���';
comment on column COM_GUAR_TRANS_RESPON_INFO.balance_num
  is '���';

