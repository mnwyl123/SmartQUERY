package com.dcits.credit;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.security.Key;
import java.sql.SQLException;
import java.util.zip.Deflater;
import java.util.zip.GZIPInputStream;
import java.util.zip.Inflater;

import javax.crypto.Cipher;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.DESKeySpec;
import javax.crypto.spec.IvParameterSpec;

import org.apache.commons.codec.binary.Base64;

import Decoder.BASE64Decoder;
import Decoder.BASE64Encoder;


public class test2 {
	
	
	
	@SuppressWarnings("static-access")
	public static void main(String[] args) throws SQLException, MalformedURLException, InterruptedException {
        
		Long query_no54 = (long) 292490;//流水号需要更改
		Long query_no54i = (long) 292215;//流水号需要更改
		//个人申请接口
		URL url54p = new URL("http://10.16.0.21:8080/SmartSense/rest/personInterface/queryRequest");
		URL url54pf = new URL("http://10.16.0.21:8080/SmartSense/rest/personInterface/queryRequestFast");	
		URL url54pp = new URL("http://10.16.0.21:8080/SmartSense/rest/personInterface/queryReport");
		URL url54pb = new URL("http://10.16.0.21:8080/SmartSense/rest/personInterface/queryRequest_batch");	
//		URL url54c = new URL("http://10.15.0.20:8080/SmartSense/rest/companyInterface/queryRequest");	
//		URL url54cp = new URL("http://10.15.0.20:8080/SmartSense/rest/companyInterface/queryRequest");	

// 		for(int i=0;i<10000;i++){
// 			query_no54++;
// 			query_no51++;
// 			String name54 = "北京报样本公司546"+i;
// 			String name51 = "北京报样本公司516"+i;
// 			String  param54 =  "{\"USERNAME\":\"cxy\","
// 	         		+ "\"CLIENT_NAME\":\""+name54+"\",\"CREDENTIALS_NO_TYPE\":\"10\",\"CHINA_CREDIT_CODE\":\"110000UE0UPWH877\","
// 	         		+ "\"QUERY_REASON\":\"01\",\"CHANNEL_ID\":\"cip\",\"IS_CHECK_IMAGE\":\"0\",\"CUST_MANAGER\":\"3333\",\"IS_USE\":\"1\","
// 	         		+ "\"CHANNEL_QUERY_NO\":\""+query_no54+"\",\"WARRANT_MATURITY_DATE\":\"99991230\",\"PRO_ID\":\"100005\",\"WARRANT\":\"111\""
// 	         		+ ",\"QUERY_NO\":\"111\",\"LOAN_APPLICATION\":\"333,222\",\"IDENTITY_DOCUMENT\":\"1111\""
// 	         		+ ",\"SQTIME\":\"2020-02-02 11:11:11\"}";
// 			String  param51 =  "{\"USERNAME\":\"cxy\","
// 	         		+ "\"CLIENT_NAME\":\""+name51+"\",\"CREDENTIALS_NO_TYPE\":\"10\",\"CHINA_CREDIT_CODE\":\"110000UE0UPWH877\","
// 	         		+ "\"QUERY_REASON\":\"01\",\"CHANNEL_ID\":\"cip\",\"IS_CHECK_IMAGE\":\"0\",\"CUST_MANAGER\":\"3333\",\"IS_USE\":\"1\","
// 	         		+ "\"CHANNEL_QUERY_NO\":\""+query_no51+"\",\"WARRANT_MATURITY_DATE\":\"99991230\",\"PRO_ID\":\"100005\",\"WARRANT\":\"111\""
// 	         		+ ",\"QUERY_NO\":\"111\",\"LOAN_APPLICATION\":\"333,222\",\"IDENTITY_DOCUMENT\":\"1111\""
// 	         		+ ",\"SQTIME\":\"2020-02-02 11:11:11\"}";
// 			WbSave(param54,url54c,111); 
// 	 		WbSave(param51,url51c,111); 
// 		}

			int na = 2983;
 		for(int i=0;i<1000;i++){
 			query_no54++;
 			query_no54i++;
 			na++;
 			String name54 = "王"+na+"小二";
 			String name54i = "王66568小二"+i;
 			String  param54 =  "{\"USERNAME\":\"mn\","
 	         		+ "\"CLIENT_NAME\":\""+name54+"\",\"CREDENTIALS_TYPE\":\"10\",\"CREDENTIALS_NO\":\"622926198501293785\","
 	         		+ "\"QUERY_REASON\":\"01\",\"CHANNEL_ID\":\"1\",\"IS_CHECK_IMAGE\":\"0\",\"CUST_MANAGER\":\"3333\",\"IS_USE\":\"0\","
 	         		+ "\"CHANNEL_QUERY_NO\":\""+query_no54.toString()+"\",\"WARRANT_MATURITY_DATE\":\"99991230\",\"PRO_ID\":\"100005\",\"WARRANT\":\"111\""
 	         		+ ",\"QUERY_NO\":\"111\",\"LOAN_APPLICATION\":\"333,222\",\"IDENTITY_DOCUMENT\":\"1111\""
 	         		+ ",\"SQTIME\":\"2020-02-02 11:11:11\",\"responseType\":\"3\"}";
 			String  param54i =  "{\"USERNAME\":\"mn\","
 	         		+ "\"CLIENT_NAME\":\""+name54i+"\",\"CREDENTIALS_TYPE\":\"10\",\"CREDENTIALS_NO\":\"622926198501293785\","
 	         		+ "\"QUERY_REASON\":\"01\",\"CHANNEL_ID\":\"1\",\"IS_CHECK_IMAGE\":\"0\",\"CUST_MANAGER\":\"3333\",\"IS_USE\":\"0\","
 	         		+ "\"CHANNEL_QUERY_NO\":\""+query_no54i.toString()+"\",\"WARRANT_MATURITY_DATE\":\"99991230\",\"PRO_ID\":\"100005\",\"WARRANT\":\"111\""
 	         		+ ",\"QUERY_NO\":\"111\",\"LOAN_APPLICATION\":\"333,222\",\"IDENTITY_DOCUMENT\":\"1111\""
 	         		+ ",\"SQTIME\":\"2020-02-02 11:11:11\",\"responseType\":\"3\"}";
 			String param54m ="["+ param54+","+param54i+"]";
// 			WbSave(param54,url54p,111); 
// 			Thread.sleep(3000);
 			WbSave(param54,url54pf,111); 
// 			WbSave(param54i,url54pf,222); 
 	 		Thread.sleep(1000);
 		}
 		//URL url12 = new URL("http://10.15.0.20:8080/SmartSense/rest/personInterface/queryReport");		
		//String  param12 =  "{\"USERNAME\":\"cxy\",\"CHANNEL_ID\":\"1\",\"CHANNEL_QUERY_NO\":\""+query_no+"\"}";
		//WbSave(param12,url12,12);
// 		String str = "eNplkDFvAyEMhf8Lc6aOtznwUCxxQA3c9VRVTB26tFIidan633N3GSDJgvQ+2/g9/6kIqUdKrNXw/nHYZYqhNOV4QlOaBJCuGsjXVMaRZGn0tUCWZ7w3G2Ri1/0oMJsDVPY2NC6ItPSryOb1XeFDY5hRM70hNTRBDOvcwDYhussR4cll7oeihIkNfK62eLMt6p3PNUEX4XwXkxxb1pQ5+M6oGdnzGmAmMQ3Pp+BQHR3hHhLcztUf5vfzfPn6+VaDelH/V38eeCk=";
// 		String strr = "";
 		try {
 			//strr = decoderBase64File(str);//人行解密
//			strr = uncompress(str);//cip解密
 			//strr = compress(str);//cip加密
 			//strr = decrypt("enhjeA==", str);//数据库解密
			//strr = encrypt("enhjeA==", str);
// 			strr = URLDecoder.decode(str, "utf-8");
 			//strr =URLEncoder.encode(str, "utf-8");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
// 		System.out.println(strr);
 		return;
// 		String str1 = "中国吉林省长春市净月中信城中央公园中国吉林省长春市净月中信城中央公园中国吉林省长";
// 		str1 = encrypt("enhjeA==", str1);
// 		System.out.println(str1.length());
	}  
	public static String compress(String inputString){
		int len = 0;
		Deflater defl = new Deflater();
		defl.setLevel(9);//压缩级别，1-9级。级别越大，压缩率越大，耗时也越大。
		defl.setInput(inputString.getBytes());
		defl.finish();
		ByteArrayOutputStream bos = new ByteArrayOutputStream();
		byte[] outputByte = new byte[1024];
		try {
			while (!defl.finished()) {
				// 压缩并将压缩后的内容输出到字节输出流bos中
				len = defl.deflate(outputByte);
				bos.write(outputByte, 0, len);
			}
			defl.end();
		}catch (Exception e) {
		} finally {
			try {
				bos.close();
			} catch (IOException e) {
			}
		}
		return Base64.encodeBase64String(bos.toByteArray());
	}
	/**
    * 征信查询申请资料上传
    * @param str
    */
	@SuppressWarnings("unused")
	public static void WbSave(String str,URL StrUrl,int i) {
		URL url;
		try {
			byte[] b = str.getBytes("utf-8");
			url = StrUrl;		
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");// 提交模式
			// 是否允许输入输出
			conn.setDoInput(true);
			conn.setDoOutput(true);
			//conn.setConnectTimeout(600000);// 连接超时 单位毫秒
			conn.setReadTimeout(600000);// 读取超时 单位毫秒
			// 设置请求头里面的数据，以下设置用于解决http请求code415的问题
			conn.setRequestProperty("Content-Type",
					"application/json;charset=UTF-8");
			// 链接地址
			conn.connect();
			// 发送参数
			OutputStream writer = conn.getOutputStream();
			writer.write(b);

			// 清理当前编辑器的左右缓冲区，并使缓冲区数据写入基础流
			writer.flush();
			writer.close();
			if (conn.getResponseCode() != 200) {
				throw new RuntimeException("Failed : HTTP error code : "
						+ conn.getResponseCode());
			}
			BufferedReader reader = new BufferedReader(new InputStreamReader(
					conn.getInputStream(), "utf-8"));
			String lines = reader.readLine();// 读取请求结果
//			System.out.println(i+"----"+lines);
			// JSONObject js=JSONObject.fromObject(lines);
			reader.close();
			conn.disconnect();
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e){
			System.out.println("4444444444444444444444444444444444444444444444");
			e.printStackTrace();
		}
		
	}
	public static String decoderBase64File(String base64Code)throws Exception{
		String str = null;
		byte[] buffer = new BASE64Decoder().decodeBuffer(base64Code);
//		System.out.println("3333333333333"+buffer);
		byte[] b = uncompress(buffer);
		
//		System.out.println("666666666"+b);
		String s = new String(b,"UTF-8");
//		System.out.println("777777"+s);
	    str = new String(buffer,"UTF-8");
	    return s;
	}
	public static byte[] uncompress(byte[] data) throws IOException {
		if (data == null || data.length == 0) {
			return data;
		}
		ByteArrayOutputStream out = new ByteArrayOutputStream();
		ByteArrayInputStream in = new ByteArrayInputStream(data);
		GZIPInputStream gunzip = new GZIPInputStream(in);
		byte[] buffer = new byte[256];
		int n;
		while ((n = gunzip.read(buffer)) >= 0) {
			out.write(buffer, 0, n);
		}
		gunzip.close();
		in.close();
		return out.toByteArray();
	}
	
	public static String uncompress(String inputString)  {
		int len = 0;
		Inflater infl = new Inflater();
		infl.setInput(Base64.decodeBase64(inputString));
		ByteArrayOutputStream bos = new ByteArrayOutputStream();
		byte[] outByte = new byte[1024];
		try {
			while (!infl.finished()) {
				// 解压缩并将解压缩后的内容输出到字节输出流bos中
				len = infl.inflate(outByte);
				if (len == 0) {
					break;
				}
				bos.write(outByte, 0, len);
			}
			infl.end();
		} catch (Exception e) {
		} finally {
			try {
				bos.close();
			} catch (IOException e) {
			}
		}
		return bos.toString();
	}
	public static String encrypt(String password, String data) {
        if (password== null || password.length() < 8) {
            throw new RuntimeException("加密失败，key不能小于8位");
        }
        if (data == null)
            return null;
        BASE64Encoder base64Encoder = new BASE64Encoder();
        try {
            Key secretKey = generateKey(password);
            Cipher cipher = Cipher.getInstance(CIPHER_ALGORITHM);
            IvParameterSpec iv = new IvParameterSpec(IV_PARAMETER.getBytes(CHARSET));
            cipher.init(Cipher.ENCRYPT_MODE, secretKey, iv);
            byte[] bytes = cipher.doFinal(data.getBytes(CHARSET));
 
            //JDK1.8及以上可直接使用Base64，JDK1.7及以下可以使用BASE64Encoder
            //Android平台可以使用android.util.Base64
            return new String(base64Encoder.encode(bytes));
 
        } catch (Exception e) {
            e.printStackTrace();
            return data;
        }
    }
	 private static Key generateKey(String password) throws Exception {
	        DESKeySpec dks = new DESKeySpec(password.getBytes(CHARSET));
	        SecretKeyFactory keyFactory = SecretKeyFactory.getInstance(ALGORITHM);
	        return keyFactory.generateSecret(dks);
	    }
	 private static final String CHARSET = "utf-8";
	 private static final String ALGORITHM = "DES";
	 private static final String CIPHER_ALGORITHM = "DES/CBC/PKCS5Padding";
	 private final static String IV_PARAMETER = "12345678";
	 
	 public static String decrypt(String password, String data) {
	        if (password== null || password.length() < 8) {
	            throw new RuntimeException("加密失败，key不能小于8位");
	        }
	        if (data == null)
	            return null;
	        BASE64Decoder base64decoder = new BASE64Decoder();
	        try {
	            Key secretKey = generateKey(password);
	            Cipher cipher = Cipher.getInstance(CIPHER_ALGORITHM);
	            IvParameterSpec iv = new IvParameterSpec(IV_PARAMETER.getBytes(CHARSET));
	            cipher.init(Cipher.DECRYPT_MODE, secretKey, iv);
	            return new String(cipher.doFinal(base64decoder.decodeBuffer(data)), CHARSET);
	        } catch (Exception e) {
	            e.printStackTrace();
	            return data;
	        }
	    }
}

