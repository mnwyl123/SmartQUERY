create table COM_MAIN_MEMBER
(
  report_id          VARCHAR2(30) not null,
  num_pepl           VARCHAR2(64),
  date_update_senior VARCHAR2(64)
)
;
comment on table COM_MAIN_MEMBER
  is '��Ҫ��Ա��';
comment on column COM_MAIN_MEMBER.report_id
  is '������';
comment on column COM_MAIN_MEMBER.num_pepl
  is '��Ҫ�����Ա����';
comment on column COM_MAIN_MEMBER.date_update_senior
  is '��������';

