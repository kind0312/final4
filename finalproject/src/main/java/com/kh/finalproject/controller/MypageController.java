package com.kh.finalproject.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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
import com.kh.finalproject.repository.ChatDao;
import com.kh.finalproject.repository.MemberDao;
import com.kh.finalproject.repository.PointDao;
import com.kh.finalproject.repository.ReviewDao;
import com.kh.finalproject.repository.ScheduleDao;
import com.kh.finalproject.repository.TrainerDao;
import com.kh.finalproject.repository.TrainerLikeDao;
import com.kh.finalproject.repository.TrainingDao;
import com.kh.finalproject.repository.TrainingPurchaseDao;
import com.kh.finalproject.vo.OneTrainingVO;
import com.kh.finalproject.vo.PaginationListSearchVO;
import com.kh.finalproject.vo.PointListVO;
import com.kh.finalproject.vo.TrainerOneVO;

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
	private TrainerDao trainerDao;
	@Autowired
	private TrainerLikeDao trainerLikeDao;
	@Autowired
	private ScheduleDao scheduleDao;
	@Autowired
	private ReviewDao reviewDao;
	@Autowired
	private ChatDao chatDao;
	
	//포인트 관리
//	@RequestMapping("/point")
//	public String list(HttpSession session, Model model) {
//		String memberId = (String)session.getAttribute(SessionConstant.ID);
//		model.addAttribute("point", memberDao.selectOne(memberId));
//		List<PointDto> list = pointDao.selectList(memberId);
//		model.addAttribute("list", list);
//		return "mypage/point_list";
//	}
	
	@RequestMapping("/point")
	public String list(HttpSession session, Model model,
			@ModelAttribute(name = "vo") PointListVO vo) {
		String memberId = (String)session.getAttribute(SessionConstant.ID);
		model.addAttribute("point", memberDao.selectOne(memberId));
		List<PointDto> list = pointDao.selectList(memberId);
		//model.addAttribute("list", list);
		
		// 조회 유형 판정과 실행시킬 메소드를 PointDaoImpl에서 결정하도록 변경
		// 조회 유형에 따른 조회 결과의 총 갯수를 반환
		vo.setMemberId(memberId); //count구하기 위해 먼저 실행되어야함
		// 반환한 조회 결과의 총 갯수(count)를 vo의 count 필드의 값으로 설정
		int count = pointDao.count(vo);
		vo.setCount(count);
		
		int endRow = vo.getP()*vo.getSize();
		int startRow = endRow - (vo.getSize() - 1);
		vo.setEndRow(endRow);
		vo.setStartRow(startRow);
		
		// model에 조회 유형에 따른 조회 결과를 첨부
		model.addAttribute("page", pointDao.listAll(vo));

		return "mypage/point_list";
	}
	
	
	//예약 확인
	@RequestMapping("/training")
	public String training(HttpSession session, Model model) {
		String memberId = (String)session.getAttribute(SessionConstant.ID);
		//비동기 처리 위한 데이터 넘김
		model.addAttribute("memberId", memberId);
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
		List<OneTrainingVO> dto = trainingDao.oneTraining(trainingNo);
		model.addAttribute("training", dto);
		//해당 훈련사 정보 단일조회
		TrainerOneVO onevo = trainerDao.selectOnePro(dto.get(0).getTrainerNo());
		model.addAttribute("trainer", onevo);
		//결제내역 단일조회
		model.addAttribute("purchase", trainingPurchaseDao.selectOne(trainingNo));
		//리뷰 작성 여부
		model.addAttribute("reviewDto", reviewDao.writed(trainingNo));
		return "mypage/training_detail";
	}
	
	@RequestMapping("/training_cancel")
	public String cancel(@RequestParam int trainingNo, Model model) {
		//훈련서비스 단일조회
		model.addAttribute("training", trainingDao.oneTraining(trainingNo));
		//결제내역 단일조회
		model.addAttribute("purchase", trainingPurchaseDao.selectOne(trainingNo));

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
		pointDao.cancelInsert(pointDto);
		
		//3. 훈련서비스(training) 상태 예약취소로 변경
		trainingDao.statusChange(trainingDetailDto.getTrainingNo());
		
		//4. 훈련서비스 결제상세내역(purchase_detail) 거래상태 취소로 변경
		TrainingPurchaseDto trainingPurchaseDto = 
				trainingPurchaseDao.selectOne(trainingDetailDto.getTrainingNo()); 
		List<PurchaseDetailDto> purchaseDetailDto =
				trainingPurchaseDao.detailSelectOne(trainingPurchaseDto.getTrainingPurchaseNo());
		
		for(int i=0; i<purchaseDetailDto.size(); i++) {
			int no = purchaseDetailDto.get(i).getPurchaseDetailNo();
			trainingPurchaseDao.statusChange(no);
		}
		
		//스케줄 테이블 DB삭제
		scheduleDao.delete(trainingDetailDto.getTrainingNo());

		return "redirect:/mypage/cancel_success";
	}

	@RequestMapping("/cancel_success")
	public String cancel_success() {
		return "mypage/training_cancel_success";
	}
	
	//정보수정
	@RequestMapping("/profile")
	public String profile(HttpSession session, Model model) {
		String memberId = (String)session.getAttribute(SessionConstant.ID);
		model.addAttribute("member", memberDao.selectOne(memberId));
		model.addAttribute("filesNo", memberDao.findFileNo(memberId));
		return "mypage/profile";
	}
	
	//후기작성내역
	@RequestMapping("/review")
	public String review(HttpSession session, Model model,
			@ModelAttribute(name = "vo") PaginationListSearchVO vo) {
		String memberId = (String)session.getAttribute(SessionConstant.ID);

		vo.setMemberId(memberId); //count구하기 위해 먼저 실행되어야함
		int count = reviewDao.count(vo);
		vo.setCount(count);
		
		int endRow = vo.getP()*vo.getSize();
		int startRow = endRow - (vo.getSize() - 1);
		vo.setEndRow(endRow);
		vo.setStartRow(startRow);
		
		// model에 조회 유형에 따른 조회 결과를 첨부
		model.addAttribute("list", reviewDao.listAll(vo));
		
		return "mypage/review_list";
	}
	
	@GetMapping("/like")
	public String like(Model model, HttpSession session) {
		
		String memberId = (String)session.getAttribute(SessionConstant.ID);
		model.addAttribute("like", trainerLikeDao.likeList(memberId));
		
		return "mypage/like_list";
	}
	

}
