create table COM_LEND_ACCOUNT
(
  report_id              VARCHAR2(30) not null,
  smart_lend_bus         VARCHAR2(100),
  num_cred_agree         VARCHAR2(100),
  big_lend_bus           VARCHAR2(100),
  num_lend_account       VARCHAR2(100),
  other_repay_way        VARCHAR2(100),
  issue_way              VARCHAR2(100),
  date_close             VARCHAR2(100),
  type_account_lend      VARCHAR2(100),
  type_bus_mana_org      VARCHAR2(100),
  code_bus_mana_org      VARCHAR2(100),
  len_sum                VARCHAR2(100),
  date_info_report       VARCHAR2(100),
  time_lim_len           VARCHAR2(100),
  date_account_open      VARCHAR2(100),
  cred_line              VARCHAR2(100),
  due_time               VARCHAR2(100),
  jio_loan_mark          VARCHAR2(100),
  state_lend_account_act VARCHAR2(100),
  currency               VARCHAR2(100),
  guar_way               VARCHAR2(100),
  num_repay_record       VARCHAR2(100),
  num_spe_trans          VARCHAR2(100),
  serial                 VARCHAR2(100)
)
;
comment on table COM_LEND_ACCOUNT
  is '����˻���Ϣ��Ԫ';
comment on column COM_LEND_ACCOUNT.report_id
  is '������';
comment on column COM_LEND_ACCOUNT.smart_lend_bus
  is '���ҵ������ϸ��';
comment on column COM_LEND_ACCOUNT.num_cred_agree
  is '����Э����';
comment on column COM_LEND_ACCOUNT.big_lend_bus
  is '���ҵ���������';
comment on column COM_LEND_ACCOUNT.num_lend_account
  is '����˻����';
comment on column COM_LEND_ACCOUNT.other_repay_way
  is '�������֤��ʽ';
comment on column COM_LEND_ACCOUNT.issue_way
  is '������ʽ';
comment on column COM_LEND_ACCOUNT.date_close
  is '�ر�����';
comment on column COM_LEND_ACCOUNT.type_account_lend
  is '����˻�����';
comment on column COM_LEND_ACCOUNT.type_bus_mana_org
  is 'ҵ������������';
comment on column COM_LEND_ACCOUNT.code_bus_mana_org
  is 'ҵ������������';
comment on column COM_LEND_ACCOUNT.len_sum
  is '�����';
comment on column COM_LEND_ACCOUNT.date_info_report
  is '��Ϣ��������';
comment on column COM_LEND_ACCOUNT.time_lim_len
  is '�������';
comment on column COM_LEND_ACCOUNT.date_account_open
  is '��������';
comment on column COM_LEND_ACCOUNT.cred_line
  is '���ö��';
comment on column COM_LEND_ACCOUNT.due_time
  is '��������';
comment on column COM_LEND_ACCOUNT.jio_loan_mark
  is '��ͬ����ʶ';
comment on column COM_LEND_ACCOUNT.state_lend_account_act
  is '�˻��״̬';
comment on column COM_LEND_ACCOUNT.currency
  is '����';
comment on column COM_LEND_ACCOUNT.guar_way
  is '������ʽ';
comment on column COM_LEND_ACCOUNT.num_repay_record
  is '������ּ�¼����';
comment on column COM_LEND_ACCOUNT.num_spe_trans
  is '�ض����׸���';
comment on column COM_LEND_ACCOUNT.serial
  is '���';

