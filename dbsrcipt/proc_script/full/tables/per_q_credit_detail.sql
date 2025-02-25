create table PER_Q_CREDIT_DETAIL
(
  report_id               VARCHAR2(30) not null,
  serial_number           VARCHAR2(64),
  serial                  VARCHAR2(10),
  q_cr_rel_card_date      VARCHAR2(20),
  q_cr_rel_card_org       VARCHAR2(30),
  bussid                  VARCHAR2(40),
  vouchtype               VARCHAR2(200),
  currencytype            VARCHAR2(100),
  cardtype                VARCHAR2(18),
  q_cr_credit_sum         VARCHAR2(20),
  q_cr_share_credit_sum   VARCHAR2(20),
  q_cr_stop_date          VARCHAR2(20),
  q_cr_acc_status         VARCHAR2(10),
  q_cr_used_sum           VARCHAR2(20),
  q_cr_avg_used_sum       VARCHAR2(20),
  q_cr_used_max_sum       VARCHAR2(20),
  q_cr_should_repay_amout VARCHAR2(20),
  q_cr_bill_date          VARCHAR2(20),
  q_cr_actual_repay_amout VARCHAR2(20),
  q_cr_last_repay_date    VARCHAR2(20),
  unrepay_balance         VARCHAR2(20),
  q_cr_cur_over_num       VARCHAR2(20),
  q_cr_cur_over_amout     VARCHAR2(20),
  statebtime              VARCHAR2(20),
  stateetime              VARCHAR2(20),
  q_cr_repay_record       VARCHAR2(100),
  overdue_bdate           VARCHAR2(20),
  overdue_edate           VARCHAR2(20),
  special_trade_type      VARCHAR2(50),
  occur_date              VARCHAR2(20),
  change_month            VARCHAR2(10),
  occur_sum               VARCHAR2(20),
  overdue_detail          VARCHAR2(100),
  balance                 VARCHAR2(16),
  bank_type               VARCHAR2(200),
  currencytype2           VARCHAR2(100),
  bank_type2              VARCHAR2(200),
  vouchtype2              VARCHAR2(200),
  cardtype2               VARCHAR2(18),
  q_cr_acc_status2        VARCHAR2(10)
)
;
comment on table PER_Q_CREDIT_DETAIL
  is '׼���ǿ�������ϸ��';
comment on column PER_Q_CREDIT_DETAIL.report_id
  is '������';
comment on column PER_Q_CREDIT_DETAIL.serial_number
  is '��ˮ��';
comment on column PER_Q_CREDIT_DETAIL.serial
  is '���';
comment on column PER_Q_CREDIT_DETAIL.q_cr_rel_card_date
  is '��������';
comment on column PER_Q_CREDIT_DETAIL.q_cr_rel_card_org
  is '��������';
comment on column PER_Q_CREDIT_DETAIL.bussid
  is 'ҵ���';
comment on column PER_Q_CREDIT_DETAIL.vouchtype
  is '������ʽ';
comment on column PER_Q_CREDIT_DETAIL.currencytype
  is '����';
comment on column PER_Q_CREDIT_DETAIL.cardtype
  is '������';
comment on column PER_Q_CREDIT_DETAIL.q_cr_credit_sum
  is '���Ŷ��';
comment on column PER_Q_CREDIT_DETAIL.q_cr_share_credit_sum
  is '�������Ŷ��';
comment on column PER_Q_CREDIT_DETAIL.q_cr_stop_date
  is '��ֹ����';
comment on column PER_Q_CREDIT_DETAIL.q_cr_acc_status
  is '�˻�״̬';
comment on column PER_Q_CREDIT_DETAIL.q_cr_used_sum
  is '���ö��';
comment on column PER_Q_CREDIT_DETAIL.q_cr_avg_used_sum
  is '���6����ƽ��ʹ�ö��';
comment on column PER_Q_CREDIT_DETAIL.q_cr_used_max_sum
  is '���ʹ�ö��';
comment on column PER_Q_CREDIT_DETAIL.q_cr_should_repay_amout
  is '����Ӧ����';
comment on column PER_Q_CREDIT_DETAIL.q_cr_bill_date
  is '�˵���';
comment on column PER_Q_CREDIT_DETAIL.q_cr_actual_repay_amout
  is '����ʵ����';
comment on column PER_Q_CREDIT_DETAIL.q_cr_last_repay_date
  is '���һ�λ�������';
comment on column PER_Q_CREDIT_DETAIL.unrepay_balance
  is '͸֧180������δ�����';
comment on column PER_Q_CREDIT_DETAIL.q_cr_cur_over_num
  is '��ǰ��������';
comment on column PER_Q_CREDIT_DETAIL.q_cr_cur_over_amout
  is '��ǰ��������';
comment on column PER_Q_CREDIT_DETAIL.statebtime
  is '24�ڿ�ʼ����';
comment on column PER_Q_CREDIT_DETAIL.stateetime
  is '24�ڽ�ֹ����';
comment on column PER_Q_CREDIT_DETAIL.q_cr_repay_record
  is '���24���»����¼';
comment on column PER_Q_CREDIT_DETAIL.overdue_bdate
  is '���ڿ�ʼ����';
comment on column PER_Q_CREDIT_DETAIL.overdue_edate
  is '���ڽ�ֹ����';
comment on column PER_Q_CREDIT_DETAIL.special_trade_type
  is '���⽻������';
comment on column PER_Q_CREDIT_DETAIL.occur_date
  is '��������';
comment on column PER_Q_CREDIT_DETAIL.change_month
  is '�������';
comment on column PER_Q_CREDIT_DETAIL.occur_sum
  is '�������';
comment on column PER_Q_CREDIT_DETAIL.overdue_detail
  is '��ϸ��¼';
comment on column PER_Q_CREDIT_DETAIL.balance
  is '���';
comment on column PER_Q_CREDIT_DETAIL.bank_type
  is '��������';

