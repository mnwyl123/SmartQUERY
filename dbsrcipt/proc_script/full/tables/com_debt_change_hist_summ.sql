create table COM_DEBT_CHANGE_HIST_SUMM
(
  report_id              VARCHAR2(30) not null,
  change_date            VARCHAR2(20),
  all_debt_balance       VARCHAR2(15),
  bad_debt_balance       VARCHAR2(15),
  month                  VARCHAR2(100),
  num_over_debt          VARCHAR2(100),
  num_over_principal     VARCHAR2(100),
  over_principal         VARCHAR2(100),
  num_focus_debt_balance VARCHAR2(100),
  all_num_debt_balance   VARCHAR2(100),
  over_sum               VARCHAR2(100),
  focus_debt_balance     VARCHAR2(100),
  num_account_bad_debt   VARCHAR2(100)
)
;
comment on table COM_DEBT_CHANGE_HIST_SUMM
  is '��ծ�仯��ʷ��Ҫ';
comment on column COM_DEBT_CHANGE_HIST_SUMM.report_id
  is '������';
comment on column COM_DEBT_CHANGE_HIST_SUMM.change_date
  is '����';
comment on column COM_DEBT_CHANGE_HIST_SUMM.all_debt_balance
  is 'ȫ����ծ���';
comment on column COM_DEBT_CHANGE_HIST_SUMM.bad_debt_balance
  is '�����ฺծ���';
comment on column COM_DEBT_CHANGE_HIST_SUMM.month
  is '�·�';
comment on column COM_DEBT_CHANGE_HIST_SUMM.num_over_debt
  is '�����˻���';
comment on column COM_DEBT_CHANGE_HIST_SUMM.num_over_principal
  is '���ڱ����˻���';
comment on column COM_DEBT_CHANGE_HIST_SUMM.over_principal
  is '���ڱ���';
comment on column COM_DEBT_CHANGE_HIST_SUMM.num_focus_debt_balance
  is '��ע�ฺծ�˻���';
comment on column COM_DEBT_CHANGE_HIST_SUMM.all_num_debt_balance
  is 'ȫ����ծ�˻���';
comment on column COM_DEBT_CHANGE_HIST_SUMM.over_sum
  is '�����ܶ�';
comment on column COM_DEBT_CHANGE_HIST_SUMM.focus_debt_balance
  is '��ע�ฺծ���';
comment on column COM_DEBT_CHANGE_HIST_SUMM.num_account_bad_debt
  is '�����ฺծ�˻���';

