create table COM_LACK_INTEREST
(
  report_id            VARCHAR2(30) not null,
  serial_no            VARCHAR2(64),
  credit_org           VARCHAR2(200),
  currency             VARCHAR2(10),
  lack_inte_balance    VARCHAR2(15),
  balance_change_date  VARCHAR2(20),
  lack_inte_type       VARCHAR2(20),
  his_max_lack_inte    VARCHAR2(15),
  first_lack_inte_date VARCHAR2(20),
  last_settle_date     VARCHAR2(20),
  settle_status        VARCHAR2(10),
  remarks              VARCHAR2(200),
  type_org             VARCHAR2(100),
  code_org             VARCHAR2(100),
  num_lack             VARCHAR2(100),
  date_report          VARCHAR2(100),
  currency2            VARCHAR2(10),
  lack_inte_type2      VARCHAR2(20)
)
;
comment on table COM_LACK_INTEREST
  is 'ǷϢ��Ϣ��Ԫ';
comment on column COM_LACK_INTEREST.report_id
  is '������';
comment on column COM_LACK_INTEREST.serial_no
  is '��ˮ��';
comment on column COM_LACK_INTEREST.credit_org
  is '���Ż���';
comment on column COM_LACK_INTEREST.currency
  is '����';
comment on column COM_LACK_INTEREST.lack_inte_balance
  is 'ǷϢ���';
comment on column COM_LACK_INTEREST.balance_change_date
  is '���仯����';
comment on column COM_LACK_INTEREST.lack_inte_type
  is 'ǷϢ����';
comment on column COM_LACK_INTEREST.his_max_lack_inte
  is '��ʷ���ǷϢ��Ԫ��';
comment on column COM_LACK_INTEREST.first_lack_inte_date
  is '�״�ǷϢ��������';
comment on column COM_LACK_INTEREST.last_settle_date
  is '���һ�ν�������';
comment on column COM_LACK_INTEREST.settle_status
  is '����״̬(0��δ����,1���ѽ���)';
comment on column COM_LACK_INTEREST.remarks
  is '��ע';
comment on column COM_LACK_INTEREST.type_org
  is 'ҵ������������';
comment on column COM_LACK_INTEREST.code_org
  is 'ҵ������������';
comment on column COM_LACK_INTEREST.num_lack
  is 'ǷϢ��Ϣ���';
comment on column COM_LACK_INTEREST.date_report
  is '��Ϣ��������';
comment on column COM_LACK_INTEREST.currency2
  is '����2';
comment on column COM_LACK_INTEREST.lack_inte_type2
  is 'ǷϢ����2';

