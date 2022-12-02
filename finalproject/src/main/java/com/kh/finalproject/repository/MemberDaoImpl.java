package com.kh.finalproject.repository;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalproject.entity.MemberDto;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insert(MemberDto memberDto) {
		sqlSession.insert("member.insert", memberDto);
	}

	@Override
	public List<MemberDto> selectList() {
		return sqlSession.selectList("member.list");
	}

	@Override
	public List<MemberDto> seletList(String type, String keyword) {
	
		//Map<String, String> param = new HashMap<>();
		
		//String sql="select *from member "
		//		+"where instr(#1,?)>0";
		//sql=sql.replace("#1",type);
		Object[] param = {keyword};
		return sqlSession.selectList("member.search",param);
	}
}
