package com.kh.finalproject.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.kh.finalproject.repository.EmailcertDao;

@Service
public class SchedulerServiceImpl implements SchedulerService {
	
	@Autowired
	private EmailcertDao emailcertDao;

	//매시 정각마다 삭제
	@Scheduled(cron = "0 0 * * * *")
	@Override
	public void clearCert() {
//		System.out.println(LocalDateTime.now());
		emailcertDao.clear();
	}
}
