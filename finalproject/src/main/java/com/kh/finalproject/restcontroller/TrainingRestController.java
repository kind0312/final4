package com.kh.finalproject.restcontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
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
	
	@GetMapping("/training_ing/{memberId}")
	public List<TrainingDto> list(@PathVariable String memberId){
		List<TrainingDto> dto = trainingDao.ingList(memberId);
		return dto;
	}
	
	@GetMapping("/training_end/{memberId}")
	public List<TrainingDto> selectone(@PathVariable String memberId){
		List<TrainingDto> dto = trainingDao.endList(memberId);
		return dto;
	}

	

}
