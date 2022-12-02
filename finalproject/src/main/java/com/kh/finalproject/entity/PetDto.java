package com.kh.finalproject.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class PetDto {

	private int petNo;
	private String memberId;
	private String petType;
	private String petName;
	private String petGender;
	private String petBreed;
	private Date petBirth;
	private int petWeight;
	private String petNeutralization;
}
