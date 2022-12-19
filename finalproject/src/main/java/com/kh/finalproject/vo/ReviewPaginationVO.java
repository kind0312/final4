package com.kh.finalproject.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class ReviewPaginationVO {
	//현재 페이지 번호
	//int는 아무말이 없으면 기본값이 0 이다.
	private int p = 1; //현재 페이지 번호가 없을 경우 1로 설정
	private int size = 6;
	private int startRow;
	private int endRow;
	
	//총 게시글 수
	private int count;
	
	//화면에 표시할 블럭 개수
	private int blockSize = 10;
	
	@ToString.Include
	public int pageCount() {
		return (count + size - 1) / size;
	}
	
	@ToString.Include
	public int startBlock() {
		return (p - 1) / blockSize * blockSize + 1;
	}
	
	@ToString.Include
	public int endBlock() {
		int value = startBlock() + blockSize - 1;
		return Math.min(value, lastBlock());
	}
	
	@ToString.Include
	public int prevBlock() {
		return startBlock() - 1;
	}
	
	@ToString.Include
	public int nextBlock() {
		return endBlock() + 1;
	}
	
	@ToString.Include
	public int firstBlock() {
		return 1;
	}
	
	@ToString.Include
	public int lastBlock() {
		return pageCount();
	}
	
	@ToString.Include
	public boolean isFirst() {
		return p == 1;
	}
	
	@ToString.Include
	public boolean isLast() {
		return endBlock() == lastBlock();
	}
	
	@ToString.Include
	public boolean hasPrev() {
		return startBlock() > 1;
	}
	
	@ToString.Include
	public boolean hasNext() {
		return endBlock() < lastBlock();
	}
	
	public String parameter() {
		// 전체 조회일 경우
		return "size=" + size;
	}
}
