create table PER_ASSETS_DISPOSAL
(
  report_id        VARCHAR2(30) not null,
  serial           VARCHAR2(10),
  info_type        VARCHAR2(5),
  company_name     VARCHAR2(200),
  receive_date     VARCHAR2(20),
  aggregate_amount VARCHAR2(20),
  last_repay_date  VARCHAR2(20),
  balance          VARCHAR2(20),
  info_type2       VARCHAR2(5)
)
;
comment on table PER_ASSETS_DISPOSAL
  is '�ʲ�����/��֤�˴�����Ϣ';
comment on column PER_ASSETS_DISPOSAL.report_id
  is '������';
comment on column PER_ASSETS_DISPOSAL.serial
  is '���';
comment on column PER_ASSETS_DISPOSAL.info_type
  is '����(0:�ʲ����ã�1:��֤�˴���)';
comment on column PER_ASSETS_DISPOSAL.company_name
  is '��������';
comment on column PER_ASSETS_DISPOSAL.receive_date
  is '����/��������';
comment on column PER_ASSETS_DISPOSAL.aggregate_amount
  is '���';
comment on column PER_ASSETS_DISPOSAL.last_repay_date
  is '���һ�λ�������';
comment on column PER_ASSETS_DISPOSAL.balance
  is '���';

