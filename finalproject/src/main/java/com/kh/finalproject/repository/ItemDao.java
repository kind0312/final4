package com.kh.finalproject.repository;

import java.util.List;

import com.kh.finalproject.entity.ItemDto;

public interface ItemDao {

	//등록
	void insert(ItemDto itemDto);
	//조회
	List<ItemDto> selectList();
	ItemDto selectOnd(int itemNo);
	//수정
	//삭제
}
