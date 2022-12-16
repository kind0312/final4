package com.kh.finalproject.service;

import java.net.URISyntaxException;

import com.kh.finalproject.vo.PayApproveRequestVO;
import com.kh.finalproject.vo.PayApproveResponseVO;
import com.kh.finalproject.vo.PayCancelResponseVO;
import com.kh.finalproject.vo.PayCancelReuqestVO;
import com.kh.finalproject.vo.PayOrderRequestVO;
import com.kh.finalproject.vo.PayOrderResponseVO;
import com.kh.finalproject.vo.PayReadyRequestVO;
import com.kh.finalproject.vo.PayReadyResponseVO;

public interface PayService {
	//결제 준비
	PayReadyResponseVO ready(PayReadyRequestVO vo) throws URISyntaxException;
	//결제 승인
	PayApproveResponseVO approve(PayApproveRequestVO vo) throws URISyntaxException;
	//결제 취소
	PayCancelResponseVO cancel(PayCancelReuqestVO vo) throws URISyntaxException;
}
