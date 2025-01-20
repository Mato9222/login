package com.teamtodev.documents.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.teamtodev.documents.service.DocumentFormService;
import com.teamtodev.documents.vo.DocumentFormVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequiredArgsConstructor
@RequestMapping("/dcform")
public class documentFormController {

	private final DocumentFormService dcformService;
	
	@GetMapping(value = "/tree", produces = "application/json;charset=UTF-8")
	public List<Map<String, Object>> getDocumentTree () {
		List<DocumentFormVO> document = dcformService.documentFormList();
		
		List<Map<String, Object>> nodes = new ArrayList();
		for(DocumentFormVO vo : document) {
			Map<String, Object> node = new HashMap();
			node.put("child", vo.getDoorSign());
			node.put("parent", vo.getDocTy());
			node.put("no", vo.getDocRaisngNo());
			node.put("cn", vo.getDocCn());
			nodes.add(node);
		}
		return nodes;
	}
}
