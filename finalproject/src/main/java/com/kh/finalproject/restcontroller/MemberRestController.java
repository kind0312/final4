package com.kh.finalproject.restcontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kh.finalproject.repository.MemberDao;

@CrossOrigin
@RestController
@RequestMapping("/rest")
public class MemberRestController {

	@Autowired
	private MemberDao memberDao;
	
	@PostMapping("/memberid")
	private String memberid (@RequestParam String memberId) {
		if(memberDao.selectOne(memberId) == null) {
			return "is-valid";
		}
		else {
			return "is-invalid";
		}
	}
}
