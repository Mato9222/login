package com.teamtodev.documents.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.teamtodev.documents.vo.DocumentFormVO;

@Mapper
public interface DocumentFormMapper {
	/**
	 * 결재양식 생성
	 * @param dcformVO
	 * @return
	 */
	public int insertDocumentForm(DocumentFormVO dcformVO);
	
	
	/**
	 * 결재양식 전체 조회
	 * @param 
	 * @return
	 */
	public List<DocumentFormVO> documentFormList();
	
	/**
	 * 결재양식 선택 조회
	 * @param dcformNo
	 * @return
	 */
	public DocumentFormVO selectDocumentForm(String dcformNo);
	
	/**
	 * 결재양식 삭제
	 * @param sclineNo
	 * @return
	 */
	public int deleteDocumentForm(String dcformNo);
}
