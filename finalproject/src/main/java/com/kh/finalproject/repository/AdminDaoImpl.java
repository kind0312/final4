package com.kh.finalproject.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalproject.entity.AdminDto;


@Repository
public class AdminDaoImpl implements AdminDao {
	
	@Autowired
	private SqlSession sqlSession;


	@Override
	public AdminDto selectOne(String adminId) {
	       return sqlSession.selectOne("admin.one", adminId);
	}

}
