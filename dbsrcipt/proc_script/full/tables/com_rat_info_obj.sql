create table COM_RAT_INFO_OBJ
(
  report_id VARCHAR2(30) not null,
  sta_type  VARCHAR2(100),
  sta_cont  VARCHAR2(400),
  obj_type  VARCHAR2(100),
  date_t    VARCHAR2(100),
  obj_logo  VARCHAR2(100)
)
;
comment on table COM_RAT_INFO_OBJ
  is '�����������ע��Ϣ��Ԫ';
comment on column COM_RAT_INFO_OBJ.report_id
  is '������';
comment on column COM_RAT_INFO_OBJ.sta_type
  is '��ע����������';
comment on column COM_RAT_INFO_OBJ.sta_cont
  is '��ע����������';
comment on column COM_RAT_INFO_OBJ.obj_type
  is '��������';
comment on column COM_RAT_INFO_OBJ.date_t
  is '�������';
comment on column COM_RAT_INFO_OBJ.obj_logo
  is '�����ʶ';

