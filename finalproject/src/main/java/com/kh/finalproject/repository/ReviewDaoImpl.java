package com.kh.finalproject.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalproject.entity.ReviewDto;
import com.kh.finalproject.vo.ReviewVO;

@Repository
public class ReviewDaoImpl implements ReviewDao {

	@Autowired
	private SqlSession sqlSession;
	
	//이용후기 목록
	@Override
	public List<ReviewVO> reviewList() {
		return sqlSession.selectList("review.list");
	}
}
