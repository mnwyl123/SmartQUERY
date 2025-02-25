create table CIFM_NUMREAD_INFO
(
  id                VARCHAR2(100),
  requestid         VARCHAR2(100),
  resultcode        VARCHAR2(100),
  resultdesc        VARCHAR2(100),
  originateorgcode  VARCHAR2(100),
  originateusercode VARCHAR2(100),
  name              VARCHAR2(100),
  idtype            VARCHAR2(100),
  idnum             VARCHAR2(100),
  queryreason       VARCHAR2(100),
  servicecode       VARCHAR2(100),
  productdate       VARCHAR2(100),
  resulttype        VARCHAR2(100),
  score             VARCHAR2(100),
  factornum         VARCHAR2(100),
  factorrecs        VARCHAR2(100),
  position          VARCHAR2(100),
  scoredate         VARCHAR2(100)
)
;
comment on table CIFM_NUMREAD_INFO
  is '�������ֽ��������Ϣ��';
comment on column CIFM_NUMREAD_INFO.id
  is '���';
comment on column CIFM_NUMREAD_INFO.requestid
  is '��Ϣ��¼��';
comment on column CIFM_NUMREAD_INFO.resultcode
  is '��ѯ������� ';
comment on column CIFM_NUMREAD_INFO.resultdesc
  is '��ѯ�������';
comment on column CIFM_NUMREAD_INFO.originateorgcode
  is '�����������';
comment on column CIFM_NUMREAD_INFO.originateusercode
  is '�����û�����';
comment on column CIFM_NUMREAD_INFO.name
  is '��Ϣ��������';
comment on column CIFM_NUMREAD_INFO.idtype
  is '��Ϣ����֤������';
comment on column CIFM_NUMREAD_INFO.idnum
  is '��Ϣ����֤������';
comment on column CIFM_NUMREAD_INFO.queryreason
  is '��ѯԭ��';
comment on column CIFM_NUMREAD_INFO.servicecode
  is '�������';
comment on column CIFM_NUMREAD_INFO.productdate
  is '��Ʒ����';
comment on column CIFM_NUMREAD_INFO.resulttype
  is '��ѯ�������';
comment on column CIFM_NUMREAD_INFO.score
  is '���ֽ��ֵ';
comment on column CIFM_NUMREAD_INFO.factornum
  is 'Ӱ�����ظ���';
comment on column CIFM_NUMREAD_INFO.factorrecs
  is 'Ӱ�����ؼ���';
comment on column CIFM_NUMREAD_INFO.position
  is '���λ��';
comment on column CIFM_NUMREAD_INFO.scoredate
  is '��������';

