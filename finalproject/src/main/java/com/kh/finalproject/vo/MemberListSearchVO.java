package com.kh.finalproject.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class MemberListSearchVO {
	
	private String type,keyword;
	
	public boolean isSearch() {
		return type!=null && keyword !=null;
	}

}
