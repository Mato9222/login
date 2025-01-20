package com.teamtodev.mail.controller;

import java.io.IOException;
import java.nio.charset.Charset;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tiles.request.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.http.ContentDisposition;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpRequest;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.teamtodev.attachfile.service.AttachService;
import com.teamtodev.attachfile.vo.AttachVO;
import com.teamtodev.employees.service.EmployeeService;
import com.teamtodev.employees.vo.EmployeeVO;
import com.teamtodev.employees.vo.EmployeeVOWrapper;
import com.teamtodev.enumpkg.ServiceResult;
import com.teamtodev.mail.service.MailService;
import com.teamtodev.mail.vo.MailVO;
import com.teamtodev.mail.vo.RecipientsVO;
import com.teamtodev.paging.PaginationInfo;
import com.teamtodev.paging.PaginationRenderer;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/mail")
public class MailController {
	@Autowired
	private MailService service;
	
	@Autowired
	private EmployeeService emplservice;

	@Autowired
	private AttachService AttachService; // 첨부파일
	

//	----------------------select----------------- 
	// 받은메일함 리스트 select 
	@GetMapping
	public String mailList(
			Model model
			, Authentication auth
			) {
		// 사원번호 꺼내기
		EmployeeVOWrapper userWrapper = (EmployeeVOWrapper) auth.getPrincipal();
		EmployeeVO emplVO = userWrapper.getRealUser();
		EmployeeVO empl = emplservice.selectEmployeeById(emplVO.getEmplId());
		
		// 사원번호 String 으로 변환
		String recptnEmailAdres = Integer.toString(empl.getEmplNo());

		// 받는사람, 참조를 수신자에 넣을 Map
		Map<String, Object> info = new HashMap<String, Object>();
		info.put("recptnEmailAdres",recptnEmailAdres);
		
		// 받은 메일 리스트 받기
		List<MailVO> mailList = service.readMailList(info);
		model.addAttribute("mailList", mailList);
		
		log.info("메일리스트{}",mailList);
		
		return "mail/mailList";
	}

	// 받은메일 상세내용보기 detail
	@GetMapping("content/{emailNo}")
	public String mailContent(@PathVariable int emailNo
								, Model model
								, Authentication auth) {
		
		// session에서 사원번호 꺼내기
		EmployeeVOWrapper userWrapper = (EmployeeVOWrapper) auth.getPrincipal();
		EmployeeVO emplVO = userWrapper.getRealUser();
		EmployeeVO empl = emplservice.selectEmployeeById(emplVO.getEmplId());

		// 이메일 번호를 받아 내용 출력
		MailVO mail = service.readMail(emailNo);
		// 읽은 시간 입력
		service.readTime(emailNo);
		
		log.info("POST MAIL33 : {}", mail);
		
		model.addAttribute("empl",empl);
		model.addAttribute("mail",mail);
		
		return "mail/mailContent";
	}
	
//	보낸 메일함 select 
	@GetMapping("sendMailList")
	public String sendMailList( 
			Model model
			, Authentication auth
			) {
		// 사원번호 꺼내기
		EmployeeVOWrapper userWrapper = (EmployeeVOWrapper) auth.getPrincipal();
		EmployeeVO emplVO = userWrapper.getRealUser();
		
		// 사원번호 String 으로 변환
		String sendMail = Integer.toString(emplVO.getEmplNo());
		
		// 받은 메일 리스트 받기
		List<MailVO> mailList = service.sendMailList(sendMail);
		
		model.addAttribute("mailList", mailList);
		
		log.info("메일리스트2{}",mailList);

//		int unReadMail = 0;
//		
//		for (MailVO mail : mailList) {
//			List<RecipientsVO> unRead = mail.getRec();
//			log.info("여긴 어디 얘는 누구 {}",unRead);
//			for (RecipientsVO rec : unRead) {
//				if (rec.getReadTime() != null) {
//					unReadMail++;
//					// 읽은 갯수 이거 이제 sendMailList에 뿌리면 됨. 일단 변수 막지음
//					rec.setAsd(unReadMail);
//				}
//			}
//		}
		
		return "mail/sendMailList";
	}
	
