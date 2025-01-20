package com.teamtodev.main.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.teamtodev.attendance.service.AttendanceService;
import com.teamtodev.attendance.vo.AttendanceVO;
import com.teamtodev.board.vo.PostVO;
import com.teamtodev.employees.service.EmployeeService;
import com.teamtodev.employees.vo.EmployeeVO;
import com.teamtodev.employees.vo.EmployeeVOWrapper;
import com.teamtodev.mail.service.MailService;
import com.teamtodev.mail.vo.MailVO;
import com.teamtodev.main.service.MainService;
import com.teamtodev.project.service.ProjectPostService;
import com.teamtodev.project.service.ProjectService;
import com.teamtodev.project.service.ProjectWorkService;
import com.teamtodev.project.vo.ProjectPostVO;
import com.teamtodev.project.vo.ProjectVO;
import com.teamtodev.project.vo.ProjectWorkVO;
import com.teamtodev.reservation.service.ReservationService;
import com.teamtodev.reservation.vo.ReservationVO;
import com.teamtodev.utils.TimeUtils;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Controller
public class indexController {
	
	private final AttendanceService attendanceService;
	
	@Autowired
	private MainService mainService;
	
	@Autowired
	private MailService mailService; // 메일 서비스
	
	@Autowired
	private EmployeeService emplService; // 사원 서비스
	
	@Autowired
	private ProjectService projectService;
	
	@Autowired
	private ProjectWorkService projectWorkService;
	
	@Autowired
	private ProjectPostService projectPostService;
	
	@Autowired
	private ReservationService reservationService;
	
//	@Autowired
//	private PostService postService; // 게시글 서비스
	
	
	@GetMapping("/index")
	public String index(Model model
			, Authentication auth ) {
		EmployeeVOWrapper userWrapper = (EmployeeVOWrapper) auth.getPrincipal();
	    EmployeeVO user = userWrapper.getRealUser();
		List<ProjectVO> projectList = projectService.retrieveMyProject(user.getEmplNo());
		model.addAttribute("projectList",projectList);
		
		List<ProjectWorkVO> projectWorkList = projectWorkService.retrieveIndexWorkList(user.getEmplNo());
		model.addAttribute("projectWorkList",projectWorkList);
		
		EmployeeVO empl = emplService.selectEmployeeById(user.getEmplId());
		
		String now = TimeUtils.todayByPattern("yyyyMMdd");
		AttendanceVO attendanceVO = attendanceService.selectAttendanceByDay(empl.getEmplNo(), now);
		
		model.addAttribute("attendanceVO", attendanceVO);
		
		
		List<ProjectPostVO> projectPostList = projectPostService.retrieveIndexPostList(user.getEmplNo());
		model.addAttribute("projectPostList",projectPostList);
		
		List<ReservationVO> reservationList = reservationService.retrieveReservationList(user.getEmplNo());
		model.addAttribute("reservationList",reservationList);
		
		 int one1 = projectService.countProjectCodeZ01();
		 int two2 = projectService.countProjectCodeZ02();
		 int three3 = projectService.countProjectCodeZ03();
		 int four4 = projectService.countProjectCodeZ04();
		 int sum2 = one1 + two2 + three3 + four4;
		 
		 model.addAttribute("one1",one1);
		 model.addAttribute("two2",two2);
		 model.addAttribute("three3",three3);
		 model.addAttribute("four4",four4);
		 model.addAttribute("sum2",sum2);
		return "index";
	}
	
	
	
//	인덱스에서는 되는데 다른 레프트메뉴에도 적용시킬라면 어떻게 해야할까..?
	@GetMapping("/mail/count")
	@ResponseBody
	public Map<String, Integer> leftMenu(
			Authentication auth) {

		// 사원번호 꺼내기
		EmployeeVOWrapper userWrapper = (EmployeeVOWrapper) auth.getPrincipal();
		EmployeeVO emplVO = userWrapper.getRealUser();

		Map<String, Integer> map = new HashMap<>();
		
		// 받은메일함 갯수
		int mailCount = mainService.receEmailCount(emplVO.getEmplNo());
		int tempCount = mainService.tempMailCount(emplVO.getEmplNo());
		
		map.put("mailCount", mailCount);
		map.put("tempCount", tempCount);
		
		return map;
	}
	
	@ResponseBody
	@GetMapping("/main/mail")
	public List<MailVO> mailList(
			Authentication auth
			) {
		// 사원번호 꺼내기
		EmployeeVOWrapper userWrapper = (EmployeeVOWrapper) auth.getPrincipal();
		EmployeeVO emplVO = userWrapper.getRealUser();
		EmployeeVO empl = emplService.selectEmployeeById(emplVO.getEmplId());
		
		// 사원번호 String 으로 변환
		String recptnEmailAdres = Integer.toString(empl.getEmplNo());

		// 받는사람, 참조를 수신자에 넣을 Map
		Map<String, Object> info = new HashMap<String, Object>();
		info.put("recptnEmailAdres",recptnEmailAdres);
		
		int emplNo = emplVO.getEmplNo();  
		
		// 받은 메일 리스트 받기
		List<MailVO> mailList = mailService.dashMail(emplNo);
		
		return mailList;	
	}

	// 메인페이지 - 공지사항 목록 출력
	@GetMapping("/main/post")
	@ResponseBody
	public Map<String, List<PostVO>> postList () {
		int noticsBoard = 2; // 공지사항 게시판 번호
		int departBoard = 3; // 부서 게시판 번호
		
		List<PostVO> noticsBoardList = mainService.mainPost(noticsBoard);
		List<PostVO> departBoardList = mainService.mainPost(departBoard);
		
		Map<String, List<PostVO>> boardList = new HashMap<>();
		boardList.put("noticsBoardList", noticsBoardList);
		boardList.put("departBoardList", departBoardList);
		
		return boardList;
	}
	
	@GetMapping("/san/count")
	@ResponseBody
	public Map<String, Integer> snacWait(
			Authentication auth 
			, Model model
			) {
		// 사원번호 꺼내기
		EmployeeVOWrapper userWrapper = (EmployeeVOWrapper) auth.getPrincipal();
		EmployeeVO emplVO = userWrapper.getRealUser();
		EmployeeVO empl = emplService.selectEmployeeById(emplVO.getEmplId());
		
		Map<String, Integer> map = new HashMap<>();
		
		int wait = mainService.snacWait(empl.getEmplNo());
		int process = mainService.snacComp(empl.getEmplNo());
		int reference = mainService.snacReje(empl.getEmplNo());
		int rcver = mainService.snacTemp(empl.getEmplNo());
		
		model.addAttribute("wait", wait);
		model.addAttribute("process", process);
		model.addAttribute("reference", reference);
		model.addAttribute("rcver", rcver);
		
		map.put("wait", wait);
		map.put("process", process);
		map.put("reference", reference);
		map.put("rcver", rcver);
		
		return map;
	}
}

