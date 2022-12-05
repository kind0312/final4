package com.kh.finalproject.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class FilesDto {
	
	private int filesNo;
	private String filesOriginalName;
	private String filesType;
	private int filesSize;
	private Date filesDate;

}
