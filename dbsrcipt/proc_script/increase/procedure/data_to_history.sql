create or replace procedure data_to_history
as
  l_step number;
  l_cnt number; --当前表数据量
  l_his_cnt number; --历史表数据量
begin
  /*
	create date：2019-05-29
	author：wangwme
  */
  --将两个月前的数据移至历史表
  l_step := 1;
  --个人信息表
  --新增数据
  insert into cifm_person_info_his(
  ID,CLIENT_NAME,CREDENTIALS_TYPE,CREDENTIALS_NO,QUERY_REASON,QUERY_VERSION,WARRANT_MATURITY_DATE,CUST_MANAGER,QUERY_TYPE,AUDITORS,REMARKS,BUSINESS_STATUS,QUERYORGCODE,USERNAME,ORIGINATEORGCODE,ORIGINATEUSERCODE,SERVICECODE,REPORTNAME
  )
  select
  A.ID,A.CLIENT_NAME,A.CREDENTIALS_TYPE,A.CREDENTIALS_NO,A.QUERY_REASON,A.QUERY_VERSION,A.WARRANT_MATURITY_DATE,A.CUST_MANAGER,A.QUERY_TYPE,A.AUDITORS,A.REMARKS,A.BUSINESS_STATUS,A.QUERYORGCODE,A.USERNAME,A.ORIGINATEORGCODE,A.ORIGINATEUSERCODE,A.SERVICECODE,A.REPORTNAME
  from cifm_person_info A inner join cifm_flow_status B on A.id = B.id 
  where B.Client_Type='1' and B.application_time<trunc(add_months(sysdate,-1),'mm');
  --对比即将删除的数据与新增数据是否一致
  select count(a.id) into l_cnt from cifm_person_info A inner join cifm_flow_status B on A.id = B.id 
    where B.Client_Type='1' and B.application_time<trunc(add_months(sysdate,-1),'mm');
  select count(b.id) into l_his_cnt from cifm_person_info_his A inner join cifm_flow_status B on A.id = B.id 
    where B.Client_Type='1' and B.application_time<trunc(add_months(sysdate,-1),'mm');
  if l_cnt=l_his_cnt then
    delete from cifm_person_info where id in(select id from cifm_flow_status where Client_Type='1' and application_time<trunc(add_months(sysdate,-1),'mm'));
    insert into data_to_history_log(execute_time,proc_name,step,status,execute_result) values(sysdate,'data_to_history',l_step,1,'个人信息表历史表(cifm_person_info_his)新增'||l_his_cnt||'条数据,个人信息表删除'||l_cnt||'条数据');
    commit;
  else
    rollback;
    insert into data_to_history_log(execute_time,proc_name,step,status,execute_result) values(sysdate,'data_to_history',l_step,0,'个人信息历史表新增数据与个人信息表即将删除数据不一致，已回滚');
    commit;
  end if;
  l_step := 2;
  --个人明细表
  --新增数据
  insert into cifm_person_detail_his(
  ID,ORG_CODE,BRANCH_CODE,BRANCH_NAME,USER_SYS_NAME,USER_REAL_NAME,QUERY_TIME,CLIENT_NAME,CREDENTIALS_TYPE,CREDENTIALS_NO,QUERY_REASON,QUERY_VERSION,IS_GET,CHECK_TIME,IP
  )
  select
  A.ID,A.ORG_CODE,A.BRANCH_CODE,A.BRANCH_NAME,A.USER_SYS_NAME,A.USER_REAL_NAME,A.QUERY_TIME,A.CLIENT_NAME,A.CREDENTIALS_TYPE,A.CREDENTIALS_NO,A.QUERY_REASON,A.QUERY_VERSION,A.IS_GET,A.CHECK_TIME,A.IP
  from cifm_person_detail A inner join cifm_flow_status B on A.id = B.id 
  where B.Client_Type='1' and B.application_time<trunc(add_months(sysdate,-1),'mm');
  --对比即将删除的数据与新增数据是否一致
  select count(a.id) into l_cnt from cifm_person_detail A inner join cifm_flow_status B on A.id = B.id 
    where B.Client_Type='1' and B.application_time<trunc(add_months(sysdate,-1),'mm');
  select count(b.id) into l_his_cnt from cifm_person_detail_his A inner join cifm_flow_status B on A.id = B.id 
    where B.Client_Type='1' and B.application_time<trunc(add_months(sysdate,-1),'mm');
  if l_cnt=l_his_cnt then
    delete from cifm_person_detail where id in(select id from cifm_flow_status where Client_Type='1' and application_time<trunc(add_months(sysdate,-1),'mm'));
    insert into data_to_history_log(execute_time,proc_name,step,status,execute_result) values(sysdate,'data_to_history',l_step,1,'个人明细表历史表(cifm_person_detail_his)新增'||l_his_cnt||'条数据,个人明细表删除'||l_cnt||'条数据');
    commit;
  else
    rollback;
    insert into data_to_history_log(execute_time,proc_name,step,status,execute_result) values(sysdate,'data_to_history',l_step,0,'个人明细历史表新增数据与个人明细表即将删除数据不一致，已回滚');
    commit;
  end if;
  l_step := 3;
  --企业信息表
  --新增数据
  insert into cifm_company_info_his(
  ID,QUERY_REASON,CHINA_CREDIT_CODE,WARRANT_MATURITY_DATE,QUERY_VERSION,COMPANY_NAME,QUERY_TYPE,CUST_MANAGER,AUDITORS,CREDENTIALS_NO_TYPE,REMARKS,BUSINESS_STATUS,SERVICECODE,REPORTNAME
  )
  select
  A.ID,A.QUERY_REASON,A.CHINA_CREDIT_CODE,A.WARRANT_MATURITY_DATE,A.QUERY_VERSION,A.COMPANY_NAME,A.QUERY_TYPE,A.CUST_MANAGER,A.AUDITORS,A.CREDENTIALS_NO_TYPE,A.REMARKS,A.BUSINESS_STATUS,A.SERVICECODE,A.REPORTNAME
  from cifm_company_info A inner join cifm_flow_status B on A.id = B.id 
  where B.Client_Type='2' and B.application_time<trunc(add_months(sysdate,-1),'mm');
  --对比即将删除的数据与新增数据是否一致
  select count(a.id) into l_cnt from cifm_company_info A inner join cifm_flow_status B on A.id = B.id 
    where B.Client_Type='2' and B.application_time<trunc(add_months(sysdate,-1),'mm');
  select count(b.id) into l_his_cnt from cifm_company_info_his A inner join cifm_flow_status B on A.id = B.id 
    where B.Client_Type='2' and B.application_time<trunc(add_months(sysdate,-1),'mm');
  if l_cnt=l_his_cnt then
    delete from cifm_company_info where id in(select id from cifm_flow_status where Client_Type='2' and application_time<trunc(add_months(sysdate,-1),'mm'));
    insert into data_to_history_log(execute_time,proc_name,step,status,execute_result) values(sysdate,'data_to_history',l_step,1,'企业信息表历史表(cifm_person_detail_his)新增'||l_his_cnt||'条数据,企业信息表删除'||l_cnt||'条数据');
    commit;
  else
    rollback;
    insert into data_to_history_log(execute_time,proc_name,step,status,execute_result) values(sysdate,'data_to_history',l_step,0,'企业信息历史表新增数据与企业信息表即将删除数据不一致，已回滚');
    commit;
  end if;
  l_step := 4;
  --企业明细表
  --新增数据
  insert into cifm_company_detail_his(
  ID,ORG_CODE,BRANCH_CODE,BRANCH_NAME,USER_SYS_NAME,USER_REAL_NAME,DEPT_CODE,QUERY_TIME,QUERY_REASON,CHINA_CREDIT_CODE,IS_GET,CHECK_TIME,IP,COMPANY_NAME,QUERY_COST
  )
  select
  A.ID,A.ORG_CODE,A.BRANCH_CODE,A.BRANCH_NAME,A.USER_SYS_NAME,A.USER_REAL_NAME,A.DEPT_CODE,A.QUERY_TIME,A.QUERY_REASON,A.CHINA_CREDIT_CODE,A.IS_GET,A.CHECK_TIME,A.IP,A.COMPANY_NAME,A.QUERY_COST
  from cifm_company_detail A inner join cifm_flow_status B on A.id = B.id 
  where B.Client_Type='2' and B.application_time<trunc(add_months(sysdate,-1),'mm');
  --对比即将删除的数据与新增数据是否一致
  select count(a.id) into l_cnt from cifm_company_detail A inner join cifm_flow_status B on A.id = B.id 
    where B.Client_Type='2' and B.application_time<trunc(add_months(sysdate,-1),'mm');
  select count(b.id) into l_his_cnt from cifm_company_detail_his A inner join cifm_flow_status B on A.id = B.id 
    where B.Client_Type='2' and B.application_time<trunc(add_months(sysdate,-1),'mm');
  if l_cnt=l_his_cnt then
    delete from cifm_company_detail where id in(select id from cifm_flow_status where Client_Type='2' and application_time<trunc(add_months(sysdate,-1),'mm'));
    insert into data_to_history_log(execute_time,proc_name,step,status,execute_result) values(sysdate,'data_to_history',l_step,1,'企业明细表历史表(cifm_person_detail_his)新增'||l_his_cnt||'条数据,企业明细表删除'||l_cnt||'条数据');
    commit;
  else
    rollback;
    insert into data_to_history_log(execute_time,proc_name,step,status,execute_result) values(sysdate,'data_to_history',l_step,0,'企业明细历史表新增数据与企业明细表即将删除数据不一致，已回滚');
    commit;
  end if;
  l_step := 5;
  --流程表
  --新增数据
  insert into cifm_flow_status_his(
  ID,USER_SYS_ID,APPLICATION_TIME,QUERY_TIME,CHECK_SYS_ID,CHECK_TIME,STATUS,IP,MAC,ANNEX,LAST_CHANGE_TIME,INTERNAL,REPORT_ID,CHECK_REJECT_RESON,CLIENT_TYPE,ORG_ID,CHANNEL_ID,IS_WX_CHECK,CHANNEL_QUERY_NO,SEND_STATUS,IS_PRINT,RERUNS_TIME,RESULTCODE,RESULTDESC,REPORTNAME
  ) 
  select
  ID,USER_SYS_ID,APPLICATION_TIME,QUERY_TIME,CHECK_SYS_ID,CHECK_TIME,STATUS,IP,MAC,ANNEX,LAST_CHANGE_TIME,INTERNAL,REPORT_ID,CHECK_REJECT_RESON,CLIENT_TYPE,ORG_ID,CHANNEL_ID,IS_WX_CHECK,CHANNEL_QUERY_NO,SEND_STATUS,IS_PRINT,RERUNS_TIME,RESULTCODE,RESULTDESC,REPORTNAME
  from cifm_flow_status 
  where application_time<trunc(add_months(sysdate,-1),'mm');
  --对比即将删除的数据与新增数据是否一致
  select count(id) into l_cnt from cifm_flow_status where application_time<trunc(add_months(sysdate,-1),'mm');
  select count(b.id) into l_his_cnt from cifm_flow_status a inner join cifm_flow_status_his b on a.id = b.id where a.application_time<trunc(add_months(sysdate,-1),'mm');
  if l_cnt=l_his_cnt then
    delete from cifm_flow_status where application_time<trunc(add_months(sysdate,-1),'mm');
    insert into data_to_history_log(execute_time,proc_name,step,status,execute_result) values(sysdate,'data_to_history',l_step,1,'流程历史表新增'||l_his_cnt||'条数据,流程表删除'||l_cnt||'条数据');
    commit;
  else
    rollback;
    insert into data_to_history_log(execute_time,proc_name,step,status,execute_result) values(sysdate,'data_to_history',l_step,0,'流程历史表新增数据与流程表即将删除数据不一致，已回滚');
    commit;
  end if;
end;
/