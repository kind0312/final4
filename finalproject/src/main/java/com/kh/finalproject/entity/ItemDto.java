package com.kh.finalproject.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class ItemDto {
	private int itemNo;
	private String itemName;
	private int itemPrice;
	private Date itemDate;
	private Date itemChangeDate;
	private String itemDisabled;
	

}
