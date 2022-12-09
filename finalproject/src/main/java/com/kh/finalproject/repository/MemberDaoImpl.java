package com.kh.finalproject.repository;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalproject.entity.MemberDto;
import com.kh.finalproject.entity.MemberImgDto;
import com.kh.finalproject.vo.MemberListSearchVO;
import com.kh.finalproject.vo.MemberListVO;


@Repository
public class MemberDaoImpl implements MemberDao {

	@Autowired
	private SqlSession sqlSession;
	
	//회원 등록
	@Override
	public void insert(MemberDto memberDto) {
		sqlSession.insert("member.insert", memberDto);
	}
	//회원 프로필 등록
	@Override
	public void memberProfileInsert(MemberImgDto memberImgDto) {
		sqlSession.insert("member.profileInsert", memberImgDto);
	}
	
	//회원 검색
	@Override
	public List<MemberListVO> selectList(MemberListSearchVO vo) {
		if(vo.isSearch()) {
			return sqlSession.selectList("member.search",vo);
		}
		else {
			return sqlSession.selectList("member.list",vo);
		}
	}

	//회원 단일조회
	@Override
	public MemberDto selectOne(String memberId) {
		return sqlSession.selectOne("member.one", memberId);
	}
	
	//결제 후 포인트 증가
	@Override
	public boolean pointPlus(MemberDto memberDto) {
		return sqlSession.update("member.plusPoint",memberDto)>0;
	}
	
	//회원 프로필 이미지 파일 번호 찾기
     @Override
	public int findFileNo(String memberId) {		
		return sqlSession.selectOne("member.findFileNo", memberId);
	}
     
     //프로필 정보수정
     @Override
    public boolean profileEdit(MemberDto memberDto) {
    	return sqlSession.update("member.profileEdit",memberDto)>0;
    }

}
