create table OBJ_UNIVERSAL_RESULT
(
  id          VARCHAR2(64),
  resultcode  VARCHAR2(100),
  resultdesc  VARCHAR2(1000),
  user_id     VARCHAR2(64),
  report_type VARCHAR2(1),
  objcheckid  VARCHAR2(20)
)
;
comment on table OBJ_UNIVERSAL_RESULT
  is 'ͨ��Ӧ����';
comment on column OBJ_UNIVERSAL_RESULT.id
  is 'ID';
comment on column OBJ_UNIVERSAL_RESULT.resultcode
  is '����������';
comment on column OBJ_UNIVERSAL_RESULT.resultdesc
  is '����������';
comment on column OBJ_UNIVERSAL_RESULT.user_id
  is '�����û���';
comment on column OBJ_UNIVERSAL_RESULT.report_type
  is '�������ͣ�1-��ȡ���˴��˲��������� 2-��ȡ���˴��˲������������Ϣ 3-����������������˲��� 4-���������������������� 5-��ѯ������������������������� 6-��Ӹ��˱�ע 7-ɾ�����˱�ע��';

