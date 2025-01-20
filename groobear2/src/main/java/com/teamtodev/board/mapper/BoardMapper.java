package com.teamtodev.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.teamtodev.board.vo.BoardVO;
import com.teamtodev.paging.PaginationInfo;


/**
 * 게시판 관리를 위한 인터페이스
 */
@Mapper
public interface BoardMapper {
	
	/**
	 * 게시판 등록
	 * @return 등록된 레코드 수
	 */
	public Integer insertBoard(BoardVO boardVO);
	
	/**
	 * 게시판 단일 정보 조회
	 * @param bbsNo 게시판 번호
	 * @return 게시판 단일 정보
	 */
	public BoardVO selectBoard(Integer bbsNo);
	
	/**
	 * 게시판 목록 조회
	 * @return 게시판 리스트 정보
	 */
	public List<BoardVO> selectBoardList();
	
	/**
	 * 게시판 정보 수정
	 * @param boardVO
	 * @return 업데이트된 게시판 레코드 수
	 */
	public int updateBoard(BoardVO boardVO);
	
	/**
	 * 게시판 정보 삭제
	 * @param bbsNo
	 * @return 삭제된 게시판 레코드 수
	 */
	public int deleteBoard(int bbsNo);
}
