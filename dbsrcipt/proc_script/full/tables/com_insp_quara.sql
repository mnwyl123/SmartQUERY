create table COM_INSP_QUARA
(
  report_id        VARCHAR2(30) not null,
  exp_com_name     VARCHAR2(100),
  quara_id         VARCHAR2(100),
  date_effe        VARCHAR2(100),
  appr_depart_name VARCHAR2(100)
)
;
comment on table COM_INSP_QUARA
  is '���뾳���������ɫͨ����Ϣ��Ԫ';
comment on column COM_INSP_QUARA.report_id
  is '������';
comment on column COM_INSP_QUARA.exp_com_name
  is '������Ʒ����';
comment on column COM_INSP_QUARA.quara_id
  is '��Ϣ���';
comment on column COM_INSP_QUARA.date_effe
  is '��Ч����';
comment on column COM_INSP_QUARA.appr_depart_name
  is '��׼��������';

