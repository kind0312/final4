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
	public TrainingListVO selectOne(TrainingDto trainingDto) {
		return sqlSession.selectOne("review.end", trainingDto);
	}
	
	//이용후기 상세정보
	@Override
	public ReviewDto detail(int reviewNo) {
		return sqlSession.selectOne("review.one", reviewNo);
	}
	
	//이용후기 작성여부
	@Override
	public ReviewDto writed(int trainingNo) {
		return sqlSession.selectOne("review.writed", trainingNo);
	}
	
	//이용후기 수정
	@Override
	public boolean edit(ReviewDto reviewDto) {
		return sqlSession.update("review.edit", reviewDto) > 0;
	}
	
	//이용후기 삭제
	@Override
	public boolean delete(int reviewNo) {
		return sqlSession.delete("review.delete", reviewNo) > 0;
	}
	
	//전체 이용후기 목록
	@Override
	public List<ReviewVO> reviewList() {
		return sqlSession.selectList("review.list");
	}
	
	//전체 이용후기 상세
	@Override
	public ReviewVO fullDetail(int reviewNo) {
		return sqlSession.selectOne("review.fulldetail", reviewNo);
	}
}
