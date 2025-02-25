package com.dcits.cq.util;

public class XslUtil {

	// 一代征信xsl样式
	int num = 0;
	int num_end = 0;

	// 二代证信xsl样式
	static int mcnt1 = 0;
	static int mcnt2 = 0;

	// 一代征信xsl样式
	public int add() {
		return num += 1;
	}

	public int add_end() {
		return num_end += 1;
	}

	public String change_str(String str) {
		if (str.length() != 0) {
			return str;
		}
		return "--";
	}

	public String change_num(String num) {
		if (num.length() != 0) {
			return num;
		}
		return "0.00";
	}

	public String change_num1(String num) {
		if (num.length() != 0) {
			return num;
		}
		return "0";
	}

	// 二代证信xsl样式
	public static void init() {
		mcnt1 = 0;
		mcnt2 = 0;
	}

	public static int addm(String para1) {
		mcnt2 = mcnt1;
		mcnt1 = Integer.parseInt(para1);
		return mcnt1 - mcnt2;
	}

	public static boolean islast(String para1) {
		if (mcnt1 == Integer.parseInt(para1)) {
			return true;
		}
		return false;
	}

	public static boolean isnull() {
		if (mcnt1 == 0) {
			return true;
		}
		return false;
	}

}