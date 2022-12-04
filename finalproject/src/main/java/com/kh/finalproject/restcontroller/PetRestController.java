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

import com.kh.finalproject.entity.PetDto;
import com.kh.finalproject.repository.PetDao;

import io.swagger.v3.oas.annotations.tags.Tag;

@Tag(name="반려동물 컨트롤러")
@RestController
@RequestMapping("/rest")
public class PetRestController {
	
	@Autowired
	private PetDao petDao;
	
	@PostMapping("/pet_insert")
	public void insert(@RequestBody PetDto petDto){
		petDao.insert(petDto);
	}
	
	@GetMapping("/pet_list/{memberId}")
	public List<PetDto> list(@PathVariable String memberId){
		List<PetDto> dto = petDao.selectList(memberId);
		return dto;
	}
	
	@GetMapping("/pet_selectone/{petNo}")
	public PetDto selectone(@PathVariable int petNo){
		PetDto dto = petDao.selectOne(petNo);
		return dto;
	}
	
	@PutMapping("/pet_edit")
	public boolean edit(@RequestBody PetDto petDto) {
		return petDao.update(petDto);
	}
	
	@DeleteMapping("/pet_delete/{petNo}")
	public boolean delete(@PathVariable int petNo) {
		return petDao.delete(petNo);
	}
	

}
