package com.teamtodev.employees.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.teamtodev.employees.service.EmployeeService;
import com.teamtodev.employees.vo.EmployeeVO;
import com.teamtodev.employees.vo.EmployeeVOWrapper;
import com.teamtodev.enumpkg.ServiceResult;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/mypage")
public class MypageController {
	private final EmployeeService employeeService;
	
	@Value("#{appInfo.saveFolder}")
	private File saveFolder;
	
	@GetMapping
	public String mypage(Model model, Authentication auth) {
		EmployeeVOWrapper userWrapper = (EmployeeVOWrapper) auth.getPrincipal();
		EmployeeVO emplVo = userWrapper.getRealUser();
		EmployeeVO empl = employeeService.selectEmployeeById(emplVo.getEmplId());
		model.addAttribute("empl", empl);
		return "/mypage/mypage";
	}	
	
	@GetMapping("/settings")
	public String mypageSettingsForm(Model model, Authentication auth) {
		EmployeeVOWrapper userWrapper = (EmployeeVOWrapper) auth.getPrincipal();
		EmployeeVO emplVo = userWrapper.getRealUser();
		EmployeeVO empl = employeeService.selectEmployeeById(emplVo.getEmplId());
		model.addAttribute("empl", empl);
		return "/mypage/mypageSettings";
	}
	
	@ResponseBody
	@PostMapping("/settings")
	public String mypageSettings(EmployeeVO employee, Authentication auth, HttpSession session, @RequestParam(required = false) MultipartFile multipartFile) {
		String emplPw = (String) session.getAttribute("emplPw");
		EmployeeVOWrapper userWrapper = (EmployeeVOWrapper) auth.getPrincipal();
		EmployeeVO emplVo = userWrapper.getRealUser();
		
		log.info("임플로이 {}", employee);
		
		if(multipartFile == null) {
			employee.setProflPhotoCours(emplVo.getProflPhotoCours());
		}
		else {
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
			employee.setProflPhotoCours(saveFileName);
		}
		
		employee.setEmplNo(emplVo.getEmplNo());
		employee.setEmplId(emplVo.getEmplId());
		employee.setEmplPw(emplPw);
		ServiceResult result = employeeService.updateEmployee(employee);
		if(result.equals(ServiceResult.OK)) {
			return "success";
		}
		return "fail";
	}
}
