package com.kh.finalproject;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.kh.finalproject.entity.MemberDto;

@SpringBootTest
public class MemberSearchTest {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Test
	public void test() {
		Map<String,Object>param=new HashMap<>();
		//param.put("sort", List.of("member_joindate desc"));
		param.put("type", "member_name");
		param.put("keyword", "홍길동");
		
		
		List<MemberDto> list=sqlSession.selectList("member.search",param);
		
		//descs는 점점 아래로 내려가는 것 .price desc는 처음엔 가격이 높은 것부터 나왔다가 점점 내려오는 구조
		//date desc는 최신순으로 처음에 나오다가 예전꺼
		for(MemberDto dto: list) {
			System.out.println(dto);
		}
	}
	
	

}
