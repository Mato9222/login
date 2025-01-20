package com.teamtodev.board.service;

import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.teamtodev.board.vo.PostVO;
import com.teamtodev.employees.vo.EmployeeVO;
import com.teamtodev.paging.PaginationInfo;

public interface PostService {
	/**
	 * 새로운 게시글 등록
	 * 
	 * @param employeeVo 로그인한 사용자 정보
	 * @param postVO 등록할 게시글 정보
	 * @return 등록된 게시글 레코드 수 반환 TODO : 해야함
	 * @throws IOException 
	 */
	public void createPost(EmployeeVO employeeVo, PostVO postVO) throws IOException;

	/**
	 * 단일 게시글 조회
	 * 
	 * @param sntncNo 조회할 게시글 번호
	 * @return 단일 게시글 정보 반환
	 */
	public PostVO selectPost(int sntncNo);

	/**
	 * 게시글 조회수 카운트
	 * 
	 * @param sntncNo 단일 게시글 번호
	 * @return 단일 게시글의 조회수 반환
	 */
	public int incrementHit(int sntncNo);

	
	/**
	 * 게시글 목록 조회
	 * @param paging 페이징 정보
	 * @return 게시글 목록 반환
	 */
	public List<PostVO> selectPostList(int bbsNo, EmployeeVO employeeVO, PaginationInfo paging); // TODO : 페이징


	/**
	 * 게시글 수정
	 * 
	 * @param postVO 단일 게시글 정보
	 * @return 수정된 게시글 레코드 수
	 */
	public int updatePost(EmployeeVO employeeVo, PostVO postVO);

	/**
	 * 게시글 삭제
	 * 
	 * @param sntncNo 삭제할 게시글 번호
	 * @return 삭제된 게시글 레코드 수
	 */
	public int deletePost(int sntncNo);
}
