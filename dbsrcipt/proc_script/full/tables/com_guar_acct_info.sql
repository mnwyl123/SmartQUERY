create table COM_GUAR_ACCT_INFO
(
  report_id                VARCHAR2(30) not null,
  num_cred_agree           VARCHAR2(100),
  date_open                VARCHAR2(100),
  due_time_date            VARCHAR2(100),
  guar_trans_species_niche VARCHAR2(100),
  type_acc_guar            VARCHAR2(100),
  type_org                 VARCHAR2(100),
  code_org                 VARCHAR2(100),
  guar_accout_id           VARCHAR2(100),
  balance_num              VARCHAR2(100),
  way_counter_guar         VARCHAR2(100),
  others_repay_ensure_way  VARCHAR2(100),
  margin_percent           VARCHAR2(100),
  currency                 VARCHAR2(100),
  date_report_info_zb      VARCHAR2(100),
  state_lend_accou_zb      VARCHAR2(100),
  balance_num_zb           VARCHAR2(100),
  five_cla_zb              VARCHAR2(100),
  exposure_to_zb           VARCHAR2(100),
  advances_zb              VARCHAR2(100),
  common_debt_indenti_zb   VARCHAR2(100),
  date_close_zb            VARCHAR2(100)
)
;
comment on table COM_GUAR_ACCT_INFO
  is '�����˻���Ϣ��Ԫ';
comment on column COM_GUAR_ACCT_INFO.report_id
  is '������';
comment on column COM_GUAR_ACCT_INFO.num_cred_agree
  is '����Э����';
comment on column COM_GUAR_ACCT_INFO.date_open
  is '��������';
comment on column COM_GUAR_ACCT_INFO.due_time_date
  is '��������';
comment on column COM_GUAR_ACCT_INFO.guar_trans_species_niche
  is '��������ҵ������ϸ��';
comment on column COM_GUAR_ACCT_INFO.type_acc_guar
  is '�����˻�����';
comment on column COM_GUAR_ACCT_INFO.type_org
  is 'ҵ������������';
comment on column COM_GUAR_ACCT_INFO.code_org
  is 'ҵ������������';
comment on column COM_GUAR_ACCT_INFO.guar_accout_id
  is '�����˻����';
comment on column COM_GUAR_ACCT_INFO.balance_num
  is '���';
comment on column COM_GUAR_ACCT_INFO.way_counter_guar
  is '��������ʽ';
comment on column COM_GUAR_ACCT_INFO.others_repay_ensure_way
  is '�������֤��ʽ';
comment on column COM_GUAR_ACCT_INFO.margin_percent
  is '��֤�����';
comment on column COM_GUAR_ACCT_INFO.currency
  is '����';
comment on column COM_GUAR_ACCT_INFO.date_report_info_zb
  is '�ڱ���Ϣ��������';
comment on column COM_GUAR_ACCT_INFO.state_lend_accou_zb
  is '�ڱ��˻��״̬';
comment on column COM_GUAR_ACCT_INFO.balance_num_zb
  is '�ڱ����';
comment on column COM_GUAR_ACCT_INFO.five_cla_zb
  is '�弶����';
comment on column COM_GUAR_ACCT_INFO.exposure_to_zb
  is '�ڱ����ճ���';
comment on column COM_GUAR_ACCT_INFO.advances_zb
  is '�ڱ�����������־';
comment on column COM_GUAR_ACCT_INFO.common_debt_indenti_zb
  is '�ڱ���ͬծ���ʶ';
comment on column COM_GUAR_ACCT_INFO.date_close_zb
  is '�ڱ��ر�����';

