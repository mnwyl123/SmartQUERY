create table COM_RAT_INFO
(
  report_id VARCHAR2(30) not null,
  rat_res   VARCHAR2(100),
  rat_date  VARCHAR2(100),
  rat_id    VARCHAR2(100),
  rat_name  VARCHAR2(100)
)
;
comment on table COM_RAT_INFO
  is '������Ϣ��Ԫ';
comment on column COM_RAT_INFO.report_id
  is '������';
comment on column COM_RAT_INFO.rat_res
  is '�������';
comment on column COM_RAT_INFO.rat_date
  is '��������';
comment on column COM_RAT_INFO.rat_id
  is '������Ϣ���';
comment on column COM_RAT_INFO.rat_name
  is '������������';

