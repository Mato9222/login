package com.teamtodev.utils;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class TimeUtils {
	
	public static String todayByPattern(String pattern) {
		LocalDateTime localDateTime = LocalDateTime.now();
		DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern(pattern);
		String now = dateTimeFormatter.format(localDateTime);
		return now;
	}
	
}
