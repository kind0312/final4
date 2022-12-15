package com.kh.finalproject.configuration;

import java.time.LocalDateTime;

public class DateTimeUtils {
	public static LocalDateTime now() {
        return LocalDateTime.now().plusHours(9);
    }
	
//	 public static LocalDateTime nowFromZone() {
//	    return ZonedDateTime.now(ZoneId.of("Asia/Seoul")).toLocalDateTime();
//	  }
}