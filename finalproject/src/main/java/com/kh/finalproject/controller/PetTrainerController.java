package com.kh.finalproject.controller;


import java.sql.Date;
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
import com.kh.finalproject.entity.ChatDto;
import com.kh.finalproject.entity.ChatUserDto;
import com.kh.finalproject.entity.MemberDto;
import com.kh.finalproject.entity.MemberImgDto;
import com.kh.finalproject.entity.PointDto;
import com.kh.finalproject.entity.PurchaseDetailDto;
import com.kh.finalproject.entity.RoomDto;
import com.kh.finalproject.entity.ScheduleDto;
import com.kh.finalproject.entity.TrainerDto;
import com.kh.finalproject.entity.TrainingDto;
import com.kh.finalproject.entity.TrainingPurchaseDto;
import com.kh.finalproject.repository.ChatDao;
import com.kh.finalproject.repository.FilesDao;
import com.kh.finalproject.repository.MemberDao;
import com.kh.finalproject.repository.PetDao;
import com.kh.finalproject.repository.PointDao;
import com.kh.finalproject.repository.ScheduleDao;
import com.kh.finalproject.repository.TrainerDao;
import com.kh.finalproject.repository.TrainingDao;
import com.kh.finalproject.repository.TrainingPurchaseDao;
import com.kh.finalproject.vo.CheckRequestVO;
import com.kh.finalproject.vo.PetDetailListVO;
import com.kh.finalproject.vo.SearchRoomVO;
import com.kh.finalproject.vo.TrainingRequestListVO;




@Controller
@RequestMapping("/trainer")
public class PetTrainerController {
	
	@Autowired
	private TrainerDao trainerDao;
	@Autowired
	private FilesDao filesDao;
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private TrainingDao trainingDao;
	@Autowired
	private PetDao petDao;
	@Autowired
	private TrainingPurchaseDao trainingPurchaseDao;
	@Autowired
	private ScheduleDao scheduleDao;
	@Autowired
	private ChatDao chatDao;
	@Autowired
	private PointDao pointDao;
	

	@RequestMapping("/main")
	public String main(HttpSession session) {
		//훈련사 번호 세션에 저장
		String memberId = (String)session.getAttribute(SessionConstant.ID);
		int trainerNo = trainerDao.selectOneTrainerNo(memberId);
		session.setAttribute(SessionConstant.trainingNo, trainerNo);
		return "trainer/main";
	}
	
	@RequestMapping("/request_list")
	public String requestList(Model model, HttpSession session ) {
		String memberId = (String) session.getAttribute(SessionConstant.ID);	
		int trainerNo = trainerDao.selectOneTrainerNo(memberId); // trainerNo를 찾아옴
		
		//System.out.println("트레이너 번호 : " + trainerNo);	
				
		List<TrainingRequestListVO> list = trainingDao.requestList(trainerNo);
		model.addAttribute("requestList", list);		
		
		return "trainer/request_list";
	}
	
	@GetMapping("/request_detail")
	public String requestDetail(Model model, @RequestParam int trainingNo) {
		//상세니까 trainingNo로 조회해서 한개의 결과값만 오는게 맞음
		
		TrainingDto dto = trainingDao.selectOne(trainingNo);
		model.addAttribute("trainingDto", dto); // traininNo로 하나만 내역 뽑아옴
		
		List<PetDetailListVO> list = trainingDao.requestDetail(trainingNo);
		model.addAttribute("petList", list);

		return "trainer/request_detail";
	}
	
