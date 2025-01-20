package com.teamtodev.documents.service;

import java.util.List;

import com.teamtodev.documents.vo.DocumentFormVO;
import com.teamtodev.enumpkg.ServiceResult;

public interface DocumentFormService {
	/**
	 * 결재양식 생성
	 * @param dcformVO
	 * @return
	 */
	public ServiceResult insertDocumentForm(DocumentFormVO dcformVO);
	
	
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
	public ServiceResult deleteDocumentForm(String dcformNo);
}
