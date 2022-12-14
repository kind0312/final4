package com.kh.finalproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ScheduleController {

	
	@GetMapping("/schedule")
	@ResponseBody
	public void schedule () {
		//트레이너 memberId로 tarinerNo를 구하고
		//trainerNo로 예약확정 or 이용완료 된 예약목록을 가져온다
		
		
	}
}
