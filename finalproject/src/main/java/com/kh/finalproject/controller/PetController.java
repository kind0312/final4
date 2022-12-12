package com.kh.finalproject.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.finalproject.constant.SessionConstant;
import com.kh.finalproject.entity.PetDto;
import com.kh.finalproject.repository.PetDao;
import com.kh.finalproject.vo.PetInsertVO;

@Controller
@RequestMapping("/mypage")
public class PetController {
	
	@Autowired
	private PetDao petDao;
	
	@RequestMapping("/pet")
	public String list(HttpSession session, Model model) {
		String memberId = (String)session.getAttribute(SessionConstant.ID);
		model.addAttribute("memberId", memberId);
		
		//방법1. pet, pet_img > left join 해서 petInsertVO에 저장 후 모델로 출력하기
		model.addAttribute("pet", petDao.list(memberId));
		
		return "mypage/pet_list";
	}
	
	@RequestMapping("/pet_insert")
	public String insert(HttpSession session, Model model) {
		String memberId = (String)session.getAttribute(SessionConstant.ID);
		model.addAttribute("memberId", memberId);
		return "mypage/pet_insert";
	}
	
	@PostMapping("/pet_insert")
	public String insert(@ModelAttribute PetInsertVO petInsertVO, 
			HttpSession session, RedirectAttributes attr) {
		String memberId = (String)session.getAttribute(SessionConstant.ID);
		int petNo = petDao.sequence();
		petInsertVO.setPetNo(petNo);
		
		//펫 db등록
		PetDto dto = PetDto.builder()
				.petNo(petNo)
				.memberId(memberId)
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
		
		attr.addAttribute("petNo", petNo);
		return "redirect:/mypage/pet_detail";
	}
	
	@RequestMapping("/pet_detail")
	public String detail(HttpSession session,
			@RequestParam int petNo, Model model) {
		String memberId = (String)session.getAttribute(SessionConstant.ID);
		model.addAttribute("memberId", memberId);
		model.addAttribute("filesNo", petDao.selectFileNo(petNo));
		model.addAttribute("petNo", petNo);
		return "mypage/pet_detail";
	}
	
	@RequestMapping("/pet_delete")
	public String delete(@RequestParam int petNo) {
		petDao.delete(petNo);
		return "redirect:/mypage/pet";
	}

}
