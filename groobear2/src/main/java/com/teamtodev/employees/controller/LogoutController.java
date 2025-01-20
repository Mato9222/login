package com.teamtodev.employees.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/logOut")
public class LogoutController {
	
	@GetMapping
	public String logout(HttpServletRequest req) {
		HttpSession session = req.getSession();
		session.invalidate();
		
		return "/login/login";
	}
}
