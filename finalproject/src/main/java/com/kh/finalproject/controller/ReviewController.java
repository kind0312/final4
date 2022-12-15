package com.kh.finalproject.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.finalproject.constant.SessionConstant;
import com.kh.finalproject.entity.ReviewDto;
import com.kh.finalproject.entity.TrainingDto;
import com.kh.finalproject.repository.ReviewDao;
import com.kh.finalproject.vo.TrainingListVO;

@Controller
@RequestMapping("/review")
public class ReviewController {
	
	@Autowired
	private ReviewDao reviewDao;
	
	//이용후기 작성
	@GetMapping("/write")
	private String write(Model model, HttpSession session,
			RedirectAttributes attr) {
		String memberId = (String)session.getAttribute(SessionConstant.ID);
		TrainingDto dto = reviewDao.one(memberId);
		//지난예약 조회
		model.addAttribute("endList", reviewDao.selectOne(dto));
		attr.addAttribute("training", dto.getTrainingNo());
		//이용후기 작성여부
		ReviewDto findDto = reviewDao.writed(reviewDao.selectOne(dto).getTrainingNo());
		if(findDto != null) {
			attr.addAttribute("reviewNo", findDto.getReviewNo());
			return "redirect:detail";
		}
		
		return "review/review_write";
	}
	
	@PostMapping("/write")
	private String write(@ModelAttribute ReviewDto reviewDto,
			RedirectAttributes attr) {
		int reviewNo = reviewDao.insert(reviewDto);
		attr.addAttribute("reviewNo", reviewNo);
		return "redirect:detail";
	}
	
	//이용후기 상세
	@GetMapping("/detail")
	public String detail(Model model, @RequestParam int reviewNo) {
		model.addAttribute("reviewDto", reviewDao.detail(reviewNo));
		return "review/review_detail";
	}
	//이용후기 목록
	@GetMapping("/list")
	private String list(Model model) {
		model.addAttribute("reviewList", reviewDao.reviewList());
		return "review/review_list";
	}
}