	// 보낸메일 상세내용보기 detail
	@GetMapping("sendContent/{emailNo}")
	public String sendMailContent(@PathVariable int emailNo
			, Model model
			, Authentication auth) {
		
		// session에서 사원번호 꺼내기
		EmployeeVOWrapper userWrapper = (EmployeeVOWrapper) auth.getPrincipal();
		EmployeeVO emplVO = userWrapper.getRealUser();
		EmployeeVO empl = emplservice.selectEmployeeById(emplVO.getEmplId());
		
		// 이메일 번호를 받아 내용 출력
		MailVO mail = service.sendReadMail(emailNo);
		
		log.info("POST MAIL33 : {}", mail);
		
		model.addAttribute("empl",empl);
		model.addAttribute("mail",mail);
		
		return "mail/mailContent";
	}
	

//	안읽은 메일함 select 
	@GetMapping("unread")
	public String unRead( 
			Model model
			, Authentication auth
			) {
		// 사원번호 꺼내기
		EmployeeVOWrapper userWrapper = (EmployeeVOWrapper) auth.getPrincipal();
		EmployeeVO emplVO = userWrapper.getRealUser();
		
		log.info("여기는 emplVO : {} "+emplVO);
		
		// 사원번호 String 으로 변환
		String recptnEmailAdres = Integer.toString(emplVO.getEmplNo());
	
		// 받는사람, 참조를 수신자에 넣을 Map
		Map<String, Object> info = new HashMap<String, Object>();
		info.put("recptnEmailAdres",recptnEmailAdres);
		
		// 받은 메일 리스트 받기
		List<MailVO> mailList = service.unReadMailList(recptnEmailAdres);
		model.addAttribute("mailList", mailList);
		
		
		log.info("메일리스트{}",mailList);
		
		return "mail/mailList";
	}

	// 휴지통 리스트 select 
	@GetMapping("trashList")
	public String trashList( Model model
			, Authentication auth ) {
		// 사원번호 꺼내기
		EmployeeVOWrapper userWrapper = (EmployeeVOWrapper) auth.getPrincipal();
		EmployeeVO emplVO = userWrapper.getRealUser();
		EmployeeVO empl = emplservice.selectEmployeeById(emplVO.getEmplId());
		
		// 사원번호 String 으로 변환
		String recptnEmailAdres = Integer.toString(empl.getEmplNo());

		// 받는사람, 참조를 수신자에 넣을 Map
		Map<String, Object> info = new HashMap<String, Object>();
		info.put("recptnEmailAdres",recptnEmailAdres);

		// 받은 메일 리스트 받기
		List<MailVO> mailList = service.trashMailList(info);
		model.addAttribute("mailList", mailList);
		
		log.info("메일리스트{}",mailList);
		
		return "mail/trashMailList";
	}
	
//	임시보관함 리스트 select 
	@GetMapping("tempList") 
	public String tempList( Model model
			, Authentication auth ) {
		// 사원번호 꺼내기
		EmployeeVOWrapper userWrapper = (EmployeeVOWrapper) auth.getPrincipal();
		EmployeeVO emplVO = userWrapper.getRealUser();
		EmployeeVO empl = emplservice.selectEmployeeById(emplVO.getEmplId());
		
		// 사원번호 String 으로 변환
		String recptnEmailAdres = Integer.toString(empl.getEmplNo());

		// 받는사람, 참조를 수신자에 넣을 Map
		Map<String, Object> info = new HashMap<String, Object>();
		info.put("recptnEmailAdres",recptnEmailAdres);

		// 받은 메일 리스트 받기
		List<MailVO> mailList = service.tmepMailList(info);
		model.addAttribute("mailList", mailList);
		
		log.info("메일리스트{}",mailList);
		
		return "mail/tempMailList";
	}

//	임시보관함에서 내용보기 select 
	@GetMapping("tempContent/{emailNo}")
	public String tempContent (
			Model model
			, @PathVariable int emailNo
			) {
		// 이메일 번호를 받아 내용 출력
		MailVO mail = service.tempReadMail(emailNo);
		
		log.info("임시저장메일{}",mail);

		model.addAttribute("mail", mail);
		
		return "mail/tempMail";
	}

//	답장 form 이동
	@ResponseBody
	@PostMapping("reSend/{emailNo}")
	public String reSendMail (
			Model model
			, Authentication auth
			, HttpSession session
			, @PathVariable int emailNo
			) {
		// 이메일 번호를 받아 내용 출력
		MailVO mail = service.readMail(emailNo);
		log.info("답장 : {} ", mail);
		// 이거 뿌려주면 됨.
		session.setAttribute("mail", mail);
		
		return "success";
	}
	
