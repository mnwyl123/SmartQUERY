declare
  job number;
begin
 dbms_job.submit(
    job => job,
    what => 'data_to_history;',
    next_date => sysdate,
    interval => 'trunc(last_day(sysdate))+1'
  );
  commit;
end;
/