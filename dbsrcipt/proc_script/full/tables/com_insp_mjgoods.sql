create table COM_INSP_MJGOODS
(
  report_id        VARCHAR2(30) not null,
  mj_name          VARCHAR2(100),
  mj_id            VARCHAR2(100),
  appr_depart_name VARCHAR2(100),
  date_end         VARCHAR2(100),
  info_id          VARCHAR2(100)
)
;
comment on table COM_INSP_MJGOODS
  is '��������Ʒ������Ϣ��Ԫ';
comment on column COM_INSP_MJGOODS.report_id
  is '������';
comment on column COM_INSP_MJGOODS.mj_name
  is '������Ʒ����';
comment on column COM_INSP_MJGOODS.mj_id
  is '�����';
comment on column COM_INSP_MJGOODS.appr_depart_name
  is '��׼��������';
comment on column COM_INSP_MJGOODS.date_end
  is '��������';
comment on column COM_INSP_MJGOODS.info_id
  is '��Ϣ���';

