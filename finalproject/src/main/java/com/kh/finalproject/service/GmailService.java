package com.kh.finalproject.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.kh.finalproject.component.RandomGenerator;
import com.kh.finalproject.entity.EmailcertDto;
import com.kh.finalproject.repository.EmailcertDao;

@Service
public class GmailService implements EmailService {

	@Autowired
	private RandomGenerator randomGenerator;
	
	@Autowired
	private EmailcertDao emailcertDao;
	
	@Autowired
	private JavaMailSender javaMailSender;
	
	@Override
	public void sendCertMail(String email) {
		//목표 : (1)랜덤인증번호생성 -> (2)이메일발송 -> (3)데이터베이스 등록
		
		//(1)
		String serial = randomGenerator.generateSerial(6);
		
		//(2)
		SimpleMailMessage message = new SimpleMailMessage();
		message.setTo(email);
		message.setSubject("[CarePet] 이메일 인증번호입니다.");
		message.setText("인증번호 : " + serial);
		javaMailSender.send(message);
		
		//(3)
		emailcertDao.delete(email);
		EmailcertDto emailcertDto = EmailcertDto.builder()
											.emailcertEmail(email)
											.emailcertSerial(serial)
										.build();
		emailcertDao.insert(emailcertDto);
	}
	
	@Override
	public boolean checkCert(EmailcertDto emailcertDto) {
		if(emailcertDao.check(emailcertDto)) {//인증 성공
			emailcertDao.delete(emailcertDto.getEmailcertEmail());
			return true;
		}
		else {
			return false;
		}
	}
}
