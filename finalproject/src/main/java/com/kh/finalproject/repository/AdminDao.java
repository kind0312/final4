package com.kh.finalproject.repository;

import com.kh.finalproject.entity.AdminDto;

public interface AdminDao {
	
	AdminDto selectOne(String adminId);
	

}
