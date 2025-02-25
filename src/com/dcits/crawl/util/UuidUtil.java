package com.dcits.crawl.util;

import java.util.UUID;

public class UuidUtil {

	public static String get32UUID() {
		String uuid = UUID.randomUUID().toString().trim().replaceAll("-", "");
		return uuid;
	}
	public static String get64UUID() {
		String uuid1 = UUID.randomUUID().toString().trim().replaceAll("-", "");
		String uuid2 = UUID.randomUUID().toString().trim().replaceAll("-", "");
		String uuid=uuid1+uuid2;
		return uuid;
	}
	public static void main(String[] args) {
		System.out.println(get64UUID());
	}
}

