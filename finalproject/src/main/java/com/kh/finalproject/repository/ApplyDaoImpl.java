package com.kh.finalproject.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ApplyDaoImpl implements ApplyDao {

	@Autowired
	private SqlSession sqlSession;
}
