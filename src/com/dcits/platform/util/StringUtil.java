package com.dcits.platform.util;

import java.util.List;

/**
 * 字符串相关方法
 *
 */
public class StringUtil {

	/**
	 * 将以逗号分隔的字符串转换成字符串数组
	 * @param valStr
	 * @return String[]
	 */
	public static String[] StrList(String valStr){
	    int i = 0;
	    String TempStr = valStr;
	    String[] returnStr = new String[valStr.length() + 1 - TempStr.replace(",", "").length()];
	    valStr = valStr + ",";
	    while (valStr.indexOf(',') > 0)
	    {
	        returnStr[i] = valStr.substring(0, valStr.indexOf(','));
	        valStr = valStr.substring(valStr.indexOf(',')+1 , valStr.length());
	        
	        i++;
	    }
	    return returnStr;
	}
	
	/**获取字符串编码
	 * @param str
	 * @return
	 */
	public static String getEncoding(String str) {      
	       String encode = "GB2312";      
	      try {      
	          if (str.equals(new String(str.getBytes(encode), encode))) {      
	               String s = encode;      
	              return s;      
	           }      
	       } catch (Exception exception) {      
	       }      
	       encode = "ISO-8859-1";      
	      try {      
	          if (str.equals(new String(str.getBytes(encode), encode))) {      
	               String s1 = encode;      
	              return s1;      
	           }      
	       } catch (Exception exception1) {      
	       }      
	       encode = "UTF-8";      
	      try {      
	          if (str.equals(new String(str.getBytes(encode), encode))) {      
	               String s2 = encode;      
	              return s2;      
	           }      
	       } catch (Exception exception2) {      
	       }      
	       encode = "GBK";      
	      try {      
	          if (str.equals(new String(str.getBytes(encode), encode))) {      
	               String s3 = encode;      
	              return s3;      
	           }      
	       } catch (Exception exception3) {      
	       }      
	      return "";      
	   } 
	
	public static String concat(String[] str, String space) {
		StringBuffer result = new StringBuffer();
		if (str == null) {
			return null;
		}
		for (String temp : str) {
			result.append(temp).append(space);
		}
		result.deleteCharAt(result.length() - 1);
		return result.toString();
	}
	
	/**
     * Check if the string supplied is empty.  A String is empty when it is null or when the length is 0
     * @param string The string to check
     * @return true if the string supplied is empty
     */
    public static final boolean isEmpty(String string)
    {
    	return string==null || string.length()==0;
    }
    
    /**
     * Check if the stringBuffer supplied is empty.  A StringBuffer is empty when it is null or when the length is 0
     * @param string The stringBuffer to check
     * @return true if the stringBuffer supplied is empty
     */
    public static final boolean isEmpty(StringBuffer string)
    {
    	return string==null || string.length()==0;
    }
    
    /**
     * Check if the string array supplied is empty.  A String array is empty when it is null or when the number of elements is 0
     * @param string The string array to check
     * @return true if the string array supplied is empty
     */
    public static final boolean isEmpty(String[] strings)
    {
        return strings==null || strings.length==0;
    }

    /**
     * Check if the array supplied is empty.  An array is empty when it is null or when the length is 0
     * @param array The array to check
     * @return true if the array supplied is empty
     */
    public static final boolean isEmpty(Object[] array)
    {
     return array==null || array.length==0;
    }
    
    /**
     * Check if the list supplied is empty.  An array is empty when it is null or when the length is 0
     * @param list the list to check
     * @return true if the supplied list is empty
     */
    public static final boolean isEmpty(List<?> list)
    {
     return list==null || list.size()==0;
    }
}
