package com.kh.finalproject.controller;

import java.net.URISyntaxException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.finalproject.constant.SessionConstant;
import com.kh.finalproject.entity.ItemDto;
import com.kh.finalproject.entity.MemberDto;
import com.kh.finalproject.entity.PointDto;
import com.kh.finalproject.entity.PointPurchaseDto;
import com.kh.finalproject.repository.ItemDao;
import com.kh.finalproject.repository.MemberDao;
import com.kh.finalproject.repository.PointDao;
import com.kh.finalproject.repository.PointPurchaseDao;
import com.kh.finalproject.service.PayService;
import com.kh.finalproject.vo.PaginationListSearchVO;
import com.kh.finalproject.vo.PayApproveRequestVO;
import com.kh.finalproject.vo.PayApproveResponseVO;
import com.kh.finalproject.vo.PayCancelResponseVO;
import com.kh.finalproject.vo.PayCancelReuqestVO;
import com.kh.finalproject.vo.PayListVO;
import com.kh.finalproject.vo.PayReadyRequestVO;
import com.kh.finalproject.vo.PayReadyResponseVO;
import com.kh.finalproject.vo.PayVO;

@Controller
@RequestMapping("/pay")
public class PayController {
	
	@Autowired
	private PointDao pointDao;
	@Autowired
	private ItemDao itemDao;
	@Autowired
	private PointPurchaseDao pointPurchaseDao;
	@Autowired
	private PayService payService;
	@Autowired
	private MemberDao memberDao;
	
	//포인트 금액 선택 화면
	@GetMapping("/point_select")
	public String selectPay(@ModelAttribute ItemDto itemDto, Model model) {
		model.addAttribute("item", itemDao.PaySelectList());
		return "pay/point_select";
	}
	
	//카카오페이 버튼 클릭 화면
	@GetMapping("/point_pay")
	public String pay(@RequestParam int itemNo, 
			HttpSession session, Model model) {
		String memberId = (String)session.getAttribute(SessionConstant.ID);
		model.addAttribute("point", memberDao.selectOne(memberId));
		ItemDto dto = itemDao.selectOne(itemNo);
		model.addAttribute("item", dto);
		return "pay/point_pay";
	}
	
	//지불 요청(카카오페이 지불 준비)
	@PostMapping("/point_pay")
	public String payment(@ModelAttribute PayVO payVO, HttpSession session) throws URISyntaxException {		
		//결제요청 request 데이터 준비
		String memberId = (String)session.getAttribute(SessionConstant.ID);
		int pointPurchaseNo = pointPurchaseDao.sequence();
		PayReadyRequestVO vo = PayReadyRequestVO.builder()
							.partner_order_id(String.valueOf(pointPurchaseNo))
							.partner_user_id(String.valueOf(memberId))
							.item_name(payVO.getItem_name())
							.total_amount(payVO.getTotal_amount())
							.build();
		//결제요청 response
		PayReadyResponseVO response = payService.ready(vo);
		System.out.println("결제요청 response : "+response);
		
		//결제승인 요청때와 DB테이블 insert를 위해 세션에 값 저장
		session.setAttribute("tid", response.getTid());
		session.setAttribute("partner_order_id", vo.getPartner_order_id());
		session.setAttribute("partner_user_id", vo.getPartner_user_id());
		return "redirect:"+response.getNext_redirect_pc_url();
	}
	
