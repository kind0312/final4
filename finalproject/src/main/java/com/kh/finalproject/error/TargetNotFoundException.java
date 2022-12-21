package com.kh.finalproject.error;

import lombok.NoArgsConstructor;

@NoArgsConstructor
public class TargetNotFoundException extends RuntimeException{
	
	public TargetNotFoundException(String message) {
		super(message);
	}
	// 자바 스스로 찾지 못하는 에러 
}
