package com.teamtodev.sanction.controller;

import java.time.LocalDate;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.teamtodev.employees.vo.EmployeeVO;
import com.teamtodev.employees.vo.EmployeeVOWrapper;
import com.teamtodev.sanction.service.SanctionDocService;
import com.teamtodev.sanction.service.SanctionService;
import com.teamtodev.sanction.vo.SanctionDocVO;
import com.teamtodev.sanction.vo.SanctionVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/waitSanction")
public class WaitSanctionController {
	
	@Autowired
	private SanctionDocService service;
	
	@Autowired
	private SanctionService scService;
	
	@PutMapping(value = "/success", produces = MediaType.APPLICATION_JSON_VALUE)
	public Map<String, Object> Sanction(Authentication auth, @RequestBody SanctionVO sanctionVO, HttpSession session) {
		Map<String, Object> result = new LinkedHashMap<>();
		EmployeeVOWrapper userWrapper = (EmployeeVOWrapper) auth.getPrincipal();
		EmployeeVO user = userWrapper.getRealUser();
		SanctionVO scVo = new SanctionVO();
		scVo.setRealSanctnEmplNo(user.getEmplNo());
		scVo.setSanctnSttusCode("J03");
		scVo.setSanctnDocNo(sanctionVO.getSanctnDocNo());
		scVo.setSanctnOpinion(sanctionVO.getSanctnOpinion());
		scVo.setSanctnEmplNo(user.getEmplNo());
		scVo.setSanctnDe(LocalDate.now());
		scService.updateSanction(scVo);
		
		String SanctnCn = sanctionVO.getSanctnCn();
		sanctionVO.setSanctnCn(SanctnCn);
		service.updateSanctionDocURL(sanctionVO);
		
		SanctionDocVO scDocVo = new SanctionDocVO();
		scDocVo.setSanctnDocNo(sanctionVO.getSanctnDocNo());
		if(service.selectSanctionDoc(sanctionVO.getSanctnDocNo()).getLastSanctnSttusCode().equals("J01")) {
			scDocVo.setLastSanctnSttusCode("J02");
			service.updateSanctionDocSttus(scDocVo);
		}else if(scService.scDocLastOrdrSanction(sanctionVO.getSanctnDocNo()).getSanctnSttusCode().equals("J03")) {
			scDocVo.setLastSanctnSttusCode("J03");
			scDocVo.setLastSanctnDe(LocalDate.now());
			service.updateSanctionDocSttus(scDocVo);
		}
		
		result.put("success", true);
		result.put("message", "등록 성공");
		
		return result;
	}
	
	@DeleteMapping(value = "/delete", produces = MediaType.APPLICATION_JSON_VALUE)
	public Map<String, Object> DeleteSanction(@RequestBody Map<String, String> request){
		Map<String, Object> result = new LinkedHashMap<>();
		String sanctnDocNo = request.get("sanctnDocNo");
		SanctionDocVO scDocVO = service.selectSanctionDoc(sanctnDocNo);
		if (scDocVO.getLastSanctnSttusCode().equals("J01") || scDocVO.getLastSanctnSttusCode().equals("J04")) {
		    scService.deleteSanction(sanctnDocNo);
		    service.deleteSanctionDoc(sanctnDocNo);
		}else {
			result.put("false", false);
			result.put("message", "실패");
		}
		result.put("success", true);
		result.put("message", "성공");
		return result;
	}
	
	@PutMapping(value = "/update", produces = MediaType.APPLICATION_JSON_VALUE)
	public Map<String, Object> UpdateSanction(@RequestBody Map<String, Object> requestData){
		ObjectMapper objectMapper = new ObjectMapper();
		SanctionDocVO sanctionDocVO = objectMapper.convertValue(requestData.get("sanctionDocVO"), SanctionDocVO.class);
//		List<String> realAttachName = (List<String>) requestData.get("attach");
//		List<Map<String, Object>> attachTemp = (List<Map<String, Object>>) requestData.get("attachTemp");		
		sanctionDocVO.setTmprStreAt("N");
		SanctionVO scVO = new SanctionVO();
		scVO.setSanctnDocNo(sanctionDocVO.getSanctnDocNo());
		scVO.setSanctnSttusCode("J01");
		scVO.setSanctnOpinion(null);
		scVO.setSanctnDe(null);
		scVO.setRealSanctnEmplNo(null);
		scVO.setRealSanctnCtpntUrl(null);
		scService.updateReSanction(scVO);
		sanctionDocVO.setLastSanctnSttusCode("J01");
		service.updateSanctionDoc(sanctionDocVO);
		Map<String, Object> result = new LinkedHashMap<>();
		result.put("success", true);
		result.put("message", "성공");
		return result;
	}
	@PutMapping(value = "/updateSave", produces = MediaType.APPLICATION_JSON_VALUE)
	public Map<String, Object> UpdateSaveSanction(@RequestBody SanctionDocVO sanctionDocVO){
		sanctionDocVO.setTmprStreAt("Y");
		SanctionVO scVO = new SanctionVO();
		scVO.setSanctnDocNo(sanctionDocVO.getSanctnDocNo());
		scVO.setSanctnSttusCode("J01");
		scVO.setSanctnOpinion(null);
		scVO.setSanctnDe(null);
		scVO.setRealSanctnEmplNo(null);
		scVO.setRealSanctnCtpntUrl(null);
		scService.updateReSanction(scVO);
		sanctionDocVO.setLastSanctnSttusCode("J01");
		service.updateSanctionDoc(sanctionDocVO);
		Map<String, Object> result = new LinkedHashMap<>();
		result.put("success", true);
		result.put("message", "성공");
		return result;
	}
	
	@PutMapping(value = "/return", produces = MediaType.APPLICATION_JSON_VALUE)
	public Map<String, Object> UpdateSanctionReturn(@RequestBody SanctionVO sanctionVO, Authentication auth){
		Map<String, Object> result = new LinkedHashMap<>();
		EmployeeVOWrapper userWrapper = (EmployeeVOWrapper) auth.getPrincipal();
		EmployeeVO user = userWrapper.getRealUser();
		sanctionVO.setRealSanctnEmplNo(user.getEmplNo());
		sanctionVO.setSanctnEmplNo(user.getEmplNo());
		sanctionVO.setSanctnSttusCode("J04");
		sanctionVO.setSanctnDe(LocalDate.now());
		scService.updateSanction(sanctionVO);
		
		SanctionDocVO scDocVO = new SanctionDocVO();
		scDocVO.setSanctnDocNo(sanctionVO.getSanctnDocNo());
		scDocVO.setLastSanctnSttusCode("J04");
		scDocVO.setLastSanctnDe(LocalDate.now());
		service.updateSanctionDocSttus(scDocVO);
		result.put("success", true);
		result.put("message", "성공");
		return result;
	}
}
