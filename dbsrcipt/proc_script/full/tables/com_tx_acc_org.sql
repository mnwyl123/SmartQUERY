create table COM_TX_ACC_ORG
(
  report_id            VARCHAR2(30) not null,
  type_org             VARCHAR2(100),
  num_acc_settle_sum   VARCHAR2(100),
  code_org             VARCHAR2(100),
  num_acc_settle       VARCHAR2(100),
  type_business        VARCHAR2(100),
  five_type            VARCHAR2(100),
  num_org_info         VARCHAR2(100),
  num_outstand_account VARCHAR2(100),
  over_principal_sum   VARCHAR2(100),
  balance_num_sum      VARCHAR2(100),
  over_sum             VARCHAR2(100)
)
;
comment on table COM_TX_ACC_ORG
  is '�����˻��ֻ���������Ϣ��Ԫ';
comment on column COM_TX_ACC_ORG.report_id
  is '������';
comment on column COM_TX_ACC_ORG.type_org
  is 'ҵ������������';
comment on column COM_TX_ACC_ORG.num_acc_settle_sum
  is '�ѽ����˻����ֽ��ϼ�';
comment on column COM_TX_ACC_ORG.code_org
  is 'ҵ������������';
comment on column COM_TX_ACC_ORG.num_acc_settle
  is '�ѽ����˻���';
comment on column COM_TX_ACC_ORG.type_business
  is 'ҵ������';
comment on column COM_TX_ACC_ORG.five_type
  is '�弶����';
comment on column COM_TX_ACC_ORG.num_org_info
  is '�����˻��ֻ���������Ϣ���';
comment on column COM_TX_ACC_ORG.num_outstand_account
  is 'δ�����˻���';
comment on column COM_TX_ACC_ORG.over_principal_sum
  is '���ڱ���ϼ�';
comment on column COM_TX_ACC_ORG.balance_num_sum
  is '���ϼ�';
comment on column COM_TX_ACC_ORG.over_sum
  is '�����ܶ�ϼ�';

