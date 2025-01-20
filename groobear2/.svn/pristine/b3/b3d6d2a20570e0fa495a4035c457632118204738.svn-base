package com.teamtodev.adrs.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.teamtodev.adrs.service.AdrsService;
import com.teamtodev.employees.vo.EmployeeVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/adrs")
public class adrsController {

	@Autowired
	private AdrsService adrsService;
	
	@GetMapping
	public String adrsList () {
		
		return "address/adrs";
//		return "address/address";
	}
	
	@GetMapping("/List")
	public String adrsInsert() {
		
		return "address/address";
	}

	@GetMapping("/emplList")
	@ResponseBody
	public List<EmployeeVO> emplList(Model model) {
		List<EmployeeVO> emplList = adrsService.selectList();
		
		model.addAttribute("emplList",emplList);
		
		return emplList;
	}
}
