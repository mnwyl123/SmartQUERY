package com.dcits.platform.util;

import java.text.DateFormat;
import java.text.FieldPosition;
import java.text.Format;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import com.dcits.platform.constant.DateConstant;

/** 
 * 说明：日期处理
 * 创建人：  
 * 修改时间：2015年11月24日
 * @version
 */
public class DateUtil {
	
	private final static SimpleDateFormat sdfYear = new SimpleDateFormat("yyyy");
	private final static SimpleDateFormat sdfDay = new SimpleDateFormat("yyyy-MM-dd");
	private final static SimpleDateFormat sdfDays = new SimpleDateFormat("yyyyMMdd");
	private final static SimpleDateFormat sdfTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	private final static SimpleDateFormat sdfTimes = new SimpleDateFormat("yyyyMMddHHmmss");
	private final static SimpleDateFormat sdfTimesS = new SimpleDateFormat("yyyyMMddHHmmssSSS");
	
	/**
	 * 20161212   LZX ADD
	 */
	public static final String COMPACT_DATE_FORMAT = "yyyyMMdd";
	public static final String YM = "yyyyMM";
	public static final String NORMAL_DATE_FORMAT = "yyyy-MM-dd";
	public static final String NORMAL_DATE_FORMAT_24 = "yyyy-mm-dd hh24:mi:ss";
	public static final String DATE_FORMAT = "yyyy-MM-dd";
	public static final String DATETIME_FORMAT = "yyyy-MM-dd HH:mm:ss";
	public static final String DATE_ALL = "yyyyMMddHHmmssS";

	private final static Format dateFormat = new SimpleDateFormat(
			DATETIME_FORMAT);

	private static final FieldPosition HELPER_POSITION = new FieldPosition(0);
	
	/**
	 * 获取YYYYMMDDHHmmss格式
	 * @return
	 */
	public static String getSdftimes() {
		return sdfTimes.format(new Date());
	}
	/**
	 * 获取YYYYMMDDHHmmssSSS格式
	 * @return
	 */
	public static String getSdftimesS() {
		return sdfTimesS.format(new Date());
	}

	/**
	 * 获取YYYY格式
	 * @return
	 */
	public static String getYear() {
		return sdfYear.format(new Date());
	}

	/**
	 * 获取YYYY-MM-DD格式
	 * @return
	 */
	public static String getDay() {
		return sdfDay.format(new Date());
	}
	
	/**
	 * 获取YYYYMMDD格式
	 * @return
	 */
	public static String getDays(){
		return sdfDays.format(new Date());
	}

	/**
	 * 获取YYYY-MM-DD HH:mm:ss格式
	 * @return
	 */
	public static String getTime() {
		return sdfTime.format(new Date());
	}

