package com.kh.finalproject;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.kh.finalproject.entity.ReviewDto;
import com.kh.finalproject.repository.ReviewDao;
import com.kh.finalproject.vo.ReviewPaginationVO;
import com.kh.finalproject.vo.ReviewVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@SpringBootTest
public class ReviewTest {
	
	@Autowired
	private ReviewDao reviewDao;
	
//	@Test
	public void test() {
		ReviewDto reviewDto = ReviewDto.builder()
					.trainingNo(198)
					.trainerNo(41)
					.memberId("bbororo")
					.reviewTitle("만족")
					.reviewContent("대만족")
					.reviewGood(5)
				.build();
		int reviewNo = reviewDao.insert(reviewDto);
		log.debug("No = {}", reviewNo);
	}
	
	@Test
	public void test1() {
		int count =reviewDao.count();
		log.debug("개수 : {}", count);
	}
	
//	@Test
	public void test2(ReviewPaginationVO vo) {
		int count =reviewDao.count();
		vo.setCount(count);
		List<ReviewVO> list = reviewDao.reviewList(vo);
		log.debug("리스트 : {}", list);
	}
}