	@GetMapping("adrs")
	public String adrs() {
		
		return "address/adrs";
	}
	
	
	/**
	 * 첨부파일 다운로드
	 * 
	 * @param bbsNo 게시판 번호
	 * @param sntncNo 게시글 번호
	 * @param atchFileNo 통합첨부파일번호
	 * @param atchFileSeq 첨부파일순번
	 * @param model 
	 * @return 첨부파일 리소스
	 */
	@GetMapping("/{mailNo}/attach/{atchFileNo}/{atchFileSeq}")
	private ResponseEntity<Resource> getAttach(@PathVariable int mailNo, @PathVariable String atchFileNo, @PathVariable int atchFileSeq, Model model ) {
		// 0. 첨부파일 조회조건 셋팅
		AttachVO atch = new AttachVO();
		atch.setAtchFileNo(atchFileNo);
		atch.setAtchFileSeq(atchFileSeq);
		
		// 1. 첨부파일 조회
		try {
			atch = AttachService.downloadAttach(atch);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		// 2. 헤더 설정
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_OCTET_STREAM); // APPLICATION_OCTET_STREAM : 바이너리로 클라이언트에게 보내기 위해 사용
		headers.setContentLength(atch.getFileSize());
		ContentDisposition contentDisposition = ContentDisposition.attachment()
																.filename(atch.getFileNm(), Charset.defaultCharset())
																.build();
		headers.setContentDisposition(contentDisposition);
		
		// 3. 전송
		return ResponseEntity.ok()
						.headers(headers)
						.body(atch.getBinary());
	}
	
	
//	----------------------update----------------- 
	
	@PostMapping("/delN/{emailNo}")
	@ResponseBody
	public String mailDelCancel(@PathVariable String emailNo) {
		log.info("여기 와? {} ",emailNo);
		ServiceResult result = null;
		
		String[] paserNo = emailNo.split(",");
		for (int i = 0; i < paserNo.length; i++) {
			String splNo = paserNo[i];
			int no = Integer.parseInt(splNo);

			log.info("여기 메일 삭제 for 안쪽 : {} ",splNo);
			result = service.trashCancel(no);
			
		}
		if(result.equals(ServiceResult.OK)) {
			return "success";
		}
		return "fail";
	}
	
