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
import com.kh.finalproject.vo.PetInsertVO;

import io.swagger.v3.oas.annotations.tags.Tag;

@Tag(name="반려동물 컨트롤러")
@RestController
@RequestMapping("/rest")
public class PetRestController {
	
	@Autowired
	private PetDao petDao;
	
	@PostMapping("/pet_insert")
	public void insert(@RequestBody PetInsertVO petInsertVO){
		//펫 db등록
		PetDto dto = PetDto.builder()
				.petNo(petInsertVO.getPetNo())
				.memberId(petInsertVO.getMemberId())
				.petType(petInsertVO.getPetType())
				.petName(petInsertVO.getPetName())
				.petGender(petInsertVO.getPetGender())
				.petBreed(petInsertVO.getPetBreed())
				.petBirth(petInsertVO.getPetBirth())
				.petWeight(petInsertVO.getPetWeight())
				.petNeutralization(petInsertVO.getPetNeutralization())
				.build();
		petDao.insert(dto);
		
		//펫, 첨부파일 연결테이블 db등록 - vo만들어서 처리!!!
		petDao.petProfileInsert(petInsertVO);
		
	}
	
	//한 명의 회원의 펫 목록 - 동기로 사용예정
	@GetMapping("/pet_list/{memberId}")
	public List<PetDto> list(@PathVariable String memberId){
		List<PetDto> dto = petDao.selectList(memberId);
		return dto;
	}
	
	//펫번호로 조회
	@GetMapping("/pet_selectone/{petNo}")
	public PetDto selectone(@PathVariable int petNo){
		PetDto dto = petDao.selectOne(petNo);
		return dto;
	}
	
	//펫번로 파일번호 조회
	@GetMapping("/pet_img/{petNo}")
	public int selectFileNo(@PathVariable int petNo){
		return petDao.selectFileNo(petNo);
	}
	
	@PutMapping("/pet_edit")
	public void edit(@RequestBody PetInsertVO petInsertVO) {
		//펫 db수정
		PetDto dto = PetDto.builder()
				.petNo(petInsertVO.getPetNo())
				.memberId(petInsertVO.getMemberId())
				.petType(petInsertVO.getPetType())
				.petName(petInsertVO.getPetName())
				.petGender(petInsertVO.getPetGender())
				.petBreed(petInsertVO.getPetBreed())
				.petBirth(petInsertVO.getPetBirth())
				.petWeight(petInsertVO.getPetWeight())
				.petNeutralization(petInsertVO.getPetNeutralization())
				.build();
		petDao.update(dto);
				
		//펫, 첨부파일 연결테이블 db수정
		petDao.petProfileUpdate(petInsertVO);
	}
	
	@DeleteMapping("/pet_delete/{petNo}")
	public boolean delete(@PathVariable int petNo) {
		return petDao.delete(petNo);
	}
	

}
