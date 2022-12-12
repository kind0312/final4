package com.kh.finalproject.restcontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.finalproject.repository.TrainerDao;
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
