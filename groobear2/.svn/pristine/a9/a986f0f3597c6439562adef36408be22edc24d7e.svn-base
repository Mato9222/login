package com.teamtodev.sanction.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.teamtodev.sanction.vo.SanctionLineVO;

@Mapper
public interface SanctionLineMapper {
	/**
	 * 결재라인 계정 생성
	 * @param sclineVO
	 * @return
	 */
	public int insertSanctionLine(SanctionLineVO sclineVO);
	
	
	/**
	 * 로그인 계정 결재라인 전체 조회
	 * @param emplNo
	 * @return
	 */
	public List<SanctionLineVO> SanctionLineList(int emplNo);
	
	/**
	 * 결재라인 선택 조회
	 * @param sclineNo
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
	 * @param sclineNo
	 * @return
	 */
	public int deleteSanctionLine(String sclineNo);
}
