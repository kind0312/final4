package com.kh.finalproject.repository;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalproject.entity.MemberDto;
import com.kh.finalproject.vo.MemberListSearchVO;
import com.kh.finalproject.vo.MemberListVO;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insert(MemberDto memberDto) {
		sqlSession.insert("member.insert", memberDto);
	}

//	@Override
//	public List<MemberDto> selectList() {
//		
//	sqlSession.selectList(null)
//	}

	@Override
	public List<MemberListVO> selectList(MemberListSearchVO vo) {
	if(vo.isSearch()) {
		return sqlSession.selectList("member.search",vo);
	}
	else {
		return sqlSession.selectList("member.list",vo);
	}
	}


}
