package com.teamtodev.sanction.service;

import java.util.List;

import com.teamtodev.enumpkg.ServiceResult;
import com.teamtodev.sanction.vo.SanctionVO;

public interface SanctionService {
	/**
	 * 문서 결재 생성
	 * @param scVO
	 * @return
	 */
	public ServiceResult insertSanction(SanctionVO scVO);
	
	/**
	 * 로그인 계정 결재 전체 조회
	 * @param emplNo
	 * @return
	 */
	public List<SanctionVO> emplSanctionList(int emplNo);
	
	/**
	 * 결재문서 결재 전체 조회
	 * @param emplNo
	 * @return
	 */
	public List<SanctionVO> scDocSanctionList(String scDocNo);
	
	/**
	 * 문서 결재 수정
	 * @param scVO
	 * @return
	 */
	public ServiceResult updateSanction(SanctionVO scVO);	
	
	/**
	 * 문서 재결재 결재라인 초기화
	 * @param scVO
	 * @return
	 */
	public ServiceResult updateReSanction(SanctionVO scVO);
	
	/**
	 * 결재문서 마지막 결재 조회
	 * @param emplNo
	 * @return
	 */
	public SanctionVO scDocLastOrdrSanction(String scDocNo);
	
	/**
	 * 문서 결재 삭제
	 * @param scNo
	 * @return
	 */
	public ServiceResult deleteSanction(String scNo);
}
