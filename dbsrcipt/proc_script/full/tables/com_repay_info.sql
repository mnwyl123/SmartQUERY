create table COM_REPAY_INFO
(
  report_id                   VARCHAR2(30) not null,
  rece_repay_onece_form       VARCHAR2(100),
  over_principal              VARCHAR2(100),
  over_month                  VARCHAR2(100),
  balance_num_date_change     VARCHAR2(100),
  rece_repay_sum              VARCHAR2(100),
  over_sum                    VARCHAR2(100),
  num_month_remain            VARCHAR2(100),
  serial                      VARCHAR2(100),
  date_report_info            VARCHAR2(100),
  five_cla                    VARCHAR2(100),
  date_five_cla               VARCHAR2(100),
  rece_repay_onece_time       VARCHAR2(100),
  rece_repay_onece_sum        VARCHAR2(100),
  balance_num                 VARCHAR2(100),
  rece_repay_onece_conve_date VARCHAR2(100)
)
;
comment on table COM_REPAY_INFO
  is '���������Ϣ';
comment on column COM_REPAY_INFO.report_id
  is '������';
comment on column COM_REPAY_INFO.rece_repay_onece_form
  is '���һ�λ�����ʽ';
comment on column COM_REPAY_INFO.over_principal
  is '���ڱ���';
comment on column COM_REPAY_INFO.over_month
  is '��������';
comment on column COM_REPAY_INFO.balance_num_date_change
  is '���仯����';
comment on column COM_REPAY_INFO.rece_repay_sum
  is '���һ��Ӧ���ܶ�';
comment on column COM_REPAY_INFO.over_sum
  is '�����ܶ�';
comment on column COM_REPAY_INFO.num_month_remain
  is 'ʣ�໹������';
comment on column COM_REPAY_INFO.serial
  is '���';
comment on column COM_REPAY_INFO.date_report_info
  is '��Ϣ��������';
comment on column COM_REPAY_INFO.five_cla
  is '�弶����';
comment on column COM_REPAY_INFO.date_five_cla
  is '�弶�����϶�����';
comment on column COM_REPAY_INFO.rece_repay_onece_time
  is '���һ��ʵ�ʻ�������';
comment on column COM_REPAY_INFO.rece_repay_onece_sum
  is '���һ��ʵ�ʻ����ܶ�';
comment on column COM_REPAY_INFO.balance_num
  is '���';
comment on column COM_REPAY_INFO.rece_repay_onece_conve_date
  is '���һ��Լ����������';

