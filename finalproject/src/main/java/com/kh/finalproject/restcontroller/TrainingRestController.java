package com.kh.finalproject.restcontroller;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.finalproject.repository.TrainingDao;
import com.kh.finalproject.vo.ReservationListVO;
import com.kh.finalproject.vo.ScheduleVO;

import io.swagger.v3.oas.annotations.tags.Tag;

@Tag(name="훈련서비스 컨트롤러")
@RestController
@RequestMapping("/rest")
public class TrainingRestController {
	
	@Autowired
	private TrainingDao trainingDao;
	
	@PatchMapping("/training_status/{trainingNo}")
	public boolean list(@PathVariable int trainingNo){
		return trainingDao.statusChange3(trainingNo);
	}
	
	@GetMapping("/schedule/{trainingDate}/{trainerNo}")
	public List<ReservationListVO> schedule(@PathVariable Date trainingDate,
			@PathVariable int trainerNo){
		ScheduleVO vo = ScheduleVO.builder()
				.trainerNo(trainerNo)
				.trainingDate(trainingDate)
				.build();
		return trainingDao.schedule(vo);
	}
	

}
