package com.kh.finalproject.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalproject.entity.PointPurchaseDto;
import com.kh.finalproject.vo.PaginationListSearchVO;
import com.kh.finalproject.vo.PayListVO;

@Repository
public class PointPurchaseDaoImpl implements PointPurchaseDao{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int sequence() {
		return sqlSession.selectOne("point_purchase.sequence");
	}

	@Override
	public void insert(PointPurchaseDto pointPurchaseDto) {
		sqlSession.insert("point_purchase.insert", pointPurchaseDto);
	}

	@Override
	public List<PayListVO> selectList(String memberId) {
		return sqlSession.selectList("point_purchase.selectList",memberId);
	}

	@Override
	public PayListVO selectOne(int pointPurchaseNo) {
		return sqlSession.selectOne("point_purchase.selectOne",pointPurchaseNo);
	}

	//수정
	@Override
	public boolean update(int pointPurchaseNo) {
		return sqlSession.update("point_purchase.update",pointPurchaseNo)>0;
	}

	//페이지네이션
	@Override
	public List<PayListVO> listAll(PaginationListSearchVO vo) {
		// 조회 유형
		if(vo.isSearch()) {	// 검색 조회일 경우
			return search(vo);
		}
		else {	// 그렇지 않다면
			return list(vo);
		}
	}

	@Override
	public List<PayListVO> list(PaginationListSearchVO vo) {
		return sqlSession.selectList("point_purchase.pageList",vo);
	}

	@Override
	public List<PayListVO> search(PaginationListSearchVO vo) {
		return sqlSession.selectList("point_purchase.pageSearch",vo);
	}

	@Override
	public int count(PaginationListSearchVO vo) {
		if(vo.isSearch()) {	// 검색 조회일 경우
			return searchCount(vo);	// 검색 조회의 조회 결과 총 갯수 반환
		}
		else {	// 그렇지 않을 경우(전체 조회)
			//return listCount(vo);	// 전체 조회의 조회 결과 총 갯수 반환
			return listCount(vo.getMemberId());
		}
	}

	@Override
	public int listCount(String memberId) {
		return sqlSession.selectOne("point_purchase.listCount",memberId);
	}

	@Override
	public int searchCount(PaginationListSearchVO vo) {
		return sqlSession.selectOne("point_purchase.searchCount",vo);
	}
	
	


}
