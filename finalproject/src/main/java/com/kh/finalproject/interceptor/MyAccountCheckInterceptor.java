package com.kh.finalproject.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.kh.finalproject.constant.SessionConstant;
import com.kh.finalproject.entity.MemberDto;
import com.kh.finalproject.repository.MemberDao;

@Component
public class MyAccountCheckInterceptor implements HandlerInterceptor{
	
	@Autowired
	private MemberDao memberDao;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute(SessionConstant.ID);
		MemberDto memberDto = memberDao.selectOne(userId);
		boolean isOwner = userId.equals(memberDto.getMemberId());
		if (isOwner) {
			return true;
		}
		
		response.sendError(403);
		return false;
	}

}
