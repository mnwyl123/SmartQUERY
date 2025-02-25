package com.dcits.platform.pdf;

import java.util.Map;

public class PdfExport {
	private FreemarkerUtil freemarkerUtil;
	private ITextRendererUtil iTextRendererUtil;
	
	/*
	 * 参数说明：
	 * templeteName：freemarker模板的名称；
	 * templetePath：模板的绝对路径；
	 * tempPath：模板导出的缓存绝对路径；
	 * data：模板中需要替换的实际数据；
	 * 返回值：在缓存路径中生成的pdf文件名称。
	 */
	public String exportPDF(String templeteName, String templetePath, 
			String tempPath, Map<String, Object> data){
		
		freemarkerUtil = new FreemarkerUtil();
		iTextRendererUtil = new ITextRendererUtil();
		String pdfName = null;
		
		try {
			String htmlPath = freemarkerUtil.exportHtml(templeteName, templetePath, tempPath, data);
			pdfName = iTextRendererUtil.createPDF(htmlPath, tempPath, templetePath);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return pdfName;
	}
}
