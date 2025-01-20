package com.teamtodev.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.teamtodev.board.service.PostService;
import com.teamtodev.board.vo.PostVO;
import com.teamtodev.employees.vo.EmployeeVO;
import com.teamtodev.employees.vo.EmployeeVOWrapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/board")
public class PostDeleteController {

	@Autowired
	private PostService postService; // 게시글 서비스
	
	@GetMapping("/{bbsNo}/{sntncNo}/delete")
	private String postDelete( @PathVariable int bbsNo, @PathVariable int sntncNo, Authentication auth, Model model) {
		// 로그인한 사용자의 정보 가져오기
		EmployeeVOWrapper userWrapper = (EmployeeVOWrapper) auth.getPrincipal();
		EmployeeVO employeeVo = userWrapper.getRealUser();
		
		// 게시글 번호로 조회 후
		PostVO originPost = postService.selectPost(sntncNo);
		
		// 게시글 등록자 NO 와 프린시펄 유저정보랑 같으면
		if(originPost.getEmplNo() == (employeeVo.getEmplNo())) {
	 		//게시글 삭제 진행
			postService.deletePost(sntncNo);
		}
		
		// 삭제 성공 시 
		// 현재 게시판의 목록으로 이동
		return "redirect:/board/" + bbsNo;
	}
	
	
}
