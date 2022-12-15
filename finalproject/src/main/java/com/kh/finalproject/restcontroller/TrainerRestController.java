package com.kh.finalproject.restcontroller;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.finalproject.repository.TrainerDao;
import com.kh.finalproject.repository.TrainingDao;
import com.kh.finalproject.vo.ReservationListVO;
import com.kh.finalproject.vo.ScheduleVO;
import com.kh.finalproject.vo.TrainerListVO;

@RestController
@RequestMapping("/trainerRest")
public class TrainerRestController {

	@Autowired
	private TrainerDao trainerDao;
	
	@GetMapping("/listRest")
	public List<TrainerListVO> list(){
		List<TrainerListVO> vo = trainerDao.selectTrainerList();
		return vo;
	}
	

	
	
	
}
