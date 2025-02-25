create or replace function 
encrypt_DEC(p_text varchar2) return varchar2 is
v_text varchar2(2000);
v_enc varchar2(2000);
raw_input RAW(256) ;
key_input RAW(256) ;
decrypted_raw RAW(2048);
p_key varchar2(100) := 'enhjeA==';
l_text varchar2(2000);
begin
  if p_text is null then
     v_enc:=p_text;
   else
    l_text := utl_raw.cast_to_varchar2(utl_encode.base64_encode(utl_raw.cast_to_raw(p_text)));
    v_text := rpad( l_text, (trunc(length(l_text)/8)+1)*8, chr(0));
    raw_input := UTL_RAW.CAST_TO_RAW(v_text);
    key_input := UTL_RAW.CAST_TO_RAW(p_key);
    dbms_obfuscation_toolkit.DESEncrypt(input => raw_input,key => key_input,encrypted_data =>decrypted_raw);
    v_enc := rawtohex(decrypted_raw);
end if;
return v_enc;
end;
/

