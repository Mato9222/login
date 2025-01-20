package com.teamtodev.referencecenter.controller;


import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/refCenter")
public class ReferenceCenterController {
	
	
	// AppInfo.properties 파일의 refCenterFolder 경로 리소스로 사용
	@Value("#{appInfo.refCenterFolder}")
	private Resource refCenterFolder;
	
	
	
	/**
	 * 자료실 목록 화면 이동
	 * @return
	 */
	@GetMapping
	public String retrieveReferenceCenter(Model model) {
		return "referencecenter/refCenter";
	}
	
	
	@GetMapping("/path")
	@ResponseBody
	public String refCenterInfo() {
		// 자료실 경로와 폴더,파일리스트 요청 처리
		return "su";
	}
	
}
