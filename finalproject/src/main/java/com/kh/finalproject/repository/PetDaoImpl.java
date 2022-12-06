package com.kh.finalproject.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalproject.entity.PetDto;
import com.kh.finalproject.entity.PetImgDto;
import com.kh.finalproject.vo.PetInsertVO;

@Repository
public class PetDaoImpl implements PetDao{
	
	@Autowired
	private SqlSession sqlSession;

	//시퀀스 발급
	@Override
	public int sequence() {
		return sqlSession.selectOne("pet.sequence");
	}
	
	//등록
	@Override
	public void insert(PetDto petDto) {
		sqlSession.insert("pet.insert",petDto);
	}

	//조회
	@Override
	public List<PetDto> selectList(String memberId) {
		return sqlSession.selectList("pet.list", memberId);
	}
	
	//단일조회
	@Override
	public PetDto selectOne(int petNo) {
		return sqlSession.selectOne("pet.selectone",petNo);
	}
	
	//동기로 펫 목록 출력
	@Override
	public List<PetInsertVO> list(String memberId) {
		return sqlSession.selectList("pet.volist",memberId);
	}

	//수정
	@Override
	public boolean update(PetDto petDto) {
		return sqlSession.update("pet.update", petDto)>0;
	}

	//삭제
	@Override
	public boolean delete(int petNo) {
		return sqlSession.delete("pet.delete", petNo)>0;
	}

	@Override
	public void petProfileInsert(PetInsertVO petInsertVO) {
		sqlSession.insert("pet.profileInsert", petInsertVO);
	}

	@Override
	public int selectFileNo(int petNo) {
		return sqlSession.selectOne("pet.selectFileNo",petNo);
	}


	
	
	
	

}
