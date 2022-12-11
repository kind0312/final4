package com.kh.finalproject.controller;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.finalproject.constant.SessionConstant;
import com.kh.finalproject.entity.MemberImgDto;
import com.kh.finalproject.entity.PetDto;
import com.kh.finalproject.entity.TrainerDto;
import com.kh.finalproject.entity.TrainingDetailDto;
import com.kh.finalproject.entity.TrainingDto;
import com.kh.finalproject.repository.FilesDao;
import com.kh.finalproject.repository.MemberDao;
import com.kh.finalproject.repository.PetDao;
import com.kh.finalproject.repository.TrainerDao;
import com.kh.finalproject.repository.TrainingDao;
import com.kh.finalproject.vo.PetDetailListVO;

import lombok.Builder;



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
	
	
	@RequestMapping("/main")
	public String main() {
		
		return "trainer/main";
	}
	
	@RequestMapping("/request_list")
	public String requestList(Model model, HttpSession session ) {
		String memberId = (String) session.getAttribute(SessionConstant.ID);	
		int trainerNo = trainerDao.selectOneTrainerNo(memberId); // trainerNo를 찾아옴
		
		System.out.println("트레이너 번호 : " + trainerNo);
		
				
		List<TrainingDto> list = trainerDao.requestList(trainerNo);  //예약 요청 리스트
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
	public String approve(@RequestParam int trainingNo) {
		//Dao에 training 테이블의 status 상태 수정update 
		//Dao에 상태수정 날짜 sysdate 들어가게 
		Boolean result = trainingDao.statusChange2(trainingNo);		
		if(!result) {
			return "trainer/training_disable"; //예약승인 불가 - 승인 불가한 경우 코드 넣어야함
		}		
		return "trainer/training_approve"; //예약승인 성공
	}
	
	@GetMapping("/training_reject")
	public String reject(@RequestParam int trainingNo) {
		trainingDao.statusChange(trainingNo); // 상태를 -> 예약취소로 변경
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
		System.out.println("겟매핑 dto =" + dto);
		model.addAttribute("trainerDto", dto );	
		
		//멤버 아이디로 파일 조회해 오는것도 추가해야함
		int filesNo = memberDao.findFileNo(memberId); //멤버 아이디로 파일 번호 조회해옴
		model.addAttribute("filesDto", filesDao.find(filesNo)); //조회해온 번호로 filesDto 정보 model에 첨부		
		
		return "trainer/mypage_profile_edit";
	}
	
	
	
	
	@PostMapping("/mypage_profile_edit")		
	public String mypageProfileEdit(@ModelAttribute TrainerDto trainerDto, 
														@ModelAttribute MemberImgDto memberImgDto,
															HttpSession session) {  //동기로 처리
		
		//훈련사 Trainer 테이블 update					
		
		System.out.println("Post매핑 trainerDto=" + trainerDto);
		Boolean result =trainerDao.updateTrainer(trainerDto);
	
		System.out.println(result);
		
		//첨부파일 연결 db등록 member_img (member Dao에 update 메소드 가져와야함)
		//int filesNo = memberDao.findFileNo(SessionConstant.ID); //새로 넣은 filesNo를 가져와야하는데 이렇게 가져오면 예전걸 가져온단 말이지
				
		//member_img 테이블에 이전 데이터를 지우고 (memberId로)
		String memberId = (String) session.getAttribute(SessionConstant.ID);
		memberDao.memberImgDelete(memberId); // 이전 데이터 삭제
		memberDao.memberProfileInsert(memberImgDto);	//이거 정상 작동함 
		
		if(result) {			
			return "redirect:/trainer/mypage_profile";
		}
		else {
			return "redirect:fail";
			}
		}
	
	
	}
	
	
	
	
//	@RequestMapping("/chat_list")
//	public String chatlist() {
//		
//		return "trainer/chat_list";
//	}
	

