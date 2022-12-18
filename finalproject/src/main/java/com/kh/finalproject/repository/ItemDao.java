package com.kh.finalproject.repository;

import java.util.List;

import com.kh.finalproject.entity.ItemDto;

public interface ItemDao {

	//등록
	void insert(ItemDto itemDto);
	//조회
	List<ItemDto> selectList();
	ItemDto selectOne(int itemNo);
	ItemDto selectOne(String itemName);
	//수정
	//삭제
	boolean delete(int itemNo);
}
