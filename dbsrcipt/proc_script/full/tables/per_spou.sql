create table PER_SPOU
(
  report_id              VARCHAR2(30) not null,
  spou_name              VARCHAR2(150),
  spou_credentials_type  VARCHAR2(20),
  spou_credentials_no    VARCHAR2(150),
  spou_company           VARCHAR2(200),
  spou_tel               VARCHAR2(150),
  marital_status         VARCHAR2(100),
  spou_credentials_type2 VARCHAR2(100)
)
;
comment on table PER_SPOU
  is '��ż��Ϣ��';
comment on column PER_SPOU.report_id
  is '������';
comment on column PER_SPOU.spou_name
  is '��ż����';
comment on column PER_SPOU.spou_credentials_type
  is '��ż֤������';
comment on column PER_SPOU.spou_credentials_no
  is '��ż֤������';
comment on column PER_SPOU.spou_company
  is '��ż������λ';
comment on column PER_SPOU.spou_tel
  is '��ż��ϵ�绰';
comment on column PER_SPOU.marital_status
  is '����״��';
comment on column PER_SPOU.spou_credentials_type2
  is '��ż֤������2';

