package com.kh.finalproject.service;

import java.net.URI;
import java.net.URISyntaxException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import com.kh.finalproject.configuration.KakaoPayCofigurationProperties;
import com.kh.finalproject.vo.PayApproveRequestVO;
import com.kh.finalproject.vo.PayApproveResponseVO;
import com.kh.finalproject.vo.PayCancelResponseVO;
import com.kh.finalproject.vo.PayCancelReuqestVO;
import com.kh.finalproject.vo.PayOrderRequestVO;
import com.kh.finalproject.vo.PayOrderResponseVO;
import com.kh.finalproject.vo.PayReadyRequestVO;
import com.kh.finalproject.vo.PayReadyResponseVO;

@Service
public class PayServiceImpl implements PayService{

	private RestTemplate template = new RestTemplate();
	
	@Autowired
	private KakaoPayCofigurationProperties kakaoPayCofigurationProperties;
	
	//결제준비
	@Override
	public PayReadyResponseVO ready(PayReadyRequestVO vo) throws URISyntaxException {
		//주소
		URI uri = new URI("https://kapi.kakao.com/v1/payment/ready");
		
		//헤더설정
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "KakaoAK "+kakaoPayCofigurationProperties.getKey());
		headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		
		String approval_url = ServletUriComponentsBuilder.fromCurrentContextPath()
				.path("/pay/success").toUriString();
		String cancel_url = ServletUriComponentsBuilder.fromCurrentContextPath()
				.path("/pay/point_pay_cancel").toUriString();
		String fail_url = ServletUriComponentsBuilder.fromCurrentContextPath()
				.path("/pay/point_pay_fail").toUriString();
		
		//바디 설정
		MultiValueMap<String, String> body = new LinkedMultiValueMap<>();
		body.add("cid",kakaoPayCofigurationProperties.getCid()); //가맹점번호(테스트용)
		body.add("partner_order_id", vo.getPartner_order_id()); //주문번호
		body.add("partner_user_id",vo.getPartner_user_id());  //고객번호
		body.add("item_name", vo.getItem_name()); //상품명
		body.add("quantity", "1"); //상품수량
		body.add("total_amount", String.valueOf(vo.getTotal_amount())); //구매금액
		body.add("tax_free_amount", "0"); //비과세(0원)
		body.add("approval_url", approval_url); //성공시 실행될 주소
		body.add("cancel_url", cancel_url); //취소 시 실행될 주소
		body.add("fail_url", fail_url); //실패 시 실행될 주소
		
		//보낼 내용 합체
		HttpEntity<MultiValueMap<String, String>> entity = 
				new HttpEntity<>(body, headers);
		
		//요청
		PayReadyResponseVO response = template.postForObject(
				uri, entity, PayReadyResponseVO.class);
		
		return response;
	}

	//결제승인
	@Override
	public PayApproveResponseVO approve(PayApproveRequestVO vo) throws URISyntaxException {
		//주소
		URI uri = new URI("https://kapi.kakao.com/v1/payment/approve");
		
		//헤더설정
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "KakaoAK "+kakaoPayCofigurationProperties.getKey());
		headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		
		//바디 설정
		MultiValueMap<String, String> body = new LinkedMultiValueMap<>();
		body.add("cid",kakaoPayCofigurationProperties.getCid()); //가맹점번호(테스트용)
		body.add("tid",vo.getTid());
		body.add("partner_order_id", vo.getPartner_order_id()); //주문번호
		body.add("partner_user_id",vo.getPartner_user_id());  //고객번호
		body.add("pg_token",vo.getPg_token());
		
		//보낼 내용 합체
		HttpEntity<MultiValueMap<String, String>> entity = 
				new HttpEntity<>(body, headers);
		
		//요청
		PayApproveResponseVO response = template.postForObject(
				uri, entity, PayApproveResponseVO.class);
		
		return response;
	}

	//결제 취소
	@Override
	public PayCancelResponseVO cancel(PayCancelReuqestVO vo) throws URISyntaxException {
		//주소
		URI uri = new URI("https://kapi.kakao.com/v1/payment/cancel");
		
		//헤더설정
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "KakaoAK "+kakaoPayCofigurationProperties.getKey());
		headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		
		//바디 설정
		MultiValueMap<String, String> body = new LinkedMultiValueMap<>();
		body.add("cid",kakaoPayCofigurationProperties.getCid()); 
		body.add("tid",vo.getTid());
		body.add("cancel_amount", String.valueOf(vo.getCancel_amount()));
		body.add("cancel_tax_free_amount", String.valueOf(vo.getCancel_tax_free_amount()));
		
		//보낼 내용 합체
		HttpEntity<MultiValueMap<String, String>> entity = 
				new HttpEntity<>(body, headers);
		
		//요청
		PayCancelResponseVO response = template.postForObject(
				uri, entity, PayCancelResponseVO.class);
		
		return response;
	}
	
}
