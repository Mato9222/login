package com.teamtodev.Access;

import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.teamtodev.employees.service.EmployeeService;
import com.teamtodev.employees.vo.EmployeeVO;
import com.teamtodev.employees.vo.EmployeeVOWrapper;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
@RequestMapping("/access")
public class PasswordAccessController {

	@Autowired
	private EmployeeService service;
	
	@PostMapping("/password")
	public Map<String, Object> passwordAccess(@RequestBody Map<String, String> payload ,Authentication auth, HttpSession session){
		String emplPw = payload.get("emplPw");
		EmployeeVOWrapper userWrapper = (EmployeeVOWrapper) auth.getPrincipal();
		EmployeeVO user = userWrapper.getRealUser();
		Map<String, Object> result = new LinkedHashMap<String, Object>();
		EmployeeVO emplVO = new EmployeeVO();
		emplVO.setEmplId(user.getEmplId());
		emplVO.setEmplPw(emplPw);
		int access = service.selectEmplPasswordAccess(emplVO);
		if(access > 0) {
			session.setAttribute("emplPw", emplPw);
			result.put("success", true);
		}else {
			result.put("false", false);
		}
		return result;
	}
	
	@PostMapping("/mypage")
	public Map<String, Object> mypagePasswordAccess(@RequestBody Map<String, String> payload ,Authentication auth, HttpSession session){
		String emplPw = payload.get("emplPw");
		EmployeeVOWrapper userWrapper = (EmployeeVOWrapper) auth.getPrincipal();
		EmployeeVO user = userWrapper.getRealUser();
		Map<String, Object> result = new LinkedHashMap<String, Object>();
		EmployeeVO emplVO = new EmployeeVO();
		emplVO.setEmplId(user.getEmplId());
		emplVO.setEmplPw(emplPw);
		int access = service.selectEmplPasswordAccess(emplVO);
		if(access > 0) {
			session.setAttribute("emplPw", emplPw);
			result.put("success", true);
		}else {
			result.put("false", false);
		}
		return result;
	}
}
