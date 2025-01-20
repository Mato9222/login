package com.teamtodev.project.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.teamtodev.attachfile.service.AttachService;
import com.teamtodev.attachfile.vo.AttachVO;
import com.teamtodev.common.mapper.CommonMapper;
import com.teamtodev.common.vo.CommonVO;
import com.teamtodev.employees.vo.EmployeeVO;
import com.teamtodev.employees.vo.EmployeeVOWrapper;
import com.teamtodev.project.service.ProjectLogService;
import com.teamtodev.project.service.ProjectMemberService;
import com.teamtodev.project.service.ProjectService;
import com.teamtodev.project.service.ProjectWorkService;
import com.teamtodev.project.vo.ProjectLogVO;
import com.teamtodev.project.vo.ProjectMemberVO;
import com.teamtodev.project.vo.ProjectVO;
import com.teamtodev.project.vo.ProjectWorkVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/project")
public class ProjectController {
	
	@Autowired
	private AttachService attachService;
	
	@Autowired
	private CommonMapper mapper;
	
	@Autowired
	private ProjectService Pservice;
	
	@Autowired
	private ProjectMemberService PMservice;
	
	@Autowired
	private ProjectWorkService PWservice;
	
	@Autowired
	private ProjectLogService Lservice;
	
	private List<File> listFiles(String path) {
	    List<File> fileList = new ArrayList<>();
	    File[] files = new File(path).listFiles();
	    for (File file : files) {
	        if (file.isDirectory()) {
	        	fileList.add(file);
	        } 
	    }

	    return fileList;
	}
	
	@GetMapping("/projectList")
	public String selectProjectList(Model model, Authentication auth) {
		List<ProjectVO> proList = Pservice.retrieveProjectList();
		model.addAttribute("proList",proList);
	    EmployeeVOWrapper userWrapper = (EmployeeVOWrapper) auth.getPrincipal();
	    EmployeeVO user = userWrapper.getRealUser();
	    List<ProjectVO> myProList = Pservice.retrieveMyProject(user.getEmplNo());
	    model.addAttribute("myProList",myProList);
	    
	     int one = Pservice.countProjectCodeZ01();
		 int two = Pservice.countProjectCodeZ02();
		 int three = Pservice.countProjectCodeZ03();
		 int four = Pservice.countProjectCodeZ04();
		 int sum = one + two + three + four;
		 
		 model.addAttribute("one",one);
		 model.addAttribute("two",two);
		 model.addAttribute("three",three);
		 model.addAttribute("four",four);
		 model.addAttribute("sum",sum);
		return "project/projectlist";
	}
	
	@GetMapping(value="/detailProject/{prjctCode}")
	public String selectProject(@PathVariable String prjctCode, Model model, Authentication auth) {
		List<ProjectVO> detailList = Pservice.retrieveDetailProject(prjctCode);
		String kbsPrjctCode = null;
		for (ProjectVO projectVO : detailList) {
			kbsPrjctCode = projectVO.getPrjctCode();
		}
		model.addAttribute("kbsPrjctCode",kbsPrjctCode);
		model.addAttribute("detailList",detailList);
		ProjectMemberVO pjMemVO = new ProjectMemberVO();
		EmployeeVOWrapper userWrapper = (EmployeeVOWrapper) auth.getPrincipal();
		EmployeeVO user = userWrapper.getRealUser();
		pjMemVO.setEmplNo(user.getEmplNo());
		pjMemVO.setPrjctCode(prjctCode);
		
		Integer prjctMbrNo = PMservice.retrieveProjectNumber(pjMemVO);
		model.addAttribute("kbsprjctMbrNo",prjctMbrNo);
		
		List<ProjectWorkVO> workList = PWservice.retrieveProjectWorkList(prjctCode);
		log.info("workList:{}",workList);
		model.addAttribute("workList",workList);
		
		List<ProjectLogVO> logList = Lservice.retrieveLogList(prjctCode);
		model.addAttribute("logList",logList);
		List<AttachVO> attachList = attachService.selectProjectAllAttachList(prjctCode);
		model.addAttribute("attachList",attachList);
		
		int attachCount = attachService.selectProjectAttachCount(prjctCode);
		model.addAttribute("attachCount",attachCount);
		
		String samplePath = "\\\\192.168.142.4\\groobear/";
		 List<File> files = listFiles(samplePath.toString());
		 log.info("파일드라이버 ㅋ:{}",files);
		 model.addAttribute("files",files);
		 
		 String ProjectRoleName = PMservice.retrieveProjectRoleName(pjMemVO);
		 model.addAttribute("ProjectRoleName",ProjectRoleName);
		 
		return "project/projectdetail";
	}
	
	@GetMapping("/viewProjectForm")
	public String viewProjectForm(Model model) {
		List<CommonVO> ccList = mapper.selectCommonList("프로젝트역할");
		model.addAttribute("ccList",ccList);
		return "project/projectinsertform";
	}
	
	@PostMapping(value="/insertProject",produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public String insertProject(@RequestBody ProjectVO pjVO) {
		ProjectVO newPjVo = new ProjectVO();
		newPjVo.setPrjctNm(pjVO.getPrjctNm());
		newPjVo.setPrjctDc(pjVO.getPrjctDc());
		newPjVo.setPrjctBgnde(pjVO.getPrjctBgnde());
		newPjVo.setPrjctClosOn(pjVO.getPrjctClosOn());
		Pservice.createProject(newPjVo);
		
		
		List<ProjectMemberVO> pmList = pjVO.getPjMemberVO();
		String prjctCode = newPjVo.getPrjctCode();
		
		ProjectMemberVO newPmVo = new ProjectMemberVO();
		
		for (ProjectMemberVO pmVo : pmList) {
			int emplNo = pmVo.getEmplNo();
			String prjctRoleCode = pmVo.getPrjctRoleCode();
			newPmVo.setEmplNo(emplNo);
			newPmVo.setPrjctCode(prjctCode);
			newPmVo.setPrjctRoleCode(prjctRoleCode);
			PMservice.createProjectMember(newPmVo);
		}
		
		return "ok";
	}
}
