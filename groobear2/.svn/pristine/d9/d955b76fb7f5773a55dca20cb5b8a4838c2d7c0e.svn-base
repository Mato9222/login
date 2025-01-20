package com.teamtodev.schedule.controller;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.teamtodev.employees.vo.EmployeeVO;
import com.teamtodev.employees.vo.EmployeeVOWrapper;
import com.teamtodev.schedule.service.ScheduleService;
import com.teamtodev.schedule.vo.ScheduleVO;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
@RequestMapping(value="/schedule", produces = MediaType.APPLICATION_JSON_VALUE)
public class ScheduleController {
	public static final String  MODELNAME = "schedule";
	
	@Autowired
	private ScheduleService service;
	
	
	@GetMapping(produces = MediaType.TEXT_HTML_VALUE)
	public String viewControllerMapping() {
		return "schedule/calendar";
	}
	
	@GetMapping("/selectList")
	@ResponseBody
	public List<ScheduleVO> selectScheduleList(Authentication authentication) {
		EmployeeVOWrapper userWrapper = (EmployeeVOWrapper) authentication.getPrincipal();
		EmployeeVO user = userWrapper.getRealUser();
		ScheduleVO scheVo = new ScheduleVO();
		log.info("user.getEmpNo==>>{}",user.getEmplNo());
		scheVo.setEmplNo(user.getEmplNo());
		scheVo.setDeptNo(user.getDeptNo());
		return  service.retrieveScheduleList(scheVo);
	}
	
	
	
	@GetMapping("{schdulNo}")
	@ResponseBody
	public ScheduleVO selectSchedule(@PathVariable int schdulNo) {
		log.info("schdul - >{}",schdulNo);
		ScheduleVO sd = service.retrieveSchedule(schdulNo);
		return sd;
	}
	
	@PostMapping
	@ResponseBody
	public Map<String, Object> insertSchedule(@Valid @RequestBody ScheduleVO schedule
			, BindingResult errors
			) {
			Map<String, Object> map = new LinkedHashMap<String, Object>();
			if(errors.hasErrors()) {
				map.put("success", false);
				Map<String, String> errorsMap = new LinkedHashMap<String, String>();
				map.put("errors", errorsMap);
				errors.getFieldErrors().forEach((fieldError)->{
					String propName = fieldError.getField();
					String message = fieldError.getDefaultMessage();
					errorsMap.put(propName, message);
				});
			}else {
				service.createSchedule(schedule);
				map.put(MODELNAME, schedule);
				map.put("success", true);
			}
			return map;
	}
	
	@PutMapping
	@ResponseBody
	public Map<String, Object> updateSchedule(@Valid @RequestBody ScheduleVO schedule
			, BindingResult errors
			) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put(MODELNAME, schedule);
		if(errors.hasErrors()) {
			map.put("success", false);
			Map<String, String> errorsMap = new LinkedHashMap<String, String>();
			map.put("errors", errorsMap);
			errors.getFieldErrors().forEach((fieldError)->{
				String propName = fieldError.getField();
				String message = fieldError.getDefaultMessage();
				errorsMap.put(propName, message);
			});
		}else {
			service.modifySchedule(schedule);
			map.put("success", true);
		}
		return map;
	}
	
	@DeleteMapping("{schdulNo}")
	@ResponseBody
	public Map<String, Object> deleteSchedule(@PathVariable int schdulNo
			) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put(MODELNAME, schdulNo);
		service.deleteSchedule(schdulNo);
		map.put("success", true);
		return map;
	}
}
