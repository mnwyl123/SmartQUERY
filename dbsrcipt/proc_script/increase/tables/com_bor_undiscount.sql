create table COM_BOR_UNDISCOUNT
(
  report_id        VARCHAR2(30) not null,
  num_guar_contra  VARCHAR2(100),
  cred_id          VARCHAR2(100),
  code_org         VARCHAR2(100),
  five_cla         VARCHAR2(100),
  stat_repay       VARCHAR2(100),
  type_business    VARCHAR2(100),
  len_sum          VARCHAR2(100),
  smart_bus        VARCHAR2(100),
  line_credit      VARCHAR2(100),
  type_bor         VARCHAR2(100),
  currency         VARCHAR2(100),
  over_sum         VARCHAR2(100),
  type_repay_pes   VARCHAR2(100),
  type_org         VARCHAR2(100),
  over_month       VARCHAR2(100),
  num_month_remain VARCHAR2(100),
  type_acc         VARCHAR2(100),
  currency_repay   VARCHAR2(100),
  due_time_date    VARCHAR2(100),
  over_principal   VARCHAR2(100),
  date_info_report VARCHAR2(100),
  repay_resp_bala  VARCHAR2(100),
  date_open        VARCHAR2(100),
  balance_num      VARCHAR2(100)
);
comment on table COM_BOR_UNDISCOUNT
  is '��ػ������ν���˻����������֣���Ϣ��Ԫ';
comment on column COM_BOR_UNDISCOUNT.report_id
  is '������';
comment on column COM_BOR_UNDISCOUNT.num_guar_contra
  is '��֤��ͬ���';
comment on column COM_BOR_UNDISCOUNT.cred_id
  is '�˻����';
comment on column COM_BOR_UNDISCOUNT.code_org
  is 'ҵ������������';
comment on column COM_BOR_UNDISCOUNT.five_cla
  is '�弶����';
comment on column COM_BOR_UNDISCOUNT.stat_repay
  is '����״̬';
comment on column COM_BOR_UNDISCOUNT.type_business
  is 'ҵ������';
comment on column COM_BOR_UNDISCOUNT.len_sum
  is '�����';
comment on column COM_BOR_UNDISCOUNT.smart_bus
  is 'ҵ������ϸ��';
comment on column COM_BOR_UNDISCOUNT.line_credit
  is '���ö��';
comment on column COM_BOR_UNDISCOUNT.type_bor
  is '�������������';
comment on column COM_BOR_UNDISCOUNT.currency
  is '����';
comment on column COM_BOR_UNDISCOUNT.over_sum
  is '�����ܶ�';
comment on column COM_BOR_UNDISCOUNT.type_repay_pes
  is '��ػ�������������';
comment on column COM_BOR_UNDISCOUNT.type_org
  is 'ҵ������������';
comment on column COM_BOR_UNDISCOUNT.over_month
  is '��������';
comment on column COM_BOR_UNDISCOUNT.num_month_remain
  is 'ʣ�໹������';
comment on column COM_BOR_UNDISCOUNT.type_acc
  is '�˻�����';
comment on column COM_BOR_UNDISCOUNT.currency_repay
  is '���֣���ػ������ν�';
comment on column COM_BOR_UNDISCOUNT.due_time_date
  is '��������';
comment on column COM_BOR_UNDISCOUNT.over_principal
  is '���ڱ���';
comment on column COM_BOR_UNDISCOUNT.date_info_report
  is '��Ϣ��������';
comment on column COM_BOR_UNDISCOUNT.repay_resp_bala
  is '��ػ������ν��';
comment on column COM_BOR_UNDISCOUNT.date_open
  is '��������';
comment on column COM_BOR_UNDISCOUNT.balance_num
  is '���';

