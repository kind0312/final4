package com.kh.finalproject.restcontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.finalproject.entity.TrainingDto;
import com.kh.finalproject.repository.TrainingDao;

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

	

}
