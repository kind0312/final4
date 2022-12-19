package com.kh.finalproject.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalproject.entity.ReviewDto;
import com.kh.finalproject.entity.TrainingDto;
<<<<<<< HEAD
import com.kh.finalproject.vo.ReviewPaginationVO;
=======
import com.kh.finalproject.vo.PaginationListSearchVO;
>>>>>>> refs/remotes/origin/main
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
	public List<ReviewVO> reviewList(ReviewPaginationVO vo) {
		int count = count();
		vo.setCount(count);
		
		int endRow = vo.getP()*vo.getSize();
		int startRow = endRow - (vo.getSize() - 1);
		vo.setEndRow(endRow);
		vo.setStartRow(startRow);
		return sqlSession.selectList("review.list", vo);
	}
	
	@Override
	public List<ReviewVO> reviewInfinite() {
		return sqlSession.selectList("review.infinite");
	}
	
	//전체 이용후기 상세
	@Override
	public ReviewVO fullDetail(int reviewNo) {
		return sqlSession.selectOne("review.fulldetail", reviewNo);
	}
	
	//리뷰의 총 개수
	@Override
	public int count() {
		return sqlSession.selectOne("review.count");
	}
	
	//페이지네이션
	//통합조회
	@Override
	public List<ReviewDto> listAll(PaginationListSearchVO vo) {
		// 조회 유형
		if(vo.isSearch()) {	// 검색 조회일 경우
			return search(vo);
		}
		else {	// 그렇지 않다면
			return list(vo);
		}
	}

	//전체조회
	@Override
	public List<ReviewDto> list(PaginationListSearchVO vo) {
		return sqlSession.selectList("review.pageList",vo);
	}

	//검색조회
	@Override
	public List<ReviewDto> search(PaginationListSearchVO vo) {
		return sqlSession.selectList("review.pageSearch",vo);
	}

	//조회 유형에 따른 총 조회 결과 갯수
	@Override
	public int count(PaginationListSearchVO vo) {
		if(vo.isSearch()) {	// 검색 조회일 경우
			return searchCount(vo);	// 검색 조회의 조회 결과 총 갯수 반환
		}
		else {	// 그렇지 않을 경우(전체 조회)
			return listCount(vo.getMemberId());
		}
	}
	
	//전체 조회시 총 조회 결과 갯수
	@Override
	public int listCount(String memberId) {
		return sqlSession.selectOne("review.listCount",memberId);
	}
	
	//검색 조회시 총 조회 결과 갯수
	@Override
	public int searchCount(PaginationListSearchVO vo) {
		return sqlSession.selectOne("review.searchCount",vo);
	}
}
