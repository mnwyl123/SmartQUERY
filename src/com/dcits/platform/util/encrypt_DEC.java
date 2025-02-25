package com.dcits.platform.util;

import java.io.UnsupportedEncodingException;
import java.security.InvalidKeyException;

import javax.crypto.spec.DESKeySpec;

import org.apache.commons.codec.binary.Base64;

import sun.security.provider.SecureRandom;

public class encrypt_DEC {
	private static Logger logger = Logger.getLogger(encrypt_DEC.class);
	public static String md5(String str) {
		
		 Base64 base64 = new Base64();
		 String text = str;
		 String encodedtext = "";
		 try {
			byte[] textByte = text.getBytes("UTF-8");
			encodedtext = base64.encodeToString(textByte);
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			logger.error(e.getMessage(),e);
		}
		SecureRandom random = new SecureRandom();
		try {
			DESKeySpec desKey = new DESKeySpec(encodedtext.getBytes());
		} catch (InvalidKeyException e) {
			// TODO Auto-generated catch block
			logger.error(e.getMessage(),e);
		}
		
		return encodedtext;
	}
	
}
