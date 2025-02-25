package com.dcits.credit.util;

import com.alibaba.druid.util.Base64;
import com.alibaba.druid.util.JdbcUtils;
import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import java.io.PrintStream;
import java.security.InvalidKeyException;
import java.security.Key;
import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.NoSuchAlgorithmException;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.SecureRandom;
import java.security.cert.Certificate;
import java.security.cert.CertificateFactory;
import java.security.interfaces.RSAPrivateKey;
import java.security.interfaces.RSAPublicKey;
import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.RSAPrivateKeySpec;
import java.security.spec.RSAPublicKeySpec;
import java.security.spec.X509EncodedKeySpec;
import javax.crypto.Cipher;

/**
 * 数据库密码加密解密方法
 * @author HP
 *
 */
public class ConfigTools
{
  private static final String DEFAULT_PRIVATE_KEY_STRING = "MIIBVAIBADANBgkqhkiG9w0BAQEFAASCAT4wggE6AgEAAkEAocbCrurZGbC5GArEHKlAfDSZi7gFBnd4yxOt0rwTqKBFzGyhtQLu5PRKjEiOXVa95aeIIBJ6OhC2f8FjqFUpawIDAQABAkAPejKaBYHrwUqUEEOe8lpnB6lBAsQIUFnQI/vXU4MV+MhIzW0BLVZCiarIQqUXeOhThVWXKFt8GxCykrrUsQ6BAiEA4vMVxEHBovz1di3aozzFvSMdsjTcYRRo82hS5Ru2/OECIQC2fAPoXixVTVY7bNMeuxCP4954ZkXp7fEPDINCjcQDywIgcc8XLkkPcs3Jxk7uYofaXaPbg39wuJpEmzPIxi3k0OECIGubmdpOnin3HuCP/bbjbJLNNoUdGiEmFL5hDI4UdwAdAiEAtcAwbm08bKN7pwwvyqaCBC//VnEWaq39DCzxr+Z2EIk=";
  public static final String DEFAULT_PUBLIC_KEY_STRING = "MFwwDQYJKoZIhvcNAQEBBQADSwAwSAJBAKHGwq7q2RmwuRgKxBypQHw0mYu4BQZ3eMsTrdK8E6igRcxsobUC7uT0SoxIjl1WveWniCASejoQtn/BY6hVKWsCAwEAAQ==";

  /*public static void main(String[] args)
    throws Exception
  {
    String password = "ZXGL";
    String[] arr = genKeyPair(512);
    System.out.println("privateKey:" + arr[0]);
    System.out.println("publicKey:" + arr[1]);
    System.out.println("password:" + encrypt(arr[0], password));
    System.out.println(decrypt("MFwwDQYJKoZIhvcNAQEBBQADSwAwSAJBAONqg5BSHLyqj3WBIMGP4qeme/hspzySnRNKQq5nJfZDuAXb3LBIkRyUn78D9+4WyztkuBKEsaTRLdoS3mUv//UCAwEAAQ==",
    		"mmFuTKsOeNmdKijW+4AKkAIV/EfIW2tMy+drHmCs4LJGGc0M9/tcqqoZS/D7XWKBqIatTMiy9ypWwrDvTtHc8Q=="));
    System.out.println(decrypt("MFwwDQYJKoZIhvcNAQEBBQADSwAwSAJBALYoNUklG6phOcx33vCH8mZFGt9ooLt+S+GtQsQxw3RK43/yBnRsY3wyfmX5/pDKMiIfEYVuf2KTjhotGZxI4gkCAwEAAQ==",
    		"sBIhhaeiHaL4xmW9oIzD8Y+cQHPHhKS2wz5YqhXBE6a7hk/EdMy2NpapdspPDntnqSUJrhiHK7QwuPXsYiF/2w=="));
    
  }*/

  public static String decrypt(String cipherText) throws Exception {
    return decrypt((String)null, cipherText);
  }

  public static String decrypt(String publicKeyText, String cipherText) throws Exception
  {
    PublicKey publicKey = getPublicKey(publicKeyText);

    return decrypt(publicKey, cipherText);
  }

  public static PublicKey getPublicKeyByX509(String x509File) {
    if ((x509File == null) || (x509File.length() == 0)) {
      return getPublicKey(null);
    }

    FileInputStream in = null;
    try {
      in = new FileInputStream(x509File);

      CertificateFactory factory = CertificateFactory.getInstance("X.509");

      Certificate cer = factory.generateCertificate(in);
      return cer.getPublicKey();
    } catch (Exception e) {
      throw new IllegalArgumentException("Failed to get public key", e);
    } finally {
      JdbcUtils.close(in);
    }
  }

  public static PublicKey getPublicKey(String publicKeyText) {
    if ((publicKeyText == null) || (publicKeyText.length() == 0)) {
      publicKeyText = "MFwwDQYJKoZIhvcNAQEBBQADSwAwSAJBAKHGwq7q2RmwuRgKxBypQHw0mYu4BQZ3eMsTrdK8E6igRcxsobUC7uT0SoxIjl1WveWniCASejoQtn/BY6hVKWsCAwEAAQ==";
    }
    try
    {
      byte[] publicKeyBytes = Base64.base64ToByteArray(publicKeyText);
      X509EncodedKeySpec x509KeySpec = new X509EncodedKeySpec(publicKeyBytes);

      KeyFactory keyFactory = KeyFactory.getInstance("RSA");
      return keyFactory.generatePublic(x509KeySpec);
    } catch (Exception e) {
      throw new IllegalArgumentException("Failed to get public key", e);
    }
  }

