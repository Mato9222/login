package com.teamtodev.board.mapper;

import java.util.List;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.teamtodev.AbstractRootContextTest;
import com.teamtodev.board.service.PostService;
import com.teamtodev.board.vo.PostVO;
import com.teamtodev.paging.PaginationInfo;
import com.teamtodev.paging.SimpleCondition;

import lombok.extern.slf4j.Slf4j;

@Slf4j
class PostMapperTest extends AbstractRootContextTest{

	@Autowired
	private PostMapper postMapper;
	
	@Autowired
	private PostService postService;
	
	@Test
	@DisplayName(value = "게시글 등록")
	void insertPostTest() {
		
		PostVO post = new PostVO();
		
		for(int i = 1; i<=100; i++) {
			// 데이터 세팅
			
			// SNTNC_NO글번호
			if(i % 2 == 0) {
				post.setBbsNo(2); // BBS_NO게시판번호
			} else {
				post.setBbsNo(3); // BBS_NO게시판번호
			}
			post.setEmplNo(3); // EMPL_NO사원번호
			// 카테고리 공지사항 : 공지, 일반 
			// 카테고리 부서    : 공지, 업무, 일반, 기타
			post.setCtgryCode("N01"); // CTGRY_CODE카테고리코드
			post.setSntncSj("공지" + i); // SNTNC_SJ글제목
			
			if(i % 2 == 0) {
				post.setCtgryCode("N02"); // CTGRY_CODE카테고리코드
				post.setSntncSj("업무" + i); // SNTNC_SJ글제목
			} else if(i % 3 == 0) {
				post.setCtgryCode("N03"); // CTGRY_CODE카테고리코드
				post.setSntncSj("일반" + i); // SNTNC_SJ글제목
			}
			if(i % 5 == 0) {
				post.setCtgryCode("N04"); // CTGRY_CODE카테고리코드
				post.setSntncSj("기타" + i); // SNTNC_SJ글제목
			}
			
			post.setSntncCn("내용" + i); // SNTNC_CN글내용
			post.setRdcnt(0); // RDCNT조회수
			// ATCH_FILE_NO첨부파일넘버
			post.setMngrAt("N"); // MNGR_AT관리자여부
			post.setOthbcAt("Y"); // OTHBC_AT공개여부
			// REGIST_DT등록일시
			// UPDDE_DT수정일시
			// DELETE_DT삭제일시
			post.setDeleteAt("N"); // DELETE_AT삭제여부
			post.setAtchFileAt("N"); // ATCH_FILE_AT파일첨부여부
			
			// 데이터 삽입
			int cnt = postMapper.insertPost(post);
//			log.debug("등록 레코드 수 {}", cnt);
		}
	}
	

	@Test
	@DisplayName(value = "게시글 목록 조회")
	void selectPostListTest() {
		SimpleCondition scondition = new SimpleCondition();
		scondition.setSearchType2("N01");
		scondition.setSearchType("title");
		scondition.setSearchWord("10");
		
		
		
		PaginationInfo paging = new PaginationInfo();
		paging.setSimpleCondition(scondition);
		
//		List<PostVO> list = postMapper.selectPostList(paging);
//		log.debug("게시글 목록 조회 건수 : {}", list.size());
	}
	
	/**
	 * 게시글 목록 조회
	 */
	@Test
	@DisplayName(value = "게시글 목록 조회 - 서비스 테스트")
	void selectPostListServiceImplTest() {
		SimpleCondition scondition = new SimpleCondition();
//		scondition.setSearchType2("N01");
//		scondition.setSearchType("title");
//		scondition.setSearchWord("10");
		PaginationInfo paging = new PaginationInfo();
		paging.setSimpleCondition(scondition);
		
//		List<PostVO> list = postService.selectPostList(paging);
//		log.debug("게시글 목록 : {}", list);
	}
	
	
	/**
	 * 단일 게시글 조회
	 */
	@Test
	@DisplayName(value = "게시글 상세조회")
	void selectPostTest() {
		int postNo = 589;
		PostVO detail = postMapper.selectPost(postNo);
//		log.debug("{}", detail);
	}
	
}
