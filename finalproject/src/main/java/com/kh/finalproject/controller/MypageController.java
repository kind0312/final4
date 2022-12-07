package com.kh.finalproject.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.finalproject.constant.SessionConstant;
import com.kh.finalproject.entity.PetDto;
import com.kh.finalproject.entity.PointDto;
import com.kh.finalproject.entity.TrainingDetailDto;
import com.kh.finalproject.entity.TrainingPurchaseDto;
import com.kh.finalproject.repository.MemberDao;
import com.kh.finalproject.repository.PetDao;
import com.kh.finalproject.repository.PointDao;
import com.kh.finalproject.repository.TrainingDao;
import com.kh.finalproject.repository.TrainingPurchaseDao;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private PointDao pointDao;
	@Autowired
	private TrainingDao trainingDao;
	@Autowired
	private TrainingPurchaseDao trainingPurchaseDao;
	@Autowired
	private PetDao petDao;
	
	
	//포인트 관리
	@RequestMapping("/point")
	public String list(HttpSession session, Model model) {
		String memberId = (String)session.getAttribute(SessionConstant.ID);
		model.addAttribute("point", memberDao.selectOne(memberId));
		List<PointDto> list = pointDao.selectList(memberId);
		model.addAttribute("list", list);
		return "mypage/point_list";
	}
	
	//예약 확인
	@RequestMapping("/training")
	public String training(HttpSession session, Model model) {
		String memberId = (String)session.getAttribute(SessionConstant.ID);
		//진행예약 조회
		model.addAttribute("ingList", trainingDao.ingList(memberId));
		//지난예약 조회
		model.addAttribute("endList", trainingDao.endList(memberId));
		return "mypage/training_list";
	}
	
	//예약 확인 상세
	@RequestMapping("/training_detail")
	public String detail(@RequestParam int trainingNo, Model model) {
		//훈련서비스 단일조회
		model.addAttribute("training", trainingDao.selectOne(trainingNo));
		//훈련받은 반려동물 마리수 조회
		model.addAttribute("petCount", trainingDao.petCount(trainingNo));
		//결제내역 단일조회
		TrainingPurchaseDto dto = trainingPurchaseDao.selectOne(trainingNo);
		model.addAttribute("purchase", dto);
		//훈련서비스 받은 반려동물 조회
		List<TrainingDetailDto> detailDto = trainingDao.trainingPet(trainingNo);
		//반려견이 1마리 이상이면 반려견이름 외 ?마리 출력
		PetDto petDto = petDao.selectOne(detailDto.get(0).getTrainingDetailPetNo());
		String petName = "";
		if(detailDto.size()==1) {
			petName=petDto.getPetName();
		}else {
			petName=petDto.getPetName()+" 외 "+(detailDto.size()-1)+"마리";
		}
		model.addAttribute("petName", petName);
		
		return "mypage/training_detail";
	}
	
	
	

}
