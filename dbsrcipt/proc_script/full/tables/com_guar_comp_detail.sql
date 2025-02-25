create table COM_GUAR_COMP_DETAIL
(
  report_id       VARCHAR2(30) not null,
  serial_no       VARCHAR2(64),
  comp_org        VARCHAR2(100),
  last_comp_date  VARCHAR2(20),
  tatal_comp_sum  VARCHAR2(15),
  comp_balance    VARCHAR2(15),
  last_repay_date VARCHAR2(20),
  orig_guss       VARCHAR2(100),
  settle_status   VARCHAR2(5),
  remarks         VARCHAR2(200)
)
;
comment on table COM_GUAR_COMP_DETAIL
  is '����������������ҵ����ϸ';
comment on column COM_GUAR_COMP_DETAIL.report_id
  is '������';
comment on column COM_GUAR_COMP_DETAIL.serial_no
  is '��ˮ��';
comment on column COM_GUAR_COMP_DETAIL.comp_org
  is '��������';
comment on column COM_GUAR_COMP_DETAIL.last_comp_date
  is '�����������';
comment on column COM_GUAR_COMP_DETAIL.tatal_comp_sum
  is '�ۼƴ������';
comment on column COM_GUAR_COMP_DETAIL.comp_balance
  is '�������(�ѽ�������Ϊ0)';
comment on column COM_GUAR_COMP_DETAIL.last_repay_date
  is '�����������';
comment on column COM_GUAR_COMP_DETAIL.orig_guss
  is 'ԭҵ��';
comment on column COM_GUAR_COMP_DETAIL.settle_status
  is '����״̬(0��δ����,1���ѽ���)';
comment on column COM_GUAR_COMP_DETAIL.remarks
  is '��ע';

