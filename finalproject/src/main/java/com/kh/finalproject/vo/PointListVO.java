package com.kh.finalproject.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class PointListVO {
	// 필드
	private String memberId;
	private String type;	// 검색 분류
	private String keyword;	// 검색어
	private int p = 1;	// 현재 페이지 번호 (기본값이 1이 되도록)
	private int size =5;
	private int count;
	private int blockSize = 10;
	private int endRow;
	private int startRow;
	
	// 메소드 - 조회 유형이 검색 조회인지 여부 반환
	public boolean isSearch() {
		return type != null && keyword != null;
	}
	
	// 1) 현재 페이지 rownum의 시작과 끝 번호 관련
	// 필드
	//private int p = 1;	// 현재 페이지 번호 (기본값이 1이 되도록)
	//private int size = 10;	// 페이지에 표시할 목록의 수
	
	// 메소드
	// 현재 페이지 첫 항목 rownum
	public int startRow() {
		return endRow() - (size - 1);
	}

	// 현재 페이지 마지막 항목 rownum
	public int endRow() {
		return p * size;
	}
	
	// 2) 현재 페이지 블럭의 시작과 끝 번호 관련
	// 현재 페이지에 표시할 블럭의 시작 번호
	public int startBlock() {
		return (p - 1) / blockSize * blockSize + 1;
	}
	
	
	// 현재 페이지에 표시할 블럭의 끝 번호
	public int endBlock() {
		int value = startBlock() + blockSize - 1;
		return Math.min(value, lastBlock());
	}


	// 3) 페이지 블럭 전체의 시작과 끝 번호 관련
	// 필드
	// 총 항목의 수 (= 마지막 항목의 rownum)
	//private int count;
	
	// 페이지에 표시할 블럭 구간의 크기
	//private int blockSize = 10; 
	
	// 메소드
	// 마지막 게시글이 속한 블럭 번호(마지막 페이지 번호)
	public int pageCount() {
		return (count + (size - 1)) / size;
	}

	// 블럭의 시작 번호(첫 페이지 번호)
	public int firstBlock() {
		return 1;
	}
	
	// 블럭의 끝 번호 (마지막 페이지 번호 = 마지막 항목이 속한 블럭 번호)
	public int lastBlock() {
		return pageCount();
	}
	
	// 4) 페이지 이동시 표시할 블럭의 번호 관련
	// 이전 블럭의 번호 반환
	public int prevBlock() {
		return startBlock() - 1;
	}
	
	// 다음 블럭의 번호 반환
	public int nextBlock() {
		return endBlock() + 1;
	}
	
	// 현재 블럭이 첫 번째 블럭인지의 여부를 반환
	public boolean isFirst() {
		return p == 1;
	}
	
	// 현재 블럭이 마지막 블럭인지의 여부를 반환
	public boolean isLast() {
		return p == lastBlock();
	}
	
	// 이전 블럭 구간이 존재하는지의 여부를 반환
	public boolean hasPrev() {
		return startBlock() > 1;
	}
	
	// 다음 블럭 구간이 존재하는지의 여부를 반환
	public boolean hasNext() {
		return endBlock() < lastBlock();
	}
	
	// 5) 검색 조회시에도 페이징을 유지할 수 있도록 주소 뒤에 붙일 Query String을 반환
	// - p(페이지 번호)를 제외한 나머지 항목들에 대한 파라미터명과 그 값을 반환
	public String parameter() {
		if(isSearch()) { // 검색 조회일 경우
			return "size=" + size + "&type=" + type + "&keyword=" + keyword;
		}
		else { // 전체 조회일 경우
			return "size=" + size;
		}
	}
	
	
}
