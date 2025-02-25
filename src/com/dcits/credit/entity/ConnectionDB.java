package com.dcits.credit.entity;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.util.Const;
import com.dcits.platform.util.Logger;
import com.dcits.platform.util.PageData;
import com.dcits.platform.util.PathUtil;
//import org.apache.ibatis.logging.Log;

/** 
 * 数据库连接类 
 * 说明:封装了 无参，有参，存储过程的调用 
 * @author iflytek 
 * 
 */  
public class ConnectionDB{
    private static Logger logger = Logger.getLogger(ConnectionDB.class);
	private static String queryCountDB="queryCount.properties";
    /** 
     * 创建数据库连接对象 
     */  
    private Connection connnection = null;  
  
    /** 
     * 创建PreparedStatement对象 
     */  
    private PreparedStatement preparedStatement = null;  
      
    /** 
     * 创建CallableStatement对象 
     */  
    private CallableStatement callableStatement = null;  
  
    /** 
     * 创建结果集对象 
     */  
    private ResultSet resultSet = null;  
    
  
    
  //读取服务器配置信息
  	public static PageData getQueryCountDB(){
  		PageData pd = new PageData();
  		Properties properties = new Properties();
        try{
  		properties.load(BaseController.class.getClassLoader()
  				.getResourceAsStream(queryCountDB));
        }catch(Exception e){
        	logger.error(e.getMessage(),e);
        }
  		Set<Object> keys = properties.keySet();
  		for(Object obj : keys){
  			String key = (String)obj;
  			String value = (String)properties.get(key);
  			pd.put(key, value);
  		}
  		return pd;
  	}
  
    static {  
        try {  
            // 加载数据库驱动程序  
            Class.forName(ConnectionDB.getQueryCountDB().getString("DRIVER"));  
        } catch (ClassNotFoundException e) {  
            logger.error("加载驱动错误");
            logger.error(e.getMessage(),e);
        }  
    }  
   
    /** 
     * 建立数据库连接 
     * @return 数据库连接 
     */  
    public Connection getConnection() {  
        try {  
            // 获取连接  
            connnection = DriverManager.getConnection(ConnectionDB.getQueryCountDB().getString("URLSTR"), ConnectionDB.getQueryCountDB().getString("USERNAME"),  
            		ConnectionDB.getQueryCountDB().getString("USERPASSWORD"));  
        } catch (SQLException e) {
            logger.error(e.getMessage(),e);
        }  
        return connnection;  
    }  
    /** 
     * SQL 查询将查询结果直接放入ResultSet中 
     * @param sql SQL语句 
     * @param params 参数数组，若没有参数则为null 
     * @return 结果集 
     */  
    private void executeQueryRS(Map params) {  
       ReadXML xml = new ReadXML();
       String localPath = PathUtil.getClasspath() + Const.FILEPATHFILE+params.get("fileName");  //文件路径  
   	   HashMap<String, String> map = ReadXML.getSql(localPath, "//template/sqltemplate");
       String sql="";  
       for(String key : map.keySet()){  
           sql=map.get(key).replace("V_DATA_DATE",(CharSequence) params.get("V_DATA_DATE"));
	       try {  
	           // 获得连接  
	           connnection = this.getConnection();  
	             
	           // 调用SQL  
	           preparedStatement = connnection.prepareStatement(sql);  
	           preparedStatement.executeQuery();  
	           print(sql); 
	 
	       } catch (SQLException e) {
               logger.error(e.getMessage(),e);
	           print(e.getMessage());
	       } finally {  
	           // 释放资源  
	           closeAll();  
	       } 
       }   
   } 
  
    /** 
     * 关闭所有资源 
     */  
    private void closeAll() {  
        // 关闭结果集对象  
        if (resultSet != null) {  
            try {  
                resultSet.close();  
            } catch (SQLException e) {
                logger.error(e.getMessage(),e);
            }  
        }  
  
        // 关闭PreparedStatement对象  
        if (preparedStatement != null) {  
            try {  
                preparedStatement.close();  
            } catch (SQLException e) {
                logger.error(e.getMessage(),e);
            }  
        }  
          
        // 关闭CallableStatement 对象  
        if (callableStatement != null) {  
            try {  
                callableStatement.close();  
            } catch (SQLException e)
            {
                logger.error(e.getMessage(),e);
            }  
        }  
  
        // 关闭Connection 对象  
        if (connnection != null) {  
            try {  
                connnection.close();  
            } catch (SQLException e) {
                logger.error(e.getMessage(),e);
            }  
        }     
    } 
    /** 
     * 写入日志 filePath 日志文件的路径 code 要写入日志文件的内容 
     */  
    public static  boolean print(String code) {  
        try {  
            File tofile = new File(ConnectionDB.getQueryCountDB().getString("logPath"));  
            FileWriter fw = new FileWriter(tofile, true);  
            BufferedWriter bw = new BufferedWriter(fw);  
            PrintWriter pw = new PrintWriter(bw);
            logger.debug(new SimpleDateFormat("yyyyMMdd HH:mm:ss").format(new Date())+":"+code);
            pw.println(new SimpleDateFormat("yyyyMMdd HH:mm:ss").format(new Date())+":"+code);  
            pw.close();  
            bw.close();  
            fw.close();  
            return true;  
        } catch (IOException e) {  
            return false;  
        }  
    }  
  //测试
	  public static void main(String[] args) throws SQLException {  
		  String V_DATA_DATE="20170821";
		  ConnectionDB con=new ConnectionDB();
		  Map<String, String> map=new HashMap();
		  String fileName="UserQueryCount.xml";
		  map.put("V_DATA_DATE", V_DATA_DATE);
		  map.put("fileName", fileName);
		  con.executeQueryRS(map);
	   }   
    
}  
