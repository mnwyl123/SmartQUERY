create table COM_LEND_TRANS_OTHER
(
  report_id          VARCHAR2(30) not null,
  buss_type          VARCHAR2(100),
  asset_quality_clas VARCHAR2(100),
  num_account        VARCHAR2(100),
  balance_num        VARCHAR2(100)
)
;
comment on table COM_LEND_TRANS_OTHER
  is 'δ��������������׷��������Ϣ';
comment on column COM_LEND_TRANS_OTHER.report_id
  is '������';
comment on column COM_LEND_TRANS_OTHER.buss_type
  is 'ҵ������';
comment on column COM_LEND_TRANS_OTHER.asset_quality_clas
  is '�ʲ���������';
comment on column COM_LEND_TRANS_OTHER.num_account
  is '�˻���';
comment on column COM_LEND_TRANS_OTHER.balance_num
  is '���';

