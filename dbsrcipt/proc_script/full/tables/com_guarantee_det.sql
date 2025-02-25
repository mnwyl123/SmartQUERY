create table COM_GUARANTEE_DET
(
  report_id                VARCHAR2(30) not null,
  guar_trans_species_niche VARCHAR2(100),
  num_outstand_account     VARCHAR2(100),
  in_sixty_day_bal_num     VARCHAR2(100),
  type_org                 VARCHAR2(100),
  code_org                 VARCHAR2(100),
  guar_accout_id           VARCHAR2(100),
  after_ninety_day_bal_num VARCHAR2(100),
  five_cla                 VARCHAR2(100),
  num_acc_settle           VARCHAR2(100),
  balance_num              VARCHAR2(100),
  in_thirty_day_bal_num    VARCHAR2(100),
  in_ninety_day_bal_num    VARCHAR2(100),
  advances                 VARCHAR2(100)
)
;
comment on table COM_GUARANTEE_DET
  is '�����˻��ֻ���������Ϣ��Ԫ';
comment on column COM_GUARANTEE_DET.report_id
  is '������';
comment on column COM_GUARANTEE_DET.guar_trans_species_niche
  is '��������ҵ������ϸ��';
comment on column COM_GUARANTEE_DET.num_outstand_account
  is 'δ�����˻���';
comment on column COM_GUARANTEE_DET.in_sixty_day_bal_num
  is '60 ���ڵ��ڵ����';
comment on column COM_GUARANTEE_DET.type_org
  is 'ҵ������������';
comment on column COM_GUARANTEE_DET.code_org
  is 'ҵ������������';
comment on column COM_GUARANTEE_DET.guar_accout_id
  is '�����˻��ֻ���������Ϣ���';
comment on column COM_GUARANTEE_DET.after_ninety_day_bal_num
  is '90 ����ڵ����';
comment on column COM_GUARANTEE_DET.five_cla
  is '�弶����';
comment on column COM_GUARANTEE_DET.num_acc_settle
  is '�ѽ����˻���';
comment on column COM_GUARANTEE_DET.balance_num
  is '���';
comment on column COM_GUARANTEE_DET.in_thirty_day_bal_num
  is '30 ���ڵ��ڵ����';
comment on column COM_GUARANTEE_DET.in_ninety_day_bal_num
  is '90 ���ڵ��ڵ����';
comment on column COM_GUARANTEE_DET.advances
  is '����־';

