package com.teamtodev.project.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.http.MediaType;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.teamtodev.attachfile.service.AttachService;
import com.teamtodev.attachfile.vo.AttachVO;
import com.teamtodev.common.service.CommonService;
import com.teamtodev.employees.vo.EmployeeVO;
import com.teamtodev.employees.vo.EmployeeVOWrapper;
import com.teamtodev.project.service.ProjectLogService;
import com.teamtodev.project.service.ProjectMemberService;
import com.teamtodev.project.service.ProjectPostService;
import com.teamtodev.project.vo.ProjectLogVO;
import com.teamtodev.project.vo.ProjectMemberVO;
import com.teamtodev.project.vo.ProjectPostVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/projectPost")
public class ProjectPostController {
	
		@Autowired
	   private CommonService commService;
	
	   @Autowired
	   private AttachService attachService;
	   
	   @Value("#{appInfo.attachFolderTemp}")
	   private Resource tempFolder; // 임시 첨부파일 리소스
	   
	   @Value("#{appInfo.attachFolder}")
	   private Resource saveFolder; // 첨부파일 리소스
	
	@Autowired
	private ProjectPostService service;
	
	@Autowired
	private ProjectLogService Lservice;
	
	@Autowired
	private ProjectMemberService Mservice;
	
	@GetMapping(value="/{prjctCode}/postList",produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public Map<String, List<ProjectPostVO>> selectPostList(@PathVariable String prjctCode){
		List<ProjectPostVO> ppVO = service.retrieveProjectPostList(prjctCode);
		return Collections.singletonMap("data", ppVO);
	}
	
	@GetMapping(value="/{prjctCode}/detailPost/{sntncNo}",produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ProjectPostVO selectDetailPost(@PathVariable String prjctCode,@PathVariable int sntncNo) {
		ProjectPostVO ppVO = new ProjectPostVO();
		ppVO.setPrjctCode(prjctCode);
		ppVO.setSntncNo(sntncNo);
		ProjectPostVO comeOn = service.retrieveProjectPost(ppVO);
		return comeOn;
	}
	
	@PostMapping(value="/{prjctCode}/insertPost", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public String insertPost(@RequestBody Map<String, Object> sendData ,@PathVariable String prjctCode, Authentication authentication) throws IOException {
		EmployeeVOWrapper wrapper =  (EmployeeVOWrapper) authentication.getPrincipal();
		EmployeeVO emplVO = wrapper.getRealUser();
		
		 List<String> realAttachName = (List<String>) sendData.get("attach");
	        List<Map<String, Object>> attachTemp = (List<Map<String, Object>>) sendData.get("attachTemp");
	        
	        String tempPath = tempFolder.getFile().getPath();
	        String savePath = saveFolder.getFile().getPath();
	        String bizType = commService.selectBizTypeCode("프로젝트게시판");
	        List<AttachVO> attachList = new ArrayList<>();
	        for (Map<String, Object> attachTempItem : attachTemp) {
	            Map<String, Object> attachVOMap = (Map<String, Object>) attachTempItem.get("attachVO");
	            String fileName = (String) attachVOMap.get("fileNm");
	            
	            if (realAttachName.contains(fileName)) {
	               AttachVO attachVO = new AttachVO();
	                attachVO.setFileNm(fileName);
	                attachVO.setSaveFileNm((String) attachVOMap.get("saveFileNm"));
	                attachVO.setFileContType((String) attachVOMap.get("fileContType"));
	                attachVO.setFilePath(savePath);
	                attachVO.setFileSize(((Integer) attachVOMap.get("fileSize")).longValue());
	                attachVO.setFileSizeContraction((String) attachVOMap.get("fileSizeContraction"));
	                attachVO.setBizType(bizType);
	                attachVO.setRegUserId(emplVO.getEmplId());
	                attachList.add(attachVO);
	                File tempFile = new File(tempPath, fileName);
	                String saveFileName = attachVO.getSaveFileNm();
	                String fileContType = attachVO.getFileContType();
	                
	                if (saveFileName == null || saveFileName.isEmpty()) {
	                    saveFileName = fileName;
	                } else {
	                    saveFileName = saveFileName + (fileContType != null ? "." + fileContType : "");
	                }
	                
	                File saveFile = new File(savePath, saveFileName);
	                FileUtils.moveFile(tempFile, saveFile);
	            } else {
	               // 5. 나머지 1건에 대한 첨부파일은 임시폴더에서 삭제 처리
	                FileUtils.delete(new File(tempPath, fileName));
	            }
	        }
		
		Map<String, String> mapmap = (Map<String, String>) sendData.get("projectPostVO");
		ProjectMemberVO pmVO = new ProjectMemberVO();
		pmVO.setEmplNo(emplVO.getEmplNo());
		pmVO.setPrjctCode(prjctCode);
		
		int prjctMbrNo = Mservice.retrieveProjectNumber(pmVO);
		ProjectPostVO ppVO = new ProjectPostVO();
		ppVO.setPrjctMbrNo(prjctMbrNo);
		ppVO.setSntncSj(mapmap.get("sntncSj"));
		ppVO.setSntncCn(mapmap.get("sntncCn"));
		ppVO.setAttchFileList(attachList);
		attachService.insertProjectPostAttach(ppVO);
		int cnt = service.createProjectPost(ppVO);
		
		if(cnt>0) {
			ProjectLogVO logVo = new ProjectLogVO();
			Integer sntncNo = ppVO.getSntncNo();
			log.info("sntncNo====>{}",sntncNo);
			String sntncNoStr = String.valueOf(sntncNo);
			log.info("worksNoStr====>{}",sntncNoStr);
			logVo.setLogClass("게시글");
			logVo.setLogStatus("등록");
			logVo.setLogConPk(sntncNoStr);
			Lservice.createLog(logVo);
		}
		return "ok";
	}
	
	@PutMapping(value="/{prjctCode}/updatePost/{sntncNo}",produces =MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public String updatePost(@RequestBody ProjectPostVO ppVO,@PathVariable String prjctCode,@PathVariable int sntncNo ) {
		ppVO.setSntncNo(sntncNo);
		int cnt = service.modifyProjectPost(ppVO);
		
		if(cnt>0) {
			ProjectLogVO logVo = new ProjectLogVO();
			Integer sntncNo2 = ppVO.getSntncNo();
			log.info("sntncNo====>{}",sntncNo2);
			String sntncNoStr = String.valueOf(sntncNo2);
			log.info("worksNoStr====>{}",sntncNoStr);
			logVo.setLogClass("게시글");
			logVo.setLogStatus("수정");
			logVo.setLogConPk(sntncNoStr);
			Lservice.createLog(logVo);
		}
		return "ok";
	}
	
	@DeleteMapping("/{prjctCode}/deletePost/{sntncNo}")
	@ResponseBody
	public String deletePost(@PathVariable String prjctCode,@PathVariable int sntncNo) {
		int cnt = service.deleteProjectPost(sntncNo);
		
		if(cnt>0) {
			return "ok";
			
		}
		return "fail";
	}
}
