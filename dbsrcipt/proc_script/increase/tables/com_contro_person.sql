create table COM_CONTRO_PERSON
(
  report_id       VARCHAR2(30) not null,
  control_num     VARCHAR2(64),
  date_update_act VARCHAR2(64)
)
;
comment on table COM_CONTRO_PERSON
  is '��Ҫ��Ա��';
comment on column COM_CONTRO_PERSON.report_id
  is '������';
comment on column COM_CONTRO_PERSON.control_num
  is '��Ҫ�����Ա����';
comment on column COM_CONTRO_PERSON.date_update_act
  is '��������';