	/**
	* @Title: compareDate
	* @Description: TODO(日期比较，如果s>=e 返回true 否则返回false)
	* @param s
	* @param e
	* @return boolean  
	* @throws
	* @author pengyj fh
	 */
	public static boolean compareDate(String s, String e) {
		if(fomatDate(s)==null||fomatDate(e)==null){
			return false;
		}
		return fomatDate(s).getTime() >=fomatDate(e).getTime();
	}
	public static boolean compareDate2(String sdate, String edate) {
		if(sdate==null||edate==null){
			return false;
		}
		try {
			return sdfTime.parse(sdate).getTime()>=sdfTime.parse(edate).getTime();
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return false;
	}

	/**
	 * 格式化日期
	 * @return
	 */
	public static Date fomatDate(String date) {
		DateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
		try {
			return fmt.parse(date);
		} catch (ParseException e) {
			e.printStackTrace();
			return null;
		}
	}

	/**
	 * 校验日期是否合法
	 * @return
	 */
	public static boolean isValidDate(String s) {
		DateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
		try {
			fmt.parse(s);
			return true;
		} catch (Exception e) {
			// 如果throw java.text.ParseException或者NullPointerException，就说明格式不对
			return false;
		}
	}
	
	/**
	 * @param startTime
	 * @param endTime
	 * @return
	 */
	public static int getDiffYear(String startTime,String endTime) {
		DateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
		try {
			//long aa=0;
			int years=(int) (((fmt.parse(endTime).getTime()-fmt.parse(startTime).getTime())/ (1000 * 60 * 60 * 24))/365);
			return years;
		} catch (Exception e) {
			// 如果throw java.text.ParseException或者NullPointerException，就说明格式不对
			return 0;
		}
	}
	 
	/**
     * <li>功能描述：时间相减得到天数
     * @param beginDateStr
     * @param endDateStr
     * @return
     * long 
     * @author pengyj Administrator
     */
    public static long getDaySub(String beginDateStr,String endDateStr){
        long day=0;
        java.text.SimpleDateFormat format = new java.text.SimpleDateFormat("yyyy-MM-dd");
        java.util.Date beginDate = null;
        java.util.Date endDate = null;
        
            try {
				beginDate = format.parse(beginDateStr);
				endDate= format.parse(endDateStr);
	            day=(endDate.getTime()-beginDate.getTime())/(24*60*60*1000);
			} catch (ParseException e) {
				e.printStackTrace();
			}
            //System.out.println("相隔的天数="+day);
      
        return day;
    }
    
    /**
     * 得到n天之后的日期
     * @param days
     * @return
     */
    public static String getAfterDayDate(String days) {
    	int daysInt = Integer.parseInt(days);
    	
        Calendar canlendar = Calendar.getInstance(); // java.util包
        canlendar.add(Calendar.DATE, daysInt); // 日期减 如果不够减会将月变动
        Date date = canlendar.getTime();
        
        SimpleDateFormat sdfd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String dateStr = sdfd.format(date);
        
        return dateStr;
    }
    
    /**
     * 得到n天之后是周几
     * @param days
     * @return
     */
    public static String getAfterDayWeek(String days) {
    	int daysInt = Integer.parseInt(days);
        Calendar canlendar = Calendar.getInstance(); // java.util包
        canlendar.add(Calendar.DATE, daysInt); // 日期减 如果不够减会将月变动
        Date date = canlendar.getTime();
        SimpleDateFormat sdf = new SimpleDateFormat("E");
        String dateStr = sdf.format(date);
        return dateStr;
    }
    
    public static void main(String[] args) {
//    	System.out.println(getDays());
//    	System.out.println(getAfterDayWeek("3"));
//    	boolean compareDate2 = compareDate2("2019-02-15 23:11:13","2019-02-15 23:11:12");
//    	System.out.println(compareDate2);
    	System.out.println(getAfterDayDate("-1").substring(0,10));
    }
    
    /**
	 * 获取当前时间
	 * 
	 * @param date
	 * @return
	 */
	public static String nowString() {

		StringBuffer sb = new StringBuffer();

		dateFormat.format(nowDate(), sb, HELPER_POSITION);

		return sb.toString();
	}
	
	/**
	 * 获取当前时间
	 * 
	 * @param date
	 * @return
	 */
	public static String nowString(String format) {

		StringBuffer sb = new StringBuffer();
		
		Format dateFormat = new SimpleDateFormat(format);
		
		dateFormat.format(nowDate(), sb, HELPER_POSITION);

		return sb.toString();
	}

	/**
	 * 获取当前时间
	 * 
	 * @param date
	 * @return
	 */
	public static Date nowDate() {

		Calendar rightNow = Calendar.getInstance();

		return rightNow.getTime();
	}

	/**
	 * 获取当前时间
	 * 
	 * @param date
	 * @return
	 */
	public static Date getCurrentDate() {
		return new Date(System.currentTimeMillis());
	}

	/**
	 * 将时间置为23时59分钟59秒
	 * 
	 * @param date
	 * @return
	 */
	public static Date setFullPassDay(Date date) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.set(Calendar.HOUR_OF_DAY, 23);
		calendar.set(Calendar.MINUTE, 59);
		calendar.set(Calendar.SECOND, 59);
		return calendar.getTime();
	}

