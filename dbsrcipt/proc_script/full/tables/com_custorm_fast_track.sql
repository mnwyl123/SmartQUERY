create table COM_CUSTORM_FAST_TRACK
(
  report_id       VARCHAR2(30) not null,
  exem_type       VARCHAR2(5),
  approval_org    VARCHAR2(100),
  exem_merch_name VARCHAR2(200),
  exem_no         VARCHAR2(30),
  end_date        VARCHAR2(20)
)
;
comment on table COM_CUSTORM_FAST_TRACK
  is '���ؿ���ͨ��';
comment on column COM_CUSTORM_FAST_TRACK.report_id
  is '������';
comment on column COM_CUSTORM_FAST_TRACK.exem_type
  is '�������(01����ɫͨ��,02�����)';
comment on column COM_CUSTORM_FAST_TRACK.approval_org
  is '��׼����';
comment on column COM_CUSTORM_FAST_TRACK.exem_merch_name
  is '�����Ʒ����';
comment on column COM_CUSTORM_FAST_TRACK.exem_no
  is '����';
comment on column COM_CUSTORM_FAST_TRACK.end_date
  is '��ֹ����';

