package com.teamtodev.main.service;

import java.util.List;

import com.teamtodev.board.vo.PostVO;

public interface MainService {

	/**
	 * 사이드바 받은메일 안읽은 수
	 * @param emplNo 사원번호
	 * @return 안읽은 메일 갯수
	 */
	public int receEmailCount(int emplNo);
	
	/**
	 * 사이드바 임시보관함 저장 수
	 * @param emplNo 사원번호
	 * @return 보관함에 저장된 갯수
	 */
	public int tempMailCount(int emplNo);
	
	
	public List<PostVO> mainPost(int bbsNo);
	
	
	/**
	 * 결재 대기문서 갯수 
	 * @param emplNo
	 * @return
	 */
	public int snacWait(int emplNo);
	
	/**
	 * 결재 완료문서 갯수 
	 * @param emplNo
	 * @return
	 */
	public int snacComp(int emplNo);
	
	/**
	 * 결재 반려문서 갯수
	 * @param emplNo
	 * @return
	 */
	public int snacReje(int emplNo);
	
	/**
	 * 결재 진행중문서 갯수
	 * @param emplNo
	 * @return
	 */
	public int snacTemp(int emplNo);
}
