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

import com.kh.finalproject.entity.MemberImgDto;


@Repository
public class MemberDaoImpl implements MemberDao {

	@Autowired
	private SqlSession sqlSession;
	
	//회원 등록
	@Override
	public void insert(MemberDto memberDto) {
		sqlSession.insert("member.insert", memberDto);
	}




	@Override
	public List<MemberListVO> selectList(MemberListSearchVO vo) {
	if(vo.isSearch()) {
		return sqlSession.selectList("member.search",vo);
	}
	else {
		return sqlSession.selectList("member.list",vo);
	}
	}



	
	//회원 프로필 등록
	@Override
	public void memberProfileInsert(MemberImgDto memberImgDto) {
		sqlSession.insert("member.profileInsert", memberImgDto);
	}
	
	//회원 단일조회

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
