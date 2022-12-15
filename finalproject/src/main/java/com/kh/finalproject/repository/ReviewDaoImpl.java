package com.kh.finalproject.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalproject.entity.ReviewDto;
import com.kh.finalproject.entity.TrainingDto;
import com.kh.finalproject.vo.ReviewVO;
import com.kh.finalproject.vo.TrainingListVO;

@Repository
public class ReviewDaoImpl implements ReviewDao {

	@Autowired
	private SqlSession sqlSession;
	
	//시퀀스 생성
	@Override
	public int sequence() {
		return sqlSession.selectOne("review.sequence");
	}

	//이용후기 작성
	@Override
	public int insert(ReviewDto reviewDto) {
		int reviewNo = sequence();
		reviewDto.setReviewNo(reviewNo);
		sqlSession.insert("review.insert", reviewDto);
		return reviewNo;
	}
	
	//이용 완료 조회
	@Override
	public TrainingDto one(String memberId) {
		return sqlSession.selectOne("review.end", memberId);
	}
	
	@Override
	public TrainingListVO selectOne(TrainingDto trainingDto) {
		return sqlSession.selectOne("review.endList", trainingDto);
	}
	
	//이용후기 상세정보
	@Override
	public ReviewDto detail(int reviewNo) {
		return sqlSession.selectOne("review.one", reviewNo);
	}
	
	//이용후기 목록
	@Override
	public List<ReviewVO> reviewList() {
		return sqlSession.selectList("review.list");
	}
	
	//이용후기 작성여부
	@Override
	public ReviewDto writed(int trainingNo) {
		return sqlSession.selectOne("review.writed", trainingNo);
	}
}
