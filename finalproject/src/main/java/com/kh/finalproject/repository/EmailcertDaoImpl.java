package com.kh.finalproject.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalproject.entity.EmailcertDto;

@Repository
public class EmailcertDaoImpl implements EmailcertDao{

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insert(EmailcertDto emailcertDto) {
		sqlSession.insert("emailcert.insert", emailcertDto);
	}

	@Override
	public boolean check(EmailcertDto emailcertDto) {
		EmailcertDto result = sqlSession.selectOne("emailcert.check", emailcertDto);
		return result != null;
	}

	@Override
	public boolean delete(String emailcertEmail) {
		int count = sqlSession.delete("emailcert.delete", emailcertEmail);
		return count > 0;
	}
	
	@Override
	public void clear() {
		sqlSession.delete("emailcert.clear");
	}

}
