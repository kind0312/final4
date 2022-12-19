package com.kh.finalproject;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.kh.finalproject.entity.ApplyDto;
import com.kh.finalproject.entity.MemberDto;
import com.kh.finalproject.entity.PetDto;



@SpringBootTest
public class MemberDetailTest {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Test
	public void test() {
		Map<String, Object> param = new HashMap<>();
		param.put("type",List.of("신청","승인","반려"));
		List<ApplyDto> list=sqlSession.selectList("apply.list",param);
		
		for(ApplyDto dto:list) {
			System.out.println(dto);
		}
	}

	
//	
//	@Test
//	public void test() {
//		String memberId="test1231";
//		MemberDto memberDto=sqlSession.selectOne("member.one",memberId);
//		System.out.println(memberDto);
//	}
//	
	
	


}
