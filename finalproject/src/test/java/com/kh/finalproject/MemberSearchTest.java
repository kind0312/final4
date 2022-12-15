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
import com.kh.finalproject.vo.TrainerListVO;

@SpringBootTest
public class MemberSearchTest {
	
	@Autowired
	private SqlSession sqlSession;
	
//	@Test
//	public void test() {
//		ApplyDto applyDto=applyDto.builder()
//				
//				
//				
//				                      .applyNo(3)
//				                      .memberId
//				                      
//	}
//	
//	@Test
//	public void test() {
//		List<ApplyDto>list=sqlSession.selectList("apply.list");
//		System.out.println(list.size());
//		for(ApplyDto dto:list) {
//			System.out.println(dto);
//		}
//	}
	
//	@Test
//	public void test() {
//		int applyNo=1;
//		ApplyDto applyDto=sqlSession.selectOne("apply.one",applyNo);
//		System.out.println(applyDto);
//	}
	
//	@Test
//	public void test() {
//		String memberId="test1235";
//		TrainerListVO trainerListVO=sqlSession.selectOne("trainer.selectOne", memberId);
//		System.out.println(trainerListVO);
//	}
	
//	@Test
//	public void test() {
//		Map<String,Object>param=new HashMap<>();
//		//param.put("sort", List.of("member_joindate desc"));
//		param.put("type", "member_name");
//		param.put("keyword", "홍길동");
//		
//		
//		List<MemberDto> list=sqlSession.selectList("member.search",param);
//		
//		//descs는 점점 아래로 내려가는 것 .price desc는 처음엔 가격이 높은 것부터 나왔다가 점점 내려오는 구조
//		//date desc는 최신순으로 처음에 나오다가 예전꺼
//		for(MemberDto dto: list) {
//			System.out.println(dto);
//		}
	
//	@Test
//	public void test() {
//		Map<String, Object>param=new HashMap<>();
//		param.put("type","member_name");
//		param.put("keyword", "훈련상");
//		
//		List<TrainerListVO>list=sqlSession.selectList("trainer.search", param);
//		for(TrainerListVO vo:list) {
//			System.out.println(vo);
//		}
//		
//	}
	
//	@Test
//	public void test() {
//		List<TrainerListVO> list=sqlSession.selectList("trainer.list");
//		for(TrainerListVO vo: list) {
//			System.out.println(vo);
//		}
//	}
	

}
