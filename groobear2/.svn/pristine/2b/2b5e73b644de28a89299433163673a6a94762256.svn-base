package com.teamtodev.common.service;

import java.util.List;

import com.teamtodev.common.vo.CommonVO;

public interface CommonService {
	
	/**
	 * 공통코드 목록 조회
	 * @param cmmnCodeGroupnm : 공통코드 그룹명
	 * @return 공통코드 목록
	 */
	public List<CommonVO> selectCommonList(String cmmnCodeGroupnm);
	
	/**
	 * 업무구분 조회
	 * 주의 : 해당 단일 공통코드 조회는 TB_ATTACH_FILE 테이블의 BIZ_TYPE 업무코드명을 할당하기 위해서만 사용되어야함
	 * @param cmmnCodeNm : 업무명, 반드시 업무명을 DB에 등록 후 사용할 것.
	 * @return 업무구분 코드
	 */
	public String selectBizTypeCode(String cmmnCodeNm);
}
