package com.kh.finalproject.error;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;



@ControllerAdvice(basePackages = {"com.kh.finalproject.controller"})
public class ExceptionProcessor {

	//에러 발생시 자동으로 간섭하여 실행할 메소드
	
	@ExceptionHandler(Exception.class) //Exception의 모든 class
	public String handle(Exception e) {
		return "error/exception";
	}
	
	@ExceptionHandler(TargetNotFoundException.class)
	public String handle2(Exception e) {
		return "error/notfound";
	}
	

	
	
   
	
}
