package com.kh.finalproject.service;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Scanner;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
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
	public void sendCertMail(String email) throws MessagingException, FileNotFoundException, IOException {
		//목표 : (1)랜덤인증번호생성 -> (2)이메일발송 -> (3)데이터베이스 등록
		
		//(1)
		String serial = randomGenerator.generateSerial(6);
		
		//(2) - 심플
//		SimpleMailMessage message = new SimpleMailMessage();
//		message.setTo(email);
//		message.setSubject("[CarePet] 이메일 인증번호입니다");
//		message.setText("인증번호 : " + serial);
//		javaMailSender.send(message);
		
		//(2) - 마임
		//1.메세지 생성
		MimeMessage message = javaMailSender.createMimeMessage();//import할때 확인
		
		//2.헬퍼 생성
		MimeMessageHelper helper = new MimeMessageHelper(message, false, "UTF-8");
		
		//3.정보 설정
		helper.setTo(email);
		helper.setSubject("[CarePet] 이메일 인증번호입니다");
		
		ClassPathResource resource = new ClassPathResource("email/certTemplate.html");//특정 경로를 찾기 위한 구문
		StringBuffer buffer = new StringBuffer();
		try(Scanner sc = new Scanner(resource.getFile())){
			while(sc.hasNextLine()) {
				buffer.append(sc.nextLine());
			}
		}
		//Jsoup 라이브러리를 사용하여 ID와 Address를 설정한 뒤 전송
		String text = buffer.toString();
		Document doc = Jsoup.parse(text);//불러온 문자열을 HTML로 파싱(해석)
		Element element = doc.getElementById("serial");//id=serial 선택
		element.text(serial);//선택한 대상에 text를 설정
		
		Element img = doc.getElementById("logo");//id=serial 선택
		img.attr("src", "${pageContext.request.contextPath}/image/logo.png");
		
		helper.setText(doc.toString(), true); //true 적으면 html 태그를 읽는다.
		
		//4.전송
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
