package com.teamtodev.sanction.service;

import java.util.List;

import com.teamtodev.enumpkg.ServiceResult;
import com.teamtodev.sanction.vo.SanctionLineVO;

public interface SanctionLineService {
	/**
	 * 결재라인 계정 생성
	 * @param deptVO
	 * @return
	 */
	public ServiceResult insertSanctionLine(SanctionLineVO sclineVO);
	
	
	/**
	 * 로그인 계정 결재라인 전체 조회
	 * @param emplNo
	 * @return
	 */
	public List<SanctionLineVO> SanctionLineList(int emplNo);
	
	/**
	 * 결재라인 조회
	 * @param deptNo
	 * @return
	 */
	public List<SanctionLineVO> selectSanctionLine(String sclineNo);
	
	/**
	 * 결재라인 결재자 선택 조회
	 * @param sclineNo
	 * @return
	 */
	public List<SanctionLineVO> selectSCSanctionLine(String sclineNo);
	
	/**
	 * 결재라인 미결재자 선택 조회
	 * @param sclineNo
	 * @return
	 */
	public List<SanctionLineVO> selectNonSanctionLine(String sclineNo);
	
	/**
	 * 결재라인 계정 삭제
	 * @param deptNo
	 * @return
	 */
	public ServiceResult deleteSanctionLine(String sclineNo);
}
