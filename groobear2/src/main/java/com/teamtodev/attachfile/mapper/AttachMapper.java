package com.teamtodev.attachfile.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.teamtodev.attachfile.vo.AttachVO;
import com.teamtodev.board.vo.PostVO;
import com.teamtodev.mail.vo.MailVO;
import com.teamtodev.project.vo.ProjectPostVO;
import com.teamtodev.project.vo.ProjectWorkVO;
import com.teamtodev.sanction.vo.SanctionDocVO;

@Mapper
public interface AttachMapper {
	
	/**
	 * 게시판 - 첨부파일정보 DB 등록 메서드
	 * @param attachFiles : 멀티파트파일 배열
	 * @return DB등록한 갯수 반환
	 */
	public int insertAttach(PostVO postVO);
	
	/**
	 * 프로젝트 일감 - 첨부파일정보 DB 등록 메서드
	 * @param attachFiles : 멀티파트파일 배열
	 * @return DB등록한 갯수 반환
	 */
	public int insertProjectWorkAttach(ProjectWorkVO pwVO);
	
	/**
	 * 프로젝트 게시판 - 첨부파일정보 DB 등록 메서드
	 * @param attachFiles : 멀티파트파일 배열
	 * @return DB등록한 갯수 반환
	 */
	public int insertProjectPostAttach(ProjectPostVO ppVO);
	
	/**
	 * 프로젝트 자료실 게시판 - 첨부파일정보 DB 등록 메서드
	 * @param attachFiles : 멀티파트파일 배열
	 * @return DB등록한 갯수 반환
	 */
	public int insertProjectAttach(AttachVO attachVO);
	
	/**
	 * 해당 프로젝트 자료실 리스트 가져오기
	 * @param attachFiles : 멀티파트파일 배열
	 * @return DB등록한 리스트 반환
	 */
	public List<AttachVO> selectProjectAllAttachList(String prjctCode);
	
	public int selectProjectAttachCount(String prjctCode);
	
	/**
	 * 다운로드 카운트 증가
	 * @param attachVO 통합첨부파일번호, 첨부파일순번 값 세팅해줄것
	 * @return 성공 : 1, 실패 0
	 */
	public int incrementCount(AttachVO attachVO);
	
	/**
	 * 전자결재 - 첨부파일정보 DB 등록 메서드
	 * @param attachFiles : 멀티파트파일 배열
	 * @return DB등록한 갯수 반환
	 */
	public int insertSantnAttach(SanctionDocVO scDocVO);
	
	/**
	 * 단일 첨부파일 조회
	 * @param attachVO 
	 * @return 
	 */
	public AttachVO selectAttach(AttachVO attachVO);
	
	/**
	 * 첨부파일 삭제를 위한 메소드
	 */
	public int deleteAttatch(@Param("atchNo") int atchNo);

	/**
	 * 메일 - 첨부파일 정보 DB등록 
	 * @param mai3l
	 * @return
	 */
	public int insertMailAttach(MailVO mai3l);

}
