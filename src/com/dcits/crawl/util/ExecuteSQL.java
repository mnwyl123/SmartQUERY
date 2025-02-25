package com.dcits.crawl.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.util.PageData;

public class ExecuteSQL {
	
	public static void main(String[] args) {
		System.out.println("1234567");
		String sql = "select CREDIT_CODE USERNAME,CURRENT_PASSWORD,"
				+"(select ORG_ID_PERBANK from sys_org where org_id = "
				+"(select org_id from sys_user_org where user_id="
				+"(select user_id from sys_user where USERNAME_PERBANK_ORG = a.credit_code and rownum=1)"
				+") and rownum=1) ORGCODE"
				+" from CIFM_CREDIT_ACCT_MANAGE a";
		ResultSet result = new ExecuteSQL().getSQLResult(sql);
		try {
			while(result.next()){
				System.out.println(result.getString("USERNAME")+"--"+result.getString("CURRENT_PASSWORD")+"--"+result.getString("ORGCODE"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	//jdbc连接数据库,执行insert/update/delete语句，无返回结果
	public void executeSQL(String sql){
		Connection con = null;  //创建一个数据库连接
		PreparedStatement pre = null; //创建预编译语句对象
		try {
			PageData pd = BaseController.getPropertiesByFileName("queryCount.properties");
			//读取连接配置
			String driver = pd.getString("DRIVER");
			String url = pd.getString("URLSTR");
			String user = pd.getString("USERNAME");
			String password = pd.getString("USERPASSWORD");
			Class.forName(driver); //加载oracle驱动
			con = DriverManager.getConnection(url,user,password); //获取连接
			pre = con.prepareStatement(sql); //实例化预编译语句
			pre.execute();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//jdbc连接数据库,执行select语句，返回结果集ResultSet
	public ResultSet getSQLResult(String sql){
		Connection con = null;  //创建一个数据库连接
		PreparedStatement pre = null; //创建预编译语句对象
		ResultSet result = null; //创建一个结果集对象
		try {
			PageData pd = BaseController.getPropertiesByFileName("queryCount.properties");
			//读取连接配置
			String driver = pd.getString("DRIVER");
			String url = pd.getString("URLSTR");
			String user = pd.getString("USERNAME");
			String password = pd.getString("USERPASSWORD");
			Class.forName(driver); //加载oracle驱动
			con = DriverManager.getConnection(url,user,password); //获取连接
			pre = con.prepareStatement(sql); //实例化预编译语句
			result = pre.executeQuery();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
