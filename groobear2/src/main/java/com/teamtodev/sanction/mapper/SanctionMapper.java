package com.teamtodev.sanction.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.teamtodev.sanction.vo.SanctionVO;

@Mapper
public interface SanctionMapper {
	/**
	 * 문서 결재 생성
	 * @param scVO
	 * @return
	 */
	public int insertSanction(SanctionVO scVO);
	
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
	 * 결재문서 마지막 결재 조회
	 * @param emplNo
	 * @return
	 */
	public SanctionVO scDocLastOrdrSanction(String scDocNo);
	
	/**
	 * 문서 결재 수정
	 * @param scNo
	 * @return
	 */
	public int updateSanction(SanctionVO scVO);
	
	/**
	 * 문서 재결재 결재라인 초기화
	 * @param scVO
	 * @return
	 */
	public int updateReSanction(SanctionVO scVO);
	
	/**
	 * 문서 결재 삭제
	 * @param scNo
	 * @return
	 */
	public int deleteSanction(String scDocNo);
}
