package com.teamtodev.attendance.controller;

import java.util.List;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.teamtodev.attendance.service.AttendanceService;
import com.teamtodev.attendance.vo.AttendanceVO;
import com.teamtodev.employees.service.EmployeeService;
import com.teamtodev.employees.vo.EmployeeVO;
import com.teamtodev.employees.vo.EmployeeVOWrapper;
import com.teamtodev.enumpkg.AttendanceType;
import com.teamtodev.utils.TimeUtils;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("attendance")
public class AttendanceController {
	
	private final AttendanceService attendanceService;
	private final EmployeeService employeeService;
	
	@GetMapping
	public String attendance(Model model, Authentication auth) {
		EmployeeVOWrapper userWrapper = (EmployeeVOWrapper) auth.getPrincipal();
		EmployeeVO employeeVO = userWrapper.getRealUser();
		EmployeeVO empl = employeeService.selectEmployeeById(employeeVO.getEmplId());
		
		String now = TimeUtils.todayByPattern("yyyyMMdd");
		AttendanceVO attendanceVO = attendanceService.selectAttendanceByDay(empl.getEmplNo(), now);
		List<AttendanceVO> attendanceList = attendanceService.selectAttendance(empl.getEmplNo());
		
//		log.info("브이오 {}", attendanceVO);
//		log.info("출근 {}", attendanceList);
		
		model.addAttribute("empl", empl);
		model.addAttribute("attendanceVO", attendanceVO);
		model.addAttribute("attendanceList", attendanceList);
		
		return "/attendance/attendance";
	}
	
	@ResponseBody
	@PostMapping("/{dclzNo}/{attendanceType}")
	public void attendanceUpdate(@PathVariable long dclzNo, @PathVariable AttendanceType attendanceType) {
		attendanceService.updateAttendance(dclzNo, attendanceType);
	}
}
