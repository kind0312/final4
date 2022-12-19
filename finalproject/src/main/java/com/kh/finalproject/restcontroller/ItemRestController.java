package com.kh.finalproject.restcontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.finalproject.entity.ItemDto;
import com.kh.finalproject.entity.PetDto;
import com.kh.finalproject.repository.ItemDao;
import com.kh.finalproject.vo.PetInsertVO;

import io.swagger.v3.oas.annotations.tags.Tag;

@Tag(name="항목(상품) 컨트롤러")
@RestController
@RequestMapping("/rest")
public class ItemRestController {
	
	@Autowired
	private ItemDao itemDao;
	
	//등록
	@PostMapping("/item_insert")
	public void insert(@RequestBody ItemDto itemDto){
		itemDao.insert(itemDto);
	}
	
	//조회
	@GetMapping("/item_list")
	public List<ItemDto> list(){
		return itemDao.selectList();
	}
	
	//수정
	@PutMapping("/item_edit")
	public boolean edit(@RequestBody ItemDto itemDto) {
		return itemDao.edit(itemDto);
	}
	
	//삭제
	@DeleteMapping("/item_delete/{itemNo}")
	public boolean delete(@PathVariable int itemNo) {
		return itemDao.delete(itemNo);
	}
	

}
