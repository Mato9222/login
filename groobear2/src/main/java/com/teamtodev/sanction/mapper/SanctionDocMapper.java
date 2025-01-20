package com.teamtodev.sanction.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.teamtodev.sanction.vo.SanctionDocVO;
import com.teamtodev.sanction.vo.SanctionVO;

@Mapper
public interface SanctionDocMapper {
	/**
	 * 결재문서 생성
	 * @param scDocVO
	 * @return
	 */
	public int insertSanctionDoc(SanctionDocVO scDocVO);
	
	/**
	 * 로그인 계정 기안 진행 문서 전체 조회
	 * @param emplNo
	 * @return
	 */
	public List<SanctionDocVO> SanctionDocList(SanctionDocVO scDocVO);
	
	/**
	 * 로그인 계정 기안 완료 문서 전체 조회
	 * @param emplNo
	 * @return
	 */
	public List<SanctionDocVO> SanctionDocFinish(SanctionDocVO scDocVO);
	
	/**
	 * 로그인 계정 결재대기문서 전체 조회
	 * @param emplNo
	 * @return
	 */
	public List<SanctionDocVO> WaitSanctionDocList(int emplNo);
	
	/**
	 * 결재완료문서 전체 조회
	 * @param emplNo
	 * @return
	 */
	public List<SanctionDocVO> SanctionDocFinishList(String sttus);
	
	/**
	 * 수신문서 전체 조회
	 * @param emplNo
	 * @return
	 */
	public List<SanctionDocVO> SanctionDocRcverList(SanctionDocVO scDocVO);
	
	/**
	 * 참조문서 전체 조회
	 * @param emplNo
	 * @return
	 */
	public List<SanctionDocVO> SanctionDocRefList(SanctionDocVO scDocVO);
	
	/**
	 * 결재문서 선택 조회
	 * @param scDocNo
	 * @return
	 */
	public SanctionDocVO selectSanctionDoc(String scDocNo);
	
	/**
	 * 결재문서 결재상태 수정
	 * @param scDocNo
	 * @return
	 */
	public int updateSanctionDocSttus(SanctionDocVO scDocVO);
	
	/**
	 * 결재문서 수정
	 * @param scDocNo
	 * @return
	 */
	public int updateSanctionDoc(SanctionDocVO scDocVO);
	
	/**
	 * 결재문서 결재도장 수정
	 * @param scDocNo
	 * @return
	 */
	public int updateSanctionDocURL(SanctionVO scDocVO);
	
	/**
	 * 결재문서 삭제
	 * @param scDocNo
	 * @return
	 */
	public int deleteSanctionDoc(String scDocNo);
}
