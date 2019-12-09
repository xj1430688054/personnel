package com.rain.util.common;

import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Date;

public class UtilSS {
	public static String getNow(){
		Date currentTime = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String dateString = formatter.format(currentTime);
		return dateString;
		
	}
	public static void main(String[] args) {
		Date currentTime = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String dateString = formatter.format(currentTime);
		System.out.println(dateString);
	}

}
