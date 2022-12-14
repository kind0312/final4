package com.kh.finalproject.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.finalproject.constant.SessionConstant;
import com.kh.finalproject.entity.LikeDto;
import com.kh.finalproject.entity.MemberDto;
import com.kh.finalproject.entity.PurchaseDetailDto;
import com.kh.finalproject.entity.TrainingDetailDto;
import com.kh.finalproject.entity.TrainingDto;
import com.kh.finalproject.entity.TrainingPurchaseDto;
import com.kh.finalproject.repository.MemberDao;
import com.kh.finalproject.repository.PetDao;
import com.kh.finalproject.repository.TrainerDao;
import com.kh.finalproject.repository.TrainerLikeDao;
import com.kh.finalproject.repository.TrainingDao;
import com.kh.finalproject.repository.TrainingPurchaseDao;
import com.kh.finalproject.vo.ReservationVO;
import com.kh.finalproject.vo.ReviewVO;
import com.kh.finalproject.vo.TrainerListVO;

@Controller
@RequestMapping("/trainer")
public class TrainerController {
	
	@Autowired
	private TrainingPurchaseDao trainingPurchaseDao;
	
	@Autowired
	private TrainerDao trainerDao;
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private TrainingDao trainingDao;
	
	@Autowired
	private PetDao petDao;
	
	@Autowired
	private TrainerLikeDao trainerLikeDao; 
	
	//훈련사 디테일(단일조회)
	@GetMapping("/detail")
	public String detail(Model model,
			@ModelAttribute TrainerListVO trainerListvo,
			@ModelAttribute ReviewVO reviewVo,
			@RequestParam int trainerNo,
			HttpSession session
			) {
		
		model.addAttribute("list", trainerDao.selectOne(trainerListvo.getTrainerNo()));	
		model.addAttribute("review", trainerDao.selectTrainerReview(reviewVo.getTrainerNo()));
		
		//좋아요 기록 조회
				String memberId = (String) session.getAttribute(SessionConstant.ID);
				if(memberId != null) {
					LikeDto likeDto = new LikeDto();
					likeDto.setMemberId(memberId);
					likeDto.setTrainerNo(trainerNo);
					model.addAttribute("isLike", trainerLikeDao.check(likeDto));
				}
		
		return "trainer/trainer_detail";
		
	}
	
	@PostMapping("/detail")
	public String detail() {
		
		return "trainer/trainer_detail";
	}
	
	//훈련사 목록 
	@GetMapping("/list")
	public String list(Model model) {
		
		
	model.addAttribute("list", trainerDao.selectTrainerList());	
		
	return "trainer/trainer_list";
		
	}
	
	
	@GetMapping("/reservation")
	public String reservation(@ModelAttribute MemberDto memberDto,Model model,
			@RequestParam int trainerNo,
			HttpSession session) {
		
		
		String userId = (String)session.getAttribute(SessionConstant.ID);

		model.addAttribute("member", memberDao.selectOne(userId));
		model.addAttribute("pet", petDao.list(userId));
		model.addAttribute("trainerno",trainerNo);
		
		return "/trainer/reservation";
	}
	
	
	@PostMapping("/reservation")
	public String reservation(HttpSession session,
			@ModelAttribute ReservationVO reservationVO,
			HttpServletRequest request) {
		
		int trainingNo = trainingDao.sequence();
		int trainingPurchaseNo =  trainingPurchaseDao.sequence();
		
		
		TrainingDto trainingDto =TrainingDto.builder()
				.trainingNo(trainingNo)
				.memberId(reservationVO.getMemberId())
				.trainingDate(reservationVO.getTrainingDate())
				.trainingStartTime(reservationVO.getTrainingStartTime())
				.trainingBasicAddress(reservationVO.getTrainingBasicAddress())
				.trainingDetailAddress(reservationVO.getTrainingDetailAddress())
				.trainingMemo(reservationVO.getTrainingMemo())
				.build();
		
		trainingDao.insert(trainingDto);
		
		TrainingPurchaseDto trainingPurchaseDto = TrainingPurchaseDto.builder()
				.trainingPurchaseNo(trainingPurchaseNo)
				.trainingNo(trainingNo)
				.trainingPurchasePrice(reservationVO.getTrainingPurchasePrice())
				.build();
		
		trainingPurchaseDao.purchaseInsert(trainingPurchaseDto);
		
		
		
		String[] arrayParam = request.getParameterValues("trainingDetailPetName");
		String[] arrayParam2 = request.getParameterValues("purchaseDetailPrice");
		
		if(arrayParam != null) {
			for(int i = 0; i<arrayParam.length; i++) {
				
				TrainingDetailDto trainingDetailDto = TrainingDetailDto.builder()
						.trainingNo(trainingNo)
						.trainingDetailPetName(arrayParam[i])
						.build();
				trainingDao.insertDetail(trainingDetailDto);
				
				
				PurchaseDetailDto purchaseDetailDto = PurchaseDetailDto.builder()
						.trainingPurchaseNo(trainingPurchaseNo)
						.purchaseDetailPetName(arrayParam[i])
						.purchaseDetailPrice(Integer.parseInt(arrayParam2[i]))
						.build();
				
				
				trainingPurchaseDao.purchaseDetailInsert(purchaseDetailDto);
				
			}
		}
		
		
		return "redirect:/trainer/list";
	}
	
	@GetMapping("/like") //인증글 좋아요
	public String trainerLike(
				@RequestParam int trainerNo,
				HttpSession session, 
				RedirectAttributes attr) {
		String memberId = (String)session.getAttribute(SessionConstant.ID);
		LikeDto dto = new LikeDto();
		dto.setMemberId(memberId);
		dto.setTrainerNo(trainerNo);
		
		if(trainerLikeDao.check(dto)) {//좋아요를 한 상태면
			trainerLikeDao.delete(dto);//취소(데이터 삭제)
		}
		else {//좋아요를 한 적이 없는 상태면
			trainerLikeDao.insert(dto);//좋아요(데이터 추가)
		}
		
		trainerLikeDao.refresh(trainerNo);//trainer_like(인증글 좋아요 수) 갱신
		
		attr.addAttribute("trainerNo", trainerNo);
		return "redirect:detail";
	}

}
