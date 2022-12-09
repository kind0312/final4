package com.kh.finalproject;

import static org.junit.jupiter.api.Assertions.assertTrue;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.kh.finalproject.entity.MemberDto;
import com.kh.finalproject.repository.MemberDao;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@SpringBootTest
public class SecurityTest {
	
	@Autowired
	private MemberDao memberDao;
	
	@Test
	public void login() {
		MemberDto memberDto = MemberDto.builder().memberId("beetle").memberPw("Test1234!").build();
		boolean login = memberDao.login(memberDto);
		log.debug("login = {}", login);
		assertTrue(login);
	}
}
