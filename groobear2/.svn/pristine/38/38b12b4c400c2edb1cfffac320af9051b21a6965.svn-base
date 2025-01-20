package com.teamtodev.attachfile.service;

import java.io.IOException;
import java.util.List;

import com.teamtodev.attachfile.vo.AttachVO;
import com.teamtodev.board.vo.PostVO;
import com.teamtodev.enumpkg.ServiceResult;
import com.teamtodev.mail.vo.MailVO;
import com.teamtodev.project.vo.ProjectPostVO;
import com.teamtodev.project.vo.ProjectWorkVO;
import com.teamtodev.sanction.vo.SanctionDocVO;

public interface AttachService {
	
	/**
	 * 게시판 - 첨부파일정보 DB 등록 메서드
	 * @param postVO 게시글 첨부파일 등록
	 */
	public int insertAttachFiles(PostVO postVO);
	
	/**
	 * 게시판 - 첨부파일정보 DB 등록 메서드
	 * @param attachFiles : 멀티파트파일 배열
	 * @return DB등록한 갯수 반환
	 */
	public int insertProjectWorkAttach(ProjectWorkVO pwVO);
	
	/**
	 * 게시판 - 첨부파일정보 DB 등록 메서드
	 * @param attachFiles : 멀티파트파일 배열
	 * @return DB등록한 갯수 반환
	 */
	public int insertProjectPostAttach(ProjectPostVO ppVO);
	
	/**
	 * 게시판 - 첨부파일정보 DB 등록 메서드
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
	 * 단일 첨부파일 조회
	 * @param attachVO 
	 * @return 
	 */
	public AttachVO selectAttach(AttachVO attachVO);
	
	/**
	 * 첨부파일 조회 및 파일획득
	 * @param attachVO 통합첨부파일번호, 첨부파일순번 값 세팅해줄것
	 * @return
	 */
	public AttachVO downloadAttach(AttachVO attachVO) throws IOException ;

	/**
	 * 전자결재 - 첨부파일정보 DB 등록 메서드
	 * @param sancDocVO - 전자결재VO
	 */
	public ServiceResult insertSancDocAttachFiles(SanctionDocVO sancDocVO);
	
	/**
	 * 메일 - 첨부파일 정보 DB등록 
	 * @param mai3l
	 * @return
	 */
	public int insertMailAttachFiles(MailVO mai3l);
	
}
