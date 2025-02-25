create or replace function decrypt_dec(p_text varchar2) return varchar2 is
v_text varchar2(2000);
p_key varchar2(100) := 'enhjeA==';
l_text varchar2(400);
begin
  if p_text is null then
     l_text:=p_text;
   else
    dbms_obfuscation_toolkit.DESDECRYPT(input_string => UTL_RAW.CAST_TO_varchar2(p_text),key_string =>p_key, decrypted_string=> v_text);
    v_text := rtrim(v_text,chr(0));
    l_text := utl_raw.cast_to_varchar2(utl_encode.base64_decode(utl_raw.cast_to_raw(v_text)));
   end if;
return l_text;
end;
/

