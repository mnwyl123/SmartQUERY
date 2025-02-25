package com.dcits.platform.language;

import java.util.HashMap;
import java.util.Locale;
import java.util.ResourceBundle;

public class LingualResource {

	private String language = "zh";
	
	private String region = "CN";
	
	private String localeCode = "zh_CN";
	
	private String fileName = "Login";
	
	private static HashMap<String, LingualResource> instances = new HashMap<String, LingualResource>();
	
	private Locale locale = null;
	
	private ResourceBundle resourceBundle = null;
	
	private LingualResource LinkLingualResource = null;
	
	private LingualResource(String fileName, String language, String region){
		this.language = language;
		this.region = region;
		this.fileName = fileName;
		localeCode = makeLocaleCode(this.fileName, this.language, this.region);
		locale = new Locale(language, region);
		resourceBundle = ResourceBundle.getBundle(this.fileName, locale);
		this.LinkLingualResource = this;
		instances.put(localeCode,LinkLingualResource);
	}
	
	public static String makeLocaleCode(String fileName, String language, String region) {
		return fileName +"."+ language + "_" + region;
	}
	
	private LingualResource() {
		
	}
	
	public synchronized static LingualResource getInstance(String fileName, String language, String region) {
		if (instances.containsKey(makeLocaleCode(fileName, language, region))) {
			return instances.get(makeLocaleCode(fileName, language, region));
		} else {
			return new LingualResource(fileName, language, region);
		}
	}
	
	public String getLocaleString(String code) {
		return resourceBundle.getString(code);
	}
}
