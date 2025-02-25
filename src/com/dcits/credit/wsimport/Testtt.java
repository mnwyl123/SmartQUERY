package com.dcits.credit.wsimport;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class Testtt {

	public static void main(String args[]){
		 String dateStr1 = "2011-09-05";
	        String dateStr2 = "2021-06-06";
	        SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
	        SimpleDateFormat format2 = new SimpleDateFormat("yyyy-MM-dd");
	        try {
	            Date date1 = format1.parse(dateStr1);
	            Date date2 = format2.parse(dateStr2);
	            long daysBetween=(date2.getTime()-date1.getTime()+1000000)/(60*60*24*1000);
	            System.out.println("相差"+differentDays(date1,date2)+"天！"+"相差了"+daysBetween);
	
	        } catch (ParseException e) {
	            e.printStackTrace();
	        }
	}
	        public static int differentDays(Date date1,Date date2){
	            Calendar calendar1 = Calendar.getInstance();
	            calendar1.setTime(date1);
	            Calendar calendar2 = Calendar.getInstance();
	            calendar2.setTime(date2);

	            int day1 = calendar1.get(Calendar.DAY_OF_YEAR);
//	            System.out.println(day1);
	            int day2 = calendar2.get(Calendar.DAY_OF_YEAR);
//	            System.out.println(day2);
	            int year1 = calendar1.get(Calendar.YEAR);
	            int year2 = calendar2.get(Calendar.YEAR);

	            if (year1 != year2)  //不同年
	            {
	                int timeDistance = 0;
	                for (int i = year1 ; i < year2 ;i++){ //闰年
	                    if (i%4==0 && i%100!=0||i%400==0){
	                        timeDistance += 366;
	                    }else { // 不是闰年
	                        timeDistance += 365;
	                    }
	                }
	                return  timeDistance + (day2-day1);
	            }else{// 同年
	                return day2-day1;
	            }

	        }
}
