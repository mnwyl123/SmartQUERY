create table PER_BASIC
(
  report_id                VARCHAR2(30) not null,
  client_name              VARCHAR2(150),
  credentials_type         VARCHAR2(50),
  credentials_no           VARCHAR2(150),
  client_sex               VARCHAR2(10),
  client_birthday          VARCHAR2(100),
  marital_status           VARCHAR2(10),
  phone_num                VARCHAR2(150),
  company_tel              VARCHAR2(150),
  family_tel               VARCHAR2(150),
  education                VARCHAR2(50),
  degree                   VARCHAR2(15),
  mailing_address          VARCHAR2(300),
  residence_address        VARCHAR2(300),
  whole_label_cnt          VARCHAR2(100),
  nationality              VARCHAR2(100),
  after_pay_cnt            VARCHAR2(100),
  query_org_code           VARCHAR2(100),
  ch_sign                  VARCHAR2(100),
  work_status              VARCHAR2(100),
  ch_phone                 VARCHAR2(200),
  ch_sdate                 VARCHAR2(100),
  ch_edate                 VARCHAR2(100),
  whole_label_obj_type     VARCHAR2(100),
  ide_cnt                  VARCHAR2(100),
  public_info_cnt          VARCHAR2(100),
  whole_label_obj_sign     VARCHAR2(100),
  query_reason_code        VARCHAR2(100),
  objection_num            VARCHAR2(100),
  email                    VARCHAR2(100),
  phone_cnt                VARCHAR2(100),
  report_time              VARCHAR2(100),
  serial                   VARCHAR2(100),
  digital_interpre         VARCHAR2(100),
  digital_interpre_des     VARCHAR2(100),
  digital_interpre_des_cnt VARCHAR2(100),
  relative_positiont       VARCHAR2(100),
  credentials_type2        VARCHAR2(50),
  degree2                  VARCHAR2(15),
  education2               VARCHAR2(50),
  marital_status2          VARCHAR2(10),
  client_sex2              VARCHAR2(10)
)
;
comment on table PER_BASIC
  is '��ע��������Ϣ��Ԫ';
comment on column PER_BASIC.report_id
  is '������';
comment on column PER_BASIC.client_name
  is '����ѯ������';
comment on column PER_BASIC.credentials_type
  is '����ѯ��֤������';
comment on column PER_BASIC.credentials_no
  is '����ѯ��֤������';
comment on column PER_BASIC.client_sex
  is '�Ա�';
comment on column PER_BASIC.client_birthday
  is '��������';
comment on column PER_BASIC.marital_status
  is '����״��';
comment on column PER_BASIC.phone_num
  is '�ֻ�����';
comment on column PER_BASIC.company_tel
  is '��λ�绰';
comment on column PER_BASIC.family_tel
  is 'סլ�绰';
comment on column PER_BASIC.education
  is 'ѧ��';
comment on column PER_BASIC.degree
  is 'ѧλ';
comment on column PER_BASIC.mailing_address
  is 'ͨѶ��ַ';
comment on column PER_BASIC.residence_address
  is '������ַ';
comment on column PER_BASIC.whole_label_cnt
  is '��ע���������͸���(����)';
comment on column PER_BASIC.nationality
  is '����';
comment on column PER_BASIC.after_pay_cnt
  is '�󸶷�ҵ����������';
comment on column PER_BASIC.query_org_code
  is '��ѯ��������';
comment on column PER_BASIC.ch_sign
  is '����թ��ʾ��־';
comment on column PER_BASIC.work_status
  is '��ҵ״��';
comment on column PER_BASIC.ch_phone
  is '����թ��ʾ��ϵ�绰';
comment on column PER_BASIC.ch_sdate
  is '����թ��ʾ��Ч����';
comment on column PER_BASIC.ch_edate
  is '����թ��ʾ��ֹ���� ';
comment on column PER_BASIC.whole_label_obj_type
  is '��������(����)';
comment on column PER_BASIC.ide_cnt
  is '��ݱ�ʶ����';
comment on column PER_BASIC.public_info_cnt
  is '������Ϣ��������';
comment on column PER_BASIC.whole_label_obj_sign
  is '�����ʶ(����)';
comment on column PER_BASIC.query_reason_code
  is '��ѯԭ�����';
comment on column PER_BASIC.objection_num
  is '�����ע��Ŀ';
comment on column PER_BASIC.email
  is '��������';
comment on column PER_BASIC.phone_cnt
  is '�ֻ��������';
comment on column PER_BASIC.report_time
  is '����ʱ��';
comment on column PER_BASIC.digital_interpre
  is '���ֽ��';
comment on column PER_BASIC.digital_interpre_des
  is '����˵��';
comment on column PER_BASIC.digital_interpre_des_cnt
  is '����˵������';
comment on column PER_BASIC.relative_positiont
  is '���λ��';
comment on column PER_BASIC.credentials_type2
  is '����ѯ��֤������2';
comment on column PER_BASIC.degree2
  is 'ѧλ2';
comment on column PER_BASIC.education2
  is 'ѧ��2';

