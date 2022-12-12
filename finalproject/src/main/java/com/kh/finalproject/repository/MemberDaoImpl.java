package com.kh.finalproject.repository;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Repository;

import com.kh.finalproject.entity.MemberDto;
import com.kh.finalproject.entity.MemberImgDto;
import com.kh.finalproject.vo.MemberListSearchVO;
import com.kh.finalproject.vo.MemberListVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class MemberDaoImpl implements MemberDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private PasswordEncoder encoder;
	
	//회원 등록
	@Override
	public void insert(MemberDto memberDto) {
		String memberPw = memberDto.getMemberPw();
		String encode = encoder.encode(memberPw);
		memberDto.setMemberPw(encode);
		sqlSession.insert("member.insert", memberDto);
	}
	
	//회원 프로필 등록
	@Override
	public void memberProfileInsert(MemberImgDto memberImgDto) {
		sqlSession.insert("member.profileInsert", memberImgDto);
	}
	
	//로그인
	@Override
	public boolean login(MemberDto memberDto) {
		MemberDto findDto = sqlSession.selectOne("member.one", memberDto.getMemberId());
		if(findDto == null) return false;
		boolean match = encoder.matches(memberDto.getMemberPw(), findDto.getMemberPw());
		return match;
	}
	
	//아이디 찾기
	@Override
	public boolean findId(MemberDto memberDto) {
		MemberDto findId = sqlSession.selectOne("member.findId", memberDto.getMemberName());
		if(findId == null) return false;
		boolean find = memberDto.getMemberTel().equals(findId.getMemberTel());
		return find;
	}
	
	//아이디 불러오기
	@Override
	public MemberDto find(MemberDto memberDto) {
		return sqlSession.selectOne("member.findId", memberDto.getMemberName());
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
     
     //회원 프로필 이미지 파일 번호 수정
     @Override
    public boolean profileImgEdit(MemberImgDto memberImgDto) {
    	return sqlSession.update("member.profileImgEdit",memberImgDto)>0;
    }

     //탈퇴 회원 처리
	@Override
	public boolean goodbye(String memberId) {
		return sqlSession.update("member.goodbye",memberId)>0;
	}
	
	//훈련사 전환여부
	@Override
	public MemberDto trainerConfirm(String memberId) {
		return sqlSession.selectOne("member.trainerConfirm",memberId);
	}

     //member_img 테이블 delete
	@Override
	public boolean memberImgDelete(String memberId) {		
		return sqlSession.delete("member.memberImgDelete", memberId) > 0;
	}

	//회원 탈퇴시 처리(삭제)
	@Override
	public boolean delete(String memberId) {
		return sqlSession.delete("member.delete",memberId)>0;
	}

}
