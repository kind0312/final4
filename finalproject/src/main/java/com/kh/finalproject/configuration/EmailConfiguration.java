package com.kh.finalproject.configuration;

import java.util.Properties;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;

//설정은 @Configuration으로 등록
@Configuration
public class EmailConfiguration {
	
	@Autowired
	private EmailProperties emailProperties;
	
	//등록 메소드
	@Bean //만들어서 세팅할때 등록
	public JavaMailSender javaMailSender() {
		
		//도구 생성 및 정보 설정
		JavaMailSenderImpl sender = new JavaMailSenderImpl();
		sender.setHost(emailProperties.getHost());//이메일 전송 대행업체의 HOST
		sender.setPort(emailProperties.getPort());//이메일 전송 대행업체의 PORT(업체마다 다르다)
		sender.setUsername(emailProperties.getUsername());//이메일 전송 대행업체 로그인 ID
		sender.setPassword(emailProperties.getPassword());//이메일 전송 대행업체 로그인 PW(앱 비밀번호)
		
		//추가 정보 설정
		Properties props = new Properties();//Map<String, String> 형태의 저장소
		props.setProperty("mail.smtp.auth", "true");//인증 여부 설정(필수)
		props.setProperty("mail.smtp.debug", "true");//디버깅 사용 여부 설정(선택)
		props.setProperty("mail.smtp.starttls.enable", "true");//TLS(보안프로토콜) 사용 여부(필수)
		props.setProperty("mail.smtp.ssl.protocols", "TLSv1.2");//TLS(ssl의 3버전) 버전 설정(필수)
		props.setProperty("mail.smtp.ssl.trust", "smtp.gmail.com");//신뢰할 수 있는 대행업체
		
		sender.setJavaMailProperties(props);
		
		return sender;
	}
	
}
