package com.kh.finalproject.configuration;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

import lombok.Data;

@Data //Setter, Getter 생성
@Component//등록해라
@ConfigurationProperties(prefix="custom.email")//properties에서 불러와라!
public class EmailProperties {
	//접두사를 제외한 나머지 이름을 field를 생성하면 자동으로 채워진다.
	private String host;
	private int port;
	private String username;
	private String password;
}
