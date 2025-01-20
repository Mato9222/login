package com.teamtodev.board.controller;

import java.io.IOException;
import java.nio.charset.Charset;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.http.ContentDisposition;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.teamtodev.attachfile.service.AttachService;
import com.teamtodev.attachfile.vo.AttachVO;
import com.teamtodev.board.service.PostService;
import com.teamtodev.board.vo.PostVO;
import com.teamtodev.common.mapper.CommonMapper;
import com.teamtodev.common.vo.CommonVO;
import com.teamtodev.employees.vo.EmployeeVO;
import com.teamtodev.employees.vo.EmployeeVOWrapper;
import com.teamtodev.paging.PaginationInfo;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/board")
public class PostReadController {
	
	@Autowired
	private PostService postService; // 게시글
	
	@Autowired
	private CommonMapper commonMapper; // 공통코드
	
	@Autowired
	private AttachService AttachService; // 첨부파일

	/**
	 * 게시판 목록 조회
	 */
	@GetMapping("/{bbsNo}")
	private String postList(@PathVariable int bbsNo, @ModelAttribute("paginationInfo") PaginationInfo paging, Authentication auth, Model model) {
		// 로그인한 사용자의 정보 가져오기
		EmployeeVOWrapper userWrapper = (EmployeeVOWrapper) auth.getPrincipal();
		EmployeeVO employeeVO = userWrapper.getRealUser();
		
		// 공통코드 - 카테고리 목록 조회
		List<CommonVO> categoryList = commonMapper.selectCommonList("카테고리");
		
		// 게시글 목록 가져오기
		List<PostVO> postVOList = postService.selectPostList(bbsNo, employeeVO, paging);
		
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("postList", postVOList);
		model.addAttribute("paginationInfo", paging); // 페이지정보 다시 보내주기 > 클라이언트에서 처리함.
		
		return "board/postList";
	}
	
	
	/**
	 * 단일 게시글 조회
	 * 
	 * @param bbsNo 게시판 번호
	 * @param sntncNo 게시글 번호
	 * @param model
	 * @return 게시글 상세화면
	 */
	@GetMapping("/{bbsNo}/{sntncNo}")
	private String postDetail(@PathVariable int bbsNo, @PathVariable int sntncNo, Authentication auth, Model model) {
		// 로그인한 사용자의 정보 가져오기
//		EmployeeVOWrapper userWrapper = (EmployeeVOWrapper) auth.getPrincipal();
//		EmployeeVO employeeVO = userWrapper.getRealUser();
		
		// 공통코드목록 조회
		List<CommonVO> categoryList = commonMapper.selectCommonList("카테고리");
		
		// 게시글 단일 조회
		PostVO postVO = postService.selectPost(sntncNo);
		
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("postVO", postVO);
		
		return "board/postDetail";
	}
	
	
	/**
	 * 첨부파일 다운로드
	 * 
	 * @param bbsNo 게시판 번호
	 * @param sntncNo 게시글 번호
	 * @param atchFileNo 통합첨부파일번호
	 * @param atchFileSeq 첨부파일순번
	 * @param model 
	 * @return 첨부파일 리소스
	 */
	@GetMapping("/{bbsNo}/{sntncNo}/attach/{atchFileNo}/{atchFileSeq}")
	private ResponseEntity<Resource> getAttach( @PathVariable int bbsNo, @PathVariable int sntncNo, @PathVariable String atchFileNo, @PathVariable int atchFileSeq, Model model ) {
		// 0. 첨부파일 조회조건 셋팅
		AttachVO atch = new AttachVO();
		atch.setAtchFileNo(atchFileNo);
		atch.setAtchFileSeq(atchFileSeq);
		
		// 1. 첨부파일 조회
		try {
			atch = AttachService.downloadAttach(atch);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		// 2. 헤더 설정
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_OCTET_STREAM); // APPLICATION_OCTET_STREAM : 바이너리로 클라이언트에게 보내기 위해 사용
		headers.setContentLength(atch.getFileSize());
		ContentDisposition contentDisposition = ContentDisposition.attachment()
																.filename(atch.getFileNm(), Charset.defaultCharset())
																.build();
		headers.setContentDisposition(contentDisposition);
		
		// 3. 전송
		return ResponseEntity.ok()
						.headers(headers)
						.body(atch.getBinary());
	}
}
