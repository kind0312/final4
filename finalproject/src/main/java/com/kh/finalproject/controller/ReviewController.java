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
import com.kh.finalproject.vo.ReviewPaginationVO;
import com.kh.finalproject.vo.TrainingListVO;

@Controller
@RequestMapping("/review")
public class ReviewController {
	
	@Autowired
	private ReviewDao reviewDao;
	
	//이용후기 작성
	@GetMapping("/write")
	public String write(Model model, HttpSession session, 
			@ModelAttribute TrainingDto trainingDto,
			RedirectAttributes attr) {
		String memberId = (String)session.getAttribute(SessionConstant.ID);
		trainingDto.setMemberId(memberId);
		//지난예약 조회
		model.addAttribute("endList", reviewDao.selectOne(trainingDto));
		//이용후기 작성여부
		ReviewDto findDto = reviewDao.writed(reviewDao.selectOne(trainingDto).getTrainingNo());
		if(findDto != null) {
			attr.addAttribute("reviewNo", findDto.getReviewNo());
			return "redirect:detail";
		}
		
		return "review/review_write";
	}
	
	@PostMapping("/write")
	public String write(@ModelAttribute ReviewDto reviewDto,
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
	
	//이용후기 수정
	@GetMapping("/edit")
	public String edit(Model model, @RequestParam int reviewNo) {
		model.addAttribute("reviewDto", reviewDao.detail(reviewNo));
		return "review/review_edit";
	}
	
	@PostMapping("/edit")
	public String edit(@ModelAttribute ReviewDto reviewDto,
			RedirectAttributes attr) {
		boolean result = reviewDao.edit(reviewDto);
		if(result) {
			attr.addAttribute("reviewNo", reviewDto.getReviewNo());
			return "redirect:detail";
		}
		else {
			return "redirect:edit?error";
		}
	}
	
	
	//이용후기 삭제
	@GetMapping("/delete")
	public String delete(@RequestParam int reviewNo) {
		reviewDao.delete(reviewNo);
		return "redirect:/mypage/training";
	}
	
	//전체 이용후기 목록
	@GetMapping("/fulllist")
	public String list(Model model, @ModelAttribute(name="vo") ReviewPaginationVO vo) {
		model.addAttribute("reviewList", reviewDao.reviewList(vo));
		model.addAttribute("count", reviewDao.count());
		return "review/review_fulllist";
	}
	
	//전체 이용후기 상세
	@GetMapping("/fulldetail")
	public String fulldetail(Model model, @RequestParam int reviewNo) {
		model.addAttribute("reviewDto", reviewDao.fullDetail(reviewNo));
		return "review/review_fulllist_detail";
	}
	
}
