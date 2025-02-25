package com.dcits.platform.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;






/**
 * 说明：密码校验 
 * 创建人： huangzwf
 * 修改时间：2016年11月28日
 * 
 * 
 */
public class PwdRuleCheck {
	public static String PWD_RULE_LOWERCASE = "lowercase";

	public static String PWD_RULE_CAPITAL = "capital";

	public static String PWD_RULE_NUMBER = "number";

	public static String PWD_RULE_SPECIALCHARACTER = "specialCharacter";

	private static String regEx = "[`~!@#$%^&*()+=|{}':;',//[//].<>/?~！@#￥%……&*（）——+|{}【】‘；：”“’。，、？]";

	/**
	 * 密码校验
	 * 
	 * @return
	 */
	public String checkPassword(PageData pd,String password) throws Exception {
		// 输出信息
		StringBuffer info = new StringBuffer("");
		// 密码校验规则
		Pattern lowercase_p = Pattern.compile("[a-z]+");
		Pattern capital_p = Pattern.compile("[A-Z]+");
		Pattern number_p = Pattern.compile("[0-9]+");
		Pattern specialCharacter_p = Pattern.compile(regEx);
		// 密码规则信息查询
		String rules = pd.getString("PASSWORD_RULE");
		// 密码长度校验
		int minLength = Integer.parseInt(pd.get("MIN_LENGTH").toString());
		int maxLength = Integer.parseInt(pd.get("MAX_LENGTH").toString());
		if (password.length() < minLength) {
			info.append("密码过短，密码长度最小为" + minLength + "!");
		}
		if (password.length() > maxLength) {
			info.append("密码过长，密码长度最大为" + maxLength + "!");
		}
		// 密码规则校验
		if (info.toString().isEmpty()) {
			Matcher m = lowercase_p.matcher(password);
			if (!rules.isEmpty() && (rules.indexOf(PWD_RULE_LOWERCASE) != -1)) {
				m.reset().usePattern(lowercase_p);
				if (!m.find()) {
					info.append("密码中必须包含小写字母");
				}
			}

			if (!rules.isEmpty() && (rules.indexOf(PWD_RULE_CAPITAL) != -1)) {
				m.reset().usePattern(capital_p);
				if (!m.find()) {
					if (info.toString().isEmpty()) {
						info.append("密码中必须包含大写字母");
					} else {
						info.append(",大写字母");
					}
				}

			}

			if (!rules.isEmpty() && (rules.indexOf(PWD_RULE_NUMBER) != -1)) {
				m.reset().usePattern(number_p);
				if (!m.find()) {
					if (info.toString().isEmpty()) {
						info.append("密码中必须包含数字");
					} else {
						info.append(",数字");
					}
				}

			}

			if (!rules.isEmpty()
					&& (rules.indexOf(PWD_RULE_SPECIALCHARACTER) != -1)) {
				m.reset().usePattern(specialCharacter_p);
				if (!m.find()) {
					if (info.toString().isEmpty()) {
						info.append("密码中必须包含特殊字符");
					} else {
						info.append(",特殊字符");
					}
				}
			}
			if (!info.toString().isEmpty()) {
				info.append("!");
			}
		}

		return info.toString();
	}

	public static void main(String[] args) {
		String pwd = "1Asdd.";
		String info = null;
		try {
			//info = checkPassword(pwd);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(info);
	}

}
