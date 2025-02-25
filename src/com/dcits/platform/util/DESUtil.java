package com.dcits.platform.util;

import java.security.Key;
import java.security.NoSuchAlgorithmException;

import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.DESKeySpec;
import javax.crypto.spec.DESedeKeySpec;
import javax.crypto.spec.IvParameterSpec;

import org.apache.commons.codec.binary.Base64;

import Decoder.BASE64Decoder;
import Decoder.BASE64Encoder;


public class DESUtil {
	 
    /**
     * 偏移变量，固定占8位字节
     */
    private final static String IV_PARAMETER = "12345678";
    /**
     * 密钥算法
     */
    private static final String ALGORITHM = "DES";
    /**
     * 加密/解密算法-工作模式-填充模式
     */
    private static final String CIPHER_ALGORITHM = "DES/CBC/PKCS5Padding";
    
    private static final String CIPHER = "DESede/ECB/PKCS5Padding";
    /**
     * 默认编码
     */
    private static final String CHARSET = "utf-8";
 
    public static String getKeyStr() throws Exception{
    	return Base64.encodeBase64String(getKey().getEncoded());
    }
    private static Key getKey() throws NoSuchAlgorithmException {
		KeyGenerator kg = KeyGenerator.getInstance("DESede");
		kg.init(168);
		SecretKey secretKey = kg.generateKey();
		return secretKey;
	}
    
    public static String encrypt2(String key, String data) {
        try {
        	DESedeKeySpec dks = new DESedeKeySpec(key.getBytes(CHARSET));
        	SecretKeyFactory keyFactory = SecretKeyFactory.getInstance("DESede");
        	SecretKey securekey = keyFactory.generateSecret(dks);
        	Cipher cipher = Cipher.getInstance(CIPHER);
        	cipher.init(Cipher.ENCRYPT_MODE, securekey);
        	
            byte[] bytes = cipher.doFinal(data.getBytes());

            //JDK1.8及以上可直接使用Base64，JDK1.7及以下可以使用BASE64Encoder
            //Android平台可以使用android.util.Base64
            return Base64.encodeBase64String(bytes).replaceAll("\r", "").replaceAll("\n", "");
 
        } catch (Exception e) {
            e.printStackTrace();
            return data;
        }
    }
    public static String decrypt2(String key, String data) {
    	
        try {
        	byte[] bytes = Base64.decodeBase64(data);
        	DESedeKeySpec dks = new DESedeKeySpec(key.getBytes(CHARSET));
        	SecretKeyFactory keyFactory = SecretKeyFactory.getInstance("DESede");
        	SecretKey securekey = keyFactory.generateSecret(dks);
        	Cipher cipher = Cipher.getInstance(CIPHER);
        	cipher.init(Cipher.ENCRYPT_MODE, securekey);
        	
        	byte[] rebytes = cipher.doFinal(bytes);
        	
            return new String(rebytes, CHARSET);
        } catch (Exception e) {
            e.printStackTrace();
            return data;
        }
    }
	/**
     * 生成key
     *
     * @param password
     * @return
     * @throws Exception
     */
    private static Key generateKey(String password) throws Exception {
        DESKeySpec dks = new DESKeySpec(password.getBytes(CHARSET));
        SecretKeyFactory keyFactory = SecretKeyFactory.getInstance(ALGORITHM);
        return keyFactory.generateSecret(dks);
    }
 
 
    /**
     * DES加密字符串
     *
     * @param password 加密密码，长度不能够小于8位
     * @param data 待加密字符串
     * @return 加密后内容
     */
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
 
    /**
     * DES解密字符串
     *
     * @param password 解密密码，长度不能够小于8位
     * @param data 待解密字符串
     * @return 解密后内容
     */
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

