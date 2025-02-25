create table PER_BORROW_DETAIL
(
  report_id                 VARCHAR2(30) not null,
  buss_org_type             VARCHAR2(100),
  cred_serial               VARCHAR2(100),
  repay_num                 VARCHAR2(100),
  cession_repay_status      VARCHAR2(100),
  new_five_type             VARCHAR2(100),
  cur_rest_repay_num        VARCHAR2(100),
  cur_actual_repay_amout    VARCHAR2(100),
  cur_cur_over_num          VARCHAR2(100),
  cur_y5_sdate              VARCHAR2(100),
  create_date               VARCHAR2(100),
  currency                  VARCHAR2(100),
  loan_sum                  VARCHAR2(100),
  acc_cred_quota            VARCHAR2(100),
  new_acc_status            VARCHAR2(100),
  new_info_report_date      VARCHAR2(100),
  cur_l_n_repay_principal   VARCHAR2(100),
  label_cnt                 VARCHAR2(100),
  serial                    VARCHAR2(100),
  share_cred_quota          VARCHAR2(100),
  expiry_date               VARCHAR2(100),
  repay_freq                VARCHAR2(100),
  loan_distri_form          VARCHAR2(100),
  new_last_repay_date       VARCHAR2(100),
  cur_five_type             VARCHAR2(100),
  cur_plan_repay_date       VARCHAR2(100),
  cur_cur_over_amount       VARCHAR2(100),
  cur_max_use_quota         VARCHAR2(100),
  cur_m24_sdate             VARCHAR2(100),
  cur_large_divide_cnt      VARCHAR2(100),
  buss_org_code             VARCHAR2(100),
  vouchtype                 VARCHAR2(100),
  new_last_repay_sum        VARCHAR2(100),
  cur_p_month               VARCHAR2(100),
  cur_no_issued_balanc      VARCHAR2(100),
  cur_avg_use_quota         VARCHAR2(100),
  cur_y5_edate              VARCHAR2(100),
  repay_way                 VARCHAR2(100),
  new_repay_statue          VARCHAR2(100),
  cur_cur_repay_amout       VARCHAR2(100),
  cur_last_repay_date       VARCHAR2(100),
  cur_n_n_repay_principal   VARCHAR2(100),
  cur_m24_edate             VARCHAR2(100),
  cur_y5_month_cnt          VARCHAR2(100),
  account_type              VARCHAR2(100),
  account_sign              VARCHAR2(100),
  buss_category             VARCHAR2(100),
  common_loan_sign          VARCHAR2(100),
  new_balance               VARCHAR2(100),
  cur_s_n_repay_principal   VARCHAR2(100),
  cur_l_overdraft_principal VARCHAR2(100),
  new_close_date            VARCHAR2(100),
  cur_info_report_date      VARCHAR2(100),
  cur_special_trade_cnt     VARCHAR2(100),
  new_out_month             VARCHAR2(100),
  cur_acc_status            VARCHAR2(100),
  cur_balance               VARCHAR2(100),
  cur_used_sum              VARCHAR2(100),
  cur_t_n_repay_principal   VARCHAR2(100),
  cur_avg_overdraft_balance VARCHAR2(100),
  cur_max_overdraft_balance VARCHAR2(100),
  cur_special_case_cnt      VARCHAR2(100)
)
;
comment on table PER_BORROW_DETAIL
  is '���ר�������Ϣ��';
comment on column PER_BORROW_DETAIL.report_id
  is '������';
comment on column PER_BORROW_DETAIL.buss_org_type
  is 'ҵ������������';
comment on column PER_BORROW_DETAIL.cred_serial
  is '����Э����';
comment on column PER_BORROW_DETAIL.repay_num
  is '��������';
comment on column PER_BORROW_DETAIL.cession_repay_status
  is 'ծȨת��ʱ�Ļ���״̬';
comment on column PER_BORROW_DETAIL.new_five_type
  is '�弶����';
comment on column PER_BORROW_DETAIL.cur_rest_repay_num
  is 'ʣ�໹������';
comment on column PER_BORROW_DETAIL.cur_actual_repay_amout
  is '����ʵ����';
comment on column PER_BORROW_DETAIL.cur_cur_over_num
  is '��ǰ��������';
comment on column PER_BORROW_DETAIL.cur_y5_sdate
  is '��ʼ����(���5��)';
comment on column PER_BORROW_DETAIL.create_date
  is '��������';
comment on column PER_BORROW_DETAIL.currency
  is '����';
comment on column PER_BORROW_DETAIL.loan_sum
  is '�����';
comment on column PER_BORROW_DETAIL.acc_cred_quota
  is '�˻����Ŷ��';
comment on column PER_BORROW_DETAIL.new_acc_status
  is '�˻�״̬';
