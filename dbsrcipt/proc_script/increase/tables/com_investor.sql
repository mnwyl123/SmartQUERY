create table COM_INVESTOR
(
  report_id          VARCHAR2(30) not null,
  reig_capital       VARCHAR2(64),
  num_invest         VARCHAR2(64),
  date_update_invest VARCHAR2(64)
)
;
comment on table COM_INVESTOR
  is 'ע���ʱ���';
comment on column COM_INVESTOR.report_id
  is '������';
comment on column COM_INVESTOR.reig_capital
  is 'ע���ʱ���������Һϼƣ�';
comment on column COM_INVESTOR.num_invest
  is '��Ҫ�����˸���';
comment on column COM_INVESTOR.date_update_invest
  is '��������(ע����)';

