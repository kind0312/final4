package com.kh.finalproject.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalproject.entity.LikeDto;

@Repository
public class TrainerLikeDaoImpl implements TrainerLikeDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insert(LikeDto dto) {

		sqlSession.insert("like.insert", dto);
		
	}

	@Override
	public void delete(LikeDto dto) {
		sqlSession.delete("like.delete", dto);
		
	}

	@Override
	public boolean check(LikeDto dto) {
		
		int count = sqlSession.selectOne("like.check", dto);
	
		return count ==1;
				
				
	}

	@Override
	public int count(int trainerNo) {
		return sqlSession.selectOne("like.count", trainerNo);
	}

	@Override
	public void refresh(int trainerNo) {
		sqlSession.update("like.refresh", trainerNo);
	}

}
