package com.kh.finalproject.repository;

import java.util.List;

import com.kh.finalproject.entity.ItemDto;

public interface ItemDao {

	//등록
	void insert(ItemDto itemDto);
	//조회
	List<ItemDto> selectList();
	List<ItemDto> PaySelectList();
	ItemDto selectOne(int itemNo);
	ItemDto selectOne(String itemName);
	//수정
	boolean edit(ItemDto itemDto);
	//삭제
	boolean delete(int itemNo);
}
