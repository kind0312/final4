package com.kh.finalproject.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalproject.entity.PointDto;
import com.kh.finalproject.vo.PointListVO;

@Repository
public class PointDaoImpl implements PointDao{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int sequence() {
		return sqlSession.selectOne("point.sequence");
	}

	@Override
	public void insert(PointDto pointDto) {
		sqlSession.insert("point.insert",pointDto);
	}
	
	//예약 취소 후 포인트 insert
	@Override
	public void cancelInsert(PointDto pointDto) {
		sqlSession.insert("point.cancelInsert",pointDto);
	}

	@Override
	public List<PointDto> selectList(String memberId) {
		return sqlSession.selectList("point.list",memberId);
	}
	
	@Override
	public int count(String memberId) {
		return sqlSession.selectOne("point.count",memberId);
	}

	
	
	
	
	//페이징
	@Override
	public List<PointDto> listAll(PointListVO vo) {
		// 조회 유형
		if(vo.isSearch()) {	// 검색 조회일 경우
			return search(vo);
		}
		else {	// 그렇지 않다면
			return list(vo);
		}
	}

	@Override
	public List<PointDto> list(PointListVO vo) {
		return sqlSession.selectList("point.pageList",vo);
	}

	@Override
	public List<PointDto> search(PointListVO vo) {
		return sqlSession.selectList("point.pageSearch",vo);
	}

	@Override
	public int count(PointListVO vo) {
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
		return sqlSession.selectOne("point.listCount",memberId);
	}

	@Override
	public int searchCount(PointListVO vo) {
		return sqlSession.selectOne("point.searchCount",vo);
	}

	


}
