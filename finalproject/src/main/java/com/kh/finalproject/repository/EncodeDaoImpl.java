package com.kh.finalproject.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Repository;

import com.kh.finalproject.entity.EncodeDto;

@Repository
public class EncodeDaoImpl implements EncodeDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private PasswordEncoder encoder;

	@Override
	public void insert(EncodeDto encodeDto) {
		String memberPw = encodeDto.getMemberPw();
		String encode = encoder.encode(memberPw);
		encodeDto.setMemberPw(encode);
		sqlSession.insert("encode.insert", encodeDto);
		
	}

	@Override
	public boolean login(EncodeDto encodeDto) {
		EncodeDto findDto = sqlSession.selectOne("encode.get", encodeDto.getMemberId());
		if(findDto == null) return false;
		boolean match = encoder.matches(encodeDto.getMemberPw(), findDto.getMemberPw());
		return match;
	}

	@Override
	public EncodeDto find(String memberId) {
		return sqlSession.selectOne("encode.get", memberId);
	}
	
}
