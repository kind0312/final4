package com.kh.finalproject.service;

import java.io.FileNotFoundException;
import java.io.IOException;

import javax.mail.MessagingException;

import com.kh.finalproject.entity.EmailcertDto;

public interface EmailService {
	
	void sendCertMail(String email) throws MessagingException, FileNotFoundException, IOException;
	
	boolean checkCert(EmailcertDto emailcertDto);
	
	//훈련사 지원 반려
	void ApplyResultMail(String email) throws MessagingException, FileNotFoundException, IOException;
}
