package com.dcits.platform.util;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.zip.Deflater;
import java.util.zip.Inflater;

import org.apache.commons.codec.binary.Base64;

/**
 * 字符串压缩工具类
 * @author 吕佳诚
 * @datetime 2019年8月6日下午2:15:17
 */
public class ZipStrUtil {
	

	




	/**
	 * deflate压缩.
	 * level
	 * 				毫秒(MS)	压缩前(MB) 	吞吐量(Mb/秒)			压缩后(MB)
		deflate (lvl=1)	4522.644	338		74.7350443679	74.7394561768
		deflate (lvl=2)	4726.477	338		71.5120374012	71.7735290527
		deflate (lvl=3)	5081.934	338		66.5101120951	69.8471069336
		deflate (lvl=4)	6739.45		338		50.1524605124	64.9452209473
		deflate (lvl=5)	7896.572	338		42.8033835442	62.6564025879
		deflate (lvl=6)	9783.701	338		34.5472536415	61.2258911133
		deflate (lvl=7)	10731.761	338		31.4952969974	61.0446929932
		deflate (lvl=8)	14760.361	338		22.8991689295	60.8825683594
		deflate (lvl=9)	14878.364	338		22.7175514727	60.8730316162
		GZIP	10351.887	338	32.651051929	61.2258911133
	 * @param inputByte
	 *            待压缩的字节数组
	 * @return 压缩后的数据
	 * @throws IOException
	 */
	public static String compress(String inputString){
		if(inputString==null||inputString.equals("")){
			return "";
		}
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
	 * deflate解压
	 * 
	 * @param inputByteQA
	 *            待解压缩的字节数组
	 * @return 解压缩后的字节数组
	 * @throws IOException
	 */
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
	


}

