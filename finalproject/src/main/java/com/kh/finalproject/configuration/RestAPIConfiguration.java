package com.kh.finalproject.configuration;

import org.springframework.context.annotation.Configuration;

import io.swagger.v3.oas.annotations.OpenAPIDefinition;
import io.swagger.v3.oas.annotations.info.Info;

@OpenAPIDefinition( 
		info =@Info(
				title = "파이널프로젝트 4조", //API 제목
				description = "펫훈련 예약 사이트", //API상세 정보
				version = "v1" //API 버전정보
				
				)	
		)


@Configuration
public class RestAPIConfiguration {

}
