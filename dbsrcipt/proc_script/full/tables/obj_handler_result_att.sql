create table OBJ_HANDLER_RESULT_ATT
(
  hr_id    VARCHAR2(64) not null,
  att_name VARCHAR2(100) not null,
  att_path VARCHAR2(200) not null
)
;
comment on table OBJ_HANDLER_RESULT_ATT
  is '���鴦����������';
comment on column OBJ_HANDLER_RESULT_ATT.hr_id
  is '���鴦������id';
comment on column OBJ_HANDLER_RESULT_ATT.att_name
  is '��������';
comment on column OBJ_HANDLER_RESULT_ATT.att_path
  is '������ftp��·��';
create unique index UK_RESULT_ATT on OBJ_HANDLER_RESULT_ATT (HR_ID, ATT_NAME, ATT_PATH);

