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
		//????????? ?????? ????????? ??????
		String memberId = (String)session.getAttribute(SessionConstant.ID);
		int trainerNo = trainerDao.selectOneTrainerNo(memberId);
		session.setAttribute(SessionConstant.trainingNo, trainerNo);
		return "trainer/main";
	}
	
	@RequestMapping("/request_list")
	public String requestList(Model model, HttpSession session ) {
		String memberId = (String) session.getAttribute(SessionConstant.ID);	
		int trainerNo = trainerDao.selectOneTrainerNo(memberId); // trainerNo??? ?????????
				
		List<TrainingRequestListVO> list = trainingDao.requestList(trainerNo);
		model.addAttribute("requestList", list);		
		
		return "trainer/request_list";
	}
	
	@GetMapping("/request_detail")
	public String requestDetail(Model model, @RequestParam int trainingNo) {
		//???????????? trainingNo??? ???????????? ????????? ???????????? ????????? ??????
		
		TrainingDto dto = trainingDao.selectOne(trainingNo);
		model.addAttribute("trainingDto", dto); // traininNo??? ????????? ?????? ?????????
		
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
		
		int trainerNo = trainerDao.selectOneTrainerNo(trainerId); // trainerNo??? ?????????
		//Dao??? training ???????????? status ?????? ??????update 
		//Dao??? ???????????? ?????? sysdate ???????????? 
		TrainingDto dto = trainingDao.selectOne(trainingNo);
		Date requestDate = dto.getTrainingDate(); //?????? trainingNo??? ?????? ?????? ????????? ??????
		
		
		//date??? ???????????? ?????? ??????????????? 
		CheckRequestVO checkReuqestVO = CheckRequestVO
				.builder()
				.trainingDate(requestDate)
				.trainerNo(trainerNo)
				.build();
		
		List<TrainingDto> list = trainingDao.checkRequest(checkReuqestVO); //??????????????? ????????? ????????? ????????? ?????? 	?????? ????????? ?????? 
		
		if(list.size() > 0) { //?????? ??? ???????????? ????????? ????????? ????????? ??????
			return "trainer/training_disable"; //???????????? ?????? - ?????? ????????? ?????? ?????? ????????????
		}		
		
		Boolean result = trainingDao.statusChange2(trainingNo);	//status ????????? ?????????????????? ????????? ?????????
		
		//????????? ???????????? ?????? ????????? ???????????? dto.getTrainingDate()
		ScheduleDto scheduleDto = ScheduleDto
				.builder()
				.trainerNo(trainerNo)
				.scheduleDate(dto.getTrainingDate())
				.trainingNo(trainingNo)
				.build();
		scheduleDao.insert(scheduleDto);
		
		//chat??? ???????????? ????????? -> ?????? ????????? ??????????????? 
				
		//?????? ?????? ?????? ????????? ????????????
		String memberId = dto.getMemberId();
		
		// ??????????????? ?????? ?????? ?????????
		MemberDto memDto = memberDao.selectOne(memberId);
		MemberDto trainerDto = memberDao.selectOne(trainerId);
		
		
		// ????????? ??? ?????? ?????? vo
		SearchRoomVO vo = SearchRoomVO
				.builder()
				.memberId(memberId)
				.trainerId(trainerId)
				.build();
		String searchRoomNo = chatDao.searchRoomVO(vo);
		
		//????????? searchRoomNo??? null??? ???????????? ???????????? ?????????
		// -> ?????? ????????? ???????????? ????????????
		if(searchRoomNo != null) {			
			//chatDao.insertApproveMessage  ???????????? searchRoomNo
			
			String message ="[ " + dto.getTrainingDate() +" ]" + "????????? ?????????????????????. ???????????????";
			
			ChatDto insertApproveMessage1 = ChatDto
					.builder()
					.roomNo(searchRoomNo)
					.memberId(trainerId)
					.chatMessage(message)
					.build();
			chatDao.insertMessage(insertApproveMessage1);
			
		}
		else {
			String seqNo = chatDao.createRoomSeq();  //????????? ??????????????? ??????	
			
			//??????room ???????????? ????????? ????????? ?????? insert
			chatDao.createRoom(roomDto.builder()
					.roomNo(seqNo)
					.roomCreateAt(roomDto.getRoomCreateAt())
					.roomUpdateAt(roomDto.getRoomUpdateAt())
					.build()
					);
			//?????? ?????? ???????????? ?????? ?????? chat_user???????????? ?????? insert
			chatDao.insertChatUser(chatUserDto.builder()
					.memberId(memberId)
					.roomNo(seqNo)
					.memberName(memDto.getMemberName())
					.memberStatus(memDto.getMemberStatus())
					.build());
			//?????? ???????????? ?????? ?????? memberId??? ??????????????? ?????????...	
			chatDao.insertChatUser(chatUserDto.builder()
					.memberId(trainerId)
					.roomNo(seqNo)
					.memberName(trainerDto.getMemberName())
					.memberStatus(trainerDto.getMemberStatus())
					.build());
			
			String message = "[ " + dto.getTrainingDate() +" ]" + "????????? ?????????????????????. ???????????????";
			
			
			//chatDao.insertApproveMessage  ???????????? seqNo
			ChatDto insertApproveMessage2 = ChatDto
					.builder()
					.roomNo(seqNo)
					.memberId(trainerId)
					.chatMessage(message)
					.build();
					
					
			chatDao.insertMessage(insertApproveMessage2);			
		}
		
		
		return "trainer/training_approve"; //???????????? ??????
	}
	
	@GetMapping("/training_reject")
	public String reject(@RequestParam int trainingNo) {
		//????????? ??????
		TrainingDto trainingDto = trainingDao.selectOne(trainingNo);
		String memberId = trainingDto.getMemberId();
		//??????????????? ??? ?????? ??????
		TrainingPurchaseDto purchaseDto = trainingPurchaseDao.selectOne(trainingNo);
				
		// ??????????????? ????????? -> ??????????????? ??????
		trainingDao.statusChange(trainingNo); 

		//??????????????? ??????????????????(purchase_detail) ???????????? ????????? ??????
		List<PurchaseDetailDto> purchaseDetailDto =
				trainingPurchaseDao.detailSelectOne(purchaseDto.getTrainingPurchaseNo());
		
		for(int i=0; i<purchaseDetailDto.size(); i++) {
			int no = purchaseDetailDto.get(i).getPurchaseDetailNo();
			trainingPurchaseDao.statusChange(no);
		}
		
		// ??????????????? ????????? ????????????(?????? ?????????)
		MemberDto memberDto = MemberDto.builder()
				.memberId(memberId)
				.memberPoint((long)purchaseDto.getTrainingPurchasePrice())
				.build();
		memberDao.pointPlus(memberDto);
		
		// ????????? ???????????? insert(????????? ?????????)
		int pointNo=pointDao.sequence();
		PointDto pointDto = PointDto.builder()
				.pointNo(pointNo)
				.memberId(memberId)
				.pointStatus("??????")
				.pointPrice(purchaseDto.getTrainingPurchasePrice())
				.build();
		pointDao.cancelInsert(pointDto);
		
		return "trainer/training_reject"; //????????????(????????????)
	}
	
	
	@RequestMapping("/mypage_profile")
	public String mypageProfile(Model model,
			HttpSession session,
			@ModelAttribute TrainerDto trainerDto
			) {
		
		String memberId = (String) session.getAttribute(SessionConstant.ID);		
		TrainerDto dto = trainerDao.selectOnePro(memberId);		
		
		model.addAttribute("trainerDto", dto );	
		
		//?????? ???????????? ?????? ????????? ???????????? ???????????????
		int filesNo = memberDao.findFileNo(memberId); //?????? ???????????? ?????? ?????? ????????????
		model.addAttribute("filesDto", filesDao.find(filesNo)); //???????????? ????????? filesDto ?????? model??? ??????
		
		return "trainer/mypage_profile";
	}
	
	
	@GetMapping("/mypage_profile_edit")
	public String mypageProfileEdit(Model model,@ModelAttribute TrainerDto trainerDto, HttpSession session) {
		
		String memberId = (String) session.getAttribute(SessionConstant.ID);		
		TrainerDto dto = trainerDao.selectOnePro(memberId);		
		model.addAttribute("trainerDto", dto );	
		
		//?????? ???????????? ?????? ????????? ???????????? ???????????????
		int filesNo = memberDao.findFileNo(memberId); //?????? ???????????? ?????? ?????? ????????????
		model.addAttribute("filesDto", filesDao.find(filesNo)); //???????????? ????????? filesDto ?????? model??? ??????		
		
		return "trainer/mypage_profile_edit";
	}
	
	@PostMapping("/mypage_profile_edit")		
	public String mypageProfileEdit( //????????? ??????	
			@ModelAttribute TrainerDto trainerDto, 
			@ModelAttribute MemberImgDto memberImgDto,
			HttpSession session) {  
		
		int originFilesNo = memberDao.findFileNo(trainerDto.getMemberId());
		int newFilesNo = memberImgDto.getFilesNo();
		
		// ?????? ?????? ????????? ????????? ??????????????? ?????? ?????????
		// ???????????? ?????? ??? ????????? ???????????? ??????
		if(originFilesNo!=newFilesNo) {
			memberDao.memberImgDelete(trainerDto.getMemberId()); //??????
			memberDao.memberProfileInsert(memberImgDto); //??????
		}
		
		//????????? ?????? ??????
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

	
	//???????????? ?????? ?????? ????????? ????????????

	
}
	
	
	
	

	

