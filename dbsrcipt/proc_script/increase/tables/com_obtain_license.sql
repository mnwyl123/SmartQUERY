create table COM_OBTAIN_LICENSE
(
  report_id       VARCHAR2(30) not null,
  obtain_name     VARCHAR2(100),
  date_end        VARCHAR2(100),
  type_obtain     VARCHAR2(100),
  date_obtain     VARCHAR2(100),
  obtain_id       VARCHAR2(100),
  content_license VARCHAR2(1000)
)
;
comment on table COM_OBTAIN_LICENSE
  is '�����ɼ�¼��Ϣ��Ԫ';
comment on column COM_OBTAIN_LICENSE.report_id
  is '������';
comment on column COM_OBTAIN_LICENSE.obtain_name
  is '��ɲ�������';
comment on column COM_OBTAIN_LICENSE.date_end
  is '��ֹ����';
comment on column COM_OBTAIN_LICENSE.type_obtain
  is '�������';
comment on column COM_OBTAIN_LICENSE.date_obtain
  is '�������';
comment on column COM_OBTAIN_LICENSE.obtain_id
  is '��ɼ�¼���';
comment on column COM_OBTAIN_LICENSE.content_license
  is '�������';