comment on column PER_BORROW_DETAIL.new_info_report_date
  is '��Ϣ��������';
comment on column PER_BORROW_DETAIL.cur_l_n_repay_principal
  is '���� 180 ������δ������';
comment on column PER_BORROW_DETAIL.label_cnt
  is '��ע����������';
comment on column PER_BORROW_DETAIL.serial
  is '�˻����';
comment on column PER_BORROW_DETAIL.share_cred_quota
  is '�������Ŷ��';
comment on column PER_BORROW_DETAIL.expiry_date
  is '��������';
comment on column PER_BORROW_DETAIL.repay_freq
  is '����Ƶ��';
comment on column PER_BORROW_DETAIL.loan_distri_form
  is '�������ʽ';
comment on column PER_BORROW_DETAIL.new_last_repay_date
  is '���һ�λ�������';
comment on column PER_BORROW_DETAIL.cur_five_type
  is '�弶����';
comment on column PER_BORROW_DETAIL.cur_plan_repay_date
  is '����/Ӧ������';
comment on column PER_BORROW_DETAIL.cur_cur_over_amount
  is '��ǰ�����ܶ�';
comment on column PER_BORROW_DETAIL.cur_max_use_quota
  is '���ʹ�ö��';
comment on column PER_BORROW_DETAIL.cur_m24_sdate
  is '��ʼ����(��� 24 ���»���״̬)';
comment on column PER_BORROW_DETAIL.cur_large_divide_cnt
  is '���ר����ڱ���';
comment on column PER_BORROW_DETAIL.buss_org_code
  is 'ҵ������������';
comment on column PER_BORROW_DETAIL.vouchtype
  is '������ʽ';
comment on column PER_BORROW_DETAIL.new_last_repay_sum
  is '���һ�λ�����';
comment on column PER_BORROW_DETAIL.cur_p_month
  is '�·�';
comment on column PER_BORROW_DETAIL.cur_no_issued_balanc
  is 'δ�����Ĵ��ר��������';
comment on column PER_BORROW_DETAIL.cur_avg_use_quota
  is '��� 6 ����ƽ��ʹ�ö��';
comment on column PER_BORROW_DETAIL.cur_y5_edate
  is '��ֹ����(���5��)';
comment on column PER_BORROW_DETAIL.repay_way
  is '���ʽ';
comment on column PER_BORROW_DETAIL.new_repay_statue
  is '����״̬';
comment on column PER_BORROW_DETAIL.cur_cur_repay_amout
  is '����Ӧ����';
comment on column PER_BORROW_DETAIL.cur_last_repay_date
  is '���һ�λ�������';
comment on column PER_BORROW_DETAIL.cur_n_n_repay_principal
  is '���� 91��180 ��δ������';
comment on column PER_BORROW_DETAIL.cur_m24_edate
  is '��ֹ����(��� 24 ���»���״̬)';
comment on column PER_BORROW_DETAIL.cur_y5_month_cnt
  is '����(���5��)';
comment on column PER_BORROW_DETAIL.account_type
  is '�˻�����';
comment on column PER_BORROW_DETAIL.account_sign
  is '�˻���ʶ';
comment on column PER_BORROW_DETAIL.buss_category
  is 'ҵ������';
comment on column PER_BORROW_DETAIL.common_loan_sign
  is '��ͬ����־';
comment on column PER_BORROW_DETAIL.new_balance
  is '���';
comment on column PER_BORROW_DETAIL.cur_s_n_repay_principal
  is '���� 61��90 ��δ������';
comment on column PER_BORROW_DETAIL.cur_l_overdraft_principal
  is '͸֧ 180 ������δ�����';
comment on column PER_BORROW_DETAIL.new_close_date
  is '�ر�����';
comment on column PER_BORROW_DETAIL.cur_info_report_date
  is '��Ϣ��������';
comment on column PER_BORROW_DETAIL.cur_special_trade_cnt
  is '���⽻�׸���';
comment on column PER_BORROW_DETAIL.new_out_month
  is 'ת���·�';
comment on column PER_BORROW_DETAIL.cur_acc_status
  is '�˻�״̬';
comment on column PER_BORROW_DETAIL.cur_balance
  is '���';
comment on column PER_BORROW_DETAIL.cur_used_sum
  is '���ö��';
comment on column PER_BORROW_DETAIL.cur_t_n_repay_principal
  is '���� 31��60 ��δ������';
comment on column PER_BORROW_DETAIL.cur_avg_overdraft_balance
  is '��� 6 ����ƽ��͸֧���';
comment on column PER_BORROW_DETAIL.cur_max_overdraft_balance
  is '���͸֧���';
comment on column PER_BORROW_DETAIL.cur_special_case_cnt
  is '�����¼�˵������';