	/**
	 * 将时间后退2小时
	 * 
	 * @param date
	 * @return
	 */
	public static Date getFallBack2Hour(Date date) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);

		calendar.set(Calendar.HOUR_OF_DAY,
				calendar.get(Calendar.HOUR_OF_DAY) - 2);
		calendar.set(Calendar.MINUTE, 0);
		calendar.set(Calendar.SECOND, 0);
		calendar.set(Calendar.MILLISECOND, 0);
		return calendar.getTime();
	}

	/**
	 * 将时间精确到小时
	 * 
	 * @param date
	 * @return
	 */
	public static Date getTimeHour(Date date) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.set(Calendar.MINUTE, 0);
		calendar.set(Calendar.SECOND, 0);
		calendar.set(Calendar.MILLISECOND, 0);
		return calendar.getTime();
	}

	/**
	 * 获取两个时间间隔的天数
	 * 
	 * @param date
	 * @return
	 */
	public static long getDiffDays(Date startDate, Date endDate) {
		long difftime = endDate.getTime() - startDate.getTime();
		return difftime / (24L * 60L * 60L * 1000L);
	}

	/**
	 * 根据日期获取当天起始时间
	 * 
	 * 
	 * @param date
	 * @return
	 */
	public static Date getStartDateOfCurrentDay(Date date) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.set(Calendar.HOUR_OF_DAY, 0);
		calendar.set(Calendar.MINUTE, 0);
		calendar.set(Calendar.SECOND, 0);
		calendar.set(Calendar.MILLISECOND, 0);
		return calendar.getTime();
	}

	public static Date getStartYesterday(Date date) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.add(Calendar.DAY_OF_MONTH, -1);
		calendar.set(Calendar.HOUR_OF_DAY, 0);
		calendar.set(Calendar.MINUTE, 0);
		calendar.set(Calendar.SECOND, 0);
		calendar.set(Calendar.MILLISECOND, 0);
		return calendar.getTime();
	}

	/**
	 * 根据日期获取下一天起始时间
	 * 
	 * 
	 * @param date
	 * @return
	 */
	public static Date getStartDateOfNextDay(Date date) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.add(Calendar.DAY_OF_MONTH, 1);
		calendar.set(Calendar.HOUR_OF_DAY, 0);
		calendar.set(Calendar.MINUTE, 0);
		calendar.set(Calendar.SECOND, 0);
		calendar.set(Calendar.MILLISECOND, 0);
		return calendar.getTime();
	}

	/**
	 * 根据日期当前日期顺延一周后的起始时间
	 * 
	 * 
	 * @param date
	 * @return
	 */
	public static Date getStartDateOfNextSevenDay(Date date) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.add(Calendar.DAY_OF_MONTH, 7);
		calendar.set(Calendar.HOUR_OF_DAY, 0);
		calendar.set(Calendar.MINUTE, 0);
		calendar.set(Calendar.SECOND, 0);
		calendar.set(Calendar.MILLISECOND, 0);
		return calendar.getTime();
	}

	/**
	 * 根据日期当前日期顺延一周后的起始时间
	 * 
	 * 
	 * @param date
	 * @return
	 */
	public static Date getStartDateOfMonth(Date date) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.set(Calendar.DAY_OF_MONTH, 1);
		calendar.set(Calendar.HOUR_OF_DAY, 0);
		calendar.set(Calendar.MINUTE, 0);
		calendar.set(Calendar.SECOND, 0);
		calendar.set(Calendar.MILLISECOND, 0);
		return calendar.getTime();
	}

	/**
	 * 根据日期当前日期顺延一月后的起始时间
	 * 
	 * 
	 * @param date
	 * @return
	 */
	public static Date getStartDateOfNextMonth(Date date) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.add(Calendar.MONTH, 1);
		calendar.set(Calendar.DAY_OF_MONTH, 1);
		calendar.set(Calendar.HOUR_OF_DAY, 0);
		calendar.set(Calendar.MINUTE, 0);
		calendar.set(Calendar.SECOND, 0);
		calendar.set(Calendar.MILLISECOND, 0);
		return calendar.getTime();
	}

	/*
	 * 封装一天只能的时间区域
	 */
	public static List<Date> getStaticByDateDateArea(Date date) {
		List<Date> dates = new ArrayList<Date>();
		Date startdate = getStartDateOfCurrentDay(date);
		Date nextday = getStartDateOfNextDay(date);
		int step = 2;
		dates.add(startdate);
		for (int i = 1; i < 12; i++) {
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(startdate);
			calendar.add(Calendar.HOUR_OF_DAY, i * step);
			dates.add(calendar.getTime());
		}
		dates.add(nextday);
		return dates;
	}

	/*
	 * 封装一周之内时间区域
	 */
	public static List<Date> getStaticByWeekDateArea(Date date) {
		List<Date> dates = new ArrayList<Date>();
		Date startdate = getStartDateOfCurrentDay(date);
		Date nextday = getStartDateOfNextSevenDay(date);
		dates.add(startdate);
		for (int i = 1; i < 7; i++) {
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(startdate);
			calendar.add(Calendar.DAY_OF_MONTH, i);
			dates.add(calendar.getTime());
		}
		dates.add(nextday);
		return dates;
	}

	/*
	 * 封装一周之内时间区域List<String>
	 */
	public static List<String> getStaticByWeekLabel(Date date) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("MM-dd");
		List<String> dates = new ArrayList<String>();
		Date startdate = getStartDateOfCurrentDay(date);
		dates.add(dateFormat.format(startdate));
		for (int i = 1; i < 7; i++) {
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(startdate);
			calendar.add(Calendar.DAY_OF_MONTH, i);
			dates.add(dateFormat.format(calendar.getTime()));
		}
		return dates;
	}

	/*
	 * 封装一月之内时间区域
	 */
	public static List<Date> getStaticByMonthDateArea(Date date) {
		List<Date> dates = new ArrayList<Date>();
		Date startdate = getStartDateOfMonth(date);
		Date nextday = getStartDateOfNextMonth(date);
		long daydiff = getDiffDays(startdate, nextday);
		dates.add(startdate);
		for (int i = 1; i < daydiff; i++) {
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(startdate);
			calendar.add(Calendar.DAY_OF_MONTH, i);
			dates.add(calendar.getTime());
		}
		dates.add(nextday);
		return dates;
	}

	/*
	 * 封装一点时间之内的时间区域（天）
	 */
	public static List<Date> getStaticBySE(Date startDate, Date endDate) {
		List<Date> dates = new ArrayList<Date>();

		long daydiff = getDiffDays(startDate, endDate);
		dates.add(startDate);
		for (int i = 1; i < daydiff; i++) {
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(startDate);
			calendar.add(Calendar.DAY_OF_MONTH, i);
			dates.add(calendar.getTime());
		}
		dates.add(endDate);
		return dates;
	}
	
	/*
	 * 封装一月之内时间区域
	 */
	public static List<String> getStaticByMonthLabel(String date) throws Exception {
		return getStaticByMonthLabel(stringToDate(date, COMPACT_DATE_FORMAT));
	}

	/*
	 * 封装一月之内时间区域
	 */
	public static List<String> getStaticByMonthLabel(Date date) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd");
		List<String> dates = new ArrayList<String>();
		Date startdate = getStartDateOfMonth(date);
		Date nextday = getStartDateOfNextMonth(date);
		long daydiff = getDiffDays(startdate, nextday);
		dates.add(dateFormat.format(startdate));
		for (int i = 1; i < daydiff; i++) {
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(startdate);
			calendar.add(Calendar.DAY_OF_MONTH, i);
			dates.add(dateFormat.format(calendar.getTime()));
		}
		return dates;
	}
	
	/*
	 * 封装T~T-11月区域
	 */
	public static List<String> getRangeByMonthLabel(String date) throws Exception {
		return getRangeByMonthLabel(stringToDate(getMonthEnd(date), COMPACT_DATE_FORMAT));
	}
	
	/*
	 * 封装T~T-11月区域
	 */
	public static List<String> getRangeByMonthLabel(Date date) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
		List<String> dates = new ArrayList<String>();
		Date startdate = getStartDateOfNextMonth(date);
		dates.add(dateFormat.format(date));
		for (int i = 1; i < 12; i++) {
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(startdate);
			calendar.add(Calendar.MONTH, -i);
			calendar.add(Calendar.DATE, -1);
			dates.add(dateFormat.format(calendar.getTime()));
		}
		return dates;
	}
	
	/*
	 * 封装T~T-11季度区域
	 */
	public static List<String> getRangeByQuarterLabel(String date) throws Exception {
		return getRangeByQuarterLabel(stringToDate(getSeasonEnd(date), COMPACT_DATE_FORMAT));
	}
	
	/*
	 * 封装T~T-11季度区域
	 */
	public static List<String> getRangeByQuarterLabel(Date date) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
		List<String> dates = new ArrayList<String>();
		Date startdate = getStartDateOfNextMonth(date);
		dates.add(dateFormat.format(date));
		for (int i = 1; i < 12; i++) {
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(startdate);
			calendar.add(Calendar.MONTH, -i*3);
			calendar.add(Calendar.DATE, -1);
			dates.add(dateFormat.format(calendar.getTime()));
		}
		return dates;
	}

	/*
	 * 封装T~T-11季度区域
	 */
	public static List<String> getRangeByHalfYearLabel(String date) throws Exception {
		return getRangeByHalfYearLabel(stringToDate(getHalfYearEnd(date), COMPACT_DATE_FORMAT));
	}
	
	/*
	 * 封装T~T-11季度区域
	 */
	public static List<String> getRangeByHalfYearLabel(Date date) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
		List<String> dates = new ArrayList<String>();
		Date startdate = getStartDateOfNextMonth(date);
		dates.add(dateFormat.format(date));
		for (int i = 1; i < 12; i++) {
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(startdate);
			calendar.add(Calendar.MONTH, -i*6);
			calendar.add(Calendar.DATE, -1);
			dates.add(dateFormat.format(calendar.getTime()));
		}
		return dates;
	}
	
	/*
	 * 封装T~T-11年区域
	 */
	public static List<String> getRangeByYearLabel(String date) throws Exception {
		return getRangeByYearLabel(stringToDate(getYearEnd(date), COMPACT_DATE_FORMAT));
	}
	
	/*
	 * 封装T~T-11年区域
	 */
	public static List<String> getRangeByYearLabel(Date date) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
		List<String> dates = new ArrayList<String>();
		dates.add(dateFormat.format(date));
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		int year = calendar.get(Calendar.YEAR);
		for (int i = 1; i < 12; i++) {
			dates.add((year - i) + "1231");
		}
		return dates;
	}
	/*
	public static void main(String arg[]) {
		try {
			List<String> dates = getRangeByHalfYearLabel("20150201");
			for (String temp : dates) {
				System.out.println(temp);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}*/
	
	public static String formatDate(String format, Date date) {
		SimpleDateFormat dateFormat = new SimpleDateFormat(format);
		return dateFormat.format(date);
	}

	public static java.util.Date stringToDate(String paramString1,
			String paramString2) throws Exception {
		SimpleDateFormat localSimpleDateFormat = new SimpleDateFormat(
				paramString2);
		localSimpleDateFormat.setLenient(false);
		try {
			return localSimpleDateFormat.parse(paramString1);
		} catch (ParseException localParseException) {
			throw new Exception("解析日期字符串时出错！");
		}
	}

	public static String dateToString(java.util.Date paramDate,
			String paramString) {
		SimpleDateFormat localSimpleDateFormat = new SimpleDateFormat(
				paramString);
		localSimpleDateFormat.setLenient(false);
		return localSimpleDateFormat.format(paramDate);
	}

	/**
	 * 通过频率转换日期
	 * 
	 * @param date
	 * @param freq
	 * @return 日期
	 */
	public static String dateDesc(String date, String freq) {
		String result = null;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		try {
			Date dd = sdf.parse(date);
			Calendar localTime = Calendar.getInstance();
			localTime.setTime(dd);
			// D 日 M 月 Q 季 H 半年 Y年 T 旬 W 周
			int y = localTime.get(Calendar.YEAR);
			int m = localTime.get(Calendar.MONTH) + 1;
			int d = localTime.get(Calendar.DATE);
			switch (freq.charAt(0)) {
			case 'D':
				result = y + DateConstant.YEAR_DESC + m
						+ DateConstant.MONTH_DESC + d + DateConstant.DAY_DESC;
				break;
			case 'W':
				result = y + DateConstant.YEAR_DESC + m
						+ DateConstant.MONTH_DESC + d + DateConstant.DAY_DESC;
				break;
			case 'T':
				result = y
						+ DateConstant.YEAR_DESC
						+ m
						+ DateConstant.MONTH_DESC
						+ ((d > 0 && d <= 10) ? DateConstant.FIRST_TEN_DAYS
								: (d > 10 && d <= 20) ? DateConstant.MIDDLE_TEN_DAYS
										: DateConstant.LAST_TEN_DAYS);
				break;
			case 'M':
				result = y + DateConstant.YEAR_DESC + m
						+ DateConstant.MONTH_DESC;
				break;
			case 'Q':
				result = y
						+ DateConstant.YEAR_DESC
						+ (m <= 3 ? DateConstant.FIRST_QUARTER
								: m <= 6 ? DateConstant.SECONDLY_QUARTER
										: m <= 9 ? DateConstant.THIRDLY_QUARTER
												: DateConstant.FOURTHLY_QUARTER);
				break;
			case 'H':
				result = y
						+ DateConstant.YEAR_DESC
						+ (m <= 6 ? DateConstant.FIRST_HALF_YEAR
								: DateConstant.LAST_HALF_YEAR);
				break;
			case 'Y':
				result = y + DateConstant.YEAR_DESC;
				break;
			default:
				result = date;
				break;
			}
		} catch (ParseException e) {
			return date;
		}
		return result;
	}
	
	/**
	 * 功能：得到昨天日期  格式为：yyyyMMdd
	 * @param date
	 * @return
	 * @throws ParseException 
	 */
	public static String getLastDayDate(String date) throws ParseException{
		Date d = sdfDays.parse(date);
		Calendar endCalendar = Calendar.getInstance();  
		endCalendar.setTime(d);
        endCalendar.add(Calendar.DAY_OF_MONTH, -1);
        return sdfDays.format(endCalendar.getTime());
	}
	
	/**
	 * 功能：得到当前月份月底 格式为：yyyyMMdd (eg: 2007-12-31)
	 * 
	 * @return String
	 * @throws ParseException
	 **/
	public static String getMonthEnd(String date) throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		Date d = sdf.parse(date);
		Calendar localTime = Calendar.getInstance();
		localTime.setTime(d);
		String strY = null;
		String strZ = null;
		boolean leap = false;
		int x = localTime.get(Calendar.YEAR);
		int y = localTime.get(Calendar.MONTH) + 1;
		if (y == 1 || y == 3 || y == 5 || y == 7 || y == 8 || y == 10
				|| y == 12) {
			strZ = "31";
		}
		if (y == 4 || y == 6 || y == 9 || y == 11) {
			strZ = "30";
		}
		if (y == 2) {
			leap = leapYear(x);
			if (leap) {
				strZ = "29";
			} else {
				strZ = "28";
			}
		}
		strY = y >= 10 ? String.valueOf(y) : ("0" + y);
		return x + strY + strZ;
	}
	
	/**
	 * 功能：得到上个月月末 格式为：yyyyMMdd
	 * @param date
	 * @return
	 * @throws ParseException 
	 */
	public static String getLastMonthEnd(String date) throws ParseException{
		Date d = sdfDays.parse(date);
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(d);
		calendar.add(Calendar.MONTH, -1);
		calendar.set(Calendar.DAY_OF_MONTH, calendar.getActualMaximum(Calendar.DAY_OF_MONTH));
		return sdfDays.format(calendar.getTime());
	}
	

	/**
	 * 功能：得到当前季度季末 格式为：yyyyMMdd (eg: 2007-12-31)<br>
	 * 
	 * @return String
	 * @throws ParseException
	 */
	public static String getSeasonEnd(String date) throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		Date d = sdf.parse(date);
		Calendar localTime = Calendar.getInstance();
		localTime.setTime(d);
		String dateString = "";
		int x = localTime.get(Calendar.YEAR);
		int y = localTime.get(Calendar.MONTH) + 1;
		if (y >= 1 && y <= 3) {
			dateString = x + "03" + "31";
		}
		if (y >= 4 && y <= 6) {
			dateString = x + "06" + "30";
		}
		if (y >= 7 && y <= 9) {
			dateString = x + "09" + "30";
		}
		if (y >= 10 && y <= 12) {
			dateString = x + "12" + "31";
		}
		return dateString;
	}
	
	/**
	 * 功能：得到上季度季末 格式为：yyyyMMdd
	 * @param date
	 * @return
	 * @throws ParseException
	 */
	public static String getLastSeasonEnd(String date) throws ParseException{
		Date d = sdfDays.parse(date);
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(d);
		calendar.set(Calendar.MONTH, ((int) calendar.get(Calendar.MONTH) / 3 - 1) * 3 + 2);  
		calendar.set(Calendar.DAY_OF_MONTH, calendar.getActualMaximum(Calendar.DAY_OF_MONTH)); 
		return sdfDays.format(calendar.getTime());
	}
	
	
	/**
	 * 功能：得到当前半年底 格式为：yyyyMMdd (eg: 2007-12-31)<br>
	 * 
	 * @return String
	 * @throws ParseException
	 */
	public static String getHalfYearEnd(String date) throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		Date d = sdf.parse(date);
		Calendar localTime = Calendar.getInstance();
		localTime.setTime(d);
		int x = localTime.get(Calendar.YEAR);
		int y = localTime.get(Calendar.MONTH);
		return x + ((y > 5) ? "1231":"0630");
	}
	
	/**
	 * 功能：得到当前日期所对上半年底 格式为：yyyyMMdd
	 * @param date
	 * @return
	 * @throws ParseException
	 */
	public static String getLastHalfYearEnd(String date) throws ParseException{
		Date d = sdfDays.parse(date);
		Calendar localTime = Calendar.getInstance();
		localTime.setTime(d);
		int x = localTime.get(Calendar.YEAR);
		int y = localTime.get(Calendar.MONTH);
		if(y>5){
			return x +  "06" + "30";
		}
		localTime.add(Calendar.YEAR,-1);
		int z = localTime.get(Calendar.YEAR);
		return z + "12" + "31";
	}
	

	/**
	 * 功能：得到当前年份年底 格式为：yyyyMMdd (eg: 2007-12-31)<br>
	 * 
	 * @return String
	 * @throws ParseException
	 */
	public static String getYearEnd(String date) throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		Date d = sdf.parse(date);
		Calendar localTime = Calendar.getInstance();
		localTime.setTime(d);
		int x = localTime.get(Calendar.YEAR);
		return x + "12" + "31";
	}

	/**
	 * 功能：得到上年年底日期 格式为：yyyyMMdd
	 * @param date
	 * @return
	 * @throws ParseException
	 */
	public static String getLastYearEnd(String date) throws ParseException{
		Date d = sdfDays.parse(date);
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(d);
		calendar.add(Calendar.YEAR,-1);
		int x = calendar.get(Calendar.YEAR);
		return x + "12" + "31";
	}
	
	/**
	 * 功能：判断输入年份是否为闰年<br>
	 * 
	 * @param year
	 * @return 是：true 否：false
	 */
	public static boolean leapYear(int year) {

		boolean leap;
		if (year % 4 == 0) {
			if (year % 100 == 0) {
				if (year % 400 == 0)
					leap = true;
				else
					leap = false;
			} else
				leap = true;
		} else
			leap = false;
		return leap;
	}
	

	/**
	 * 功能：判断输入年份是否为闰年<br>
	 * 
	 * @param year
	 * @throws ParseException 
	 */
	public static String toStringCN(String date) throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		Date d = sdf.parse(date);
		Calendar localTime = Calendar.getInstance();
		localTime.setTime(d);
		int x = localTime.get(Calendar.YEAR);
		int y = localTime.get(Calendar.MONTH) +1;
		int z = localTime.get(Calendar.DATE);
		return x + "年" + y + "月" + z +"日";
	}

}
