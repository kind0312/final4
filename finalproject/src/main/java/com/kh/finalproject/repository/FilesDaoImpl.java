package com.kh.finalproject.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalproject.entity.FilesDto;
import com.kh.finalproject.entity.PetImgDto;

@Repository
public class FilesDaoImpl implements FilesDao{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int sequence() {
		int sequence = sqlSession.selectOne("files.sequence");
		return sequence;
	}
	
	@Override
	public void insert(FilesDto filesDto) {
		sqlSession.insert("files.insert",filesDto);
	}

	@Override
	public FilesDto find(int filesNo) {
		return sqlSession.selectOne("files.petProfile",filesNo);
	}
	
	

}
