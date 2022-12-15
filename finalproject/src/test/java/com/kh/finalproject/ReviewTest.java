package com.kh.finalproject;

import static org.junit.jupiter.api.Assertions.assertTrue;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.kh.finalproject.entity.ReviewDto;
import com.kh.finalproject.repository.ReviewDao;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@SpringBootTest
public class ReviewTest {
	
	@Autowired
	private ReviewDao reviewDao;
	
	@Test
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
}
