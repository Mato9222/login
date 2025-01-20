package com.teamtodev.mail.service.impl;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.teamtodev.attachfile.service.AttachService;
import com.teamtodev.attachfile.vo.AttachVO;
import com.teamtodev.common.service.CommonService;
import com.teamtodev.enumpkg.ServiceResult;
import com.teamtodev.mail.mapper.MailListMapper;
import com.teamtodev.mail.service.MailService;
import com.teamtodev.mail.vo.MailVO;
import com.teamtodev.mail.vo.RecipientsVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor // 생성자 인젝션
public class MailServiceImpl implements MailService {
	
	private final MailListMapper mapper;

	@Autowired
	JavaMailSender mailSender;

	@Autowired
	private AttachService attachService; // 통합첨부파일
	
	@Autowired
	private CommonService commonService; // 공통코드

	@Value("#{appInfo.attachFolder}")
	private Resource saveFolder; // 첨부파일 리소스
	
//	 메일 발신
	@Override
	public ServiceResult createMail(MailVO mail) throws IOException {
		int rowcnt = mapper.insertMail(mail);

		// 업무구분
		String bizType = commonService.selectBizTypeCode("메일자료실");
		
		// 파일경로
		String filePath = saveFolder.getFile().getPath();
		
		// 첨부파일 리스트
		List<AttachVO> fileList = mail.getAttchFileList();
		if( fileList != null  && !fileList.isEmpty() ) { // 널, 비어있는지 확인
			// 첨부파일 세부정보 재세팅
			for (AttachVO attachVO : mail.getAttchFileList()) {
				attachVO.setRegUserId(mail.getEmplId());
				attachVO.setBizType(bizType);
				attachVO.setFilePath(filePath);
			}
			
			// 첨부파일정보 DB 등록
			if( attachService.insertMailAttachFiles(mail) > 0) {
				// 게시글 DB 등록
				mapper.insertMail(mail);
				
				// 파일 저장
				for(AttachVO attachVO : fileList) {
					String saveFileName = attachVO.getSaveFileNm() + "." + attachVO.getFileContType();
					Resource saveRes = saveFolder.createRelative(saveFileName); // 파일 생성
					FileUtils.copyInputStreamToFile(attachVO.getUploadFile().getInputStream(), saveRes.getFile());
				}
			} else {
				// 게시글 DB 등록
				mapper.insertMail(mail);
			} 
		}
		
		
		if(rowcnt > 0 ) {
			return ServiceResult.OK;
		} else { 
			return ServiceResult.FAIL;
		}
	}

	//	 수신함 저장
	public ServiceResult reception(MailVO mail) {
		String ref = mail.getRecptnEmailAdres();
		String refrn = mail.getRefrn();
		
		
		if (!ref.isEmpty()) {
//			if(mail.getRealMail()!=null) {
//				realMailSend(mail);
//			}
			int rowcnt = mapper.insertMailR(mail);
			log.info("수신 저장 서비스임플 : {}" ,rowcnt);
			if(rowcnt == 0 ) {
				return ServiceResult.FAIL;
			} 
		}
		return ServiceResult.OK;
	}
	
