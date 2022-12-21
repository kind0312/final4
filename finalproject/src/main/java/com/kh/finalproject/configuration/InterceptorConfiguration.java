package com.kh.finalproject.configuration;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.kh.finalproject.interceptor.UserInterceptor;


@Configuration
public class InterceptorConfiguration implements WebMvcConfigurer{
	
	@Autowired
	private UserInterceptor userInterceptor;
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		// 비회원과 회원을 구분
		registry.addInterceptor(userInterceptor)
								.addPathPatterns(
										"/trainer/reservation*", // 예약 전부 차단
										"/trainer/like", // 좋아요 전부 차단
										"/member/**",
										"/chat/**",// 유저 전부 차단
										"/admin/**" // 어드민 전부 차단
										)
		
		.excludePathPatterns(
				"/trainer/trainer_list",// 리스트 조회 가능
				"/trainer/trainer_detail",// 디테일 조회 가능
				"/member/insert", // 가입 가능
				"/member/login", // 로그인 가능
				"/member/find_id", // 아이디 찾기 가능
				"/admin/login"
				);
	}
	
}