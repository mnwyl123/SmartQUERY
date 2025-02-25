create table CIFM_OBJ_COM_INFO
(
  id                  VARCHAR2(64),
  dataproviderorgcode VARCHAR2(100),
  usercode            VARCHAR2(100),
  password            VARCHAR2(100),
  originateorgcode    VARCHAR2(100),
  originateusercode   VARCHAR2(100),
  begindate           VARCHAR2(100),
  enddate             VARCHAR2(100),
  objcheckid          VARCHAR2(100),
  phonenum            VARCHAR2(100),
  objchecknum         VARCHAR2(100),
  checkresult         VARCHAR2(100),
  checkresultdesc     VARCHAR2(100),
  correctresult       VARCHAR2(100),
  enclosureinf        VARCHAR2(100),
  correctdesc         VARCHAR2(100),
  entname             VARCHAR2(100),
  entidtype           VARCHAR2(100),
  entidnum            VARCHAR2(100),
  businesscode        VARCHAR2(100),
  locateinfnm         VARCHAR2(100),
  locateinftype       VARCHAR2(100),
  dataoccurorgcode    VARCHAR2(100),
  objdesc             VARCHAR2(100),
  servicereturncode   VARCHAR2(100),
  username            VARCHAR2(255),
  report_type         VARCHAR2(1),
  objcorrectid        VARCHAR2(100),
  del_resultcode      VARCHAR2(10),
  del_resultdesc      VARCHAR2(30)
)
;
comment on table CIFM_OBJ_COM_INFO
  is '���������Ϣ';
comment on column CIFM_OBJ_COM_INFO.dataproviderorgcode
  is '�����ṩ��������';
comment on column CIFM_OBJ_COM_INFO.usercode
  is '�û�����';
comment on column CIFM_OBJ_COM_INFO.password
  is '�û�����';
comment on column CIFM_OBJ_COM_INFO.originateorgcode
  is '�����������';
comment on column CIFM_OBJ_COM_INFO.originateusercode
  is '�����û�����';
comment on column CIFM_OBJ_COM_INFO.begindate
  is '��ʼ����';
comment on column CIFM_OBJ_COM_INFO.enddate
  is '��������';
comment on column CIFM_OBJ_COM_INFO.objcheckid
  is '���������';
comment on column CIFM_OBJ_COM_INFO.phonenum
  is '��Ч��ϵ�绰';
comment on column CIFM_OBJ_COM_INFO.objchecknum
  is '����������ˮ��';
comment on column CIFM_OBJ_COM_INFO.checkresult
  is '�˲���';
comment on column CIFM_OBJ_COM_INFO.checkresultdesc
  is '����˲�������';
comment on column CIFM_OBJ_COM_INFO.correctresult
  is '����������';
comment on column CIFM_OBJ_COM_INFO.enclosureinf
  is '������Ϣ';
comment on column CIFM_OBJ_COM_INFO.correctdesc
  is '��������������';
comment on column CIFM_OBJ_COM_INFO.entname
  is '��ҵ����';
comment on column CIFM_OBJ_COM_INFO.entidtype
  is '��ҵ��ݱ�ʶ����';
comment on column CIFM_OBJ_COM_INFO.entidnum
  is '��ҵ��ݱ�ʶ����';
comment on column CIFM_OBJ_COM_INFO.businesscode
  is 'ҵ���ʶ��';
comment on column CIFM_OBJ_COM_INFO.locateinfnm
  is '��λ��Ϣ����';
comment on column CIFM_OBJ_COM_INFO.locateinftype
  is '��λ��Ϣ���';
comment on column CIFM_OBJ_COM_INFO.dataoccurorgcode
  is '���ݷ�����������';
comment on column CIFM_OBJ_COM_INFO.objdesc
  is '����˵��';
comment on column CIFM_OBJ_COM_INFO.servicereturncode
  is 'ҵ���ִ����';
comment on column CIFM_OBJ_COM_INFO.report_type
  is '�������ͣ�1-��ȡ��ҵ���˲��������� 2-��ȡ��ҵ���˲������������Ϣ 3-������ҵ��������˲��� 4-������ҵ�������������� 5-��ѯ��ҵ��������������������� 6-�����ҵ��ע 7-ɾ����ҵ��ע��';
comment on column CIFM_OBJ_COM_INFO.objcorrectid
  is '�������������';
comment on column CIFM_OBJ_COM_INFO.del_resultcode
  is 'ɾ����ҵ��־����������';
comment on column CIFM_OBJ_COM_INFO.del_resultdesc
  is 'ɾ�����˱�־����������';

