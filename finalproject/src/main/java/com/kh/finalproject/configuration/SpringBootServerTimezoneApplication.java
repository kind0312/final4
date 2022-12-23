package com.kh.finalproject.configuration;

import java.time.LocalDateTime;
import java.util.TimeZone;

import javax.annotation.PostConstruct;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class SpringBootServerTimezoneApplication {

    @PostConstruct
    public void start() {
        TimeZone.setDefault(TimeZone.getTimeZone("UTC")); 
    }
    public static void main(String[] args) {       
      SpringApplication.run(SpringBootServerTimezoneApplication.class, args);
      
    }
}