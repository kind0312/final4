package com.kh.finalproject.service;

import com.kh.finalproject.entity.EmailcertDto;

public interface EmailService {
	
	void sendCertMail(String email);
	
	boolean checkCert(EmailcertDto emailcertDto);
}
