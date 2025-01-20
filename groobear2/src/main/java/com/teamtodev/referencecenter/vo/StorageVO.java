package com.teamtodev.referencecenter.vo;

import java.util.List;

import com.teamtodev.board.vo.PostVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "storgeNo")
public class StorageVO {
	
	// 저장소 관련
	// STORAGE Table Columns
	private String storgeNo; // 저장소번호
	private String storgeNm; // 저장소명
	
	
	
	private List<ReferenceCtVO> referenceCtVO; // 자료실
}
