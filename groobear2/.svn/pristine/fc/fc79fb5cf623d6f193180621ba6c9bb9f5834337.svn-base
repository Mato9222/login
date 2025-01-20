package com.teamtodev.chatroom.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.teamtodev.employees.service.EmployeeService;
import com.teamtodev.employees.vo.EmployeeVO;
import com.teamtodev.employees.vo.EmployeeVOWrapper;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/chat")
public class ChatController {
	private final EmployeeService employeeService;

	/**
	 * 채팅 페이지에 접근하는 메서드입니다.
	 * 
	 * @param request HttpServletRequest 객체로, 현재 요청에 대한 정보를 제공합니다.
	 * @param id      채팅에 참여하는 사용자의 ID입니다. (guest 또는 master)
	 */
	@GetMapping
	public void getChat(HttpServletRequest request, Authentication auth) {
		// 현재 요청과 관련된 세션을 가져옵니다. 세션이 없으면 새로 생성됩니다.
		HttpSession session = request.getSession();

		EmployeeVOWrapper userWrapper = (EmployeeVOWrapper) auth.getPrincipal();
		EmployeeVO employeeWrapperVO = userWrapper.getRealUser();
		EmployeeVO emplVO = employeeService.selectEmployeeById(employeeWrapperVO.getEmplId());
		List<EmployeeVO> employeeList = employeeService.selectEmployeeList();
		
//		log.info("너들어오냐? : {}", emplVO);
		session.setAttribute("sender", emplVO);
		session.setAttribute("employeeList", employeeList);
		
		
	}

	/**
	 * "master" 역할로 채팅 페이지에 접근하는 메서드입니다.
	 * 
	 * @param request HttpServletRequest 객체로, 현재 요청에 대한 정보를 제공합니다.
	 * @return 채팅 페이지의 경로를 반환합니다.
	 */
	
	@GetMapping("/chatting")
	public String enterChatAsMaster(HttpServletRequest request, Authentication auth) {
		// 현재 요청과 관련된 세션을 가져옵니다. 세션이 없으면 새로 생성됩니다.
		HttpSession session = request.getSession();
		
		EmployeeVOWrapper userWrapper = (EmployeeVOWrapper) auth.getPrincipal();
		EmployeeVO employeeWrapperVO = userWrapper.getRealUser();
		EmployeeVO emplVO = employeeService.selectEmployeeById(employeeWrapperVO.getEmplId());
		List<EmployeeVO> employeeList = employeeService.selectEmployeeList();
		
//		log.info("너들어오냐? : {}", emplVO);
		session.setAttribute("sender", emplVO);
		session.setAttribute("employeeList", employeeList);

//		// ID가 "guest"인 경우
//		if (id.equals("guest")) {
//			// 세션의 고유한 식별자를 가져와 "guest" 접두사와 함께 세션 ID를 이름으로 사용합니다.
//			String name = "guest" + session.toString().substring(session.toString().indexOf("@"));
//			// 세션에 "sessionId"라는 이름으로 이름을 저장합니다.
//			session.setAttribute("sessionId", name);
//		}
//		// ID가 "master"인 경우
//		else if (id.equals("master")) {
//			// "master"라는 이름을 사용합니다.
//			String name = "master";
//			// 세션에 "sessionId"라는 이름으로 이름을 저장합니다.
//			session.setAttribute("sessionId", name);
//		}
//
//		// 로깅 기능을 사용하여 메서드가 호출되었음을 기록합니다.
//		log.info("@ChatController, enterChatAsMaster()");

		// "/chat" 경로의 뷰를 반환합니다.
		return "/chat/chat";
	}
	@GetMapping("c")
	public String test() {
		return "/chat/chatting";
	}
}
