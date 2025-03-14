package com.dcits.platform.util;

import net.sourceforge.pinyin4j.PinyinHelper;
import net.sourceforge.pinyin4j.format.HanyuPinyinCaseType;
import net.sourceforge.pinyin4j.format.HanyuPinyinOutputFormat;
import net.sourceforge.pinyin4j.format.HanyuPinyinToneType;
import net.sourceforge.pinyin4j.format.HanyuPinyinVCharType;
import net.sourceforge.pinyin4j.format.exception.BadHanyuPinyinOutputFormatCombination;


/**
 * 汉字解析拼音处理
 * @author pengyj: FHQpengyj
 * 修改时间：2015年11月24日
 */
public class GetPinyin {
	private static Logger logger = Logger.getLogger(GetPinyin.class);
	/**
	 * 得到 全拼
	 * @param src
	 * @return
	 */
	public static String getPingYin(String src) {
		char[] t1 = null;
		t1 = src.toCharArray();
		String[] t2 = new String[t1.length];
		HanyuPinyinOutputFormat t3 = new HanyuPinyinOutputFormat();
		t3.setCaseType(HanyuPinyinCaseType.LOWERCASE);
		t3.setToneType(HanyuPinyinToneType.WITHOUT_TONE);
		t3.setVCharType(HanyuPinyinVCharType.WITH_V);
		StringBuffer t4 = new StringBuffer();
		int t0 = t1.length;
		try {
			for (int i = 0; i < t0; i++) {
				// 判断是否为汉字字符
				if (java.lang.Character.toString(t1[i]).matches(
						"[\\u4E00-\\u9FA5]+")) {
					t2 = PinyinHelper.toHanyuPinyinStringArray(t1[i], t3);
					t4.append(t2[0]);
				} else {
					t4.append(java.lang.Character.toString(t1[i]));
				}
			}
			return t4.toString();
		} catch (BadHanyuPinyinOutputFormatCombination e1) {
			logger.debug(e1.getMessage(),e1);
		}
		return t4.toString();
	}

	/**
	 * 得到中文首字母
	 * @param str
	 * @return
	 */
	public static String getPinYinHeadChar(String str) {

		StringBuffer convert = new StringBuffer();
		for (int j = 0; j < str.length(); j++) {
			char word = str.charAt(j);
			String[] pinyinArray = PinyinHelper.toHanyuPinyinStringArray(word);
			if (pinyinArray != null) {
				convert.append(pinyinArray[0].charAt(0));
			} else {
				convert.append(word);
			}
		}
		return convert.toString();
	}

	/**
	 * 将字符串转移为ASCII码
	 * @param cnStr
	 * @return
	 */
	public static String getCnASCII(String cnStr) {
		StringBuffer strBuf = new StringBuffer();
		byte[] bGBK = cnStr.getBytes();
		for (int i = 0; i < bGBK.length; i++) {
			// System.out.println(Integer.toHexString(bGBK[i]&0xff));
			strBuf.append(Integer.toHexString(bGBK[i] & 0xff));
		}
		return strBuf.toString();
	}

	public static void main(String[] args) {

		String cnStr = "中国";
		logger.debug(getPingYin(cnStr));
		logger.debug(getPinYinHeadChar(cnStr));
	}

}
