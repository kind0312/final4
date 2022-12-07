package com.kh.finalproject.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalproject.entity.MemberDto;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insert(MemberDto memberDto) {
		sqlSession.insert("member.insert", memberDto);
	}
	
	@Override
	public MemberDto selectOne(String memberId) {
		return sqlSession.selectOne("member.one", memberId);
	}
	
	@Override
	public boolean pointPlus(MemberDto memberDto) {
		return sqlSession.update("member.plusPoint",memberDto)>0;
	}

	@Override
	public int findFileNo(String memberId) {		
		return sqlSession.selectOne("member.findFileNo", memberId);
	}
}
