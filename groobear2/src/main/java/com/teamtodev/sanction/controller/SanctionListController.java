package com.teamtodev.sanction.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.teamtodev.employees.vo.EmployeeVO;
import com.teamtodev.employees.vo.EmployeeVOWrapper;
import com.teamtodev.sanction.service.SanctionDocService;
import com.teamtodev.sanction.service.SanctionService;
import com.teamtodev.sanction.vo.SanctionDocVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/sanctionList")
public class SanctionListController {

	@Autowired
	private SanctionDocService service;
	
	@Autowired
	private SanctionService scService;	
	
	@GetMapping
	public String waitSanction() {
		return "/sanction/sanctionList";
	}
	
	@GetMapping("/finish")
	public String SanctnFinishDoc (Model model, Authentication auth) {
		EmployeeVOWrapper userWrapper = (EmployeeVOWrapper) auth.getPrincipal();
		EmployeeVO user = userWrapper.getRealUser();
		SanctionDocVO scDocVO = new SanctionDocVO();
		scDocVO.setDrafterEmplNo(user.getEmplNo());
		scDocVO.setTmprStreAt("N");
		List<SanctionDocVO> scDocList = service.SanctionDocFinish(scDocVO);
		model.addAttribute("scDocList", scDocList);
		return "/sanction/sanctionFinishList";
	}
	
	@GetMapping("/receive")
	public String ReceiveSanctnDoc (Model model, Authentication auth) {
    	EmployeeVOWrapper userWrapper = (EmployeeVOWrapper) auth.getPrincipal();
    	EmployeeVO user = userWrapper.getRealUser();
    	SanctionDocVO scDocVO = new SanctionDocVO();
    	scDocVO.setLastRcver(user.getEmplNo());
    	scDocVO.setLastSanctnSttusCode("J03");
		List<SanctionDocVO> waitSclist = service.SanctionDocRcverList(scDocVO);
		model.addAttribute("waitSclist", waitSclist);		
		return "/sanction/waitReceiveList";
	}
	
	@GetMapping("/reference")
	public String refAccDocument (Model model, Authentication auth) {
    	EmployeeVOWrapper userWrapper = (EmployeeVOWrapper) auth.getPrincipal();
    	EmployeeVO user = userWrapper.getRealUser();
    	SanctionDocVO scDocVO = new SanctionDocVO();
    	scDocVO.setSanctnEmplNo(user.getEmplNo());
    	scDocVO.setLastSanctnSttusCode("J03");
		List<SanctionDocVO> refDocList = service.SanctionDocRefList(scDocVO);
		model.addAttribute("refDocList", refDocList);		
		return "/sanction/referenceList";
	}
	
	@GetMapping("/saveDocument")
	public String saveDocument (Model model, Authentication auth) {
    	EmployeeVOWrapper userWrapper = (EmployeeVOWrapper) auth.getPrincipal();
    	EmployeeVO user = userWrapper.getRealUser();
    	SanctionDocVO scDocVO = new SanctionDocVO();
    	scDocVO.setDrafterEmplNo(user.getEmplNo());
    	scDocVO.setTmprStreAt("Y");
		List<SanctionDocVO> scDocList = service.SanctionDocList(scDocVO);
		model.addAttribute("scDocList", scDocList);		
		return "/sanction/saveSanctionList";
	}
	
	@GetMapping("/sanctionBox")
	public String sanctionBox (Model model) {
		List<SanctionDocVO> scDocList = service.SanctionDocFinishList("J03");
		model.addAttribute("scDocList", scDocList);	
		return "/sanction/sanctionBox";
	}
	
	@GetMapping("/setting")
	public String sanctionSetting () {
		return "/sanction/sanctionSetting";
	}
}
