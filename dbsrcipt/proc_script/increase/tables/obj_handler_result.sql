create table OBJ_HANDLER_RESULT
(
  id          VARCHAR2(64) not null,
  att_cnt     NUMBER(2),
  result_desc VARCHAR2(4000)
)
;
comment on table OBJ_HANDLER_RESULT
  is '���鴦������д��';
comment on column OBJ_HANDLER_RESULT.att_cnt
  is '��������';
comment on column OBJ_HANDLER_RESULT.result_desc
  is '������';
alter table OBJ_HANDLER_RESULT
  add primary key (ID);

