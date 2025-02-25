create table PER_PROVIDENT_FUND_PAY
(
  report_id       VARCHAR2(30) not null,
  serial          VARCHAR2(10),
  pay_place       VARCHAR2(50),
  pay_date        VARCHAR2(20),
  start_pay_mon   VARCHAR2(20),
  stop_pay_mon    VARCHAR2(20),
  pay_status      VARCHAR2(20),
  pay_mon_amout   VARCHAR2(10),
  per_pay_percent VARCHAR2(10),
  com_pay_percent VARCHAR2(10),
  pay_com_name    VARCHAR2(100),
  update_time     VARCHAR2(20),
  label_cnt       VARCHAR2(100),
  pay_status2     VARCHAR2(20)
)
;
comment on table PER_PROVIDENT_FUND_PAY
  is 'ס��������νɼ�¼��Ϣ��';
comment on column PER_PROVIDENT_FUND_PAY.report_id
  is '������';
comment on column PER_PROVIDENT_FUND_PAY.serial
  is '���';
comment on column PER_PROVIDENT_FUND_PAY.pay_place
  is '�νɵ�';
comment on column PER_PROVIDENT_FUND_PAY.pay_date
  is '�ν�����';
comment on column PER_PROVIDENT_FUND_PAY.start_pay_mon
  is '�����·�';
comment on column PER_PROVIDENT_FUND_PAY.stop_pay_mon
  is '�����·�';
comment on column PER_PROVIDENT_FUND_PAY.pay_status
  is '�ɷ�״̬';
comment on column PER_PROVIDENT_FUND_PAY.pay_mon_amout
  is '�½ɴ��';
comment on column PER_PROVIDENT_FUND_PAY.per_pay_percent
  is '���˽ɴ����';
comment on column PER_PROVIDENT_FUND_PAY.com_pay_percent
  is '��λ�ɴ����';
comment on column PER_PROVIDENT_FUND_PAY.pay_com_name
  is '�ɷѵ�λ';
comment on column PER_PROVIDENT_FUND_PAY.update_time
  is '��Ϣ��������';
comment on column PER_PROVIDENT_FUND_PAY.label_cnt
  is '��ע����������';
comment on column PER_PROVIDENT_FUND_PAY.pay_status2
  is '�ɷ�״̬2';

