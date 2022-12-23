package com.kh.finalproject;

import org.apache.ibatis.session.SqlSession;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.kh.finalproject.entity.EmailcertDto;

@SpringBootTest
public class CheckCertTest {

	@Autowired
	private SqlSession sqlSession;
	
	String email = "kind0312jh@gmail.com";
	String serial = "374601";
	
	@Test
	public void test() {
		EmailcertDto result = sqlSession.selectOne("emailcert.check", EmailcertDto.builder()
														.emailcertEmail(email)
														.emailcertSerial(serial)
													.build());

		if(result != null) {//인증 성공
			sqlSession.delete("emailcert.delete", email);
		}
	}
}
