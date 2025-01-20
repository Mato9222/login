package com.teamtodev.board.controller;

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
import com.teamtodev.common.mapper.CommonMapper;
import com.teamtodev.common.vo.CommonVO;
import com.teamtodev.employees.vo.EmployeeVO;
import com.teamtodev.employees.vo.EmployeeVOWrapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/board")
public class PostUpdateController {
	
	@Autowired
	private PostService postService; // 게시글 서비스
	
	@Autowired
	private CommonMapper commonMapper;
	
	
	
	/**
	 * 게시글 수정화면 이동
	 */
	@GetMapping("/{bbsNo}/{sntncNo}/edit")
	public String updateForm(@PathVariable int bbsNo, @PathVariable int sntncNo, Authentication auth, Model model) {
		// 로그인한 사용자의 정보 가져오기
		EmployeeVOWrapper userWrapper = (EmployeeVOWrapper) auth.getPrincipal();
		EmployeeVO employeeVo = userWrapper.getRealUser();
		
		// 공통코드목록 조회
		List<CommonVO> categoryList = commonMapper.selectCommonList("카테고리");
		
		// 게시글 단일 조회
		PostVO postVO = postService.selectPost(sntncNo);
		
		model.addAttribute("employeeVO", employeeVo);
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("postVO", postVO);
		
		return "board/postEdit";
	}
	
	
	
	/**
	 * 게시글 수정
	 */
	@PostMapping("/{bbsNo}/{sntncNo}/edit")
	@ResponseBody
	public String update( @PathVariable int bbsNo, @PathVariable int sntncNo, Authentication auth, PostVO postVO) {
		// 로그인한 사용자의 정보 가져오기
		EmployeeVOWrapper userWrapper = (EmployeeVOWrapper) auth.getPrincipal();
		EmployeeVO employeeVo = userWrapper.getRealUser();
		
		// 게시글 수정
		postService.updatePost(employeeVo, postVO);
		
		return "success";
	}
}