	@GetMapping("/training_approve")
	public String approve(@RequestParam int trainingNo
			, HttpSession session
			,@ModelAttribute RoomDto roomDto
			,@ModelAttribute ChatUserDto chatUserDto
			,@ModelAttribute MemberDto memberDto
			) {
		
		String trainerId = (String) session.getAttribute(SessionConstant.ID);	
		
		
		int trainerNo = trainerDao.selectOneTrainerNo(trainerId); // trainerNo를 찾아옴
		//Dao에 training 테이블의 status 상태 수정update 
		//Dao에 상태수정 날짜 sysdate 들어가게 
		TrainingDto dto = trainingDao.selectOne(trainingNo);
		Date requestDate = dto.getTrainingDate(); //해당 trainingNo의 훈련 요청 날짜를 구함
		
		
		//date랑 트레이너 번호 들어가야함 
		CheckRequestVO checkReuqestVO = CheckRequestVO
				.builder()
				.trainingDate(requestDate)
				.trainerNo(trainerNo)
				.build();
		
		
		List<TrainingDto> list = trainingDao.checkRequest(checkReuqestVO); //훈련날짜에 확정된 예약이 있는지 검색 	지금 여기가 문제 
		System.out.println("예약날짜 개수: " + list.size());		
		
		
		if(list.size() > 0) { //이거 꼭 확인하기 로그인 안돼서 테스트 못함
			return "trainer/training_disable"; //예약승인 불가 - 승인 불가한 경우 코드 넣어야함
		}		
		
		Boolean result = trainingDao.statusChange2(trainingNo);	//status 상태를 예약확정으로 바꾸는 메소드
		
		//스케줄 테이블에 예약 날짜를 넣어야함 dto.getTrainingDate()
		ScheduleDto scheduleDto = ScheduleDto
				.builder()
				.trainerNo(trainerNo)
				.scheduleDate(dto.getTrainingDate())
				.trainingNo(trainingNo)
				.build();
		scheduleDao.insert(scheduleDto);
		
		//chat방 자동생성 되면서 -> 예약 메시지 들어가야함 
				
		//해당 예약 회원 아이디 찾아오기
		String memberId = dto.getMemberId();
		
		// 트레이너랑 멤버 정보 가져옴
		MemberDto memDto = memberDao.selectOne(memberId);
		MemberDto trainerDto = memberDao.selectOne(trainerId);
		
		
		// 채팅방 룸 찾을 준비 vo
		SearchRoomVO vo = SearchRoomVO
				.builder()
				.memberId(memberId)
				.trainerId(trainerId)
				.build();
		String searchRoomNo = chatDao.searchRoomVO(vo);
		System.out.println( " 룸 번호 " + searchRoomNo);
		
		//만약에 searchRoomNo가 null이 아니라면 방번호가 있는것
		// -> 해당 방으로 메세지를 보내야함
		if(searchRoomNo != null) {			
			//chatDao.insertApproveMessage  룸번호는 searchRoomNo
			
			String message ="[ " + dto.getTrainingDate() +" ]" + "예약이 확정되었습니다. 감사합니다";
			
			
			ChatDto insertApproveMessage1 = ChatDto
					.builder()
					.roomNo(searchRoomNo)
					.memberId(trainerId)
					.chatMessage(message)
					.build();
					
					
			chatDao.insertMessage(insertApproveMessage1);
			//System.out.println("인서트 메세지" + insertApproveMessage1);
			
		}
		else {
			String seqNo = chatDao.createRoomSeq();  //채팅방 시퀀스번호 생성	
			
			//채팅room 테이블에 생성된 테이블 정보 insert
			chatDao.createRoom(roomDto.builder()
					.roomNo(seqNo)
					.roomCreateAt(roomDto.getRoomCreateAt())
					.roomUpdateAt(roomDto.getRoomUpdateAt())
					.build()
					);
			//해당 방에 들어가는 유저 정보 chat_user테이블에 정보 insert
			chatDao.insertChatUser(chatUserDto.builder()
					.memberId(memberId)
					.roomNo(seqNo)
					.memberName(memDto.getMemberName())
					.memberStatus(memDto.getMemberStatus())
					.build());
			//그럼 훈련사도 같은 방에 memberId가 저장되어야 하는데...	
			chatDao.insertChatUser(chatUserDto.builder()
					.memberId(trainerId)
					.roomNo(seqNo)
					.memberName(trainerDto.getMemberName())
					.memberStatus(trainerDto.getMemberStatus())
					.build());
			
			System.out.println("새로방만들기 성공");
			
			String message = "[ " + dto.getTrainingDate() +" ]" + "예약이 확정되었습니다. 감사합니다";
			
			
			//chatDao.insertApproveMessage  룸번호는 seqNo
			ChatDto insertApproveMessage2 = ChatDto
					.builder()
					.roomNo(seqNo)
					.memberId(trainerId)
					.chatMessage(message)
					.build();
					
					
			chatDao.insertMessage(insertApproveMessage2);			
		}
		
		
		return "trainer/training_approve"; //예약승인 성공
	}
	
