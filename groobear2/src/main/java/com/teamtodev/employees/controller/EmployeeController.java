package com.teamtodev.employees.controller;

import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.UUID;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.teamtodev.attendance.service.AttendanceService;
import com.teamtodev.attendance.vo.AttendanceVO;
import com.teamtodev.common.service.CommonService;
import com.teamtodev.common.vo.CommonVO;
import com.teamtodev.department.service.DepartmentService;
import com.teamtodev.department.vo.DepartmentVO;
import com.teamtodev.employees.service.EmployeeService;
import com.teamtodev.employees.vo.EmployeeVO;
import com.teamtodev.enumpkg.ServiceResult;
import com.teamtodev.utils.TimeUtils;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/employee")
public class EmployeeController {
	
	public static final String MODELNAME = "newEmployee";
	
	private final AttendanceService attendanceService; 
	private final CommonService commonService;
	private final DepartmentService departmentService;
	private final EmployeeService employeeService;
	
	@Value("#{appInfo.saveFolder}")
	private File saveFolder;
	
	@GetMapping("/list")
	public String employeeList(Model model) {
		List<EmployeeVO> emplList = employeeService.selectEmployeeList();
		List<CommonVO> commonOfcpsList = commonService.selectCommonList("직위");
		
		model.addAttribute("emplList", emplList);
		model.addAttribute("commonOfcpsList", commonOfcpsList);
		
		return "/employee/employeeList";
	}
	
	@GetMapping("/new")
	public String employeeInsertForm(Model model) {
		List<CommonVO> commonCmmnList = commonService.selectCommonList("성별");
		List<DepartmentVO> departmentList = departmentService.selectDepartmentList();
		List<CommonVO> commonOfcpsList = commonService.selectCommonList("직위");
		List<CommonVO> commonRspofcList = commonService.selectCommonList("직책");
		
		model.addAttribute("commonCmmnList", commonCmmnList);
		model.addAttribute("departmentList", departmentList);
		model.addAttribute("commonOfcpsList", commonOfcpsList);
		model.addAttribute("commonRspofcList", commonRspofcList);
		
		return "/employee/employeeInsert";
	}
	
	@ResponseBody
	@PostMapping("/new")
	public String employeeInsert(EmployeeVO employeeVO, @RequestParam MultipartFile multipartFile) {
		String originalFileName = multipartFile.getOriginalFilename();
		String extension = FilenameUtils.getExtension(originalFileName);
		String uuid = UUID.randomUUID().toString();
		String saveFileName = uuid + "." + extension;
		File saveFile = new File(saveFolder, saveFileName);
		
		try {
			multipartFile.transferTo(saveFile);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		employeeVO.setProflPhotoCours(saveFileName);
		ServiceResult result = employeeService.insertEmployee(employeeVO);
		
		if(result.equals(ServiceResult.OK)) {
			return "success";
		}
		
		return "fail";
	}
	
	@GetMapping("/{emplNo}")
	public String employeeSelect(@PathVariable int emplNo, Model model) {
		String now = TimeUtils.todayByPattern("yyyyMMdd");
		EmployeeVO employeeVO = employeeService.selectEmployeeByNo(emplNo);
		AttendanceVO attendanceVO = attendanceService.selectAttendanceByDay(employeeVO.getEmplNo(), now);
		List<AttendanceVO> attendanceList = attendanceService.selectAttendance(emplNo);
		
		model.addAttribute("employeeVO", employeeVO);
		model.addAttribute("attendanceVO", attendanceVO);
		model.addAttribute("attendanceList", attendanceList);
		
		return "/employee/employeeDetail";
	}
	
}
