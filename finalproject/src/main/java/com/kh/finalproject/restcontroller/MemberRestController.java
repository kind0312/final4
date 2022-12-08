package com.kh.finalproject.restcontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kh.finalproject.repository.MemberDao;

import io.swagger.v3.oas.annotations.tags.Tag;

@Tag(name="회원 컨트롤러")
@RestController
@RequestMapping("/rest/member")
public class MemberRestController {

	@Autowired
	private MemberDao memberDao;
	
	@GetMapping("/{memberId}")
	private String memberid (@PathVariable String memberId) {
		if(memberDao.selectOne(memberId) == null) {
			return "possible"; //사용할 수 있는 아이디인 경우(아이디 DB에 없음)
		}
		else {
			return "impossible"; //사용할 수 없는 아이디인 경우(아이디 DB에 존재)
		}
	}
}