	@GetMapping("/training_reject")
	public String reject(@RequestParam int trainingNo) {
		//아이디 도출
		TrainingDto trainingDto = trainingDao.selectOne(trainingNo);
		String memberId = trainingDto.getMemberId();
		//훈련서비스 총 금액 확인
		TrainingPurchaseDto purchaseDto = trainingPurchaseDao.selectOne(trainingNo);
				
		// 훈련서비스 상태를 -> 예약취소로 변경
		trainingDao.statusChange(trainingNo); 

		//훈련서비스 결제상세내역(purchase_detail) 거래상태 취소로 변경
		List<PurchaseDetailDto> purchaseDetailDto =
				trainingPurchaseDao.detailSelectOne(purchaseDto.getTrainingPurchaseNo());
		
		for(int i=0; i<purchaseDetailDto.size(); i++) {
			int no = purchaseDetailDto.get(i).getPurchaseDetailNo();
			trainingPurchaseDao.statusChange(no);
		}
		
		// 결제금액분 포인트 증가처리(회원 테이블)
		MemberDto memberDto = MemberDto.builder()
				.memberId(memberId)
				.memberPoint((long)purchaseDto.getTrainingPurchasePrice())
				.build();
		memberDao.pointPlus(memberDto);
		
		// 포인트 사용내역 insert(포인트 테이블)
		int pointNo=pointDao.sequence();
		PointDto pointDto = PointDto.builder()
				.pointNo(pointNo)
				.memberId(memberId)
				.pointStatus("환불")
				.pointPrice(purchaseDto.getTrainingPurchasePrice())
				.build();
		pointDao.cancelInsert(pointDto);
		
		return "trainer/training_reject"; //예약거절(승인취소)
	}
	
	
	@RequestMapping("/mypage_profile")
	public String mypageProfile(Model model,
			HttpSession session,
			@ModelAttribute TrainerDto trainerDto
			) {
		
		String memberId = (String) session.getAttribute(SessionConstant.ID);		
		TrainerDto dto = trainerDao.selectOnePro(memberId);		
		
		model.addAttribute("trainerDto", dto );	
		
		//멤버 아이디로 파일 조회해 오는것도 추가해야함
		int filesNo = memberDao.findFileNo(memberId); //멤버 아이디로 파일 번호 조회해옴
		model.addAttribute("filesDto", filesDao.find(filesNo)); //조회해온 번호로 filesDto 정보 model에 첨부
		
		return "trainer/mypage_profile";
	}
	
	
	@GetMapping("/mypage_profile_edit")
	public String mypageProfileEdit(Model model,@ModelAttribute TrainerDto trainerDto, HttpSession session) {
		
		String memberId = (String) session.getAttribute(SessionConstant.ID);		
		TrainerDto dto = trainerDao.selectOnePro(memberId);		
		model.addAttribute("trainerDto", dto );	
		
		//멤버 아이디로 파일 조회해 오는것도 추가해야함
		int filesNo = memberDao.findFileNo(memberId); //멤버 아이디로 파일 번호 조회해옴
		model.addAttribute("filesDto", filesDao.find(filesNo)); //조회해온 번호로 filesDto 정보 model에 첨부		
		
		return "trainer/mypage_profile_edit";
	}
	
	@PostMapping("/mypage_profile_edit")		
	public String mypageProfileEdit( //동기로 처리	
			@ModelAttribute TrainerDto trainerDto, 
			@ModelAttribute MemberImgDto memberImgDto,
			HttpSession session) {  
		
		int originFilesNo = memberDao.findFileNo(trainerDto.getMemberId());
		int newFilesNo = memberImgDto.getFilesNo();
		
		// 기존 파일 번호와 새로운 파일번호가 같지 않다면
		// 기존파일 삭제 후 새로운 파일번호 등록
		if(originFilesNo!=newFilesNo) {
			memberDao.memberImgDelete(trainerDto.getMemberId()); //삭제
			memberDao.memberProfileInsert(memberImgDto); //등록
		}
		
		//프로필 정보 수정
		trainerDao.updateTrainer(trainerDto);
		
		 return "redirect:/trainer/mypage_profile";
	}

	
	@RequestMapping("/mypage_reservation")
	public String reservation(HttpSession session, Model model) {
		int trainerNo = (int)session.getAttribute(SessionConstant.trainingNo);
		model.addAttribute("ingList", trainingDao.ingList(trainerNo));
		model.addAttribute("endList", trainingDao.endList(trainerNo));
		return "trainer/mypage_reservation";
	}

	
	@RequestMapping("/mypage_reservation_detail")
	public String reservationDetail(@RequestParam int trainingNo, Model model) {
		model.addAttribute("detail", trainingDao.detailList(trainingNo));
		return "trainer/mypage_reservation_detail";
	}

	@RequestMapping("/schedule")
	public String schedule(HttpSession session, Model model) {
		int trainerNo = (int)session.getAttribute(SessionConstant.trainingNo);
		model.addAttribute("trainerNo", trainerNo);
		return "trainer/schedule";
	}

	
	//로그아웃 누를 경우 세션값 제거하기

	
}
	
	
	
	

	

