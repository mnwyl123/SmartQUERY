create table COM_INFO_CREDIT
(
  report_id             VARCHAR2(30) not null,
  first_repay_liab_year VARCHAR2(100),
  recover_current_debt  VARCHAR2(100),
  focus_current_debt    VARCHAR2(100),
  secured_over_debt     VARCHAR2(100),
  tax_arrens_num        VARCHAR2(100),
  num_enforce_record    VARCHAR2(100),
  first_trade_year      VARCHAR2(100),
  num_no_cret_tra_acc   VARCHAR2(100),
  unclear_org           VARCHAR2(100),
  secured_trans_balance VARCHAR2(100),
  focus_sec_trans_ba    VARCHAR2(100),
  num_judg_record       VARCHAR2(100),
  relation_org          VARCHAR2(100),
  current_debt          VARCHAR2(100),
  num_admini_puni       VARCHAR2(100),
  over_debt             VARCHAR2(100)
)
;
comment on table COM_INFO_CREDIT
  is '������ʾ��Ϣ��Ԫ';
comment on column COM_INFO_CREDIT.report_id
  is '������';
comment on column COM_INFO_CREDIT.first_repay_liab_year
  is '�״�����ػ������ε����';
comment on column COM_INFO_CREDIT.recover_current_debt
  is '��׷���Ľ���������';
comment on column COM_INFO_CREDIT.focus_current_debt
  is '��ע�����������';
comment on column COM_INFO_CREDIT.secured_over_debt
  is '�����ൣ���������';
comment on column COM_INFO_CREDIT.tax_arrens_num
  is 'Ƿ˰��¼����';
comment on column COM_INFO_CREDIT.num_enforce_record
  is 'ǿ��ִ�м�¼����';
comment on column COM_INFO_CREDIT.first_trade_year
  is '�״����Ŵ����׵����';
comment on column COM_INFO_CREDIT.num_no_cret_tra_acc
  is '���Ŵ������˻���';
comment on column COM_INFO_CREDIT.unclear_org
  is '��ǰ��δ�����Ŵ����׵Ļ�����';
comment on column COM_INFO_CREDIT.secured_trans_balance
  is '�����������';
comment on column COM_INFO_CREDIT.focus_sec_trans_ba
  is '��ע�ൣ���������';
comment on column COM_INFO_CREDIT.num_judg_record
  is '�����о���¼����';
comment on column COM_INFO_CREDIT.relation_org
  is '�����Ŵ����׵Ļ�����';
comment on column COM_INFO_CREDIT.current_debt
  is '����������';
comment on column COM_INFO_CREDIT.num_admini_puni
  is '����������¼����';
comment on column COM_INFO_CREDIT.over_debt
  is '���������������';

