package com.kh.finalproject.configuration;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.kh.finalproject.interceptor.AdminIntercepter;
import com.kh.finalproject.interceptor.MyAccountCheckInterceptor;
import com.kh.finalproject.interceptor.UserInterceptor;


@Configuration
public class InterceptorConfiguration implements WebMvcConfigurer{
	
	@Autowired
	private UserInterceptor userInterceptor;
	
	@Autowired
	private AdminIntercepter adminInterceptor; 
	
	@Autowired
	private MyAccountCheckInterceptor myAccountCheckInterceptor; 
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		// 비회원과 회원을 구분
		registry.addInterceptor(userInterceptor)
								.addPathPatterns(
										"/trainer/reservation*", // 예약 전부 차단
										"/trainer/like", // 좋아요 전부 차단
										"/member/**",
										"/chat/**",// 유저 전부 차단
										"/pay/**"
										)
		
		.excludePathPatterns(
				"/trainer/trainer_detail",// 디테일 조회 가능
				"/member/insert", // 가입 가능
				"/member/login", // 로그인 가능
				"/member/find_memberid", // 아이디 찾기 가능
				"/member/find_memberid_success", // 아이디 찾기 성공
				"/member/find_memberpw", // 비밀번호 찾기 가능
				"/member/change_memberpw", // 비밀번호 변경
				"/member/change_memberpw_success" //비밀번호 변경 성공
				);
		
		registry.addInterceptor(adminInterceptor)
		.addPathPatterns(
				"/admin/**" // admin 전부 차단
				)

		.excludePathPatterns(
				"/admin/login"// 로그인 가능
				);
		
		registry.addInterceptor(myAccountCheckInterceptor)//유저 로그인 확인
		.addPathPatterns(
				"/mypage/**", // 마이페이지 차단
				"/review/**" // 리뷰 작성 차단
				
				)
		
		.excludePathPatterns(
				"/review/fulllist",
				"/review/fulldetail"
				);
		
		
	}
	
}