create table PER_AFTER_PAY_INFO
(
  report_id       VARCHAR2(30) not null,
  pay_cost_status VARCHAR2(100),
  pay_cost_record VARCHAR2(100),
  org_type        VARCHAR2(100),
  owe_sum         VARCHAR2(100),
  org_name        VARCHAR2(100),
  chg_acc_ym      VARCHAR2(100),
  acc_type        VARCHAR2(100),
  open_date       VARCHAR2(100),
  label_cnt       VARCHAR2(100),
  serial          VARCHAR2(100)
)
;
comment on table PER_AFTER_PAY_INFO
  is '�󸶷�ҵ����Ϣ��';
comment on column PER_AFTER_PAY_INFO.report_id
  is '������';
comment on column PER_AFTER_PAY_INFO.pay_cost_status
  is '��ǰ�ɷ�״̬';
comment on column PER_AFTER_PAY_INFO.pay_cost_record
  is '��� 24 ���½ɷѼ�¼';
comment on column PER_AFTER_PAY_INFO.org_type
  is 'ҵ������';
comment on column PER_AFTER_PAY_INFO.owe_sum
  is '��ǰǷ�ѽ��';
comment on column PER_AFTER_PAY_INFO.org_name
  is '��������';
comment on column PER_AFTER_PAY_INFO.chg_acc_ym
  is '��������';
comment on column PER_AFTER_PAY_INFO.acc_type
  is '�󸶷��˻�����';
comment on column PER_AFTER_PAY_INFO.open_date
  is 'ҵ��ͨ����';
comment on column PER_AFTER_PAY_INFO.label_cnt
  is '��ע����������';

