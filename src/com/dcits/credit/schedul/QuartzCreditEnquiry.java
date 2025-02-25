package com.dcits.credit.schedul;

import com.dcits.credit.controller.test.test;
import com.dcits.credit.service.rest.PerCreditInterfaceManage;
import com.dcits.platform.util.Const;
import com.dcits.platform.util.Logger;
import com.dcits.platform.util.PageData;
import com.dcits.platform.util.PathUtil;

import org.apache.commons.lang.StringUtils;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.CollectionUtils;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


public class QuartzCreditEnquiry implements Job{
	private static Logger logger = Logger.getLogger(test.class);
    @Autowired
    private PerCreditInterfaceManage perCreditInterfaceManage;
    @Override
    public void execute(JobExecutionContext jobExecutionContext) throws JobExecutionException {
        try {
        	logger.debug("++++++++++++++++++++++++++影像信息补充开始++++++++++++++++++++++++++++");
            //读取共享目录下的txt文件
        	String path = PathUtil.getClasspathurl();
        	//String path = "C:\\Users\\Administrator\\Desktop\\zdc";
        	String[] pathStr = path.split(";");
        	for (int i = 0; i < pathStr.length; i++) {
        		logger.debug("++++++++++++++++++++++++++开始扫描路径"+pathStr[i]+"下的所有文件");
	            File file = new File(pathStr[i]);
	            if (file.exists()) {
	                getTxt(file);
	            }else{
	                logger.debug("!!!!!!!!!共享目录不存在!!!!!!!!!");
	            }
        	} 
        }catch (Exception e){
            e.printStackTrace();
            logger.debug("!!!!!!!!!更新失败!!!!!!!!!"+e);
        }
        logger.debug("++++++++++++++++++++++++++影像信息补充结束++++++++++++++++++++++++++++");
    }

    public void getTxt(File all) throws FileNotFoundException {
        //将全部txt存到list中
        List allPath = getFile(all);
        List<PageData> list = new ArrayList<>();
        // 读取txt内容 并转换成List
        for(int i = 0 ;i <allPath.size();i++){
            File file = new File(""+allPath.get(i));
            txt2String(file,list);
        }
    }
    // 读取文件夹下所有文件名
    public static List getFile(File file) {
        List listLocal = new ArrayList<>();
            File[] fileArray = file.listFiles();
            if (fileArray != null) {
                for(File name : fileArray) {
                	//String systime = new SimpleDateFormat("yyyyMMdd").format(new Date());
                    String s = name.toString();
                    if(!s.endsWith("HIST.txt")) {
                        if(name.isFile()) {
                            listLocal.add(name);
                        }
                    }
                }
            }
        logger.debug("++++++++++++++++++++++++++此路径下所有文件名"+listLocal);
        return listLocal;
    }
    /**
     * 读取txt文件的内容
     * @param file 想要读取的文件对象
     * @return 返回文件内容
     */
    public void txt2String(File file,List<PageData> list){
    	int i = 0;
    	String FILENAME = file.getName();
    	PageData pd = new PageData();
    	pd.put("FILENAME",FILENAME);
        try{
        	List<PageData> urllist = perCreditInterfaceManage.findByFile(pd);
        	if(urllist.size()>0) {
        		perCreditInterfaceManage.deleteIdUrl(pd);
        	}
        	List<PageData> urlDtalist = perCreditInterfaceManage.findByFileData(pd);
        	if(urlDtalist.size()>0) {
        		perCreditInterfaceManage.deleteUrlData(pd);
        	}
            BufferedReader br=new BufferedReader(new InputStreamReader(new FileInputStream(file),"utf-8"));
            String s = null;
            while((s = br.readLine())!=null){//使用readLine方法，一次读一行
            	i++;
                String[] str = s.split("\\|");
                PageData data = new PageData();
                if(str.length>=3) {
                	//流水号
                    data.put("QUERY_NO",str[0]);
                    //类型
                    data.put("TYPE_NO",str[1]);
                    //地址
                    data.put("ADDRESS_INFO",str[2]);
                    //来源文件名
                    data.put("FILENAME",FILENAME);
                    list.add(data);
                }
                
            }
            logger.debug("++++++++++++++++++++++++++文件"+FILENAME+"共读取数据"+i+"条");
            if(!CollectionUtils.isEmpty(list)){
	        	logger.debug("++++++++++++++++++++++++++开始更新");
	            //通过流水号更新流程状态表
	            for (PageData pd1:list ) {
	            	List<PageData> Datalist = perCreditInterfaceManage.findByChannel(pd1);
	            	if(Datalist.size()>0) {
	                	for (PageData pg:Datalist ) {
	                		pd1.put("ID", pg.get("id"));
	                		List<PageData> URLlist = perCreditInterfaceManage.findURLChannel(pd1);
	                		if(URLlist.size()==0) {
	                			perCreditInterfaceManage.updateURLDATA(pd1);
	                			perCreditInterfaceManage.updateByChannel(pd1);
		                        logger.debug("++++++++++++++++++++++++++更新成功");
	                		}
	                	}
	            	}else {
	            		perCreditInterfaceManage.updateURLDATA(pd1);
	            	}
	            }
	        }else {
	        	logger.debug("++++++++++++++++++++++++++无更新内容");
	        }
            list.clear();
            br.close();
            
            logger.debug("++++++++++++++++++++++++++转存开始++++++++++++++++++++++++++++");
            String newpath = PathUtil.getClasspathurlhist();
            logger.debug("++++++++++++++++++++++++++将文件"+FILENAME+"转存至"+newpath);
            FileInputStream fis = null;
            FileOutputStream fos = null;
            fis = new FileInputStream(file);
            fos = new FileOutputStream(new File(newpath+file.getName()));
            byte[] bs = new byte[50];
            int count=0;
            while((count=fis.read(bs))!=-1) {
            	fos.write(bs,0,count);
            	fos.flush();
            }
            fis.close();
            fos.close();
            file.delete();
            logger.debug("++++++++++++++++++++++++++转存结束++++++++++++++++++++++++++++");
        }catch(Exception e){
            e.printStackTrace();
            logger.debug("!!!!!!!!!读取txt文件的内容报错!!!!!!!!!报错信息："+FILENAME+"第"+i+"行出现错误"+e);
        }
    }
    public void updatedata(List<PageData> Datalist){
    	try {
	    	if(!CollectionUtils.isEmpty(Datalist)){
	        	logger.debug("++++++++++++++++++++++++++开始更新");
	            //通过流水号更新流程状态表
	            for (PageData pd:Datalist ) {
	            	List<PageData> list = perCreditInterfaceManage.findByChannel(pd);
	            	if(list.size()>0) {
	                	for (PageData pg:list ) {
	                		pd.put("ID", pg.get("id"));
	                		List<PageData> URLlist = perCreditInterfaceManage.findURLChannel(pd);
	                		if(URLlist.size()==0) {
	                			perCreditInterfaceManage.updateURLDATA(pd);
	                			perCreditInterfaceManage.updateByChannel(pd);
		                        logger.debug("++++++++++++++++++++++++++更新成功");
	                		}
	                	}
	            	}else {
	            		perCreditInterfaceManage.updateURLDATA(pd);
	            	}
	            }
	        }else {
	        	logger.debug("++++++++++++++++++++++++++无更新内容");
	        }
    	} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			logger.debug("!!!!!!!!!插入数据报错!!!!!!!!!报错信息："+e);
		}
    }
}
