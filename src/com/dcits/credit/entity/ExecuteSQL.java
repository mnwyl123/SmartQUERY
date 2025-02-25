package com.dcits.credit.entity;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.util.Logger;
import com.dcits.platform.util.PageData;

public class ExecuteSQL {
	private static Logger logger = Logger.getLogger(ExecuteSQL.class);

	public static void main(String[] args) {
		//System.out.println("1234567");
		String sql = "update SYS_INFO SET SYS_STATUS='0' WHERE SYS_NO='1'";
		new ExecuteSQL().executeSQL(sql);
		
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
			try {
				Class.forName(driver);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} //加载oracle驱动
			con = DriverManager.getConnection(url,user,password); //获取连接
			pre = con.prepareStatement(sql); //实例化预编译语句
			//pre.execute();
			pre.executeUpdate();
			logger.debug("1234567");
		} catch (SQLException e) {
			logger.error(e.getMessage(),e);
        } finally {  
            // 释放资源  
        	try {
				pre.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				logger.error(e.getMessage(),e);
			}  
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
			logger.error(e.getMessage(),e);
		}
		return result;
	}
	
}
