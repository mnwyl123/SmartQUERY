create table COM_ACTUAL_CONTROLLER
(
  report_id          VARCHAR2(30) not null,
  type_identity_num  VARCHAR2(100),
  type_identity      VARCHAR2(100),
  name_identity      VARCHAR2(150),
  type_identity_logo VARCHAR2(100)
)
;
comment on table COM_ACTUAL_CONTROLLER
  is 'ʵ�ʿ�������Ϣ';
comment on column COM_ACTUAL_CONTROLLER.report_id
  is '������';
comment on column COM_ACTUAL_CONTROLLER.type_identity_num
  is 'ʵ�ʿ�������ݱ�ʶ����';
comment on column COM_ACTUAL_CONTROLLER.type_identity
  is 'ʵ�ʿ������������';
comment on column COM_ACTUAL_CONTROLLER.name_identity
  is 'ʵ�ʿ���������';
comment on column COM_ACTUAL_CONTROLLER.type_identity_logo
  is 'ʵ�ʿ�������ݱ�ʶ����';

