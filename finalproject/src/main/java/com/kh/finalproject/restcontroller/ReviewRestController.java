package com.kh.finalproject.restcontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.finalproject.repository.ReviewDao;
import com.kh.finalproject.vo.ReviewPaginationVO;
import com.kh.finalproject.vo.ReviewVO;

import io.swagger.v3.oas.annotations.tags.Tag;

@Tag(name="리뷰 컨트롤러")
@RestController
@RequestMapping("/rest/review")
public class ReviewRestController {
	
	@Autowired
	private ReviewDao reviewDao;
	
	//전체 이용후기 목록
	@GetMapping("/fulllist")
	public List<ReviewVO> list(@ModelAttribute(name="vo") ReviewPaginationVO vo) {
		return reviewDao.reviewList(vo);
	}
}
