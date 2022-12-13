package com.kh.finalproject.repository;

import java.util.List;

import com.kh.finalproject.entity.ReviewDto;
import com.kh.finalproject.vo.ReviewVO;

public interface ReviewDao {
	
	//이용후기 목록
	List<ReviewVO> reviewList();

}
