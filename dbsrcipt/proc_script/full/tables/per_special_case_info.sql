create table PER_SPECIAL_CASE_INFO
(
  report_id    VARCHAR2(30) not null,
  case_type    VARCHAR2(100),
  s_hepp_month VARCHAR2(100),
  serial       VARCHAR2(100)
)
;
comment on table PER_SPECIAL_CASE_INFO
  is '�����¼�˵����Ϣ';
comment on column PER_SPECIAL_CASE_INFO.report_id
  is '������';
comment on column PER_SPECIAL_CASE_INFO.case_type
  is '�����¼�����';
comment on column PER_SPECIAL_CASE_INFO.s_hepp_month
  is '�����¼������·�';
comment on column PER_SPECIAL_CASE_INFO.serial
  is '�˻����';

