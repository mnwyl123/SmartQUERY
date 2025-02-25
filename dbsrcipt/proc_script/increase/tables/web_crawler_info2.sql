create table WEB_CRAWLER_INFO2
(
  user_code     VARCHAR2(20) not null,
  user_pwd      VARCHAR2(300),
  local_cpu     VARCHAR2(1000),
  local_disk    VARCHAR2(1000),
  local_network VARCHAR2(1000),
  per_statement VARCHAR2(10),
  per_token     VARCHAR2(50),
  com_statement VARCHAR2(10),
  com_token     VARCHAR2(50)
)
;
alter table WEB_CRAWLER_INFO2
  add constraint PK_USER_CODE primary key (USER_CODE);