	@GetMapping("/success")
	public String success(@RequestParam String pg_token, HttpSession session) throws URISyntaxException{
		//세션값 꺼내오기
		String tid = (String)session.getAttribute("tid");
		String partner_order_id = (String)session.getAttribute("partner_order_id");
		String partner_user_id = (String)session.getAttribute("partner_user_id");
		session.removeAttribute("tid");
		session.removeAttribute("partner_order_id");
		session.removeAttribute("partner_user_id");
		
		//승인요청 request 데이터 준비
		PayApproveRequestVO vo = PayApproveRequestVO.builder()
				.tid(tid)
				.partner_order_id(partner_order_id)
				.partner_user_id(partner_user_id)
				.pg_token(pg_token)
				.build();
		PayApproveResponseVO response = payService.approve(vo);
		System.out.println("결제승인 response : "+response);
		
		//DB테이블에 데이터 등록(point, point_purchase)
		int pointNo = pointDao.sequence();
		PointDto pointDto = PointDto.builder()
				.pointNo(pointNo)
				.memberId(partner_user_id)
				.pointStatus("구매")
				.pointPrice(response.getAmount().getTotal())
				.pointDate(response.getApproved_at())
				.build();
		pointDao.insert(pointDto);
		
		ItemDto itemDto = itemDao.selectOne(response.getItem_name());
		PointPurchaseDto pointPurchaseDto = PointPurchaseDto.builder()
			.pointPurchaseNo(Integer.parseInt(partner_order_id))
			.memberId(partner_user_id)
			.itemNo(itemDto.getItemNo())
			.pointPurchasePrice(response.getAmount().getTotal())
			.pointPurchaseDate(response.getApproved_at())
			.pointPurchasePayment("카카오페이")
			.pointPurchaseStatus("승인")
			.tid(tid)
			.build();
		pointPurchaseDao.insert(pointPurchaseDto);
		
		//회원테이블에 포인트 증가처리
		MemberDto dto = new MemberDto();
		dto.setMemberId(partner_user_id);
		dto.setMemberPoint((long)response.getAmount().getTotal());
		memberDao.pointPlus(dto);
		
		return "redirect:/pay/point_pay_success";
	}
	
	@GetMapping("/point_pay_success")
	public String pay_success() {
		return "pay/point_pay_success";
	}
	
	@GetMapping("/point_pay_cancel")
	public String pay_cancel() {
		return "pay/point_pay_cancel";
	}
	
	@GetMapping("/point_pay_fail")
	public String pay_fail() {
		return "pay/point_pay_fail";
	}
	
	//결제내역 조회
	@GetMapping("/list")
	public String list(HttpSession session, Model model,
			@ModelAttribute(name="vo") PaginationListSearchVO vo ) {
		String memberId = (String)session.getAttribute(SessionConstant.ID);
		
		//취소 버튼 이벤트 위한 데이터 준비
		//현재 포인트 출력 후 model로 넘기기
		MemberDto dto = memberDao.selectOne(memberId);
		model.addAttribute("point",dto.getMemberPoint());
		
		vo.setMemberId(memberId);
		int count = pointPurchaseDao.count(vo);
		vo.setCount(count);
		
		int endRow = vo.getP()*vo.getSize();
		int startRow = endRow - (vo.getSize() - 1);
		vo.setEndRow(endRow);
		vo.setStartRow(startRow);
		
		//List<PayListVO> list= pointPurchaseDao.selectList(memberId);
		model.addAttribute("list", pointPurchaseDao.listAll(vo));
		
		return "pay/point_pay_list";
	}
	
	//결제취소
	@GetMapping("/cancel")
	public String cancelAll(@RequestParam int pointPurchaseNo) throws URISyntaxException {
		//pointListVO로 만들어놓은 것 그냥 사용하기!
		PayListVO dto = pointPurchaseDao.selectOne(pointPurchaseNo);
		
		PayCancelReuqestVO request = 
				PayCancelReuqestVO.builder()
				.tid(dto.getTid())
				.cancel_amount(dto.getPointPurchasePrice())
				.cancel_tax_free_amount(0)
				.build();
		PayCancelResponseVO response = 
				payService.cancel(request);
		
		//pointPurchaseDto 테이블 거래상태 취소로 변경
		pointPurchaseDao.update(pointPurchaseNo);
		//point 테이블 환불금액만큼 포인트 증가처리
		int pointNo = pointDao.sequence();
		PointDto pointDto = PointDto.builder()
				.pointNo(pointNo)
				.memberId(response.getPartner_user_id())
				.pointStatus("환불")
				.pointPrice(response.getAmount().getTotal())
				.pointDate(response.getCanceled_at())
				.build();
		pointDao.insert(pointDto);
		
		//회원테이블 포인트 증가처리
		MemberDto memberDto = MemberDto.builder()
				.memberId(response.getPartner_user_id())
				.memberPoint((long)response.getAmount().getTotal())
				.build();
		memberDao.pointPlus(memberDto);
		
		return "redirect:list";
	}
	
	
	
	
	

}
