create table OBJ_TOCHECKINF
(
  ci_id                  VARCHAR2(64),
  objcheckid             VARCHAR2(100),
  objchecknum            VARCHAR2(100),
  checkbegindate         VARCHAR2(100),
  name                   VARCHAR2(100),
  idtype                 VARCHAR2(100),
  idnum                  VARCHAR2(100),
  phonenum               VARCHAR2(100),
  objiteminf             VARCHAR2(100),
  objitemdesc            VARCHAR2(1000),
  dataproviderorgcode    VARCHAR2(100),
  dataoccurorgcode       VARCHAR2(100),
  businesscode           VARCHAR2(100),
  businesstype           VARCHAR2(100),
  checkfinaldate         VARCHAR2(100),
  dataoccurdate          VARCHAR2(100),
  dataoccuramount        VARCHAR2(100),
  enclosureflag          VARCHAR2(100),
  historicalcheckinf     VARCHAR2(100),
  org_id                 VARCHAR2(64),
  result_phonenum        VARCHAR2(100),
  result_checkresult     VARCHAR2(100),
  result_checkresultdesc VARCHAR2(100),
  correctresult          VARCHAR2(100),
  correctdesc            VARCHAR2(100),
  correct_enclosureinf   VARCHAR2(100),
  relative_enddate       VARCHAR2(100)
)
;
comment on table OBJ_TOCHECKINF
  is '���������Ϣ';
comment on column OBJ_TOCHECKINF.ci_id
  is '���˲���������id(����OBJ_CHECK_ITEM��id)';
comment on column OBJ_TOCHECKINF.objcheckid
  is '���������';
comment on column OBJ_TOCHECKINF.objchecknum
  is '����������ˮ��';
comment on column OBJ_TOCHECKINF.checkbegindate
  is '�˲鿪ʼ����';
comment on column OBJ_TOCHECKINF.name
  is '����(��ҵ����)';
comment on column OBJ_TOCHECKINF.idtype
  is '֤������(��ҵ��ݱ�ʶ����)';
comment on column OBJ_TOCHECKINF.idnum
  is '֤������(��ҵ��ݱ�ʶ����)';
comment on column OBJ_TOCHECKINF.phonenum
  is '��Ч��ϵ�绰';
comment on column OBJ_TOCHECKINF.objiteminf
  is '����������Ϣ';
comment on column OBJ_TOCHECKINF.objitemdesc
  is '����˵��';
comment on column OBJ_TOCHECKINF.dataproviderorgcode
  is '�����ṩ��������';
comment on column OBJ_TOCHECKINF.dataoccurorgcode
  is '���ݷ�����������';
comment on column OBJ_TOCHECKINF.businesscode
  is 'ҵ���ʶ��';
comment on column OBJ_TOCHECKINF.businesstype
  is 'ҵ������';
comment on column OBJ_TOCHECKINF.checkfinaldate
  is '�˲鵽������';
comment on column OBJ_TOCHECKINF.dataoccurdate
  is '���ݷ�������';
comment on column OBJ_TOCHECKINF.dataoccuramount
  is '���ݷ������';
comment on column OBJ_TOCHECKINF.enclosureflag
  is '�Ƿ���ڸ���';
comment on column OBJ_TOCHECKINF.org_id
  is '�����䴦�����';
comment on column OBJ_TOCHECKINF.result_phonenum
  is '��Ч��ϵ�绰��������������˲�����';
comment on column OBJ_TOCHECKINF.result_checkresult
  is '�˲�����������������˲�����';
comment on column OBJ_TOCHECKINF.result_checkresultdesc
  is '����˲���������������������˲�����';
comment on column OBJ_TOCHECKINF.correctresult
  is '����������';
comment on column OBJ_TOCHECKINF.correctdesc
  is '��������������';
comment on column OBJ_TOCHECKINF.correct_enclosureinf
  is '��������ϴ���������';
comment on column OBJ_TOCHECKINF.relative_enddate
  is '��Լ�鵽��ʱ��=����鿪ʼʱ��+5�죩';

