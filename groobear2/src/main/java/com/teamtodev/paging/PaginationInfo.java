package com.teamtodev.paging;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@ToString
public class PaginationInfo {
	
	// 기본 생성자
	public PaginationInfo() {
		this(10, 10);
	}

	// 생성자
	public PaginationInfo(int recordCount, int pageSize) {
		super();
		this.recordCount = recordCount;
		this.pageSize = pageSize;
		setCurrentPage(1);
	}


	private int totalRecord; // 전체 레코드 수(조회할 데이터) , 100
	
	private int recordCount; // 한 페이지의 레코드 수(임의 결정), 10
	private int pageSize; // 한 페이지에서 제공할 페이지 링크 수(임의 결정) , 5
	
	private int totalPage; // 전체 페이지 수 , 10
	
	private int currentPage; // 클라이언트 요구 페이지(요청 파라미터), 1
	
	private int firstRecord; // 현재 페이지의 첫번째 레코드 번호, 1
	private int lastRecord; // 현재 페이지의 마지막 레코드 번호, 10

	
	private int firstPage; // 한 구간(block)에서 제공할 첫번째 페이지 번호 , 1
	private int lastPage; // 한 구간(block)에서 제공할 마지막 페이지 번호 , 5
	
	
	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
		this.totalPage = (totalRecord + (recordCount - 1)) / recordCount;
	}
	
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
		this.lastRecord = currentPage * recordCount;
		this.firstRecord = lastRecord - (recordCount - 1);
		
		this.lastPage = pageSize * ((currentPage+(pageSize-1)) / pageSize);
		this.firstPage = lastPage - (pageSize - 1);
	}
	
	// 검색 조건
	@Setter
	private SimpleCondition simpleCondition;
}






































