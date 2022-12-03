package com.kh.finalproject.configuration;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
@ConfigurationProperties(prefix = "custom.kakaopay")
public class KakaoPayCofigurationProperties {
	private String key, cid;
}
