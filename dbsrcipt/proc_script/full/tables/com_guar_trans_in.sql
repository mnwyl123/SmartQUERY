create table COM_GUAR_TRANS_IN
(
  report_id             VARCHAR2(30) not null,
  num_secured_notrans   VARCHAR2(100),
  num_secured_trans_cat VARCHAR2(100)
)
;
comment on table COM_GUAR_TRANS_IN
  is '�������׻�����Ϣ��Ԫ';
comment on column COM_GUAR_TRANS_IN.report_id
  is '������';
comment on column COM_GUAR_TRANS_IN.num_secured_notrans
  is '�������׷��������Ŀ����(�ѽ���)';
comment on column COM_GUAR_TRANS_IN.num_secured_trans_cat
  is '�������׷��������Ŀ����(δ����)';

