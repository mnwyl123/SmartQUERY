create table COM_REPAY_GUAR
(
  report_id       VARCHAR2(30) not null,
  guar_accout_id  VARCHAR2(100),
  five_cla        VARCHAR2(100),
  num_account     VARCHAR2(100),
  repay_resp_type VARCHAR2(100),
  balance_num     VARCHAR2(100),
  repay_resp_bala VARCHAR2(100),
  guar_sum        VARCHAR2(100),
  smart_bus       VARCHAR2(100),
  type_org        VARCHAR2(100),
  code_org        VARCHAR2(100),
  num_guar_contra VARCHAR2(100)
)
;
comment on table COM_REPAY_GUAR
  is '��ػ������ε����˻��ֻ���������Ϣ��Ԫ';
comment on column COM_REPAY_GUAR.report_id
  is '������';
comment on column COM_REPAY_GUAR.guar_accout_id
  is '�����˻��ֻ���������Ϣ���';
comment on column COM_REPAY_GUAR.five_cla
  is '�弶����';
comment on column COM_REPAY_GUAR.num_account
  is '�˻���';
comment on column COM_REPAY_GUAR.repay_resp_type
  is '��ػ�����������';
comment on column COM_REPAY_GUAR.balance_num
  is '���';
comment on column COM_REPAY_GUAR.repay_resp_bala
  is '��ػ������ν��';
comment on column COM_REPAY_GUAR.guar_sum
  is '�������';
comment on column COM_REPAY_GUAR.smart_bus
  is 'ҵ������ϸ��';
comment on column COM_REPAY_GUAR.type_org
  is 'ҵ������������';
comment on column COM_REPAY_GUAR.code_org
  is 'ҵ������������';
comment on column COM_REPAY_GUAR.num_guar_contra
  is '��֤��ͬ���';

