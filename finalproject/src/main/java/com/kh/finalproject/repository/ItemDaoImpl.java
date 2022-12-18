package com.kh.finalproject.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalproject.entity.ItemDto;

@Repository
public class ItemDaoImpl implements ItemDao{
	
	@Autowired
	private SqlSession sqlSession;

	//등록
	@Override
	public void insert(ItemDto itemDto) {
		sqlSession.insert("item.insert",itemDto);
	}

	//전체조회
	@Override
	public List<ItemDto> selectList() {
		return sqlSession.selectList("item.list");
	}

	@Override
	public ItemDto selectOne(int itemNo) {
		return sqlSession.selectOne("item.selectone", itemNo);
	}	
	
	@Override
		public ItemDto selectOne(String itemName) {
			return sqlSession.selectOne("item.selectname", itemName);
		}
	
	//수정
	@Override
	public boolean edit(ItemDto itemDto) {
		return sqlSession.update("item.edit",itemDto)>0;
	}
	
	//삭제
	@Override
	public boolean delete(int itemNo) {
		return sqlSession.delete("item.delete",itemNo)>0;
	}
	
	

}
