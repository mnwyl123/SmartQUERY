create table PER_STATEMENT
(
  report_id          VARCHAR2(30) not null,
  serial             VARCHAR2(10),
  serial_number      VARCHAR2(64),
  cart_type          VARCHAR2(10),
  org_des            VARCHAR2(200),
  org_des_date       VARCHAR2(20),
  owner_declare      VARCHAR2(200),
  owner_declare_date VARCHAR2(20),
  objections         VARCHAR2(200),
  objections_date    VARCHAR2(20),
  instruction_type   VARCHAR2(2),
  instruction        VARCHAR2(255),
  add_date           VARCHAR2(24),
  instruction_type2  VARCHAR2(2)
)
;
comment on table PER_STATEMENT
  is '˵��/����/��ע��Ϣ��';
comment on column PER_STATEMENT.report_id
  is '������';
comment on column PER_STATEMENT.serial
  is '���';
comment on column PER_STATEMENT.serial_number
  is '��ˮ��';
comment on column PER_STATEMENT.cart_type
  is '����((0:���1:���ǿ���2:׼���ǿ���3:����������4:�����ע))';
comment on column PER_STATEMENT.org_des
  is '����/��������˵��(�ѷϳ�)';
comment on column PER_STATEMENT.org_des_date
  is '������ڣ��ѷϳ���';
comment on column PER_STATEMENT.owner_declare
  is '�����������ѷϳ���';
comment on column PER_STATEMENT.owner_declare_date
  is '������ڣ��ѷϳ���';
comment on column PER_STATEMENT.objections
  is '�����ע���ѷϳ���';
comment on column PER_STATEMENT.objections_date
  is '������ڣ��ѷϳ���';
comment on column PER_STATEMENT.instruction_type
  is '˵�����ͣ�0:����/��������˵����1:����������2:�����ע��';
comment on column PER_STATEMENT.instruction
  is '˵������';
comment on column PER_STATEMENT.add_date
  is '�������';