	private void realMailSend(MailVO mail) {
		 try {
	            // 이메일 객체
	            MimeMessage msg = mailSender.createMimeMessage();
	            String mailadres = "zzxxcc385@naver.com";
	            
	            // 받는 사람을 설정 (수신자, 받는사람의 이메일 주소 객체를 생성해서 수신자 이메일주소를 담음)
	            msg.addRecipient(RecipientType.TO, new InternetAddress(mailadres, mail.getEmplNm()));
	 
	            /*
	             * createMimeMessage() : MimeMessage객체를 생성시킴 (이것을 이용해서 메시지를 구성한 뒤 메일 발송)
	             * addRecipient() : 메시지의 발신자를 설정 InternetAddress() : 이메일 주소 getReceiveMail() :
	             * 수신자 이메일 주소
	             */
	 
	            // 보내는 사람(이메일주소+이름)
	            // (발신자, 보내는 사람의 이메일 주소와 이름을 담음)
	            // 이메일 발신자
	            msg.addFrom(new InternetAddress[] { new InternetAddress(mail.getRealMail())});
	 
	            // 이메일 제목 (인코딩을 해야 한글이 깨지지 않음)
	            msg.setSubject(mail.getEmailSj(), "utf-8");
	            // 이메일 본문 (인코딩을 해야 한글이 깨지지 않음)
	            msg.setText(mail.getEmailCn(), "utf-8");
	 
//	            html로 보낼 경우            
//	            MimeMessage message = mailSender.createMimeMessage();
//	            MimeMessageHelper helper 
//	            = new MimeMessageHelper(message, true);
//	            helper.setTo("test@host.com");
//	            helper.setText("<html><body><img src='cid:identifier1234'></body></html>", true);
	 
	            // 이메일 보내기
	            mailSender.send(msg);
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
			
	}

	
//	메일 읽기
	@Override
	public MailVO readMail(int mailNo) {
		MailVO mail = mapper.selectMail(mailNo);
		// 최초 읽은시간 입력 
		return mail;
	}

	@Override
	public void readTime(int mailNo) {
		mapper.readTime(mailNo);
	}
	
	
//  임시메일 보기
	@Override
	public MailVO tempReadMail(int mailNo) {
		MailVO mail = mapper.tempReadMail(mailNo);
		
		return mail;
	}

//	보낸메일 읽기
	@Override
	public MailVO sendReadMail(int mailNo) {
		MailVO mail = mapper.selectMail(mailNo);
		
		return mail;
	}

//	받은메일 리스트 
	@Override
	public List<MailVO> readMailList(Map<String, Object> info ) {
		
		List<MailVO> mailList = mapper.selectMailList(info);
		
		return mailList;
	}
	
//	휴지통 리스트
	@Override
	public List<MailVO> trashMailList(Map<String, Object> info ) {
		
		List<MailVO> mailList = mapper.trashMailList(info);
		
		return mailList;
	}
	
//	임시보관함 리스트
	public List<MailVO> tmepMailList(Map<String, Object> info ) {
		
		List<MailVO> mailList = mapper.tempMailList(info);
		
		return mailList;
	}

//	메일함에서 휴지통으로 
	@Override
	public ServiceResult trashMail(int emailNo) {
		int rowcnt = mapper.trashMail(emailNo);
		
		if(rowcnt > 0 ) {
			return ServiceResult.OK;
		} else { 
			return ServiceResult.FAIL;
		}
	}
	
//	메일함에서 휴지통으로 
	@Override
	public ServiceResult trashSendMail(int emailNo) {
		int rowcnt = mapper.outBoxDel(emailNo);
		
		if(rowcnt > 0 ) {
			return ServiceResult.OK;
		} else { 
			return ServiceResult.FAIL;
		}
	}
	
//	휴지통에서 완전삭제
	@Override
	public ServiceResult deleteMail(String emailNo) {
		int rowcnt = mapper.deleteRece(emailNo);
		log.info("rece 삭제 {} ",rowcnt);
		
		if(rowcnt > 0 ) {
			int rowcnt2 = mapper.deleteMail(emailNo);
			log.info("mail 삭제 {} ",rowcnt2);
			if(rowcnt2 == 0 ) { 
				return ServiceResult.FAIL;
			}
		}
		return ServiceResult.OK;
	}

//	작성중 메일 임시저장
	@Override
	public ServiceResult tempMail(MailVO mail) {
		int rowcnt = mapper.tempMail(mail);
		
		if(rowcnt > 0 ) {
			return ServiceResult.OK;
		} else { 
			return ServiceResult.FAIL;
		}
	}
	
//	임시 목록에서 완전삭제
	@Override
	public ServiceResult tempDeleteMail(String emailNo) {
		log.info("여기는 들어오는데 삭제하기{}", emailNo);
		int rowcnt = mapper.deleteMail(emailNo);
		log.info("삭제하기{}", rowcnt);
		if(rowcnt == 0 ) { 
			return ServiceResult.FAIL;
		}
		return ServiceResult.OK;
	}
	
//	안읽은 메일
	@Override
	public List<RecipientsVO> unReadMail(String emplNo) {
		List<RecipientsVO> unMail = mapper.unReadMail(emplNo);
		return unMail;
	}

//	안읽은 메일리스트
	@Override
	public List<MailVO> unReadMailList(String info) {
		List<MailVO> mailList = mapper.unReadMailList(info);
		
		return mailList;
	}

//	보낸 메일함 리스트
	@Override
	public List<MailVO> sendMailList(String info) {
		List<MailVO> mailList = mapper.sendMailList(info);

		for (MailVO mailVO : mailList) {
			for (RecipientsVO rece : mailVO.getRec()) {
				// 누구 외 몇명 의 몇명 담당
				int count = mapper.sendMailCount(rece);
				rece.setCount(count);
				// 받은 사람중 몇명이 읽었는지 담당
				int readCount = mapper.sendReadMailCount(rece);
				rece.setReadCount(readCount);
			}
		}
		
		return mailList;
	}

//	임시메일에서 보내기 
	@Override
	public ServiceResult updateMail(MailVO mail) {
		int rowcnt = mapper.updateMail(mail);

		if (rowcnt > 0) {
			return ServiceResult.OK;
		}
		return ServiceResult.FAIL;
	}

//	메일 임시저장
	@Override
	public ServiceResult tempSaveMail(MailVO mail) {
		int rowcnt = mapper.tempSaveMail(mail);
		
		log.info("서비스는 ? {}",rowcnt);
		
		if (rowcnt > 0) {
			return ServiceResult.OK;
		}
		return ServiceResult.FAIL;
	}

	@Override
	public List<MailVO> dashMail(int emplNo) {
		log.info("시벌럼이 {}",emplNo);
		
		List<MailVO> res = mapper.dashMail(emplNo);
		
		return res;
	}

//	휴지통에서 받은메일함으로 살리기
	@Override
	public ServiceResult trashCancel(int emailNo) {
	int rowcnt = mapper.trashCancel(emailNo);
		
		if(rowcnt > 0 ) {
			return ServiceResult.OK;
		} else { 
			return ServiceResult.FAIL;
		}
	}

//	public List<MailVO> dashBoard (MailVO mail) {
//		List<MailVO> res ;
//		
//		return res;
//	}

	
	
	
	
	
	
	
	
	
	
	
}
