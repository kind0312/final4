package com.kh.finalproject.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.finalproject.constant.SessionConstant;
import com.kh.finalproject.entity.MemberDto;
import com.kh.finalproject.entity.PointDto;
import com.kh.finalproject.entity.PurchaseDetailDto;
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
		model.addAttribute("purchase", trainingPurchaseDao.selectOne(trainingNo));
		//훈련서비스 받은 반려동물 조회		
		List<TrainingDetailDto> detailDto = trainingDao.trainingPet(trainingNo);
		//반려견 이름 출력
		String petName = detailDto.get(0).getTrainingDetailPetName();
		if(detailDto.size()>1) {
			petName=detailDto.get(0).getTrainingDetailPetName()+" 외 "+(detailDto.size()-1)+"마리";
		}
		model.addAttribute("petName", petName);
		
		return "mypage/training_detail";
	}
	
	@RequestMapping("/training_cancel")
	public String cancel(@RequestParam int trainingNo, Model model) {
		//화면에 필요한 데이터 찍어주기
		//훈련서비스 단일조회
		model.addAttribute("training", trainingDao.selectOne(trainingNo));
		//훈련받은 반려동물 마리수 조회
		model.addAttribute("petCount", trainingDao.petCount(trainingNo));
		//결제내역 단일조회
		model.addAttribute("purchase", trainingPurchaseDao.selectOne(trainingNo));
		//훈련서비스 받은 반려동물 조회		
		List<TrainingDetailDto> detailDto = trainingDao.trainingPet(trainingNo);
		//반려견 이름 출력
		String petName = detailDto.get(0).getTrainingDetailPetName();
		if(detailDto.size()>1) {
			petName=detailDto.get(0).getTrainingDetailPetName()+" 외 "+(detailDto.size()-1)+"마리";
		}
		model.addAttribute("petName", petName);

		return "mypage/training_cancel";
	}
	
	@PostMapping("/training_cancel")
	public String cancel(@ModelAttribute TrainingDetailDto trainingDetailDto,
			HttpSession session) {
		//예약대기, 예약확정 상태에서만 취소신청가능
		//1. 결제금액만큼 포인트 환불
		String memberId = (String)session.getAttribute(SessionConstant.ID);
		TrainingPurchaseDto dto = 
				trainingPurchaseDao.selectOne(trainingDetailDto.getTrainingNo());
		int payPrice = dto.getTrainingPurchasePrice();
		MemberDto memberDto = MemberDto.builder()
								.memberId(memberId)
								.memberPoint((long)payPrice)
								.build();
		memberDao.pointPlus(memberDto);
		
		//2. 포인트 사용내역(point) 상태 환불로 변경
		int pointNo=pointDao.sequence();
		PointDto pointDto = PointDto.builder()
				.pointNo(pointNo)
				.memberId(memberId)
				.pointStatus("환불")
				.pointPrice(payPrice)
				.build();
		System.out.println(pointDto);
		pointDao.cancelInsert(pointDto);
		
		//3. 훈련서비스(training) 상태 예약취소로 변경
		trainingDao.statusChange(trainingDetailDto.getTrainingNo());
		
		//4. 훈련서비스 결제상세내역(purchase_detail) 거래상태 취소로 변경
		TrainingPurchaseDto trainingPurchaseDto = 
				trainingPurchaseDao.selectOne(trainingDetailDto.getTrainingNo()); 
		List<PurchaseDetailDto> purchaseDetailDto =
				trainingPurchaseDao.detailSelectOne(trainingPurchaseDto.getTrainingPurchaseNo());
		
		for(int i=0; i<purchaseDetailDto.size(); i++) {
			int no = purchaseDetailDto.get(i).getTrainingPurchaseNo();
			trainingPurchaseDao.statusChange(no);
		}
		
		return "redirect:/mypage/cancel_success";
	}

	@RequestMapping("/cancel_success")
	public String cancel_success() {
		return "mypage/training_cancel_success";
	}
	
	@RequestMapping("/profile")
	public String profile(HttpSession session, Model model) {
		String memberId = (String)session.getAttribute(SessionConstant.ID);
		model.addAttribute("member", memberDao.selectOne(memberId));
		model.addAttribute("filesNo", memberDao.findFileNo(memberId));
		return "mypage/profile";
	}
	
	
	

}
