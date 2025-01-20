package com.teamtodev.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.teamtodev.board.vo.PostVO;
import com.teamtodev.employees.vo.EmployeeVO;
import com.teamtodev.paging.PaginationInfo;

/**
 * 게시판의 게시글 관리를 위한 인터페이스
 */
@Mapper
public interface PostMapper {

	/**
	 * 새로운 게시글 등록
	 * 
	 * @param postVO 등록할 게시글 정보
	 * @return 등록된 게시글 레코드 수 반환
	 */
	public Integer insertPost(PostVO postVO);

	/**
	 * 단일 게시글 조회
	 * 
	 * @param sntncNo 조회할 게시글 번호
	 * @return 단일 게시글 정보 반환
	 */
	public PostVO selectPost(int sntncNo);

	/**
	 * 게시글 조회수 증가
	 * 
	 * @param sntncNo 단일 게시글 번호
	 * @return 단일 게시글의 조회수 증가
	 */
	public int incrementHit(int sntncNo);

	/**
	 * 게시글 목록 조회
	 * @param paging 페이징 정보
	 * @return 게시글 목록 반환
	 */
	public List<PostVO> selectPostList(@Param("bbsNo") int bbsNo
									 , @Param("employeeVO") EmployeeVO employeeVO
									 , @Param("paging") PaginationInfo paging);

	/**
	 * 검색된 게시글 목록의 총 갯수 조회
	 * 
	 * @param paging 페이징 정보
	 * @return 게시글 목록 총 갯수
	 */
	public int selectPostCount(@Param("bbsNo") int bbsNo
							 , @Param("employeeVO") EmployeeVO employeeVO
							 , @Param("paging") PaginationInfo paging);

	/**
	 * 게시글 수정
	 * 
	 * @param postVO 단일 게시글 정보
	 * @return 수정된 게시글 레코드 수
	 */
	public int updatePost(PostVO postVO);

	/**
	 * 게시글 삭제
	 * 
	 * @param sntncNo 삭제할 게시글 번호
	 * @return 삭제된 게시글 레코드 수
	 */
	public int deletePost(int sntncNo);
}
