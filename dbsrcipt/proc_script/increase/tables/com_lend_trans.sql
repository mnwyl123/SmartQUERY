create table COM_LEND_TRANS
(
  report_id                 VARCHAR2(30) not null,
  yassets_disp_num          VARCHAR2(100),
  num_month_fz              VARCHAR2(100),
  last_disp_date            VARCHAR2(100),
  over_sum                  VARCHAR2(100),
  over_principal            VARCHAR2(100),
  ynum_advances_account     VARCHAR2(100),
  num_other_trans           VARCHAR2(100),
  yassets_disp_balance      VARCHAR2(100),
  ynum_other_trans_yj       VARCHAR2(100),
  assets_disp_balance       VARCHAR2(100),
  num_advances_account      VARCHAR2(100),
  over_interst_other        VARCHAR2(100),
  ydate_completion          VARCHAR2(100),
  assets_disp_num           VARCHAR2(100),
  advaes_acc_balance        VARCHAR2(100),
  yadvances_account_balance VARCHAR2(100),
  last_ads_acc_date         VARCHAR2(100),
  ydate_settlement          VARCHAR2(100)
)
;
comment on table COM_LEND_TRANS
  is '������׻�����Ϣ��Ԫ';
comment on column COM_LEND_TRANS.report_id
  is '������';
comment on column COM_LEND_TRANS.yassets_disp_num
  is '�ѽ����ʲ�����ҵ���˻���  ';
comment on column COM_LEND_TRANS.num_month_fz
  is '�·���(��ծ)';
comment on column COM_LEND_TRANS.last_disp_date
  is '���һ�δ�������';
comment on column COM_LEND_TRANS.over_sum
  is '�����ܶ�';
comment on column COM_LEND_TRANS.over_principal
  is '���ڱ���';
comment on column COM_LEND_TRANS.ynum_advances_account
  is '���ҵ���˻���  ';
comment on column COM_LEND_TRANS.num_other_trans
  is '����������׷��������Ŀ����';
comment on column COM_LEND_TRANS.yassets_disp_balance
  is '�ʲ�����ҵ����  ';
comment on column COM_LEND_TRANS.ynum_other_trans_yj
  is '����������׷��������Ŀ����';
comment on column COM_LEND_TRANS.assets_disp_balance
  is '�ʲ�����ҵ�����';
comment on column COM_LEND_TRANS.num_advances_account
  is '���ҵ���˻���';
comment on column COM_LEND_TRANS.over_interst_other
  is '������Ϣ������';
comment on column COM_LEND_TRANS.ydate_completion
  is '�����������  ';
comment on column COM_LEND_TRANS.assets_disp_num
  is 'δ�����ʲ�����ҵ���˻���';
comment on column COM_LEND_TRANS.advaes_acc_balance
  is '���ҵ�����';
comment on column COM_LEND_TRANS.yadvances_account_balance
  is '���ҵ����  ';
comment on column COM_LEND_TRANS.last_ads_acc_date
  is '������һ�λ�������';
comment on column COM_LEND_TRANS.ydate_settlement
  is '��������  ';

