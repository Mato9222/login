package com.teamtodev.sanction.controller;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.MediaType;
import org.springframework.security.core.Authentication;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.teamtodev.employees.vo.EmployeeVO;
import com.teamtodev.employees.vo.EmployeeVOWrapper;
import com.teamtodev.sanction.service.SanctionLineService;
import com.teamtodev.sanction.vo.SanctionDocVO;
import com.teamtodev.sanction.vo.SanctionLineVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequiredArgsConstructor
@RequestMapping("/scline")
public class SanctionLineController {

	private final SanctionLineService sclineService;
	
	@GetMapping(produces = MediaType.APPLICATION_JSON_VALUE)
	public List<SanctionLineVO> sclineList(Authentication auth) {
		EmployeeVOWrapper userWrapper = (EmployeeVOWrapper) auth.getPrincipal();
		EmployeeVO emplVo = userWrapper.getRealUser();
        List<SanctionLineVO> sclineList = sclineService.SanctionLineList(emplVo.getEmplNo());
        return sclineList;
	}
	
	@PostMapping(consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
	public Map<String, Object> InsertScline(Authentication auth ,@RequestBody SanctionLineVO sclineVO){
		Map<String, Object> result = new LinkedHashMap<>();
		EmployeeVOWrapper userWrapper = (EmployeeVOWrapper) auth.getPrincipal();
		EmployeeVO emplVo = userWrapper.getRealUser();
		sclineVO.setEmplNo(emplVo.getEmplNo());
		sclineService.insertSanctionLine(sclineVO);
		result.put("success", true);
		result.put("message", "등록 성공");
		result.put("target", sclineVO);
		return result;
	}
	
	@DeleteMapping(consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
	public Map<String, Object> deleteScline(@RequestBody String sclineNo) {
		Map<String, Object> result = new LinkedHashMap<>();
		sclineService.deleteSanctionLine(sclineNo);
		result.put("success", true);
		result.put("message", "삭제 성공");
		result.put("target", sclineNo);
		return result;
	}
	
	@GetMapping(value = "/detail", produces = MediaType.APPLICATION_JSON_VALUE)
	public List<SanctionLineVO> sclineDetail(@RequestParam String sclineNo) {
		List<SanctionLineVO> sclineVO = sclineService.selectSanctionLine(sclineNo);
		return sclineVO;
	}
	
}
