package com.teamtodev.board.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.teamtodev.board.service.PostService;
import com.teamtodev.board.vo.PostVO;
import com.teamtodev.common.service.CommonService;
import com.teamtodev.common.vo.CommonVO;
import com.teamtodev.employees.service.EmployeeService;
import com.teamtodev.employees.vo.EmployeeVO;
import com.teamtodev.employees.vo.EmployeeVOWrapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/board")
public class PostInsertController {
	
	@Autowired
	private PostService postService; // 게시글
	
	@Autowired
	private CommonService commonService; // 공통코드
	
	@Autowired
	private EmployeeService emplservice; // 직원
	
	/**
	 * 게시글 등록 화면 이동
	 * 
	 * @param bbsNo : 게시판 번호, 사용은 안함
	 * @param model : 모델객체
	 * @return 게시글등록화면
	 */
	@GetMapping("/{bbsNo}/new")
	private String postInsertForm(@PathVariable int bbsNo, Model model) {
		// 공통코드목록 조회
		List<CommonVO> categoryList = commonService.selectCommonList("카테고리");
		
		model.addAttribute("categoryList", categoryList);
		
		return "board/postForm";
	}
	
	/**
	 * 게시글 등록
	 * 
	 * @param bbsNo : 게시판 번호, 사용은 안함
	 * @param auth : 로그인사용자 정보
	 * @param postVO : 게시글 정보
	 * @param tbAttachFile : 첨부파일 배열
	 * @param redirectAttributes : 
	 * @return : 게시글등록 완료 : success, 실패 : fail
	 */
	@PostMapping("/{bbsNo}/new")
	@ResponseBody
	private String postInsert( @PathVariable int bbsNo, Authentication auth, PostVO postVO) {
		// 로그인한 사용자의 정보 가져오기
		EmployeeVOWrapper userWrapper = (EmployeeVOWrapper) auth.getPrincipal();
		EmployeeVO employeeVo = userWrapper.getRealUser();
		
		// 게시글 등록
		try {
			postService.createPost(employeeVo, postVO);
		} catch (IOException e) {
			e.printStackTrace(); // TODO : 익셉션 처리
			return "fail";
		}
		
		return "success"; // TODO : 정리필요
	}
	
}
