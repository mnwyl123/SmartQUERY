create table COM_IMEX_SUPERVISION
(
  report_id     VARCHAR2(30) not null,
  super_org     VARCHAR2(100),
  super_council VARCHAR2(100),
  super_level   VARCHAR2(100),
  start_date    VARCHAR2(20),
  end_date      VARCHAR2(20),
  info_id       VARCHAR2(100),
  super_level2  VARCHAR2(100)
)
;
comment on table COM_IMEX_SUPERVISION
  is '��������Ʒ�����������Ϣ��Ԫ';
comment on column COM_IMEX_SUPERVISION.report_id
  is '������';
comment on column COM_IMEX_SUPERVISION.super_org
  is '��ܲ�������';
comment on column COM_IMEX_SUPERVISION.super_council
  is '��Ͻֱ����';
comment on column COM_IMEX_SUPERVISION.super_level
  is '��ܼ���';
comment on column COM_IMEX_SUPERVISION.start_date
  is '��Ч����';
comment on column COM_IMEX_SUPERVISION.end_date
  is '��������';
comment on column COM_IMEX_SUPERVISION.info_id
  is '��Ϣ���';
comment on column COM_IMEX_SUPERVISION.super_level2
  is '��ܼ���2';

