package com.kh.finalproject.restcontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.finalproject.entity.PointDto;
import com.kh.finalproject.repository.PointDao;

import io.swagger.v3.oas.annotations.tags.Tag;

@Tag(name="포인트 컨트롤러")
@RestController
@RequestMapping("/rest")
public class MypageRestController {
	
	@Autowired
	private PointDao pointDao;
	
	//조회
	@GetMapping("/point_list")
	public List<PointDto> list(){
		String memberId = "test1234";
		List<PointDto> dto = pointDao.selectList(memberId);
		return dto;
	}
}