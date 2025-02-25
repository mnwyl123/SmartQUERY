package com.dcits.platform.pdf;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.util.Date;
import java.util.Map;

import com.dcits.platform.util.GenerateSequenceUtil;

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;

public class FreemarkerUtil {

	public Template getTemplate(String templeteName, String templetePath) {
		Template temp = null;
		try {
			Configuration cfg = new Configuration();
			cfg.setDefaultEncoding("UTF-8");
			cfg.setDirectoryForTemplateLoading(new File(templetePath));
			temp = cfg.getTemplate(templeteName);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return temp;
	}

	public String exportHtml(String templeteName, String templetePath, String tempPath,
			Map<String, Object> data) {
		
		FileOutputStream out = null;
		String htmlPath = null;
		try {
			htmlPath = tempPath + File.separator + 
					GenerateSequenceUtil.generateSequenceNo(new Date()) + ".html";
			out = new FileOutputStream(new File(htmlPath));
			OutputStreamWriter osw = new OutputStreamWriter(out, "UTF-8");
			BufferedWriter bw = new BufferedWriter(osw, 1024);
			Template template = this.getTemplate(templeteName, templetePath);
			template.process(data, bw);
			
			bw.flush();
			bw.close();
			osw.close();
			out.close();
		} catch (TemplateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return htmlPath;
	}
}
