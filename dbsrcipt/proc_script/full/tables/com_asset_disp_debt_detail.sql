create table COM_ASSET_DISP_DEBT_DETAIL
(
  report_id      VARCHAR2(30) not null,
  serial_no      VARCHAR2(64),
  disp_org       VARCHAR2(30),
  currency       VARCHAR2(10),
  orig_amount    VARCHAR2(15),
  rec_date       VARCHAR2(20),
  balance        VARCHAR2(15),
  last_disp_date VARCHAR2(20),
  settle_status  VARCHAR2(2),
  remarks        VARCHAR2(200),
  currency2      VARCHAR2(10)
)
;
comment on table COM_ASSET_DISP_DEBT_DETAIL
  is '�ʲ���˾����ծ����ϸ';
comment on column COM_ASSET_DISP_DEBT_DETAIL.report_id
  is '������';
comment on column COM_ASSET_DISP_DEBT_DETAIL.serial_no
  is '��ˮ��';
comment on column COM_ASSET_DISP_DEBT_DETAIL.disp_org
  is '���û���';
comment on column COM_ASSET_DISP_DEBT_DETAIL.currency
  is '����';
comment on column COM_ASSET_DISP_DEBT_DETAIL.orig_amount
  is 'ԭʼ���';
comment on column COM_ASSET_DISP_DEBT_DETAIL.rec_date
  is '��������';
comment on column COM_ASSET_DISP_DEBT_DETAIL.balance
  is '���(�ѽ�������Ϊ0)';
comment on column COM_ASSET_DISP_DEBT_DETAIL.last_disp_date
  is '���һ�δ�������';
comment on column COM_ASSET_DISP_DEBT_DETAIL.settle_status
  is '����״̬(0��δ����,1���ѽ���)';
comment on column COM_ASSET_DISP_DEBT_DETAIL.remarks
  is '��ע';

