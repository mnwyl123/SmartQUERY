package com.dcits.credit.util;

import java.util.HashMap;
import java.util.Map;
import java.util.Stack;

import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

import com.dcits.credit.service.numRead.NumReadService;
import com.dcits.platform.util.Logger;

public class MySAXHandler  extends DefaultHandler{
	
	private static Logger logger = Logger.getLogger(MySAXHandler.class);
	
	public MySAXHandler(String COMPANY,String fileName,NumReadService numReadService){
		this.COMPANY = COMPANY;
		this.RE_FILE_NAME = fileName;
		this.numReadService = numReadService;
	}
	//存放数值
	private int count = 0;
	private String sqlV = "";
	private NumReadService numReadService;
	private String sql="INSERT INTO CIFM_NUMREADR_SUCC_LOG(USER_CODE,ORG_CODE,REQUEST_NO,RESULT_TYPE,SCORE,FACTORS,POSITION,SCORE_DATE,RE_FILE_NAME,COMPANY)";

    // 数据
    private String USER_CODE;
    private String ORG_CODE;
    private String REQUEST_NO;
    private String RESULT_TYPE;
    private String SCORE;
    private String FACTORS = "";
    private String POSITION;
    private String SCORE_DATE;
    private String COMPANY;
    private String RE_FILE_NAME;
    private int totalNum;

    // 使用栈这个数据结构来保存
    private Stack<String> stack = new Stack<String>();


    @Override
    public void startDocument() throws SAXException
    {
        logger.info("start document -> parse begin");
    }

    @Override
    public void endDocument() throws SAXException
    {
        logger.info("end document -> parse finished");
    }

    @Override
    public void startElement(String uri, String localName, String qName,
            Attributes attributes) throws SAXException
    {
        // 将标签名压入栈
        stack.push(qName);
    }

    @Override
    public void characters(char[] ch, int start, int length)
            throws SAXException
    {
        // 取出标签名
        String tag = stack.peek();
        if ("ResponseUserCode".equals(tag)){
        	USER_CODE = new String(ch, start, length);
        }else if ("ResponseOrgCode".equals(tag)){
        	ORG_CODE = new String(ch, start, length);
        }else if ("RequestId".equals(tag)){
        	REQUEST_NO = new String(ch, start, length);
        }else if ("ResultType".equals(tag)){
        	RESULT_TYPE = new String(ch, start, length);
        }else if ("Score".equals(tag)){
        	SCORE = new String(ch, start, length);
        }else if ("Factor".equals(tag)){
        	FACTORS += new String(ch, start, length)+",";
        }else if ("Position".equals(tag)){
        	POSITION = new String(ch, start, length);
        }else if ("ScoreDate".equals(tag)){
        	SCORE_DATE = new String(ch, start, length);
        }else if ("TotalNum".equals(tag)){
        	totalNum = Integer.parseInt(new String(ch, start, length));
        }
    }

    @Override
    public void endElement(String uri, String localName, String qName)
            throws SAXException
    {
        stack.pop();// 表示该元素解析完毕，需要从栈中弹出标签
        if("BtResultMsg".equals(qName)){
            if(!"".equals(REQUEST_NO)&&REQUEST_NO!=null){
            	sqlV += " SELECT '"+USER_CODE+"','"+ORG_CODE+"','"+REQUEST_NO+"','"+RESULT_TYPE+"','"+SCORE+"','"+FACTORS+"','"+POSITION+"','"+SCORE_DATE+"','"+RE_FILE_NAME+"','"+COMPANY+"' FROM DUAL UNION ALL";
            	count++;
            }
            
            if(count==1000){
    			Map<String,String> mapp = new HashMap<String,String>();
    			mapp.put("creatSql", sql+sqlV.substring(0, sqlV.length()-9));
    			//入库
    			try {
    				numReadService.saveInfo(mapp);
    			} catch (Exception e) {
    				logger.error(e.getMessage(),e);
    			}
            	sqlV = "";
            	count=0;
            }else if(count==totalNum%1000){
            	Map<String,String> mapp = new HashMap<String,String>();
    			mapp.put("creatSql", sql+sqlV.substring(0, sqlV.length()-9));
    			//入库
    			try {
    				numReadService.saveInfo(mapp);
    			} catch (Exception e) {
    				logger.error(e.getMessage(),e);
    			}
            	sqlV = "";
            	count=0;
            }
            //将FACTORS置为空，以便下一个<BtResultMsg>从头累加
            FACTORS = "";
        }
    }
}
