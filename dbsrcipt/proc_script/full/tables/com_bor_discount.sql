create table COM_BOR_DISCOUNT
(
  report_id       VARCHAR2(30) not null,
  dis_org_id      VARCHAR2(100),
  repay_resp_bala VARCHAR2(100),
  over_principal  VARCHAR2(100),
  five_cla        VARCHAR2(100),
  smart_bus       VARCHAR2(100),
  repay_resp_type VARCHAR2(100),
  type_org        VARCHAR2(100),
  balance_num     VARCHAR2(100),
  len_sum         VARCHAR2(100),
  num_guar_contra VARCHAR2(100),
  code_org        VARCHAR2(100),
  over_sum        VARCHAR2(100),
  num_account     VARCHAR2(100)
)
;
comment on table COM_BOR_DISCOUNT
  is '��ػ������������˻��ֻ���������Ϣ��Ԫ';
comment on column COM_BOR_DISCOUNT.report_id
  is '������';
comment on column COM_BOR_DISCOUNT.dis_org_id
  is '�����˻��ֻ���������Ϣ���';
comment on column COM_BOR_DISCOUNT.repay_resp_bala
  is '��ػ������ν��';
comment on column COM_BOR_DISCOUNT.over_principal
  is '���ڱ���';
comment on column COM_BOR_DISCOUNT.five_cla
  is '�弶����';
comment on column COM_BOR_DISCOUNT.smart_bus
  is 'ҵ������ϸ��';
comment on column COM_BOR_DISCOUNT.repay_resp_type
  is '��ػ�����������';
comment on column COM_BOR_DISCOUNT.type_org
  is 'ҵ������������';
comment on column COM_BOR_DISCOUNT.balance_num
  is '���';
comment on column COM_BOR_DISCOUNT.len_sum
  is '�����';
comment on column COM_BOR_DISCOUNT.num_guar_contra
  is '��֤��ͬ���';
comment on column COM_BOR_DISCOUNT.code_org
  is 'ҵ������������';
comment on column COM_BOR_DISCOUNT.over_sum
  is '�����ܶ�';
comment on column COM_BOR_DISCOUNT.num_account
  is '�˻���';

