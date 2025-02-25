package com.dcits.credit.entity;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.dcits.platform.util.PageData;
  
public class ReadAccess {  
	
	private final static Log logger = LogFactory.getLog(ReadAccess.class);  
	/** 
	  * TODO : 读取文件access 
	  * @param filePath,tableName 
	  * @return 
	  * @throws ClassNotFoundException  
	  */  
	 public static List<Object> readFileACCESS(String filePath,String tableName)   {  
	  List<Object> maplist= new ArrayList();  
	  
	   Statement stmt=null;  
	   ResultSet rs=null;  
	   try {
           Class.forName("com.hxtt.sql.access.AccessDriver").newInstance();
           String url = "jdbc:Access:///"+filePath;

           String sql = "select * from "+tableName;

           Connection con = DriverManager.getConnection(url, "", "");

           stmt = con.createStatement();

           rs = stmt.executeQuery(sql);

           ResultSetMetaData data=rs.getMetaData();

           while(rs.next()) {  
      	     PageData map = new PageData();
      	      for(int i = 1 ; i<= data.getColumnCount() ; i++){   
      	       //String columnName =data.getColumnName(i);    //列名  
      	       String columnName ="var"+i;
      	       String  columnValue= rs.getString(i);   
       	        map.put(columnName, columnValue);  
      	      }  
      	        maplist.add(map);     
      	     }   
           
           rs.close();
           stmt.close();
           con.close();
       }catch (Exception e) {
    	   logger.error(e.getMessage(),e);
       }
	   return maplist;   
	 } 
   // public static void main(String[] args) {  
/*    	String filePath="E:/test.mdb";
    	//List<Object> maplist=readFileACCESS(filePath);
    	
    	Map<Integer, Object[]> map = new HashMap<Integer, Object[]>();  
        String[] column ;  
        Properties prop = new Properties();    
        prop.put("charSet", "gb2312");                //这里是解决中文乱码  
        prop.put("user", "");  
        prop.put("password", "");  
       try {  
             Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");  
            //DBTest.mdb是d盘下access文件  
            String url="jdbc:odbc:Driver={MicroSoft Access Driver (*.mdb, *.accdb)};DBQ=E:/test.mdb";  
            //String url="jdbc:odbc:testdb"; 
            String user="";  
            String password="";  
            Connection con=null;  
            Statement st=null;  
             ResultSet rs=null;  
            con=DriverManager.getConnection(url,prop);  
            st=con.createStatement();  
               
             rs=st.executeQuery("select * from VSNC2017011903126510");  
              
            //读取字段名称  
            ResultSetMetaData metaDate = rs.getMetaData();     
            int number = metaDate.getColumnCount();     
            column = new String[number];     
            for (int j = 0;j < column.length; j++){     
                column[j] = metaDate.getColumnName(j + 1);     
                System.out.print(column[j]+"\t");  
            }     
            System.out.println();  
            int a = 0;  
            //输出数据  
            while(rs.next()){  
                a++;  
                Object[] rss = new Object[number];  
                for(int i = 0;i < rss.length; i++){  
                    rss[i] = rs.getString(i + 1);    
//                    System.out.print(rss[i]+"\t");  
                }  
//                System.out.println();  
                map.put(a, rss) ; 
                System.out.println(map);  
            }  
        } catch (SQLException e) {  
            e.printStackTrace();  
        }  
        catch (ClassNotFoundException e) {  
            e.printStackTrace();  
        }*/       
    	 public static void main(String argv[]) {
    		 for(int i=1;i<51;i++){
    			 try {
     	            Class.forName("com.hxtt.sql.access.AccessDriver").newInstance();

     	            //Please see Connecting to the Database section of Chapter 2. Installation in Development Document
     	            //Please change "demodata" to your database directory
     	            String url = "jdbc:Access:///E:/VSNC2018030903216298.mdb";

     	            //Please replace with your query statement.
     	            //You should read SQL syntax in HXTT Access Development Document
     	            String sql = "select * from VSNC2018030903216298";

     	            Connection con = DriverManager.getConnection(url, "", "");

     	            Statement stmt = con.createStatement();

     	            ResultSet rs = stmt.executeQuery("select * from VSNC2018030903216298");

     	            ResultSetMetaData data=rs.getMetaData();
     	            int count = 0;
     	            while(rs.next()) {  
     	            	count++;
     	       	     }   
                    logger.debug("第"+i+"次："+data.getColumnCount()+"----------"+count);
     	            rs.close();
     	            stmt.close();
     	            con.close();
     	        }
     	        catch (Exception e) {
     	            logger.debug(e.getMessage(),e);
     	        }
    		 }
    		 
    	        
    	    }
} 