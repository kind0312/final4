package com.kh.finalproject.restcontroller;

import java.io.FileNotFoundException;
import java.io.IOException;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kh.finalproject.entity.EmailcertDto;
import com.kh.finalproject.repository.MemberDao;
import com.kh.finalproject.service.EmailService;

import io.swagger.v3.oas.annotations.tags.Tag;

@Tag(name="회원 컨트롤러")
@RestController
@RequestMapping("/rest/member")
public class MemberRestController {

	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private EmailService emailService;
	
	//아이디 중복검사
	@GetMapping("/{memberId}")
	private String memberid (@PathVariable String memberId) {
		if(memberDao.selectOne(memberId) == null) {
			return "possible"; //사용할 수 있는 아이디인 경우(아이디 DB에 없음)
		}
		else {
			return "impossible"; //사용할 수 없는 아이디인 경우(아이디 DB에 존재)
		}
	}
	
	//이메일 인증
	@PostMapping("/emailcert")
	public void emailcert(@RequestParam String emailcertEmail) throws FileNotFoundException, MessagingException, IOException {
		emailService.sendCertMail(emailcertEmail);
	}
	
	//이메일 인증코드 검사
	@PostMapping("/confirmcert")
	public boolean confirmcert(@ModelAttribute EmailcertDto emailcertDto) {
		if(emailService.checkCert(emailcertDto)) {
			return true;
		}
		else {
			return false;
		}
	}
}
