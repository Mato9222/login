package com.teamtodev.employees.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.server.ResponseStatusException;

import com.teamtodev.employees.exception.AuthenticateException;
import com.teamtodev.employees.service.EmployeeService;
import com.teamtodev.employees.vo.EmployeeVO;

import lombok.RequiredArgsConstructor;

@Controller
//@RequiredArgsConstructor
@RequestMapping("/login")
public class LoginController {
//	private final EmployeeService service;
	
	@GetMapping
	public String loginPage() {
		return "login/login";
	}
//	
//	@PostMapping
//    public String login(HttpServletRequest req,
//    					@RequestParam String emplId,
//    					@RequestParam String emplPW) {
//		HttpSession session = req.getSession(true);
//		if(session.isNew()) {
//			throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "로그인 페이지를 최초로 요청해야함");
//		}
//		String viewName = null;
//		try {
//			EmployeeVO inputData = new EmployeeVO();
//			inputData.setEmplId(emplId);
//			inputData.setEmplPw(emplPW);
//			EmployeeVO authEmpl = service.authenticate(inputData);
//			EmployeeVO authEmpl = service.selectEmployee(inputData.getEmplId());
//			session.setAttribute("authEmpl", authEmpl);
//			viewName = "index";
//		}catch(AuthenticateException e) {
//			session.setAttribute("message", e.getMessage());
//		}
//		return viewName;
//    }
//	
}
