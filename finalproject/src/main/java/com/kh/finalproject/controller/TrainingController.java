package com.kh.finalproject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.finalproject.repository.TrainingDao;

@Controller
public class TrainingController {

	@Autowired
	private TrainingDao trainingDao;


}
