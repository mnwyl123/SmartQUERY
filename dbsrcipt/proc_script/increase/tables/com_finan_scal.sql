create table COM_FINAN_SCAL
(
  report_id       VARCHAR2(30) not null,
  sub_list        VARCHAR2(100),
  type_contr_scal VARCHAR2(100),
  info_id         VARCHAR2(100),
  the_size        VARCHAR2(100),
  years           VARCHAR2(100)
)
;
comment on table COM_FINAN_SCAL
  is '���ʹ�ģ������Ϣ��Ԫ';
comment on column COM_FINAN_SCAL.report_id
  is '������';
comment on column COM_FINAN_SCAL.sub_list
  is '������¼';
comment on column COM_FINAN_SCAL.type_contr_scal
  is '���ʿ�������';
comment on column COM_FINAN_SCAL.info_id
  is '��Ϣ���';
comment on column COM_FINAN_SCAL.the_size
  is '��ģ';
comment on column COM_FINAN_SCAL.years
  is '���';

