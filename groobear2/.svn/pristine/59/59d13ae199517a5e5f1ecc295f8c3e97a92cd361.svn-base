package com.teamtodev.sanction.controller;

import java.io.File;
import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.xml.bind.DatatypeConverter;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.MediaType;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.teamtodev.employees.service.EmployeeService;
import com.teamtodev.employees.vo.EmployeeVO;
import com.teamtodev.employees.vo.EmployeeVOWrapper;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
@RequestMapping("/sanctionSet")
public class SanctionSettingController {
	
	@Autowired
	private EmployeeService service;
	
	@Value("#{appInfo.saveFolderSign}")
	private File saveFolder;
	
	@PutMapping(value = "/signURL", produces = MediaType.APPLICATION_JSON_VALUE)
	public Map<String, Object> UpdateSignURL(Authentication auth, @RequestParam String sign, HttpSession session){
		String emplPw = (String) session.getAttribute("emplPw");
    	EmployeeVOWrapper userWrapper = (EmployeeVOWrapper) auth.getPrincipal();
    	EmployeeVO user = userWrapper.getRealUser();
    	EmployeeVO emplVO = new EmployeeVO();
		Map<String, Object> result = new LinkedHashMap<>();
		String data = StringUtils.split(sign, ",")[1];
		
		String fileName = "sign"+System.currentTimeMillis()+".png";
		try {
			File saveFile = new File (saveFolder, fileName);
			FileUtils.writeByteArrayToFile(saveFile, Base64.decodeBase64(data));
			emplVO.setEmplNo(user.getEmplNo());
			emplVO.setEmplId(user.getEmplId());
			emplVO.setEmplPw(emplPw);
			emplVO.setSanctnCtpntUrl(fileName);
			service.UpdateEmployeeSignURL(emplVO);
            result.put("success", true);
            result.put("fileName", fileName);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
            result.put("error", false);
		}
		return result;
	}
	
}