	// 휴지통 이동 update
	@PostMapping("trash/{emailNo}")
	@ResponseBody
	public String mailTrash(@PathVariable String emailNo) {
		
		ServiceResult result = null;
		
		log.info("여기 메일 삭제 : {} ",emailNo);
		String[] paserNo = emailNo.split(",");
		for (int i = 0; i < paserNo.length; i++) {
			String splNo = paserNo[i];
			int no = Integer.parseInt(splNo);

			log.info("여기 메일 삭제 for 안쪽 : {} ",splNo);
			result = service.trashMail(no);
			
		}
		if(result.equals(ServiceResult.OK)) {
			return "success";
		}
		return "fail";
	}
	
//	 받은 메일함에서 휴지통 이동 update
	@PostMapping("sendTrash/{emailNo}")
	@ResponseBody
	public String sendMailTrash(@PathVariable String emailNo) {
		
		ServiceResult result = null;
		
		log.info("여기 메일 삭제 : {} ",emailNo);
		
		String[] paserNo = emailNo.split(",");
		for (int i = 0; i < paserNo.length; i++) {
			String splNo = paserNo[i];
			int no = Integer.parseInt(splNo);

			log.info("여기 메일 삭제 for 안쪽 : {} ",splNo);
			result = service.trashSendMail(no);
			
			if(result.equals(ServiceResult.OK)) {
				return "success";
			}
		}
		return "fail";
	}

//	임시보관함에서 내용 전송 update
	@PutMapping("/tempSend")
	@ResponseBody
	public String tempSendMail( 
			Model model
			, Authentication auth
			, @RequestBody MailVO mail
			) {
		EmployeeVOWrapper userWrapper = (EmployeeVOWrapper) auth.getPrincipal();
		EmployeeVO emplVO = userWrapper.getRealUser();
		EmployeeVO empl = emplservice.selectEmployeeById(emplVO.getEmplId());
		
		// 보내는 사원번호 String 으로 변환
		Long emplNo = (long) empl.getEmplNo();
		mail.setEmplNo(emplNo);
		mail.setEmplId(empl.getEmplId());
		log.info("POST MAIL : {}", mail);
		
		ServiceResult result = null;
		// 발신함 저장
		System.out.println("왜안돼 ㅅㅂ");
		try {
			result = service.createMail(mail);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		if(result.equals(ServiceResult.OK)) {
			String result1 = sendMail(mail);
			return result1;
		}
		return "fail";
	}
	
//	임시저장 수정
	@ResponseBody
	@PostMapping("/reSend")
	public String reSendMail (
			Model model
			, @RequestBody MailVO mail
			) {		
		ServiceResult mailRes = service.tempSaveMail(mail);
		
		if(mailRes == ServiceResult.OK) {
			return "success";
		} 
		return "fail";
	}
	

//	----------------------insert----------------- 
//	 메일 보내기 form 이동 
	@GetMapping("send")
	public String sendMail() {
		return "mail/sendMail";
	}
	
//	 메일 보내기 insert
	@ResponseBody
	@PostMapping(value="/send")
	public String sendMail( 
			Model model
			, Authentication auth
			, MailVO mail
			) {
		EmployeeVOWrapper userWrapper = (EmployeeVOWrapper) auth.getPrincipal();
		EmployeeVO emplVO = userWrapper.getRealUser();
		EmployeeVO empl = emplservice.selectEmployeeById(emplVO.getEmplId());
		
		// 보내는 사원번호 String 으로 변환
		Long emplNo = (long) empl.getEmplNo();
		mail.setEmplNo(emplNo);
		mail.setEmplId(empl.getEmplId());
		log.info("POST MAIL1 : {}", mail);
		
		// 실제 메일주소 받는사람 저장
//		mail.setRecptnEmailAdres(mail.getRealMail());
//		mail.setEmplNm(empl.getEmplNm());
//		mail.setOfcpsCodeNm(empl.getOfcpsCodeNm());
		ServiceResult result = null;
		// 발신함 저장
		
		try {
			result = service.createMail(mail);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		if(result.equals(ServiceResult.OK)) {
			String result1 = sendMail(mail);
			return result1;
		}
		return "fail";
	}

//	수신함 저장 insert
	public String sendMail(MailVO mail) {
		String email = mail.getRecptnEmailAdres();
		String[] splitEmail = email.split(",");
		
		String ref = mail.getRefrn();
		String[] splitRef = ref.split(",");
		
		ServiceResult result = null;
//		받는사람 저장 
		for (int i=0 ; i < splitEmail.length ; i++) {
			String trimMail = splitEmail[i].trim();
			
			mail.setRecptnEmailAdres(trimMail);
			log.info("for문 i {}", mail);
			
//			수신함 저장 함수
			result = service.reception(mail);
			log.info("수신자결과 {}", result);
		}
		
		if(result.equals(ServiceResult.OK) ) {
//		참조가 0이 아니라면 수신함에 저장
			if( splitRef.length != 0 ) {
				for (int i=0 ; i < splitRef.length ; i++) {
					String trimRef = splitRef[i].trim();
					
					mail.setRecptnEmailAdres(trimRef);
					
					result = service.reception(mail);
					
					log.info("for문 안쪽i {}", result);
				}
				
				if(result.equals(ServiceResult.FAIL)) {
					return "fail";
				}
			}
		}
		return "success";
	}
	
//	임시메일함 저장 insert
	@PostMapping("temp")
	@ResponseBody
	public String tempMail(
			Model model
			, Authentication auth
			, @RequestBody MailVO mail) {
		
		EmployeeVOWrapper userWrapper = (EmployeeVOWrapper) auth.getPrincipal();
		EmployeeVO emplVO = userWrapper.getRealUser();
		EmployeeVO empl = emplservice.selectEmployeeById(emplVO.getEmplId());
		
		// 보내는 사원번호 String 으로 변환
		Long emplNo = (long) empl.getEmplNo();
		mail.setEmplNo(emplNo);
		
		log.info("temp POST MAIL : {}", mail);
		
		ServiceResult result = service.tempMail(mail);
		if(result.equals(ServiceResult.OK)) {
			return "success";
		}
		return "fail";
	}
	
	@GetMapping("reSendMail")
	public String reSend(Model model, HttpSession session) {
		MailVO mail = (MailVO) session.getAttribute("mail");
		
		session.setAttribute("mail", mail);
		
		return "mail/reSendMail";
	}
	
	
	
	
	
	
	
	

//	----------------------delete----------------- 
	
	// delete
	@ResponseBody // 얘가없으면 return 에 .jsp로 이동하게된다.
	@PostMapping("deleteMail/{readNo}")
	public String deleteMail(@PathVariable String readNo) {
		ServiceResult delete = service.deleteMail(readNo);
		
		if (delete.equals(ServiceResult.OK)) {
			return "success";
		} else {
			return "fail";
		}
	}
	
//	임시보관함에서 완전 삭제
	@ResponseBody // 얘가없으면 return 에 .jsp로 이동하게된다.
	@PostMapping("tempDeleteMail/{readNo}")
	public String tempDeleteMail(@PathVariable String readNo) {
		log.info("임시 삭제 여기야 {} ",readNo);
		ServiceResult delete = service.tempDeleteMail(readNo);
		log.info("임시 삭제 delete {} ",delete);
		
		if (delete.equals(ServiceResult.OK)) {
			return "success";
		} else {
			return "fail";
		}
	}
	
	
	
	
	
	
	
	
	

}
