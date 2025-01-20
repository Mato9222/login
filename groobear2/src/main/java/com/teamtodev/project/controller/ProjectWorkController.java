package com.teamtodev.project.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.http.MediaType;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
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
import com.teamtodev.project.service.ProjectWorkService;
import com.teamtodev.project.vo.ProjectLogVO;
import com.teamtodev.project.vo.ProjectWorkVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/projectWork")
public class ProjectWorkController {
		
	 	@Autowired
	   private CommonService commService;
	
	   @Autowired
	   private AttachService attachService;
	   
	   @Value("#{appInfo.attachFolderTemp}")
	   private Resource tempFolder; // 임시 첨부파일 리소스
	   
	   @Value("#{appInfo.projectfiles}")
	   private Resource saveFolder; // 첨부파일 리소스
	
	@Autowired
	private ProjectWorkService service;
	
	@Autowired
	private ProjectLogService lService;
	
	@GetMapping(value="/{prjctCode}/workList",produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<ProjectWorkVO> selectWorkList(@PathVariable String prjctCode){
		List<ProjectWorkVO> pwList = service.retrieveProjectWorkList(prjctCode);
		return pwList;
	}
	
	@GetMapping(value="/detailWork/{worksNo}")
	@ResponseBody
	public ProjectWorkVO selectDetailWork(@PathVariable int worksNo) {
		ProjectWorkVO pwVO = service.retrieveProjectWork(worksNo);
		return pwVO;
	}
	
	@PostMapping(value="/insertWork",produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public String insertWork(@RequestBody Map<String, Object> sendData, Authentication authentication) throws IOException {
	       EmployeeVOWrapper userWrapper = (EmployeeVOWrapper) authentication.getPrincipal();
	       EmployeeVO user = userWrapper.getRealUser();
	        // sanctionDoc 데이터 추출
	       // 4. 3건의 임시파일 중 2건이 실제 사용될 첨부파일이면 실제 첨부파일은 DB 및 폴더에 저장
	        List<String> realAttachName = (List<String>) sendData.get("attach");
	        List<Map<String, Object>> attachTemp = (List<Map<String, Object>>) sendData.get("attachTemp");
	        
	        String tempPath = tempFolder.getFile().getPath();
	        String savePath = saveFolder.getFile().getPath();
	        String bizType = commService.selectBizTypeCode("프로젝트일감");
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
	                attachVO.setRegUserId(user.getEmplId());
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
			Map<String, String> mapmap = (Map<String, String>) sendData.get("projectWorkVO");
			ProjectWorkVO pwVO = new ProjectWorkVO();
			pwVO.setWorksTitle(mapmap.get("worksTitle"));
			pwVO.setWorksCon(mapmap.get("worksCon"));
			pwVO.setPrjctMbrNo(Integer.parseInt(mapmap.get("prjctMbrNo")));
			pwVO.setPrjctMbrNo2(Integer.parseInt(mapmap.get("prjctMbrNo2")));
			pwVO.setBgnde(mapmap.get("bgnde"));
			pwVO.setClosOn(mapmap.get("closOn"));
			pwVO.setWorksOrd(Integer.parseInt(mapmap.get("worksOrd")));
			pwVO.setAttchFileList(attachList);
			attachService.insertProjectWorkAttach(pwVO);
			int cnt = service.createProjectWork(pwVO);
		
		if(cnt>0) {
			ProjectLogVO logVo = new ProjectLogVO();
			Integer worksNo = pwVO.getWorksNo();
			log.info("worksNo====>{}",worksNo);
			String worksNoStr = worksNo.toString();
			log.info("worksNoStr====>{}",worksNoStr);
			logVo.setLogClass("일감");
			logVo.setLogStatus("등록");
			logVo.setLogConPk(worksNoStr);
			lService.createLog(logVo);
		}
		
		return "ok";
	}
	
	@PutMapping(value="/updateWork",produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public String updateWork(@RequestBody ProjectWorkVO pwVO) {
		if(pwVO.getProgrsRt()>0 && pwVO.getProgrsRt()<100) {
			pwVO.setWorkSttusCode("G01");
		}
		if(pwVO.getProgrsRt()==100) {
			pwVO.setWorkSttusCode("G02");
		}
		int cnt = service.modifyProjectWork(pwVO);
		
		if(cnt>0) {
			ProjectLogVO logVo = new ProjectLogVO();
			Integer worksNo = pwVO.getWorksNo();
			log.info("worksNo====>{}",worksNo);
			String worksNoStr = worksNo.toString();
			log.info("worksNoStr====>{}",worksNoStr);
			logVo.setLogClass("일감");
			logVo.setLogStatus("수정");
			logVo.setLogConPk(worksNoStr);
			lService.createLog(logVo);
		}
		return "ok";
	}
	
	@PutMapping(value="/deleteWork/{worksNo}", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public String deleteWork(@PathVariable int worksNo) {
		int cnt = service.deleteProjectWork(worksNo);
		
		if(cnt>0) {
			ProjectLogVO logVo = new ProjectLogVO();
			Integer wrNo = worksNo;
			log.info("worksNo====>{}",worksNo);
			String worksNoStr = wrNo.toString();
			log.info("worksNoStr====>{}",worksNoStr);
			logVo.setLogClass("일감");
			logVo.setLogStatus("삭제");
			logVo.setLogConPk(worksNoStr);
			lService.createLog(logVo);
		}
		
		return "ok";
	}
	
	@GetMapping(value="/countWorkChart")
	@ResponseBody
	public int selectChartCount(@RequestBody ProjectWorkVO pjVO) {
		int cnt  = service.retrieveProjectWorkStatusCount(pjVO);
		return cnt;
	}
	
	@GetMapping(value="/countAllMemberDetailWorkCount",produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public int selectAllMemberDetailWorkCount(@RequestBody ProjectWorkVO pjVO) {
		int cnt = service.retrieveIndexDetailWorkAllCount(pjVO);
		return cnt;
	}
}