  public static PublicKey getPublicKeyByPublicKeyFile(String publicKeyFile) {
    if ((publicKeyFile == null) || (publicKeyFile.length() == 0)) {
      return getPublicKey(null);
    }

    FileInputStream in = null;
    try {
      in = new FileInputStream(publicKeyFile);
      ByteArrayOutputStream out = new ByteArrayOutputStream();
      int len = 0;
      byte[] b = new byte[64];
      while ((len = in.read(b)) != -1) {
        out.write(b, 0, len);
      }

      byte[] publicKeyBytes = out.toByteArray();
      X509EncodedKeySpec spec = new X509EncodedKeySpec(publicKeyBytes);
      KeyFactory factory = KeyFactory.getInstance("RSA");
      return factory.generatePublic(spec);
    } catch (Exception e) {
      throw new IllegalArgumentException("Failed to get public key", e);
    } finally {
      JdbcUtils.close(in);
    }
  }

  public static String decrypt(PublicKey publicKey, String cipherText) throws Exception
  {
    Cipher cipher = Cipher.getInstance("RSA");
    try {
      cipher.init(2, publicKey);
    }
    catch (InvalidKeyException e)
    {
      RSAPublicKey rsaPublicKey = (RSAPublicKey)publicKey;
      RSAPrivateKeySpec spec = new RSAPrivateKeySpec(rsaPublicKey.getModulus(), rsaPublicKey.getPublicExponent());
      Key fakePrivateKey = KeyFactory.getInstance("RSA").generatePrivate(spec);
      cipher = Cipher.getInstance("RSA");
      cipher.init(2, fakePrivateKey);
    }

    if ((cipherText == null) || (cipherText.length() == 0)) {
      return cipherText;
    }

    byte[] cipherBytes = Base64.base64ToByteArray(cipherText);
    byte[] plainBytes = cipher.doFinal(cipherBytes);

    return new String(plainBytes);
  }

  public static String encrypt(String plainText) throws Exception {
    return encrypt((String)null, plainText);
  }

  public static String encrypt(String key, String plainText) throws Exception {
    if (key == null) {
      key = "MIIBVAIBADANBgkqhkiG9w0BAQEFAASCAT4wggE6AgEAAkEAocbCrurZGbC5GArEHKlAfDSZi7gFBnd4yxOt0rwTqKBFzGyhtQLu5PRKjEiOXVa95aeIIBJ6OhC2f8FjqFUpawIDAQABAkAPejKaBYHrwUqUEEOe8lpnB6lBAsQIUFnQI/vXU4MV+MhIzW0BLVZCiarIQqUXeOhThVWXKFt8GxCykrrUsQ6BAiEA4vMVxEHBovz1di3aozzFvSMdsjTcYRRo82hS5Ru2/OECIQC2fAPoXixVTVY7bNMeuxCP4954ZkXp7fEPDINCjcQDywIgcc8XLkkPcs3Jxk7uYofaXaPbg39wuJpEmzPIxi3k0OECIGubmdpOnin3HuCP/bbjbJLNNoUdGiEmFL5hDI4UdwAdAiEAtcAwbm08bKN7pwwvyqaCBC//VnEWaq39DCzxr+Z2EIk=";
    }

    byte[] keyBytes = Base64.base64ToByteArray(key);
    return encrypt(keyBytes, plainText);
  }

  public static String encrypt(byte[] keyBytes, String plainText) throws Exception
  {
    PKCS8EncodedKeySpec spec = new PKCS8EncodedKeySpec(keyBytes);
    KeyFactory factory = KeyFactory.getInstance("RSA");
    PrivateKey privateKey = factory.generatePrivate(spec);
    Cipher cipher = Cipher.getInstance("RSA");
    try {
      cipher.init(1, privateKey);
    }
    catch (InvalidKeyException e) {
      RSAPrivateKey rsaPrivateKey = (RSAPrivateKey)privateKey;
      RSAPublicKeySpec publicKeySpec = new RSAPublicKeySpec(rsaPrivateKey.getModulus(), rsaPrivateKey.getPrivateExponent());
      Key fakePublicKey = KeyFactory.getInstance("RSA").generatePublic(publicKeySpec);
      cipher = Cipher.getInstance("RSA");
      cipher.init(1, fakePublicKey);
    }

    byte[] encryptedBytes = cipher.doFinal(plainText.getBytes("UTF-8"));
    String encryptedString = Base64.byteArrayToBase64(encryptedBytes);

    return encryptedString;
  }

  public static byte[][] genKeyPairBytes(int keySize) throws NoSuchAlgorithmException
  {
    byte[][] keyPairBytes = new byte[2][];

    KeyPairGenerator gen = KeyPairGenerator.getInstance("RSA");
    gen.initialize(keySize, new SecureRandom());
    KeyPair pair = gen.generateKeyPair();

    keyPairBytes[0] = pair.getPrivate().getEncoded();
    keyPairBytes[1] = pair.getPublic().getEncoded();

    return keyPairBytes;
  }

  public static String[] genKeyPair(int keySize) throws NoSuchAlgorithmException
  {
    byte[][] keyPairBytes = genKeyPairBytes(keySize);
    String[] keyPairs = new String[2];

    keyPairs[0] = Base64.byteArrayToBase64(keyPairBytes[0]);
    keyPairs[1] = Base64.byteArrayToBase64(keyPairBytes[1]);

    return keyPairs;
  }
}