package com.kh.finalproject.repository;

import com.kh.finalproject.entity.EmailcertDto;

public interface EmailcertDao {
	
	//인증번호 등록
	void insert(EmailcertDto emailcertDto);
	
	//인증번호 검사
	boolean check(EmailcertDto emailcertDto);
	
	//인증번호 삭제
	boolean delete(String emailcertEmail);
	
	//5분 지난 인증번호 삭제
	void clear();

}
