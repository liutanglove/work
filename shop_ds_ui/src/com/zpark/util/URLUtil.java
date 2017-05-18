package com.zpark.util;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

public class URLUtil {
	public static String encoder(String message,String charset){
		
		try {
			String mess = URLEncoder.encode(message,charset);
			return mess;
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
}
